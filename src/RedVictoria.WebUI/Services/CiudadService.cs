using System.Net.Http.Json;
using Microsoft.Extensions.Configuration;
using RedVictoria.WebUI.Constants;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Ciudades;
using RedVictoria.WebUI.Models.Common;

namespace RedVictoria.WebUI.Services;

public sealed class CiudadService(HttpClient httpClient, IConfiguration configuration) : ICiudadService
{
    public async Task<IReadOnlyCollection<CiudadModel>> ObtenerCiudadesPorDepartamentoIdAsync(
        int departamentoId,
        CancellationToken cancellationToken = default)
    {
        if (departamentoId <= 0)
        {
            return [];
        }

        try
        {
            var endpoint = $"{ApiEndpoints.Ciudades}/departamento/{departamentoId}";
            var response = await httpClient.GetFromJsonAsync<ApiResponseModel<IReadOnlyCollection<CiudadModel>>>(
                ApiEndpointBuilder.Build(configuration, endpoint),
                cancellationToken);

            return response?.IsSuccess == true
                ? response.Data ?? []
                : [];
        }
        catch (HttpRequestException)
        {
            return [];
        }
        catch (NotSupportedException)
        {
            return [];
        }
    }
}
