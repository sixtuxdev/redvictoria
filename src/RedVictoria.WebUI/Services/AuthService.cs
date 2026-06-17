using System.Net.Http.Json;
using System.Text.Json;
using Microsoft.Extensions.Configuration;
using RedVictoria.WebUI.Constants;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Auth;
using RedVictoria.WebUI.Models.Common;

namespace RedVictoria.WebUI.Services;

public sealed class AuthService(
    HttpClient httpClient,
    IConfiguration configuration,
    IAuthSessionService authSessionService) : IAuthService
{
    public async Task<AuthResultModel> LoginAsync(LoginRequestModel request, CancellationToken cancellationToken = default)
    {
        var apiRequest = new LoginApiRequest(request.UserIdentifier, request.Password);
        var endpoint = ApiEndpointBuilder.Build(configuration, AuthEndpoints.Login);
        var response = await httpClient.PostAsJsonAsync(endpoint, apiRequest, cancellationToken);

        ApiResponseModel<LoginResponseModel>? apiResponse;
        try
        {
            apiResponse = await response.Content.ReadFromJsonAsync<ApiResponseModel<LoginResponseModel>>(
                cancellationToken: cancellationToken);
        }
        catch (JsonException)
        {
            return AuthResultModel.Failure("No fue posible interpretar la respuesta de inicio de sesion.");
        }
        catch (NotSupportedException)
        {
            return AuthResultModel.Failure("El servicio de inicio de sesion no devolvio una respuesta valida.");
        }

        if (response.IsSuccessStatusCode && apiResponse?.IsSuccess == true && apiResponse.Data is not null)
        {
            var session = new AuthSessionModel
            {
                Token = apiResponse.Data.Token,
                UsuarioId = apiResponse.Data.UsuarioId,
                CiudadanoId = apiResponse.Data.CiudadanoId,
                Nombre = apiResponse.Data.Nombre,
                CodigoReferido = apiResponse.Data.CodigoReferido,
                Email = apiResponse.Data.Email,
                Rol = apiResponse.Data.Rol,
                FechaExpiracion = apiResponse.Data.FechaExpiracion
            };

            await authSessionService.SetSessionAsync(session, cancellationToken);
            return AuthResultModel.Success(apiResponse.Message, session);
        }

        return AuthResultModel.Failure(
            apiResponse?.Message ?? "No fue posible iniciar sesion con las credenciales suministradas.");
    }

    private sealed record LoginApiRequest(string Email, string Password);
}
