namespace RedVictoria.Application.DTOs.Usuarios;

public class ActivarAccesoRequest
{
    public int CiudadanoId { get; set; }
    public string Email { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
    public string ConfirmPassword { get; set; } = string.Empty;
}
