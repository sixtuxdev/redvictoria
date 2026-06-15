using RedVictoria.Application.DTOs.Auth;
using RedVictoria.Application.Interfaces;
using RedVictoria.Application.Services;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Auth;
using Xunit;

namespace RedVictoria.Application.Tests.Services;

public class AuthApplicationTests
{
    [Fact]
    public async Task LoginAsync_ConCredencialesValidas_RetornaTokenYDatos()
    {
        var repository = new AuthRepositoryFake(ValidUser());
        var application = CreateApplication(repository);

        var response = await application.LoginAsync(ValidRequest());

        Assert.True(response.IsSuccess);
        Assert.Equal("token-test", response.Data!.Token);
        Assert.True(response.Data.UsuarioId > 0);
        Assert.True(response.Data.CiudadanoId > 0);
        Assert.Equal("Ciudadano", response.Data.Rol);
        Assert.True(response.Data.FechaExpiracion > DateTime.UtcNow);
        Assert.Equal("usuario@email.com", repository.Email);
    }

    [Fact]
    public async Task LoginAsync_ConPasswordIncorrecto_RetornaCredencialesInvalidas()
    {
        var application = CreateApplication(new AuthRepositoryFake(ValidUser()));
        var request = ValidRequest();
        request.Password = "654321";

        var response = await application.LoginAsync(request);

        Assert.False(response.IsSuccess);
        Assert.Equal("Credenciales invÃ¡lidas.", response.Message);
        Assert.Null(response.Data);
    }

    [Fact]
    public async Task LoginAsync_ConEmailInexistente_RetornaCredencialesInvalidas()
    {
        var application = CreateApplication(new AuthRepositoryFake(null));

        var response = await application.LoginAsync(ValidRequest());

        Assert.False(response.IsSuccess);
        Assert.Equal("Credenciales invÃ¡lidas.", response.Message);
        Assert.Null(response.Data);
    }

    [Fact]
    public async Task LoginAsync_ConCiudadanoSinAcceso_RetornaMensajeEsperado()
    {
        var user = ValidUser(tieneAcceso: false);
        var application = CreateApplication(new AuthRepositoryFake(user));

        var response = await application.LoginAsync(ValidRequest());

        Assert.False(response.IsSuccess);
        Assert.Equal("El ciudadano no tiene acceso al sistema.", response.Message);
        Assert.Null(response.Data);
    }

    [Theory]
    [InlineData(false, true)]
    [InlineData(true, false)]
    public async Task LoginAsync_ConUsuarioOCiudadanoInactivo_RetornaCredencialesInvalidas(
        bool usuarioEstado,
        bool ciudadanoEstado)
    {
        var user = ValidUser(
            usuarioEstado: usuarioEstado,
            ciudadanoEstado: ciudadanoEstado);
        var application = CreateApplication(new AuthRepositoryFake(user));

        var response = await application.LoginAsync(ValidRequest());

        Assert.False(response.IsSuccess);
        Assert.Equal("Credenciales invÃ¡lidas.", response.Message);
        Assert.Null(response.Data);
    }

    private static AuthApplication CreateApplication(IAuthRepository repository) =>
        new(repository, new PasswordHasherFake(), new JwtTokenGeneratorFake());

    private static LoginRequest ValidRequest() =>
        new()
        {
            Email = "USUARIO@EMAIL.COM",
            Password = "123456"
        };

    private static UsuarioLoginResult ValidUser(
        bool usuarioEstado = true,
        bool ciudadanoEstado = true,
        bool tieneAcceso = true) =>
        new()
        {
            UsuarioId = 1,
            CiudadanoId = 2,
            NombresCompletos = "Juan Perez",
            Email = "usuario@email.com",
            PasswordHash = "hash:123456",
            Rol = "Ciudadano",
            UsuarioEstado = usuarioEstado,
            CiudadanoEstado = ciudadanoEstado,
            TieneAcceso = tieneAcceso
        };

    private sealed class AuthRepositoryFake : IAuthRepository
    {
        private readonly UsuarioLoginResult? _user;

        public AuthRepositoryFake(UsuarioLoginResult? user)
        {
            _user = user;
        }

        public string? Email { get; private set; }

        public Task<UsuarioLoginResult?> ObtenerPorEmailAsync(
            string email,
            CancellationToken cancellationToken = default)
        {
            Email = email;
            return Task.FromResult(_user);
        }
    }

    private sealed class PasswordHasherFake : IPasswordHasher
    {
        public string Hash(string password) => $"hash:{password}";
        public bool Verify(string password, string passwordHash) => passwordHash == $"hash:{password}";
    }

    private sealed class JwtTokenGeneratorFake : IJwtTokenGenerator
    {
        public JwtTokenResult Generate(LoginResponse user) =>
            new()
            {
                Token = "token-test",
                FechaExpiracion = DateTime.UtcNow.AddHours(2)
            };
    }
}
