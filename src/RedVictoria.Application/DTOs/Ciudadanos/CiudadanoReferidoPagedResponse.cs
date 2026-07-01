namespace RedVictoria.Application.DTOs.Ciudadanos;

public sealed class CiudadanoReferidoPagedResponse
{
    public IReadOnlyCollection<CiudadanoReferidoResponse> Items { get; init; } = [];
    public int TotalItems { get; init; }
    public int TotalDirectos { get; init; }
    public int TotalIndirectos { get; init; }
    public int TotalActivos { get; init; }
    public int TotalInactivos { get; init; }
}
