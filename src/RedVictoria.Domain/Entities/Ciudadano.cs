namespace RedVictoria.Domain.Entities;

public class Ciudadano
{
    public int CiudadanoId { get; set; }
    public string NombresCompletos { get; set; } = string.Empty;
    public DateTime? FechaNacimiento { get; set; }
    public string? LugarNacimiento { get; set; }
    public string? Email { get; set; }
    public string? Celular { get; set; }
    public bool? TieneWhatsapp { get; set; }
    public int? ParametroIdDondeVive { get; set; }
    public string? PuestoVotacion { get; set; }
    public int? ParametroIdTipoIdentificacion { get; set; }
    public string? NumeroIdentificacion { get; set; }
    public string? Direccion { get; set; }
    public int? DepartamentoId { get; set; }
    public int? MunicipioId { get; set; }
    public int? ParametroIdGrupoEdad { get; set; }
    public int? ParametroIdGenero { get; set; }
    public int? ParametroIdSoy { get; set; }
    public string CodigoReferido { get; set; } = string.Empty;
    public int? CiudadanoReferidorId { get; set; }
    public bool TieneAcceso { get; set; }
    public bool Estado { get; set; }
    public DateTime FechaRegistro { get; set; }
}
