using System.Net;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using RedVictoria.Application.DTOs.Auth;
using RedVictoria.Infrastructure.Security;
using RedVictoria.Services.API.Extensions;
using Xunit;

namespace RedVictoria.Services.API.Tests.Auth;

public class JwtAuthenticationTests
{
    [Fact]
    public async Task EndpointProtegido_SinToken_RetornaUnauthorized()
    {
        using var server = CreateServer();
        var client = server.CreateClient();

        var response = await client.GetAsync("/private");

        Assert.Equal(HttpStatusCode.Unauthorized, response.StatusCode);
    }

    [Fact]
    public async Task EndpointProtegido_ConTokenValido_RetornaOk()
    {
        using var server = CreateServer();
        var client = server.CreateClient();
        var token = CreateToken();

        client.DefaultRequestHeaders.Authorization =
            new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);

        var response = await client.GetAsync("/private");

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
    }

    [Fact]
    public void JwtTokenGenerator_GeneraClaimsRequeridos()
    {
        var token = CreateToken();
        var jwt = new JwtSecurityTokenHandler().ReadJwtToken(token);

        Assert.Contains(jwt.Claims, claim => claim.Type == "UsuarioId" && claim.Value == "1");
        Assert.Contains(jwt.Claims, claim => claim.Type == "CiudadanoId" && claim.Value == "2");
        Assert.Contains(jwt.Claims, claim => claim.Type == "Nombre" && claim.Value == "Juan Perez");
        Assert.Contains(jwt.Claims, claim => claim.Type == "CodigoReferido" && claim.Value == "RV-ABC123");
        Assert.Contains(jwt.Claims, claim => claim.Type == ClaimTypes.Email && claim.Value == "usuario@email.com");
        Assert.Contains(jwt.Claims, claim => claim.Type == ClaimTypes.Role && claim.Value == "Ciudadano");
    }

    private static TestServer CreateServer()
    {
        var builder = WebApplication.CreateBuilder();
        builder.WebHost.UseTestServer();
        builder.Configuration.AddInMemoryCollection(JwtConfiguration());
        builder.Services.AddAuthorization();
        builder.Services.AddJwtAuthentication(builder.Configuration);

        var app = builder.Build();
        app.UseAuthentication();
        app.UseAuthorization();
        app.MapGet("/private", () => Results.Ok()).RequireAuthorization();
        app.StartAsync().GetAwaiter().GetResult();

        return app.GetTestServer();
    }

    private static string CreateToken()
    {
        var configuration = new ConfigurationBuilder()
            .AddInMemoryCollection(JwtConfiguration())
            .Build();
        var generator = new JwtTokenGenerator(configuration);
        var result = generator.Generate(new LoginResponse
        {
            UsuarioId = 1,
            CiudadanoId = 2,
            Nombre = "Juan Perez",
            CodigoReferido = "RV-ABC123",
            Email = "usuario@email.com",
            Rol = "Ciudadano"
        });

        return result.Token;
    }

    private static Dictionary<string, string?> JwtConfiguration() =>
        new()
        {
            ["JwtSettings:SecretKey"] = "REDVICTORIA_SECRET_CAMBIAR_PRODUCCION_2026_DEV_KEY",
            ["JwtSettings:Issuer"] = "RedVictoria",
            ["JwtSettings:Audience"] = "RedVictoriaUsers",
            ["JwtSettings:ExpirationMinutes"] = "120"
        };
}
