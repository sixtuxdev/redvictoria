namespace RedVictoria.Domain.Entities;

public class Ciudad
{
    public int CiudadId { get; set; }
    public int DepartamentoId { get; set; }
    public string CiudadNombre { get; set; } = string.Empty;
    public string? Descripcion { get; set; }
    public DateTime FechaCreacion { get; set; }
}
