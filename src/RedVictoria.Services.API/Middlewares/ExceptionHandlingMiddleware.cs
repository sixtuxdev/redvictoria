using System.Data.Common;
using System.Runtime.ExceptionServices;
using Microsoft.Data.SqlClient;

namespace RedVictoria.Services.API.Middlewares;

public class ExceptionHandlingMiddleware
{
    private readonly RequestDelegate _next;
    private readonly ILogger<ExceptionHandlingMiddleware> _logger;

    public ExceptionHandlingMiddleware(
        RequestDelegate next,
        ILogger<ExceptionHandlingMiddleware> logger)
    {
        _next = next;
        _logger = logger;
    }

    public async Task InvokeAsync(HttpContext context)
    {
        try
        {
            await _next(context);
        }
        catch (Exception exception)
        {
            await HandleExceptionAsync(context, exception);
        }
    }

    private async Task HandleExceptionAsync(HttpContext context, Exception exception)
    {
        _logger.LogError(
            exception,
            "Error no controlado. ExceptionType: {ExceptionType}, TraceId: {TraceId}, Path: {Path}, Method: {Method}",
            exception.GetType().FullName,
            context.TraceIdentifier,
            context.Request.Path,
            context.Request.Method);

        if (context.Response.HasStarted)
        {
            ExceptionDispatchInfo.Capture(exception).Throw();
        }

        var error = MapException(exception);

        context.Response.Clear();
        context.Response.StatusCode = error.StatusCode;
        context.Response.ContentType = "application/json";

        await context.Response.WriteAsJsonAsync(
            new ErrorResponse
            {
                Message = error.Message,
                ErrorCode = error.ErrorCode,
                TraceId = context.TraceIdentifier
            });
    }

    private static ErrorDetails MapException(Exception exception) =>
        exception switch
        {
            SqlException or DbException => new(
                StatusCodes.Status500InternalServerError,
                "No fue posible procesar la solicitud en la base de datos.",
                "SQL_ERROR"),
            TimeoutException => new(
                StatusCodes.Status504GatewayTimeout,
                "La operación tardó demasiado tiempo en responder.",
                "TIMEOUT_ERROR"),
            InvalidOperationException or ArgumentException => new(
                StatusCodes.Status400BadRequest,
                "La solicitud contiene datos inválidos.",
                "VALIDATION_ERROR"),
            UnauthorizedAccessException => new(
                StatusCodes.Status401Unauthorized,
                "No tiene permisos para realizar esta acción.",
                "UNAUTHORIZED_ERROR"),
            _ => new(
                StatusCodes.Status500InternalServerError,
                "Ocurrió un error inesperado. Intente nuevamente o contacte al administrador.",
                "UNEXPECTED_ERROR")
        };

    private sealed record ErrorDetails(int StatusCode, string Message, string ErrorCode);
}
