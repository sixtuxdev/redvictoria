using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Ciudades;

namespace RedVictoria.Application.Interfaces;

public interface ICiudadApplication
{
    Task<Response<IReadOnlyCollection<CiudadResponse>>> ObtenerCiudadesPorDepartamentoIdAsync(
        int departamentoId,
        CancellationToken cancellationToken = default);
}
