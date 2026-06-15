namespace RedVictoria.Application.Common;

public class Response<T>
{
    public bool IsSuccess { get; init; }
    public string Message { get; init; } = string.Empty;
    public T? Data { get; init; }
    public IReadOnlyCollection<string> Errors { get; init; } = [];

    public static Response<T> Success(T data, string message) =>
        new()
        {
            IsSuccess = true,
            Message = message,
            Data = data
        };

    public static Response<T> Failure(string message, IEnumerable<string>? errors = null) =>
        new()
        {
            IsSuccess = false,
            Message = message,
            Errors = errors?.ToArray() ?? []
        };
}
