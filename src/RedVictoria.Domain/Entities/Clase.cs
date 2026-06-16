namespace RedVictoria.Domain.Entities;

public class Clase
{
    public int ClaseId { get; set; }
    public string Descripcion { get; set; } = string.Empty;
    public bool Estado { get; set; }
    public DateTime FechaCreacion { get; set; }
}
