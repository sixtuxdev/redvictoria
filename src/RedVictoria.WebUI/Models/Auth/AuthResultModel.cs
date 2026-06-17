namespace RedVictoria.WebUI.Models.Auth;

public sealed record AuthResultModel(
    bool IsSuccess,
    string? Message = null,
    AuthSessionModel? Session = null)
{
    public static AuthResultModel Success(
        string? message = null,
        AuthSessionModel? session = null)
    {
        return new AuthResultModel(true, message, session);
    }

    public static AuthResultModel Failure(string message)
    {
        return new AuthResultModel(false, message);
    }
}
