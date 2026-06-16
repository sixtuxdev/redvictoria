namespace RedVictoria.WebUI.Models.Common;

public sealed record OperationResultModel(bool IsSuccess, string? Message = null)
{
    public static OperationResultModel Success(string? message = null)
    {
        return new OperationResultModel(true, message);
    }

    public static OperationResultModel Failure(string message)
    {
        return new OperationResultModel(false, message);
    }
}
