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
    public async Task RegistrarAsync_SinReferidoNiPassword_RegistraSinAcceso()
    {
        var repository = new CiudadanoRepositoryFake(SuccessResult(tieneAcceso: false));
        var application = CreateApplication(repository);

        var response = await application.RegistrarAsync(ValidRequest());

        Assert.True(response.IsSuccess);
        Assert.False(response.Data!.TieneAcceso);
        Assert.Null(repository.Command!.CodigoReferidoInvitacion);
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
        var application = new CiudadanoApplication(repository, hasher);
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
        Assert.True(repository.Command.Estado);
        Assert.Equal(fechaNacimiento, response.Data!.FechaNacimiento);
        Assert.Equal("Bogota", response.Data.LugarNacimiento);
        Assert.Equal("3001234567", response.Data.Celular);
        Assert.True(response.Data.TieneWhatsapp);
        Assert.Equal(8, response.Data.ParametroIdDondeVive);
        Assert.Equal("Colegio Central", response.Data.PuestoVotacion);
        Assert.Equal(4, response.Data.ParametroIdSoy);
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

    private static CiudadanoApplication CreateApplication(ICiudadanoRepository repository) =>
        new(repository, new PasswordHasherFake());

    private static RegistroCiudadanoRequest ValidRequest() =>
        new()
        {
            NombresCompletos = "Juan Pérez Martínez",
            Celular = "3001234567"
        };

    private static RegistroCiudadanoResult SuccessResult(
        bool tieneAcceso,
        int? ciudadanoReferidorId = null) =>
        new()
        {
            IsSuccess = true,
            Message = "Ciudadano registrado correctamente.",
            CiudadanoId = 10,
            NombresCompletos = "Juan Perez Martinez",
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

        public Task<RegistroCiudadanoResult> RegistrarAsync(
            RegistroCiudadanoCommand command,
            CancellationToken cancellationToken = default)
        {
            Command = command;
            return Task.FromResult(_result);
        }
    }

    private sealed class PasswordHasherFake : IPasswordHasher
    {
        public string Hash(string password) => $"hash:{password}";
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
    }
}
