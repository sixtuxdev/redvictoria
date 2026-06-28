namespace RedVictoria.Domain.Models.TerminosyCondiciones;

public sealed class TerminosyCondicionesCommand
{
    public int? TipoDocumentoId { get; init; }
    public string Documento { get; init; } = string.Empty;
    public string Nombres { get; init; } = string.Empty;
    public string? Apellidos { get; init; }
}
