using RedVictoria.WebUI.Models.Auth;

namespace RedVictoria.WebUI.Interfaces;

public interface IAuthSessionService
{
    Task<AuthSessionModel?> GetSessionAsync(CancellationToken cancellationToken = default);
    Task<string?> GetTokenAsync(CancellationToken cancellationToken = default);
    Task SetSessionAsync(AuthSessionModel session, CancellationToken cancellationToken = default);
    Task ClearSessionAsync(CancellationToken cancellationToken = default);
}
