namespace RedVictoria.WebUI.Models.Ciudadanos;

public sealed class RegisterCiudadanoRequestModel
{
    public string NombresCompletos { get; set; } = string.Empty;
    public DateTime? FechaNacimiento { get; set; }
    public string? LugarNacimiento { get; set; }
    public string? Email { get; set; }
    public string? Celular { get; set; }
    public bool? TieneWhatsapp { get; set; }
    public string? Celular2 { get; set; }
    public bool? TieneWhatsapp2 { get; set; }
    public int? ParametroIdDondeVive { get; set; }
    public int? ParametroIdTipoIdentificacion { get; set; }
    public string? NumeroIdentificacion { get; set; }
    public string? Direccion { get; set; }
    public int? DepartamentoId { get; set; }
    public int? MunicipioId { get; set; }
    public int? ParametroIdGrupoEdad { get; set; }
    public int? ParametroIdGenero { get; set; }
    public int? ParametroIdSoy { get; set; }
    public string? CodigoReferido { get; set; }
    public int? CiudadanoReferidorId { get; set; }
    public bool TieneAcceso { get; set; }
    public int? ParametroIdVereda { get; set; }
    public bool Estado { get; set; } = true;
    public string? Password { get; set; }
    public string? ConfirmPassword { get; set; }
}