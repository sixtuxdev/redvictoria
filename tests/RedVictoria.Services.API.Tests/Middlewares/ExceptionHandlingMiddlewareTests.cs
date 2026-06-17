using System.Reflection;
using System.Text.Json;
using Microsoft.AspNetCore.Http;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Logging;
using RedVictoria.Services.API.Middlewares;
using Xunit;

namespace RedVictoria.Services.API.Tests.Middlewares;

public class ExceptionHandlingMiddlewareTests
{
    [Fact]
    public async Task InvokeAsync_ConErrorGeneral_RetornaRespuestaControladaYRegistraError()
    {
        var exception = new Exception("detalle tecnico sensible");

        var result = await ExecuteAsync(exception);

        Assert.Equal(StatusCodes.Status500InternalServerError, result.Context.Response.StatusCode);
        Assert.Equal("UNEXPECTED_ERROR", result.Response.ErrorCode);
        Assert.Equal(
            "Ocurrió un error inesperado. Intente nuevamente o contacte al administrador.",
            result.Response.Message);
        Assert.Equal(result.Context.TraceIdentifier, result.Response.TraceId);
        Assert.DoesNotContain(exception.Message, result.Body);
        AssertLoggedException(result.Logger, exception, result.Context);
    }

    [Fact]
    public async Task InvokeAsync_ConSqlException_RetornaErrorSqlYRegistraDetalle()
    {
        var exception = CreateSqlException("detalle SQL sensible");

        var result = await ExecuteAsync(exception);

        Assert.Equal(StatusCodes.Status500InternalServerError, result.Context.Response.StatusCode);
        Assert.Equal("SQL_ERROR", result.Response.ErrorCode);
        Assert.Equal(
            "No fue posible procesar la solicitud en la base de datos.",
            result.Response.Message);
        Assert.Equal(result.Context.TraceIdentifier, result.Response.TraceId);
        Assert.DoesNotContain("detalle SQL sensible", result.Body);
        AssertLoggedException(result.Logger, exception, result.Context);
    }

    [Fact]
    public async Task InvokeAsync_ConArgumentException_RetornaErrorDeValidacion()
    {
        var result = await ExecuteAsync(new ArgumentException("argumento invalido"));

        Assert.Equal(StatusCodes.Status400BadRequest, result.Context.Response.StatusCode);
        Assert.Equal("VALIDATION_ERROR", result.Response.ErrorCode);
        Assert.Equal("La solicitud contiene datos inválidos.", result.Response.Message);
    }

    [Fact]
    public async Task InvokeAsync_ConUnauthorizedAccessException_RetornaErrorNoAutorizado()
    {
        var result = await ExecuteAsync(
            new UnauthorizedAccessException("detalle de autorizacion"));

        Assert.Equal(StatusCodes.Status401Unauthorized, result.Context.Response.StatusCode);
        Assert.Equal("UNAUTHORIZED_ERROR", result.Response.ErrorCode);
        Assert.Equal(
            "No tiene permisos para realizar esta acción.",
            result.Response.Message);
    }

    private static async Task<MiddlewareResult> ExecuteAsync(Exception exception)
    {
        var logger = new TestLogger<ExceptionHandlingMiddleware>();
        var middleware = new ExceptionHandlingMiddleware(
            _ => Task.FromException(exception),
            logger);
        var context = new DefaultHttpContext();
        context.TraceIdentifier = "trace-test-001";
        context.Request.Method = HttpMethods.Post;
        context.Request.Path = "/api/ciudadanos/registrar";
        context.Response.Body = new MemoryStream();

        await middleware.InvokeAsync(context);

        context.Response.Body.Position = 0;
        using var reader = new StreamReader(context.Response.Body);
        var body = await reader.ReadToEndAsync();
        var response = JsonSerializer.Deserialize<ErrorResponse>(
            body,
            new JsonSerializerOptions { PropertyNameCaseInsensitive = true });

        Assert.NotNull(response);
        Assert.StartsWith("application/json", context.Response.ContentType);

        return new MiddlewareResult(context, response, body, logger);
    }

    private static void AssertLoggedException(
        TestLogger<ExceptionHandlingMiddleware> logger,
        Exception exception,
        HttpContext context)
    {
        var entry = Assert.Single(logger.Entries);
        Assert.Equal(LogLevel.Error, entry.Level);
        Assert.Same(exception, entry.Exception);
        Assert.Contains(context.TraceIdentifier, entry.Message);
        Assert.Contains(context.Request.Path, entry.Message);
        Assert.Contains(context.Request.Method, entry.Message);
        Assert.Contains(exception.GetType().FullName!, entry.Message);
    }

    private static SqlException CreateSqlException(string message)
    {
        var errorCollection = Activator.CreateInstance(
            typeof(SqlErrorCollection),
            nonPublic: true)!;
        var errorConstructor = typeof(SqlError)
            .GetConstructors(BindingFlags.Instance | BindingFlags.NonPublic)
            .OrderByDescending(constructor => constructor.GetParameters().Length)
            .First();
        var error = (SqlError)errorConstructor.Invoke(
            CreateArguments(errorConstructor.GetParameters(), message));
        typeof(SqlErrorCollection)
            .GetMethod("Add", BindingFlags.Instance | BindingFlags.NonPublic)!
            .Invoke(errorCollection, [error]);

        var createMethod = typeof(SqlException)
            .GetMethods(BindingFlags.Static | BindingFlags.NonPublic)
            .Where(method => method.Name == "CreateException")
            .First(method =>
            {
                var parameters = method.GetParameters();
                return parameters.Length >= 2
                    && parameters[0].ParameterType == typeof(SqlErrorCollection)
                    && parameters[1].ParameterType == typeof(string);
            });

        var arguments = CreateArguments(createMethod.GetParameters(), message);
        arguments[0] = errorCollection;
        arguments[1] = "16.0.0";

        return (SqlException)createMethod.Invoke(null, arguments)!;
    }

    private static object?[] CreateArguments(
        IReadOnlyList<ParameterInfo> parameters,
        string message)
    {
        return parameters
            .Select(parameter => CreateArgument(parameter, message))
            .ToArray();
    }

    private static object? CreateArgument(ParameterInfo parameter, string message)
    {
        if (parameter.ParameterType == typeof(string))
        {
            return parameter.Name?.Contains("message", StringComparison.OrdinalIgnoreCase) == true
                ? message
                : string.Empty;
        }

        if (parameter.ParameterType == typeof(int))
            return 50000;
        if (parameter.ParameterType == typeof(uint))
            return 0U;
        if (parameter.ParameterType == typeof(byte))
            return (byte)0;
        if (parameter.ParameterType == typeof(Guid))
            return Guid.NewGuid();
        if (parameter.ParameterType == typeof(bool))
            return false;

        return null;
    }

    private sealed record MiddlewareResult(
        DefaultHttpContext Context,
        ErrorResponse Response,
        string Body,
        TestLogger<ExceptionHandlingMiddleware> Logger);

    private sealed class TestLogger<T> : ILogger<T>
    {
        public List<LogEntry> Entries { get; } = [];

        public IDisposable? BeginScope<TState>(TState state) where TState : notnull => null;

        public bool IsEnabled(LogLevel logLevel) => true;

        public void Log<TState>(
            LogLevel logLevel,
            EventId eventId,
            TState state,
            Exception? exception,
            Func<TState, Exception?, string> formatter)
        {
            Entries.Add(new LogEntry(logLevel, formatter(state, exception), exception));
        }
    }

    private sealed record LogEntry(
        LogLevel Level,
        string Message,
        Exception? Exception);
}
