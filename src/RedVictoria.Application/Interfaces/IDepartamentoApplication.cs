using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Departamentos;

namespace RedVictoria.Application.Interfaces;

public interface IDepartamentoApplication
{
    Task<Response<IReadOnlyCollection<DepartamentoResponse>>> ObtenerDepartamentosAsync(
        CancellationToken cancellationToken = default);
}
