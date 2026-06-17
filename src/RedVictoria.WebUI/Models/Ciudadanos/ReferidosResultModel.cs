namespace RedVictoria.WebUI.Models.Ciudadanos;

public sealed record ReferidosResultModel(
    bool IsSuccess,
    IReadOnlyCollection<CiudadanoReferidoModel> Data,
    string? Message = null)
{
    public static ReferidosResultModel Success(
        IReadOnlyCollection<CiudadanoReferidoModel> data,
        string? message = null) =>
        new(true, data, message);

    public static ReferidosResultModel Failure(string message) =>
        new(false, [], message);
}
