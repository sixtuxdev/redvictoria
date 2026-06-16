namespace RedVictoria.Application.DTOs.Parametros;

public class ParametroResponse
{
    public int ParametroId { get; init; }
    public int ClaseId { get; init; }
    public string Descripcion { get; init; } = string.Empty;
    public string? Observacion { get; init; }
    public bool Estado { get; init; }
    public DateTime FechaCreacion { get; init; }
}
