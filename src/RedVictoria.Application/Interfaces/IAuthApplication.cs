using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Auth;

namespace RedVictoria.Application.Interfaces;

public interface IAuthApplication
{
    Task<Response<LoginResponse>> LoginAsync(
        LoginRequest request,
        CancellationToken cancellationToken = default);
}
