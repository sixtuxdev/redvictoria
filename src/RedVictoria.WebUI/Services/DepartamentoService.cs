using System.Net.Http.Json;
using Microsoft.Extensions.Configuration;
using RedVictoria.WebUI.Constants;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Common;
using RedVictoria.WebUI.Models.Departamentos;

namespace RedVictoria.WebUI.Services;

public sealed class DepartamentoService(HttpClient httpClient, IConfiguration configuration) : IDepartamentoService
{
    public async Task<IReadOnlyCollection<DepartamentoModel>> ObtenerDepartamentosAsync(
        CancellationToken cancellationToken = default)
    {
        try
        {
            var response = await httpClient.GetFromJsonAsync<ApiResponseModel<IReadOnlyCollection<DepartamentoModel>>>(
                ApiEndpointBuilder.Build(configuration, ApiEndpoints.Departamentos),
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
