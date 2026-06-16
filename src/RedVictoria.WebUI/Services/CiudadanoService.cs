using System.Net.Http.Json;
using RedVictoria.WebUI.Constants;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Ciudadanos;
using RedVictoria.WebUI.Models.Common;

namespace RedVictoria.WebUI.Services;

public sealed class CiudadanoService(HttpClient httpClient) : ICiudadanoService
{
    public async Task<OperationResultModel> RegistrarAsync(
        RegistroCiudadanoRequestModel request,
        string? codigoReferido,
        CancellationToken cancellationToken = default)
    {
        var endpoint = string.IsNullOrWhiteSpace(codigoReferido)
            ? ApiEndpoints.RegistroCiudadano
            : $"{ApiEndpoints.RegistroCiudadano}?ref={Uri.EscapeDataString(codigoReferido)}";

        var response = await httpClient.PostAsJsonAsync(endpoint, request, cancellationToken);
        var apiResponse = await response.Content.ReadFromJsonAsync<ApiResponseModel<RegistroCiudadanoResponseModel>>(
            cancellationToken: cancellationToken);

        if (response.IsSuccessStatusCode && apiResponse?.IsSuccess == true)
        {
            return OperationResultModel.Success(apiResponse.Message);
        }

        var errors = apiResponse?.Errors?.Where(error => !string.IsNullOrWhiteSpace(error)).ToArray() ?? [];
        var message = errors.Length > 0
            ? string.Join(" ", errors)
            : apiResponse?.Message ?? "No fue posible registrar el ciudadano.";

        return OperationResultModel.Failure(message);
    }
}
