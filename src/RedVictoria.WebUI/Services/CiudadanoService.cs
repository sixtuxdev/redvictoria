using System.Net.Http.Json;
using System.Text.Json;
using Microsoft.Extensions.Configuration;
using RedVictoria.WebUI.Constants;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Ciudadanos;
using RedVictoria.WebUI.Models.Common;

namespace RedVictoria.WebUI.Services;

public sealed class CiudadanoService(HttpClient httpClient, IConfiguration configuration) : ICiudadanoService
{
    public async Task<OperationResultModel> ValidarCodigoReferidoAsync(
        string? codigoReferido,
        CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(codigoReferido))
        {
            return OperationResultModel.Failure("No puede continuar porque el referido ingresado no existe.");
        }

        var relativeEndpoint = $"{ApiEndpoints.ValidarCodigoReferido}/{Uri.EscapeDataString(codigoReferido.Trim())}";
        var endpoint = ApiEndpointBuilder.Build(configuration, relativeEndpoint);

        ApiResponseModel<ValidarCodigoReferidoResponseModel>? apiResponse;
        try
        {
            apiResponse = await httpClient.GetFromJsonAsync<ApiResponseModel<ValidarCodigoReferidoResponseModel>>(
                endpoint,
                cancellationToken);
        }
        catch (HttpRequestException)
        {
            return OperationResultModel.Failure("No fue posible validar el referido ingresado.");
        }
        catch (JsonException)
        {
            return OperationResultModel.Failure("No fue posible interpretar la validacion del referido.");
        }
        catch (NotSupportedException)
        {
            return OperationResultModel.Failure("El servicio de validacion del referido no devolvio una respuesta JSON valida.");
        }

        if (apiResponse?.IsSuccess == true && apiResponse.Data?.Existe == true)
        {
            return OperationResultModel.Success(apiResponse.Message);
        }

        return OperationResultModel.Failure(
            apiResponse?.Message ?? "No puede continuar porque el referido ingresado no existe.");
    }

    public async Task<OperationResultModel> RegistrarAsync(
        RegistroCiudadanoRequestModel request,
        string? codigoReferido,
        CancellationToken cancellationToken = default)
    {
        var relativeEndpoint = string.IsNullOrWhiteSpace(codigoReferido)
            ? ApiEndpoints.RegistroCiudadano
            : $"{ApiEndpoints.RegistroCiudadano}?ref={Uri.EscapeDataString(codigoReferido)}";
        var endpoint = ApiEndpointBuilder.Build(configuration, relativeEndpoint);

        var response = await httpClient.PostAsJsonAsync(endpoint, request, cancellationToken);
        if (response.Content.Headers.ContentLength == 0)
        {
            return OperationResultModel.Failure("El servicio de registro ciudadano no devolvio una respuesta valida.");
        }

        ApiResponseModel<RegistroCiudadanoResponseModel>? apiResponse = null;
        try
        {
            apiResponse = await response.Content.ReadFromJsonAsync<ApiResponseModel<RegistroCiudadanoResponseModel>>(
                cancellationToken: cancellationToken);
        }
        catch (JsonException)
        {
            return OperationResultModel.Failure("No fue posible interpretar la respuesta del servicio de registro ciudadano.");
        }
        catch (NotSupportedException)
        {
            return OperationResultModel.Failure("El servicio de registro ciudadano no devolvio una respuesta JSON valida.");
        }

        if (response.IsSuccessStatusCode && apiResponse?.IsSuccess == true)
        {
            return OperationResultModel.Success(
                apiResponse.Message,
                apiResponse.Data?.CodigoReferido);
        }

        var errors = apiResponse?.Errors?.Where(error => !string.IsNullOrWhiteSpace(error)).ToArray() ?? [];
        var message = errors.Length > 0
            ? string.Join(" ", errors)
            : apiResponse?.Message ?? "No fue posible registrar el ciudadano.";

        return OperationResultModel.Failure(message);
    }
}
