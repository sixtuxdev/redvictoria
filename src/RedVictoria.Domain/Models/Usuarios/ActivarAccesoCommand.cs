namespace RedVictoria.Domain.Models.Usuarios;

public class ActivarAccesoCommand
{
    public int CiudadanoId { get; init; }
    public string Email { get; init; } = string.Empty;
    public string PasswordHash { get; init; } = string.Empty;
}
