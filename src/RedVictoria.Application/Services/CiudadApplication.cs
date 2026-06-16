using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Ciudades;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;

namespace RedVictoria.Application.Services;

public class CiudadApplication : ICiudadApplication
{
    private readonly ICiudadRepository _ciudadRepository;

    public CiudadApplication(ICiudadRepository ciudadRepository)
    {
        _ciudadRepository = ciudadRepository;
    }

    public async Task<Response<IReadOnlyCollection<CiudadResponse>>> ObtenerCiudadesPorDepartamentoIdAsync(
        int departamentoId,
        CancellationToken cancellationToken = default)
    {
        if (departamentoId <= 0)
        {
            return Response<IReadOnlyCollection<CiudadResponse>>.Failure(
                "DepartamentoId es obligatorio.",
                new[] { "DepartamentoId debe ser mayor que cero." });
        }

        var ciudades = await _ciudadRepository.ObtenerCiudadesPorDepartamentoIdAsync(
            departamentoId,
            cancellationToken);

        var response = ciudades
            .Select(ciudad => new CiudadResponse
            {
                CiudadId = ciudad.CiudadId,
                DepartamentoId = ciudad.DepartamentoId,
                CiudadNombre = ciudad.CiudadNombre,
                Descripcion = ciudad.Descripcion,
                FechaCreacion = ciudad.FechaCreacion
            })
            .ToArray();

        return Response<IReadOnlyCollection<CiudadResponse>>.Success(
            response,
            "Ciudades consultadas correctamente.");
    }
}
