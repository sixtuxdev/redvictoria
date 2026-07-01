namespace RedVictoria.WebUI.Models.Ciudadanos;

public sealed record ReferidosPageResultModel(
    bool IsSuccess,
    IReadOnlyCollection<CiudadanoReferidoModel> Items,
    int TotalItems,
    int TotalDirectos,
    int TotalIndirectos,
    int TotalActivos,
    int TotalInactivos,
    string? Message = null)
{
    public static ReferidosPageResultModel Success(
        IReadOnlyCollection<CiudadanoReferidoModel> items,
        int totalItems,
        int totalDirectos,
        int totalIndirectos,
        int totalActivos,
        int totalInactivos,
        string? message = null) =>
        new(true, items, totalItems, totalDirectos, totalIndirectos, totalActivos, totalInactivos, message);

    public static ReferidosPageResultModel Failure(string message) =>
        new(false, [], 0, 0, 0, 0, 0, message);
}
