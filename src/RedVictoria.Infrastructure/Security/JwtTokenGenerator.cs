using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using RedVictoria.Application.DTOs.Auth;
using RedVictoria.Application.Interfaces;

namespace RedVictoria.Infrastructure.Security;

public class JwtTokenGenerator : IJwtTokenGenerator
{
    private const int MinimumSecretKeyLength = 32;
    private readonly IConfiguration _configuration;

    public JwtTokenGenerator(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    public JwtTokenResult Generate(LoginResponse user)
    {
        var secretKey = _configuration["JwtSettings:SecretKey"];
        if (string.IsNullOrWhiteSpace(secretKey) || secretKey.Length < MinimumSecretKeyLength)
        {
            throw new InvalidOperationException(
                "La clave JWT no estÃ¡ configurada o no tiene una longitud segura.");
        }

        var issuer = _configuration["JwtSettings:Issuer"];
        var audience = _configuration["JwtSettings:Audience"];
        var expirationMinutes = int.TryParse(
            _configuration["JwtSettings:ExpirationMinutes"],
            out var configuredExpirationMinutes)
            ? configuredExpirationMinutes
            : 120;
        var expiration = DateTime.UtcNow.AddMinutes(expirationMinutes);
        var claims = new[]
        {
            new Claim("UsuarioId", user.UsuarioId.ToString()),
            new Claim("CiudadanoId", user.CiudadanoId.ToString()),
            new Claim("Nombre", user.Nombre),
            new Claim(ClaimTypes.Email, user.Email),
            new Claim(ClaimTypes.Role, user.Rol),
            new Claim(JwtRegisteredClaimNames.Sub, user.UsuarioId.ToString()),
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
        };
        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));
        var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
        var token = new JwtSecurityToken(
            issuer: issuer,
            audience: audience,
            claims: claims,
            expires: expiration,
            signingCredentials: credentials);

        return new JwtTokenResult
        {
            Token = new JwtSecurityTokenHandler().WriteToken(token),
            FechaExpiracion = expiration
        };
    }
}
