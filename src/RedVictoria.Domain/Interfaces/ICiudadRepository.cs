using RedVictoria.Domain.Models.Ciudades;

namespace RedVictoria.Domain.Interfaces;

public interface ICiudadRepository
{
    Task<IReadOnlyCollection<CiudadResult>> ObtenerCiudadesPorDepartamentoIdAsync(
        int departamentoId,
        CancellationToken cancellationToken = default);
}
