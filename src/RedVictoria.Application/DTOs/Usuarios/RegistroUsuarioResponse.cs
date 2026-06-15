namespace RedVictoria.Application.DTOs.Usuarios;

public class RegistroUsuarioResponse
{
    public int UsuarioId { get; set; }
    public int CiudadanoId { get; set; }
    public string Email { get; set; } = string.Empty;
    public string Rol { get; set; } = string.Empty;
    public bool Estado { get; set; }
    public DateTime FechaCreacion { get; set; }
    public string Mensaje { get; set; } = string.Empty;
}
