namespace RedVictoria.WebUI.Models.Ciudades;

public sealed class CiudadModel
{
    public int CiudadId { get; init; }
    public int DepartamentoId { get; init; }
    public string CiudadNombre { get; init; } = string.Empty;
    public string? Descripcion { get; init; }
}
