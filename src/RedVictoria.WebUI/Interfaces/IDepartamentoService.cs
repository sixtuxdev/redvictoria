using RedVictoria.WebUI.Models.Departamentos;

namespace RedVictoria.WebUI.Interfaces;

public interface IDepartamentoService
{
    Task<IReadOnlyCollection<DepartamentoModel>> ObtenerDepartamentosAsync(
        CancellationToken cancellationToken = default);
}
