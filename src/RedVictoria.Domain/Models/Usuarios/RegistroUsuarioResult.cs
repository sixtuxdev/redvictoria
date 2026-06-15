namespace RedVictoria.Domain.Models.Usuarios;

public class RegistroUsuarioResult
{
    public bool IsSuccess { get; init; }
    public string Message { get; init; } = string.Empty;
    public int? UsuarioId { get; init; }
    public int? CiudadanoId { get; init; }
    public string? Email { get; init; }
    public string? Rol { get; init; }
    public bool Estado { get; init; }
    public DateTime? FechaCreacion { get; init; }
}
