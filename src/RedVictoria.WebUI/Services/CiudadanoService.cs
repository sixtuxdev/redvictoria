using System.Net.Http.Json;
using System.Net.Http.Headers;
using System.Text.Json;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using RedVictoria.WebUI.Constants;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Ciudadanos;
using RedVictoria.WebUI.Models.Common;

namespace RedVictoria.WebUI.Services;

public sealed class CiudadanoService(
    HttpClient httpClient,
    IConfiguration configuration,
    IAuthSessionService authSessionService,
    ILogger<CiudadanoService> logger) : ICiudadanoService
{
    public async Task<ReferidosResultModel> ObtenerRedReferidosAsync(
        CancellationToken cancellationToken = default)
    {
        var request = await CreateAuthorizedRequestAsync(
            HttpMethod.Get,
            ApiEndpoints.Referidos,
            cancellationToken);
        if (request is null)
        {
            return ReferidosResultModel.Failure("Debes iniciar sesión para consultar el dashboard.");
        }

        var response = await httpClient.SendAsync(request, cancellationToken);
        ApiResponseModel<IReadOnlyCollection<CiudadanoReferidoModel>>? apiResponse;
        try
        {
            apiResponse = await response.Content.ReadFromJsonAsync<ApiResponseModel<IReadOnlyCollection<CiudadanoReferidoModel>>>(
                cancellationToken: cancellationToken);
        }
        catch (JsonException)
        {
            return ReferidosResultModel.Failure("No fue posible interpretar la red de referidos.");
        }
        catch (NotSupportedException)
        {
            return ReferidosResultModel.Failure("El servicio de referidos no devolvio una respuesta valida.");
        }

        if (response.IsSuccessStatusCode && apiResponse?.IsSuccess == true)
        {
            return ReferidosResultModel.Success(apiResponse.Data ?? [], apiResponse.Message);
        }

        return ReferidosResultModel.Failure(apiResponse?.Message ?? "No fue posible consultar la red de referidos.");
    }

    public async Task<OperationResultModel> DesactivarReferidoAsync(
        int ciudadanoReferidoId,
        CancellationToken cancellationToken = default)
    {
        var request = await CreateAuthorizedRequestAsync(
            HttpMethod.Put,
            $"{ApiEndpoints.Referidos}/{ciudadanoReferidoId}/desactivar",
            cancellationToken);
        if (request is null)
        {
            return OperationResultModel.Failure("Debes iniciar sesión para desactivar un referido.");
        }

        var response = await httpClient.SendAsync(request, cancellationToken);
        ApiResponseModel<bool>? apiResponse;
        try
        {
            apiResponse = await response.Content.ReadFromJsonAsync<ApiResponseModel<bool>>(
                cancellationToken: cancellationToken);
        }
        catch (JsonException)
        {
            return OperationResultModel.Failure("No fue posible interpretar la respuesta de desactivacion.");
        }
        catch (NotSupportedException)
        {
            return OperationResultModel.Failure("El servicio de desactivacion no devolvio una respuesta valida.");
        }

        return response.IsSuccessStatusCode && apiResponse?.IsSuccess == true
            ? OperationResultModel.Success(apiResponse.Message)
            : OperationResultModel.Failure(apiResponse?.Message ?? "No fue posible desactivar el referido.");
    }

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
            return OperationResultModel.Failure("No fue posible interpretar la validación del referido.");
        }
        catch (NotSupportedException)
        {
            return OperationResultModel.Failure("El servicio de validación del referido no devolvió una respuesta JSON válida.");
        }

        if (apiResponse?.IsSuccess == true && apiResponse.Data?.Existe == true)
        {
            return OperationResultModel.Success(apiResponse.Message);
        }

        return OperationResultModel.Failure(
            apiResponse?.Message ?? "No puede continuar porque el referido ingresado no existe.");
    }

    public Task<OperationResultModel> RegistrarAsync(
        RegistroCiudadanoRequestModel request,
        string? codigoReferido,
        CancellationToken cancellationToken = default) =>
        RegistrarCoreAsync(request, codigoReferido, cancellationToken);

    public Task<OperationResultModel> RegistrarAsync(
        RegisterCiudadanoRequestModel request,
        string? codigoReferido,
        CancellationToken cancellationToken = default) =>
        RegistrarCoreAsync(request, codigoReferido, cancellationToken);

    private async Task<OperationResultModel> RegistrarCoreAsync<TRequest>(
        TRequest request,
        string? codigoReferido,
        CancellationToken cancellationToken = default)
    {
        var relativeEndpoint = string.IsNullOrWhiteSpace(codigoReferido)
            ? ApiEndpoints.RegistroCiudadano
            : $"{ApiEndpoints.RegistroCiudadano}?ref={Uri.EscapeDataString(codigoReferido)}";
        var endpoint = ApiEndpointBuilder.Build(configuration, relativeEndpoint);
        var camposNuevosJson = BuildCamposNuevosJson(request);
        logger.LogInformation("Registro ciudadano WebUI HTTP JSON campos nuevos: {CamposNuevosJson}", camposNuevosJson);

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

    private static string BuildCamposNuevosJson<TRequest>(TRequest request)
    {
        var requestType = request?.GetType();
        object? GetValue(string propertyName) => requestType?.GetProperty(propertyName)?.GetValue(request);

        return JsonSerializer.Serialize(new
        {
            ParametroIdTipoDiscapacidad = GetValue(nameof(RegistroCiudadanoRequestModel.ParametroIdTipoDiscapacidad)),
            ParametroIdEstadoCivil = GetValue(nameof(RegistroCiudadanoRequestModel.ParametroIdEstadoCivil)),
            TieneHijos = GetValue(nameof(RegistroCiudadanoRequestModel.TieneHijos)),
            Cuantos = GetValue(nameof(RegistroCiudadanoRequestModel.Cuantos)),
            TieneVehiculo = GetValue(nameof(RegistroCiudadanoRequestModel.TieneVehiculo)),
            ParametroIdTipoVehiculo = GetValue(nameof(RegistroCiudadanoRequestModel.ParametroIdTipoVehiculo)),
            ParametroIdReligion = GetValue(nameof(RegistroCiudadanoRequestModel.ParametroIdReligion)),
            EsEmpleado = GetValue(nameof(RegistroCiudadanoRequestModel.EsEmpleado))
        });
    }
    private async Task<HttpRequestMessage?> CreateAuthorizedRequestAsync(
        HttpMethod method,
        string relativeEndpoint,
        CancellationToken cancellationToken)
    {
        var token = await authSessionService.GetTokenAsync(cancellationToken);
        if (string.IsNullOrWhiteSpace(token))
        {
            return null;
        }

        var endpoint = ApiEndpointBuilder.Build(configuration, relativeEndpoint);
        var request = new HttpRequestMessage(method, endpoint);
        request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", token);
        return request;
    }
}
