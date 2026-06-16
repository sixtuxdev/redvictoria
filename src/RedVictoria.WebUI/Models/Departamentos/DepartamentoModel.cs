namespace RedVictoria.WebUI.Models.Departamentos;

public sealed class DepartamentoModel
{
    public int DepartamentoId { get; init; }
    public string DepartamentoNombre { get; init; } = string.Empty;
    public string? Descripcion { get; init; }
}
