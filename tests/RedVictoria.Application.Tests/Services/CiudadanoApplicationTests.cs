using RedVictoria.Application.DTOs.Ciudadanos;
using RedVictoria.Application.Interfaces;
using RedVictoria.Application.Services;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Ciudadanos;
using Xunit;

namespace RedVictoria.Application.Tests.Services;

public class CiudadanoApplicationTests
{
    [Fact]
    public async Task RegistrarAsync_ConReferidoNiPassword_RegistraSinAcceso()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: false));
        var application = CreateApplication(repository);

        var response = await application.RegistrarAsync(ValidRequest());

        Assert.True(response.IsSuccess);
        Assert.False(response.Data!.TieneAcceso);
        Assert.Equal("RV-REF001", repository.Command!.CodigoReferidoInvitacion);
        Assert.Null(repository.Command.PasswordHash);
    }

    [Fact]
    public async Task RegistrarAsync_ConReferidoValido_GuardaReferidor()
    {
        const int referidorId = 27;
        var repository = new CiudadanoRepositoryFake(
            SuccessResult(tieneAcceso: false, ciudadanoReferidorId: referidorId));
        var application = CreateApplication(repository);
        var request = ValidRequest();
        request.CodigoReferido = "RV-000001";

        var response = await application.RegistrarAsync(request);

        Assert.True(response.IsSuccess);
        Assert.Equal("RV-000001", repository.Command!.CodigoReferidoInvitacion);
        Assert.Equal(referidorId, response.Data!.CiudadanoReferidorId);
    }

    [Fact]
    public async Task RegistrarAsync_ConReferidoInvalido_RetornaMensajeEsperado()
    {
        var repository = new CiudadanoRepositoryFake(new RegistroCiudadanoResult
        {
            IsSuccess = false,
            Message = "El código de referido no es válido."
        });
        var application = CreateApplication(repository);
        var request = ValidRequest();
        request.CodigoReferido = "NO-EXISTE";

        var response = await application.RegistrarAsync(request);

        Assert.False(response.IsSuccess);
        Assert.Equal("El código de referido no es válido.", response.Message);
        Assert.Null(response.Data);
    }

    [Fact]
    public async Task RegistrarAsync_ConPassword_GeneraHashYAcceso()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: true));
        var hasher = new PasswordHasherFake();
        var application = new CiudadanoApplication(repository, hasher, new CorreoServiceFake());
        var request = ValidRequest();
        request.Email = "CIUDADANO@EXAMPLE.COM";
        request.Password = "123456";
        request.ConfirmPassword = "123456";

        var response = await application.RegistrarAsync(request);

        Assert.True(response.IsSuccess);
        Assert.True(response.Data!.TieneAcceso);
        Assert.Equal("hash:123456", repository.Command!.PasswordHash);
        Assert.Equal("ciudadano@example.com", repository.Command.Email);
    }

    [Fact]
    public async Task RegistrarAsync_ConEmailDuplicado_RetornaMensajeEsperado()
    {
        var repository = new CiudadanoRepositoryFake(new RegistroCiudadanoResult
        {
            IsSuccess = false,
            Message = "El email ya se encuentra registrado."
        });
        var application = CreateApplication(repository);
        var request = ValidRequest();
        request.Email = "ciudadano@example.com";
        request.Password = "123456";
        request.ConfirmPassword = "123456";

        var response = await application.RegistrarAsync(request);

        Assert.False(response.IsSuccess);
        Assert.Equal("El email ya se encuentra registrado.", response.Message);
    }

    [Theory]
    [InlineData("El email ya se encuentra registrado en ciudadanos.")]
    [InlineData("El celular ya se encuentra registrado en ciudadanos.")]
    [InlineData("El numero de identificacion ya se encuentra registrado en ciudadanos.")]
    public async Task RegistrarAsync_ConDatoUnicoDuplicado_RetornaMensajeEsperado(string expectedMessage)
    {
        var repository = new CiudadanoRepositoryFake(new RegistroCiudadanoResult
        {
            IsSuccess = false,
            Message = expectedMessage
        });
        var correoService = new CorreoServiceFake();
        var application = CreateApplication(repository, correoService);
        var request = ValidRequest();
        request.Email = "ciudadano@example.com";

        var response = await application.RegistrarAsync(request);

        Assert.False(response.IsSuccess);
        Assert.Equal(expectedMessage, response.Message);
        Assert.Null(response.Data);
        Assert.Null(correoService.Destinatario);
    }

    [Fact]
    public async Task RegistrarAsync_ReferidoUrl_TienePrioridadSobreElBody()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: false));
        var application = CreateApplication(repository);
        var request = ValidRequest();
        request.CodigoReferido = "RV-BODY";

        await application.RegistrarAsync(request, "RV-URL");

        Assert.Equal("RV-URL", repository.Command!.CodigoReferidoInvitacion);
    }

    [Fact]
    public async Task RegistrarAsync_SinNombres_RetornaErrorYNoInvocaRepositorio()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: false));
        var application = CreateApplication(repository);
        var request = ValidRequest();
        request.NombresCompletos = " ";

        var response = await application.RegistrarAsync(request);

        Assert.False(response.IsSuccess);
        Assert.Contains("NombresCompletos es obligatorio.", response.Errors);
        Assert.Null(repository.Command);
    }

    [Fact]
    public async Task RegistrarAsync_ConPasswordSinEmail_RetornaError()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: true));
        var application = CreateApplication(repository);
        var request = ValidRequest();
        request.Email = null;
        request.Password = "123456";
        request.ConfirmPassword = "123456";

        var response = await application.RegistrarAsync(request);

        Assert.False(response.IsSuccess);
        Assert.Contains(
            response.Errors,
            error => error.StartsWith("Email es obligatorio", StringComparison.Ordinal));
        Assert.Null(repository.Command);
    }

    [Fact]
    public async Task RegistrarAsync_ConPasswordsDiferentes_RetornaError()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: true));
        var application = CreateApplication(repository);
        var request = ValidRequest();
        request.Email = "ciudadano@example.com";
        request.Password = "123456";
        request.ConfirmPassword = "654321";

        var response = await application.RegistrarAsync(request);

        Assert.False(response.IsSuccess);
        Assert.Contains(
            "Password y ConfirmPassword deben coincidir.",
            response.Errors);
        Assert.Null(repository.Command);
    }

    [Fact]
    public async Task RegistrarAsync_ConNuevosCampos_LosEnviaYRetorna()
    {
        var fechaNacimiento = new DateTime(1990, 5, 20);
        var fechaRegistro = new DateTime(2026, 6, 15, 12, 0, 0);
        var repository = new CiudadanoRepositoryFake(new RegistroCiudadanoResult
        {
            IsSuccess = true,
            Message = "Ciudadano registrado correctamente.",
            CiudadanoId = 10,
            NombresCompletos = "Juan Perez Martinez",
            CodigoReferido = "RV-ABC123",
            FechaNacimiento = fechaNacimiento,
            LugarNacimiento = "Bogota",
            Celular = "3001234567",
            TieneWhatsapp = true,
            ParametroIdDondeVive = 8,
            PuestoVotacion = "Colegio Central",
            ParametroIdSoy = 4,
            ParametroIdVereda = 15,
            Estado = true,
            FechaRegistro = fechaRegistro
        });
        var application = CreateApplication(repository);
        var request = ValidRequest();
        request.FechaNacimiento = fechaNacimiento;
        request.LugarNacimiento = " Bogota ";
        request.TieneWhatsapp = true;
        request.ParametroIdDondeVive = 8;
        request.PuestoVotacion = " Colegio Central ";
        request.ParametroIdSoy = 4;
        request.ParametroIdVereda = 15;
        request.Estado = true;

        var response = await application.RegistrarAsync(request);

        Assert.True(response.IsSuccess);
        Assert.Equal(fechaNacimiento, repository.Command!.FechaNacimiento);
        Assert.Equal("Bogota", repository.Command.LugarNacimiento);
        Assert.Equal("3001234567", repository.Command.Celular);
        Assert.True(repository.Command.TieneWhatsapp);
        Assert.Equal(8, repository.Command.ParametroIdDondeVive);
        Assert.Equal("Colegio Central", repository.Command.PuestoVotacion);
        Assert.Equal(4, repository.Command.ParametroIdSoy);
        Assert.Equal(15, repository.Command.ParametroIdVereda);
        Assert.True(repository.Command.Estado);
        Assert.Equal(fechaNacimiento, response.Data!.FechaNacimiento);
        Assert.Equal("Bogota", response.Data.LugarNacimiento);
        Assert.Equal("3001234567", response.Data.Celular);
        Assert.True(response.Data.TieneWhatsapp);
        Assert.Equal(8, response.Data.ParametroIdDondeVive);
        Assert.Equal("Colegio Central", response.Data.PuestoVotacion);
        Assert.Equal(4, response.Data.ParametroIdSoy);
        Assert.Equal(15, response.Data.ParametroIdVereda);
        Assert.True(response.Data.Estado);
        Assert.Equal(fechaRegistro, response.Data.FechaRegistro);
    }

    [Fact]
    public async Task RegistrarAsync_ConFechaNacimientoFutura_RetornaError()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: false));
        var application = CreateApplication(repository);
        var request = ValidRequest();
        request.FechaNacimiento = DateTime.Today.AddDays(1);

        var response = await application.RegistrarAsync(request);

        Assert.False(response.IsSuccess);
        Assert.Contains(
            "FechaNacimiento no puede ser una fecha futura.",
            response.Errors);
        Assert.Null(repository.Command);
    }

    [Theory]
    [InlineData("LugarNacimiento")]
    [InlineData("PuestoVotacion")]
    public async Task RegistrarAsync_ConNuevoTextoMayorA150_RetornaError(string fieldName)
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: false));
        var application = CreateApplication(repository);
        var request = ValidRequest();
        var invalidValue = new string('A', 151);

        if (fieldName == "LugarNacimiento")
            request.LugarNacimiento = invalidValue;
        else
            request.PuestoVotacion = invalidValue;

        var response = await application.RegistrarAsync(request);

        Assert.False(response.IsSuccess);
        Assert.Contains(
            $"{fieldName} no puede superar 150 caracteres.",
            response.Errors);
        Assert.Null(repository.Command);
    }

    [Fact]
    public async Task RegistrarAsync_ConErrorDeRepositorio_PropagaLaExcepcion()
    {
        var expectedException = new InvalidOperationException("error de persistencia");
        var repository = new CiudadanoRepositoryThrowingFake(expectedException);
        var application = CreateApplication(repository);

        var exception = await Assert.ThrowsAsync<InvalidOperationException>(
            () => application.RegistrarAsync(ValidRequest()));

        Assert.Same(expectedException, exception);
    }

    [Fact]
    public async Task RegistrarAsync_ConEmailYRegistroExitoso_EnviaCorreoConCodigoReferido()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(
            tieneAcceso: false,
            email: "ciudadano@example.com"));
        var correoService = new CorreoServiceFake();
        var application = CreateApplication(repository, correoService);
        var request = ValidRequest();
        request.Email = "ciudadano@example.com";

        var response = await application.RegistrarAsync(request);

        Assert.True(response.IsSuccess);
        Assert.Equal("ciudadano@example.com", correoService.Destinatario);
        Assert.Equal("Juan Perez Martinez", correoService.NombresCompletos);
        Assert.Equal("RV-ABC123", correoService.CodigoReferido);
    }

    [Fact]
    public async Task RegistrarAsync_CuandoCorreoFalla_MantieneRegistroExitoso()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(
            tieneAcceso: false,
            email: "ciudadano@example.com"));
        var correoService = new CorreoServiceFake(new InvalidOperationException("smtp no disponible"));
        var application = CreateApplication(repository, correoService);
        var request = ValidRequest();
        request.Email = "ciudadano@example.com";

        var response = await application.RegistrarAsync(request);

        Assert.True(response.IsSuccess);
        Assert.NotNull(response.Data);
        Assert.Contains("No fue posible enviar el correo", response.Message);
    }

    [Fact]
    public async Task RegistrarAsync_SinEmail_RetornaError()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: false));
        var correoService = new CorreoServiceFake();
        var application = CreateApplication(repository, correoService);
        var request = ValidRequest();
        request.Email = null;

        var response = await application.RegistrarAsync(request);

        Assert.False(response.IsSuccess);
        Assert.Contains("Email es obligatorio.", response.Errors);
        Assert.Null(repository.Command);
        Assert.Null(correoService.Destinatario);
    }

    [Fact]
    public async Task ValidarCodigoReferidoAsync_ConCodigoExistente_RetornaExiste()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: false))
        {
            ExisteCodigoReferido = true
        };
        var application = CreateApplication(repository);

        var response = await application.ValidarCodigoReferidoAsync(" RV-REF001 ");

        Assert.True(response.IsSuccess);
        Assert.True(response.Data!.Existe);
        Assert.Equal("RV-REF001", response.Data.CodigoReferido);
    }

    [Fact]
    public async Task ValidarCodigoReferidoAsync_ConCodigoInexistente_RetornaNoExiste()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: false))
        {
            ExisteCodigoReferido = false
        };
        var application = CreateApplication(repository);

        var response = await application.ValidarCodigoReferidoAsync("NO-EXISTE");

        Assert.True(response.IsSuccess);
        Assert.False(response.Data!.Existe);
        Assert.Equal("No puede continuar porque el referido ingresado no existe.", response.Message);
    }

    [Fact]
    public async Task ObtenerRedReferidosAsync_RetornaDirectosEIndirectos()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: false))
        {
            RedReferidos =
            [
                new CiudadanoReferidoResult
                {
                    CiudadanoId = 11,
                    NombresCompletos = "Directo Uno",
                    CodigoReferido = "RV-DIRECTO",
                    Referidor = "Padre",
                    FechaRegistro = new DateTime(2026, 6, 17),
                    Estado = true,
                    Nivel = 1,
                    TipoReferido = "Directo"
                },
                new CiudadanoReferidoResult
                {
                    CiudadanoId = 12,
                    NombresCompletos = "Indirecto Uno",
                    CodigoReferido = "RV-INDIRECTO",
                    Referidor = "Directo Uno",
                    FechaRegistro = new DateTime(2026, 6, 17),
                    Estado = true,
                    Nivel = 2,
                    TipoReferido = "Indirecto"
                }
            ]
        };
        var application = CreateApplication(repository);

        var response = await application.ObtenerRedReferidosAsync(10);

        Assert.True(response.IsSuccess);
        Assert.Equal(2, response.Data!.Count);
        Assert.Contains(response.Data, item => item.TipoReferido == "Directo");
        Assert.Contains(response.Data, item => item.TipoReferido == "Indirecto");
    }

    [Fact]
    public async Task DesactivarReferidoAsync_CuandoNoPerteneceARed_RetornaError()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: false))
        {
            DesactivarReferidoResult = false
        };
        var application = CreateApplication(repository);

        var response = await application.DesactivarReferidoAsync(10, 99);

        Assert.False(response.IsSuccess);
        Assert.Contains("no pertenece", response.Message);
    }

    private static CiudadanoApplication CreateApplication(ICiudadanoRepository repository) =>
        CreateApplication(repository, new CorreoServiceFake());

    private static CiudadanoApplication CreateApplication(
        ICiudadanoRepository repository,
        ICorreoService correoService) =>
        new(repository, new PasswordHasherFake(), correoService);

    private static RegistroCiudadanoRequest ValidRequest() =>
        new()
        {
            NombresCompletos = "Juan Pérez Martínez",
            FechaNacimiento = new DateTime(1990, 5, 20),
            Email = "ciudadano@example.com",
            Celular = "3001234567",
            TieneWhatsapp = true,
            ParametroIdDondeVive = 8,
            PuestoVotacion = "Colegio Central",
            ParametroIdTipoIdentificacion = 1,
            NumeroIdentificacion = "12345678",
            Direccion = "Calle 1 # 2-3",
            DepartamentoId = 5,
            MunicipioId = 10,
            ParametroIdGenero = 2,
            ParametroIdSoy = 4,
            ParametroIdVereda = 15,
            CodigoReferido = "RV-REF001"
        };

    private static RegistroCiudadanoResult SuccessResult(
        bool tieneAcceso,
        int? ciudadanoReferidorId = null,
        string? email = null) =>
        new()
        {
            IsSuccess = true,
            Message = "Ciudadano registrado correctamente.",
            CiudadanoId = 10,
            NombresCompletos = "Juan Perez Martinez",
            Email = email,
            CodigoReferido = "RV-ABC123",
            TieneAcceso = tieneAcceso,
            CiudadanoReferidorId = ciudadanoReferidorId,
            Estado = true,
            FechaRegistro = new DateTime(2026, 6, 15, 12, 0, 0)
        };

    private sealed class CiudadanoRepositoryFake : ICiudadanoRepository
    {
        private readonly RegistroCiudadanoResult _result;

        public CiudadanoRepositoryFake(RegistroCiudadanoResult result)
        {
            _result = result;
        }

        public RegistroCiudadanoCommand? Command { get; private set; }

        public bool ExisteCodigoReferido { get; init; } = true;
        public IReadOnlyCollection<CiudadanoReferidoResult> RedReferidos { get; init; } = [];
        public bool DesactivarReferidoResult { get; init; } = true;

        public Task<RegistroCiudadanoResult> RegistrarAsync(
            RegistroCiudadanoCommand command,
            CancellationToken cancellationToken = default)
        {
            Command = command;
            return Task.FromResult(_result);
        }

        public Task<bool> ExisteCodigoReferidoAsync(
            string codigoReferido,
            CancellationToken cancellationToken = default)
        {
            return Task.FromResult(ExisteCodigoReferido);
        }

        public Task<IReadOnlyCollection<CiudadanoReferidoResult>> ObtenerRedReferidosAsync(
            int ciudadanoId,
            CancellationToken cancellationToken = default)
        {
            return Task.FromResult(RedReferidos);
        }

        public Task<bool> DesactivarReferidoAsync(
            int ciudadanoAutenticadoId,
            int ciudadanoReferidoId,
            CancellationToken cancellationToken = default)
        {
            return Task.FromResult(DesactivarReferidoResult);
        }
    }

    private sealed class PasswordHasherFake : IPasswordHasher
    {
        public string Hash(string password) => $"hash:{password}";
        public bool Verify(string password, string passwordHash) => passwordHash == $"hash:{password}";
    }

    private sealed class CorreoServiceFake : ICorreoService
    {
        private readonly Exception? _exception;

        public CorreoServiceFake(Exception? exception = null)
        {
            _exception = exception;
        }

        public string? Destinatario { get; private set; }
        public string? NombresCompletos { get; private set; }
        public string? CodigoReferido { get; private set; }

        public Task EnviarRegistroCiudadanoAsync(
            string destinatario,
            string nombresCompletos,
            string codigoReferido,
            CancellationToken cancellationToken = default)
        {
            if (_exception is not null)
                return Task.FromException(_exception);

            Destinatario = destinatario;
            NombresCompletos = nombresCompletos;
            CodigoReferido = codigoReferido;
            return Task.CompletedTask;
        }
    }

    private sealed class CiudadanoRepositoryThrowingFake : ICiudadanoRepository
    {
        private readonly Exception _exception;

        public CiudadanoRepositoryThrowingFake(Exception exception)
        {
            _exception = exception;
        }

        public Task<RegistroCiudadanoResult> RegistrarAsync(
            RegistroCiudadanoCommand command,
            CancellationToken cancellationToken = default)
        {
            return Task.FromException<RegistroCiudadanoResult>(_exception);
        }

        public Task<bool> ExisteCodigoReferidoAsync(
            string codigoReferido,
            CancellationToken cancellationToken = default)
        {
            return Task.FromException<bool>(_exception);
        }

        public Task<IReadOnlyCollection<CiudadanoReferidoResult>> ObtenerRedReferidosAsync(
            int ciudadanoId,
            CancellationToken cancellationToken = default)
        {
            return Task.FromException<IReadOnlyCollection<CiudadanoReferidoResult>>(_exception);
        }

        public Task<bool> DesactivarReferidoAsync(
            int ciudadanoAutenticadoId,
            int ciudadanoReferidoId,
            CancellationToken cancellationToken = default)
        {
            return Task.FromException<bool>(_exception);
        }
    }
}
