using RedVictoria.WebUI.Models.Auth;

namespace RedVictoria.WebUI.Interfaces;

public interface IAuthService
{
    Task<AuthResultModel> LoginAsync(LoginRequestModel request, CancellationToken cancellationToken = default);
}
