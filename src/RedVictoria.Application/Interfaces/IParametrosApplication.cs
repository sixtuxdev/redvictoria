using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Parametros;

namespace RedVictoria.Application.Interfaces;

public interface IParametrosApplication
{
    Task<Response<IReadOnlyCollection<ParametroResponse>>> ObtenerParametrosPorClaseDescripcion(
        string descripcionClase,
        CancellationToken cancellationToken = default);
}
