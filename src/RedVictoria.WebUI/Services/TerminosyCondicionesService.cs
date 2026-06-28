using System.Net.Http.Json;
using System.Text.Json;
using Microsoft.Extensions.Configuration;
using RedVictoria.WebUI.Constants;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Common;
using RedVictoria.WebUI.Models.TerminosyCondiciones;

namespace RedVictoria.WebUI.Services;

public sealed class TerminosyCondicionesService(
    HttpClient httpClient,
    IConfiguration configuration) : ITerminosyCondicionesService
{
    public async Task<OperationResultModel> InsertarAsync(
        TerminosyCondicionesRequestModel request,
        CancellationToken cancellationToken = default)
    {
        var endpoint = ApiEndpointBuilder.Build(configuration, ApiEndpoints.TerminosyCondiciones);
        var response = await httpClient.PostAsJsonAsync(endpoint, request, cancellationToken);

        if (response.Content.Headers.ContentLength == 0)
        {
            return OperationResultModel.Failure("El servicio de términos y condiciones no devolvió una respuesta válida.");
        }

        ApiResponseModel<TerminosyCondicionesResponseModel>? apiResponse;
        try
        {
            apiResponse = await response.Content.ReadFromJsonAsync<ApiResponseModel<TerminosyCondicionesResponseModel>>(
                cancellationToken: cancellationToken);
        }
        catch (JsonException)
        {
            return OperationResultModel.Failure("No fue posible interpretar la respuesta de términos y condiciones.");
        }
        catch (NotSupportedException)
        {
            return OperationResultModel.Failure("El servicio de términos y condiciones no devolvió una respuesta JSON válida.");
        }

        if (response.IsSuccessStatusCode && apiResponse?.IsSuccess == true)
        {
            return OperationResultModel.Success(apiResponse.Message);
        }

        var errors = apiResponse?.Errors?.Where(error => !string.IsNullOrWhiteSpace(error)).ToArray() ?? [];
        var message = errors.Length > 0
            ? string.Join(" ", errors)
            : apiResponse?.Message ?? "No fue posible registrar la aceptación de términos y condiciones.";

        return OperationResultModel.Failure(message);
    }
}
