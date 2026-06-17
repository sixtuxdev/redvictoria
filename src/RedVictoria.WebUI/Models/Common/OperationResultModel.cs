namespace RedVictoria.WebUI.Models.Common;

public sealed record OperationResultModel(
    bool IsSuccess,
    string? Message = null,
    string? CodigoReferido = null)
{
    public static OperationResultModel Success(
        string? message = null,
        string? codigoReferido = null)
    {
        return new OperationResultModel(true, message, codigoReferido);
    }

    public static OperationResultModel Failure(string message)
    {
        return new OperationResultModel(false, message);
    }
}
