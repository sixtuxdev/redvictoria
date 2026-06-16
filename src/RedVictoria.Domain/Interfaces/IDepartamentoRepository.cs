using RedVictoria.Domain.Models.Departamentos;

namespace RedVictoria.Domain.Interfaces;

public interface IDepartamentoRepository
{
    Task<IReadOnlyCollection<DepartamentoResult>> ObtenerDepartamentosAsync(
        CancellationToken cancellationToken = default);
}
