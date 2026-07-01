namespace RedVictoria.Application.DTOs.Ciudadanos;

public sealed class CiudadanoReferidoPagedRequest
{
    public int PageNumber { get; init; } = 1;
    public int PageSize { get; init; } = 10;
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
