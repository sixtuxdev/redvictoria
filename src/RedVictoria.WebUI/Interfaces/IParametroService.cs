using RedVictoria.WebUI.Models.Parametros;

namespace RedVictoria.WebUI.Interfaces;

public interface IParametroService
{
    Task<RegistroCiudadanoParametrosModel> ObtenerParametrosRegistroCiudadanoAsync(
        CancellationToken cancellationToken = default);
}
