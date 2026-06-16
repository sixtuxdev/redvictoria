namespace RedVictoria.Domain.Models.Usuarios;

public class ActivarAccesoResult
{
    public bool IsSuccess { get; init; }
    public string Message { get; init; } = string.Empty;
    public int? UsuarioId { get; init; }
    public int? CiudadanoId { get; init; }
    public string? Nombre { get; init; }
    public bool TieneAcceso { get; init; }
}
