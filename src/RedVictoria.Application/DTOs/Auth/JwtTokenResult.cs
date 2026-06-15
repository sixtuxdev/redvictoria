namespace RedVictoria.Application.DTOs.Auth;

public class JwtTokenResult
{
    public string Token { get; init; } = string.Empty;
    public DateTime FechaExpiracion { get; init; }
}
