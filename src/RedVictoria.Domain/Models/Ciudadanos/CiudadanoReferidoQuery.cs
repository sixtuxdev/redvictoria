namespace RedVictoria.Domain.Models.Ciudadanos;

public sealed class CiudadanoReferidoQuery
{
    public int CiudadanoId { get; init; }
    public int? PageNumber { get; init; }
    public int? PageSize { get; init; }
    public string? SearchText { get; init; }
    public string? NombresCompletos { get; init; }
    public string? NumeroIdentificacion { get; init; }
    public string? Email { get; init; }
    public string? Celular { get; init; }
    public DateTime? FechaNacimiento { get; init; }
    public string? CodigoReferido { get; init; }
    public string? Referidor { get; init; }
    public DateTime? FechaRegistro { get; init; }
    public bool? Estado { get; init; }
    public string? TipoReferido { get; init; }
    public string? SortColumn { get; init; }
    public bool SortDescending { get; init; }
}
