namespace RedVictoria.Application.DTOs.Ciudades;

public class CiudadResponse
{
    public int CiudadId { get; init; }
    public int DepartamentoId { get; init; }
    public string CiudadNombre { get; init; } = string.Empty;
    public string? Descripcion { get; init; }
    public DateTime FechaCreacion { get; init; }
}
