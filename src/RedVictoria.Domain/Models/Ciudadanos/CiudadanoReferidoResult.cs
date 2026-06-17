namespace RedVictoria.Domain.Models.Ciudadanos;

public class CiudadanoReferidoResult
{
    public int CiudadanoId { get; init; }
    public string NombresCompletos { get; init; } = string.Empty;
    public string? Email { get; init; }
    public string? Celular { get; init; }
    public string? Celular2 { get; init; }
    public bool? TieneWhatsapp2 { get; init; }
    public string? NumeroIdentificacion { get; init; }
    public string CodigoReferido { get; init; } = string.Empty;
    public int? CiudadanoReferidorId { get; init; }
    public string? Referidor { get; init; }
    public DateTime FechaRegistro { get; init; }
    public bool Estado { get; init; }
    public int Nivel { get; init; }
    public string TipoReferido { get; init; } = string.Empty;
}
