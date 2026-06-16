using System.Net.Http.Json;
using RedVictoria.WebUI.Constants;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Common;
using RedVictoria.WebUI.Models.Parametros;

namespace RedVictoria.WebUI.Services;

public sealed class ParametroService(HttpClient httpClient) : IParametroService
{
    public async Task<RegistroCiudadanoParametrosModel> ObtenerParametrosRegistroCiudadanoAsync(
        CancellationToken cancellationToken = default)
    {
        return new RegistroCiudadanoParametrosModel
        {
            DondeVive = await ObtenerPorTipoAsync(ParametroTipos.DondeVive, cancellationToken),
            TiposIdentificacion = await ObtenerPorTipoAsync(ParametroTipos.TipoIdentificacion, cancellationToken),
            GruposEdad = await ObtenerPorTipoAsync(ParametroTipos.GrupoEdad, cancellationToken),
            Generos = await ObtenerPorTipoAsync(ParametroTipos.Genero, cancellationToken),
            Soy = await ObtenerPorTipoAsync(ParametroTipos.Soy, cancellationToken)
        };
    }

    private async Task<IReadOnlyCollection<ParametroOptionModel>> ObtenerPorTipoAsync(
        string tipo,
        CancellationToken cancellationToken)
    {
        try
        {
            var response = await httpClient.GetFromJsonAsync<ApiResponseModel<IReadOnlyCollection<ParametroOptionModel>>>(
                $"{ApiEndpoints.Parametros}/clase/{Uri.EscapeDataString(tipo)}",
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
