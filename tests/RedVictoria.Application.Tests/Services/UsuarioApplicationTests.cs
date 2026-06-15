using RedVictoria.Application.DTOs.Usuarios;
using RedVictoria.Application.Interfaces;
using RedVictoria.Application.Services;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Usuarios;
using Xunit;

namespace RedVictoria.Application.Tests.Services;

public class UsuarioApplicationTests
{
    [Fact]
    public async Task RegistrarAsync_ConDatosValidos_CreaUsuarioConPasswordHash()
    {
        var repository = new UsuarioRepositoryFake(SuccessResult());
        var application = CreateApplication(repository);

        var response = await application.RegistrarAsync(ValidRequest());

        Assert.True(response.IsSuccess);
        Assert.Equal("Usuario registrado correctamente.", response.Message);
        Assert.Equal(10, response.Data!.UsuarioId);
        Assert.Equal("usuario@email.com", repository.Command!.Email);
        Assert.Equal("hash:123456", repository.Command.PasswordHash);
        Assert.NotEqual("123456", repository.Command.PasswordHash);
        Assert.Equal("Ciudadano", repository.Command.Rol);
    }

    [Theory]
    [InlineData("El ciudadano no existe.")]
    [InlineData("El ciudadano se encuentra inactivo.")]
    [InlineData("El ciudadano ya tiene un usuario registrado.")]
    [InlineData("El email ya se encuentra registrado.")]
    public async Task RegistrarAsync_ConErrorDeNegocio_RetornaMensajeEsperado(string message)
    {
        var repository = new UsuarioRepositoryFake(FailureResult(message));
        var application = CreateApplication(repository);

        var response = await application.RegistrarAsync(ValidRequest());

        Assert.False(response.IsSuccess);
        Assert.Equal(message, response.Message);
        Assert.Null(response.Data);
    }

    [Fact]
    public async Task RegistrarAsync_ConPasswordDiferente_NoInvocaRepositorio()
    {
        var repository = new UsuarioRepositoryFake(SuccessResult());
        var application = CreateApplication(repository);
        var request = ValidRequest();
        request.ConfirmPassword = "654321";

        var response = await application.RegistrarAsync(request);

        Assert.False(response.IsSuccess);
        Assert.Contains(
            "La contraseÃ±a y la confirmaciÃ³n no coinciden.",
            response.Errors);
        Assert.Null(repository.Command);
    }

    [Fact]
    public async Task RegistrarAsync_ConRolVacio_UsaRolCiudadano()
    {
        var repository = new UsuarioRepositoryFake(SuccessResult());
        var application = CreateApplication(repository);
        var request = ValidRequest();
        request.Rol = " ";

        await application.RegistrarAsync(request);

        Assert.Equal("Ciudadano", repository.Command!.Rol);
    }

    [Theory]
    [InlineData(0, "CiudadanoId debe ser mayor que 0.")]
    [InlineData(-1, "CiudadanoId debe ser mayor que 0.")]
    public async Task RegistrarAsync_ConCiudadanoIdInvalido_NoInvocaRepositorio(
        int ciudadanoId,
        string expectedError)
    {
        var repository = new UsuarioRepositoryFake(SuccessResult());
        var application = CreateApplication(repository);
        var request = ValidRequest();
        request.CiudadanoId = ciudadanoId;

        var response = await application.RegistrarAsync(request);

        Assert.False(response.IsSuccess);
        Assert.Contains(expectedError, response.Errors);
        Assert.Null(repository.Command);
    }

    private static UsuarioApplication CreateApplication(IUsuarioRepository repository) =>
        new(repository, new PasswordHasherFake());

    private static RegistroUsuarioRequest ValidRequest() =>
        new()
        {
            CiudadanoId = 1,
            Email = "USUARIO@EMAIL.COM",
            Password = "123456",
            ConfirmPassword = "123456",
            Rol = "Ciudadano"
        };

    private static RegistroUsuarioResult SuccessResult() =>
        new()
        {
            IsSuccess = true,
            Message = "Usuario registrado correctamente.",
            UsuarioId = 10,
            CiudadanoId = 1,
            Email = "usuario@email.com",
            Rol = "Ciudadano",
            Estado = true,
            FechaCreacion = new DateTime(2026, 6, 15, 12, 0, 0)
        };

    private static RegistroUsuarioResult FailureResult(string message) =>
        new()
        {
            IsSuccess = false,
            Message = message
        };

    private sealed class UsuarioRepositoryFake : IUsuarioRepository
    {
        private readonly RegistroUsuarioResult _result;

        public UsuarioRepositoryFake(RegistroUsuarioResult result)
        {
            _result = result;
        }

        public RegistroUsuarioCommand? Command { get; private set; }

        public Task<RegistroUsuarioResult> RegistrarAsync(
            RegistroUsuarioCommand command,
            CancellationToken cancellationToken = default)
        {
            Command = command;
            return Task.FromResult(_result);
        }
    }

    private sealed class PasswordHasherFake : IPasswordHasher
    {
        public string Hash(string password) => $"hash:{password}";
        public bool Verify(string password, string passwordHash) => passwordHash == $"hash:{password}";
    }
}
