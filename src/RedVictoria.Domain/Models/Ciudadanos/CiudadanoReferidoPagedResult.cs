namespace RedVictoria.Domain.Models.Ciudadanos;

public sealed record CiudadanoReferidoPagedResult(
    IReadOnlyCollection<CiudadanoReferidoResult> Items,
    int TotalItems,
    int TotalDirectos,
    int TotalIndirectos,
    int TotalActivos,
    int TotalInactivos);
