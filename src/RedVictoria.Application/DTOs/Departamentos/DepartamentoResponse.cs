namespace RedVictoria.Application.DTOs.Departamentos;

public class DepartamentoResponse
{
    public int DepartamentoId { get; init; }
    public string DepartamentoNombre { get; init; } = string.Empty;
    public string? Descripcion { get; init; }
    public DateTime FechaCreacion { get; init; }
}
