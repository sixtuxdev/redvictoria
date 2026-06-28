using RedVictoria.Domain.Models.TerminosyCondiciones;

namespace RedVictoria.Domain.Interfaces;

public interface ITerminosyCondicionesRepository
{
    Task<TerminosyCondicionesResult> InsertarAsync(
        TerminosyCondicionesCommand command,
        CancellationToken cancellationToken = default);
}
