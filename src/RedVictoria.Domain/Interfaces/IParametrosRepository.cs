using RedVictoria.Domain.Models.Parametros;

namespace RedVictoria.Domain.Interfaces;

public interface IParametrosRepository
{
    Task<IReadOnlyCollection<ParametroResult>> ObtenerParametrosPorClaseDescripcion(
        string descripcionClase,
        CancellationToken cancellationToken = default);
}
