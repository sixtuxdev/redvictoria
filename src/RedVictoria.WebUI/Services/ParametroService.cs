using System.Net.Http.Json;
using Microsoft.Extensions.Configuration;
using RedVictoria.WebUI.Constants;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Common;
using RedVictoria.WebUI.Models.Parametros;

namespace RedVictoria.WebUI.Services;

public sealed class ParametroService(HttpClient httpClient, IConfiguration configuration) : IParametroService
{
    public async Task<RegistroCiudadanoParametrosModel> ObtenerParametrosRegistroCiudadanoAsync(
        CancellationToken cancellationToken = default)
    {
        return new RegistroCiudadanoParametrosModel
        {
            TiposIdentificacion = await ObtenerParametrosPorClaseDescripcionAsync(ParametroTipos.TipoIdentificacion, cancellationToken),
            GruposEdad = await ObtenerParametrosPorClaseDescripcionAsync(ParametroTipos.GrupoEdad, cancellationToken),
            Generos = await ObtenerParametrosPorClaseDescripcionAsync(ParametroTipos.Genero, cancellationToken),
            Soy = await ObtenerParametrosPorClaseDescripcionAsync(ParametroTipos.Soy, cancellationToken),
            DondeVive = await ObtenerParametrosPorClaseDescripcionAsync(ParametroTipos.DondeVive, cancellationToken)
        };
    }

    public async Task<IReadOnlyCollection<ParametroOptionModel>> ObtenerParametrosPorClaseDescripcionAsync(
        string descripcionClase,
        CancellationToken cancellationToken)
    {
        if (string.IsNullOrWhiteSpace(descripcionClase))
        {
            return [];
        }

        try
        {
            var response = await httpClient.GetFromJsonAsync<ApiResponseModel<IReadOnlyCollection<ParametroOptionModel>>>(
                BuildEndpoint(descripcionClase),
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

    private string BuildEndpoint(string descripcionClase)
    {
        var relativeEndpoint = $"{ApiEndpoints.Parametros}/clase/{Uri.EscapeDataString(descripcionClase.Trim())}";
        var apiBaseUrl = configuration["ApiBaseUrl"];

        if (string.IsNullOrWhiteSpace(apiBaseUrl))
        {
            return relativeEndpoint;
        }

        return new Uri(new Uri(apiBaseUrl, UriKind.Absolute), relativeEndpoint).ToString();
    }
}
