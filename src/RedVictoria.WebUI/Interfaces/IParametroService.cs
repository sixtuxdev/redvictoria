using RedVictoria.WebUI.Models.Parametros;

namespace RedVictoria.WebUI.Interfaces;

public interface IParametroService
{
    Task<RegistroCiudadanoParametrosModel> ObtenerParametrosRegistroCiudadanoAsync(
        CancellationToken cancellationToken = default);

    Task<IReadOnlyCollection<ParametroOptionModel>> ObtenerParametrosPorClaseDescripcionAsync(
        string descripcionClase,
        CancellationToken cancellationToken = default);
}
