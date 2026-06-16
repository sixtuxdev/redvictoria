namespace RedVictoria.Domain.Models.Parametros;

public class ParametroResult
{
    public int ParametroId { get; init; }
    public int ClaseId { get; init; }
    public string Descripcion { get; init; } = string.Empty;
    public string? Observacion { get; init; }
    public bool Estado { get; init; }
    public DateTime FechaCreacion { get; init; }
}
