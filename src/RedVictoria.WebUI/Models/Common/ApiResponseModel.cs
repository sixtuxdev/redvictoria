namespace RedVictoria.WebUI.Models.Common;

public sealed class ApiResponseModel<T>
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public T? Data { get; set; }
    public IReadOnlyCollection<string> Errors { get; set; } = [];
}
