using System.Net.Http.Json;
using RedVictoria.WebUI.Constants;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Auth;

namespace RedVictoria.WebUI.Services;

public sealed class AuthService(HttpClient httpClient) : IAuthService
{
    public async Task<AuthResultModel> LoginAsync(LoginRequestModel request, CancellationToken cancellationToken = default)
    {
        var apiRequest = new LoginApiRequest(request.UserIdentifier, request.Password);
        var response = await httpClient.PostAsJsonAsync(AuthEndpoints.Login, apiRequest, cancellationToken);

        if (response.IsSuccessStatusCode)
        {
            return AuthResultModel.Success();
        }

        return AuthResultModel.Failure("No fue posible iniciar sesion con las credenciales suministradas.");
    }

    private sealed record LoginApiRequest(string Email, string Password);
}
