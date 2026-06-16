namespace RedVictoria.Application.DTOs.Usuarios;

public class ActivarAccesoResponse
{
    public int UsuarioId { get; set; }
    public int CiudadanoId { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public bool TieneAcceso { get; set; }
}
