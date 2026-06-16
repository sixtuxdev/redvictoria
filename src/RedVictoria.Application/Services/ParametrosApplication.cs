using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Parametros;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;

namespace RedVictoria.Application.Services;

public class ParametrosApplication : IParametrosApplication
{
    private readonly IParametrosRepository _parametrosRepository;

    public ParametrosApplication(IParametrosRepository parametrosRepository)
    {
        _parametrosRepository = parametrosRepository;
    }

    public async Task<Response<IReadOnlyCollection<ParametroResponse>>> ObtenerParametrosPorClaseDescripcion(
        string descripcionClase,
        CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(descripcionClase))
        {
            return Response<IReadOnlyCollection<ParametroResponse>>.Failure(
                "DescripcionClase es obligatoria.",
                new[] { "DescripcionClase es obligatoria." });
        }

        var parametros = await _parametrosRepository.ObtenerParametrosPorClaseDescripcion(
            descripcionClase.Trim(),
            cancellationToken);

        var response = parametros
            .Select(parametro => new ParametroResponse
            {
                ParametroId = parametro.ParametroId,
                ClaseId = parametro.ClaseId,
                Descripcion = parametro.Descripcion,
                Observacion = parametro.Observacion,
                Estado = parametro.Estado,
                FechaCreacion = parametro.FechaCreacion
            })
            .ToArray();

        return Response<IReadOnlyCollection<ParametroResponse>>.Success(
            response,
            "Parametros consultados correctamente.");
    }
}
