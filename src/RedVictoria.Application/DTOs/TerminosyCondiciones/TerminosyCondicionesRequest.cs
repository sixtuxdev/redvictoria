namespace RedVictoria.Application.DTOs.TerminosyCondiciones;

public sealed class TerminosyCondicionesRequest
{
    public int? TipoDocumentoId { get; set; }
    public string Documento { get; set; } = string.Empty;
    public string Nombres { get; set; } = string.Empty;
    public string? Apellidos { get; set; }
}
