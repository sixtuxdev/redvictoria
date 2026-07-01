namespace RedVictoria.WebUI.Models.Ciudadanos;

public sealed class ReferidosPageResponseModel
{
    public IReadOnlyCollection<CiudadanoReferidoModel> Items { get; init; } = [];
    public int TotalItems { get; init; }
    public int TotalDirectos { get; init; }
    public int TotalIndirectos { get; init; }
    public int TotalActivos { get; init; }
    public int TotalInactivos { get; init; }
}
