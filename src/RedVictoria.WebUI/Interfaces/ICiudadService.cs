using RedVictoria.WebUI.Models.Ciudades;

namespace RedVictoria.WebUI.Interfaces;

public interface ICiudadService
{
    Task<IReadOnlyCollection<CiudadModel>> ObtenerCiudadesPorDepartamentoIdAsync(
        int departamentoId,
        CancellationToken cancellationToken = default);
}
