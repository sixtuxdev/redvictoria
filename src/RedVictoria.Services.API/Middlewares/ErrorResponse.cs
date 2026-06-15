namespace RedVictoria.Services.API.Middlewares;

public class ErrorResponse
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public string? ErrorCode { get; set; }
    public string? TraceId { get; set; }
}
