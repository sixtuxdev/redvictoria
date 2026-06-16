namespace RedVictoria.WebUI.Models.Auth;

public sealed record AuthResultModel(bool IsSuccess, string? Message = null)
{
    public static AuthResultModel Success(string? message = null)
    {
        return new AuthResultModel(true, message);
    }

    public static AuthResultModel Failure(string message)
    {
        return new AuthResultModel(false, message);
    }
}
