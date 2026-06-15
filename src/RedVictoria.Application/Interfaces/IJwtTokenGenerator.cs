using RedVictoria.Application.DTOs.Auth;

namespace RedVictoria.Application.Interfaces;

public interface IJwtTokenGenerator
{
    JwtTokenResult Generate(LoginResponse user);
}
