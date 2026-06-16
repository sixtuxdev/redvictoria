using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Departamentos;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;

namespace RedVictoria.Application.Services;

public class DepartamentoApplication : IDepartamentoApplication
{
    private readonly IDepartamentoRepository _departamentoRepository;

    public DepartamentoApplication(IDepartamentoRepository departamentoRepository)
    {
        _departamentoRepository = departamentoRepository;
    }

    public async Task<Response<IReadOnlyCollection<DepartamentoResponse>>> ObtenerDepartamentosAsync(
        CancellationToken cancellationToken = default)
    {
        var departamentos = await _departamentoRepository.ObtenerDepartamentosAsync(cancellationToken);
        var response = departamentos
            .Select(departamento => new DepartamentoResponse
            {
                DepartamentoId = departamento.DepartamentoId,
                DepartamentoNombre = departamento.DepartamentoNombre,
                Descripcion = departamento.Descripcion,
                FechaCreacion = departamento.FechaCreacion
            })
            .ToArray();

        return Response<IReadOnlyCollection<DepartamentoResponse>>.Success(
            response,
            "Departamentos consultados correctamente.");
    }
}
