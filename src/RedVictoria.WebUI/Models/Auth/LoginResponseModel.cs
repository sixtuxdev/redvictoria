namespace RedVictoria.WebUI.Models.Auth;

public sealed class LoginResponseModel
{
    public string Token { get; init; } = string.Empty;
    public int UsuarioId { get; init; }
    public int CiudadanoId { get; init; }
    public string Nombre { get; init; } = string.Empty;
    public string CodigoReferido { get; init; } = string.Empty;
    public string Email { get; init; } = string.Empty;
    public string Rol { get; init; } = string.Empty;
    public DateTime FechaExpiracion { get; init; }
}
