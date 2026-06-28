namespace RedVictoria.Domain.Models.TerminosyCondiciones;

public sealed class TerminosyCondicionesResult
{
    public int TerminosyCondicionesId { get; init; }
    public bool IsSuccess { get; init; }
    public string Message { get; init; } = string.Empty;
}
