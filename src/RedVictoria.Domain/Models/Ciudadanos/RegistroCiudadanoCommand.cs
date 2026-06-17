namespace RedVictoria.Domain.Models.Ciudadanos;

public class RegistroCiudadanoCommand
{
    public string NombresCompletos { get; init; } = string.Empty;
    public string? Celular { get; init; }
    public DateTime? FechaNacimiento { get; init; }
    public string? LugarNacimiento { get; init; }
    public bool? TieneWhatsapp { get; init; }
    public int? ParametroIdDondeVive { get; init; }
    public string? PuestoVotacion { get; init; }
    public string? Email { get; init; }
    public int? ParametroIdTipoIdentificacion { get; init; }
    public string? NumeroIdentificacion { get; init; }
    public string? Direccion { get; init; }
    public int? DepartamentoId { get; init; }
    public int? MunicipioId { get; init; }
    public int? ParametroIdGrupoEdad { get; init; }
    public int? ParametroIdGenero { get; init; }
    public int? ParametroIdSoy { get; init; }
    public int? ParametroIdVereda { get; init; }
    public bool Estado { get; init; } = true;
    public string? CodigoReferidoInvitacion { get; init; }
    public string? PasswordHash { get; init; }
}
