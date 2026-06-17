namespace RedVictoria.Application.DTOs.Auth;

internal class UsuarioLoginDto
{
    public int UsuarioId { get; init; }
    public int CiudadanoId { get; init; }
    public string NombresCompletos { get; init; } = string.Empty;
    public string CodigoReferido { get; init; } = string.Empty;
    public string Email { get; init; } = string.Empty;
    public string PasswordHash { get; init; } = string.Empty;
    public string Rol { get; init; } = string.Empty;
    public bool UsuarioEstado { get; init; }
    public bool CiudadanoEstado { get; init; }
    public bool TieneAcceso { get; init; }
}
