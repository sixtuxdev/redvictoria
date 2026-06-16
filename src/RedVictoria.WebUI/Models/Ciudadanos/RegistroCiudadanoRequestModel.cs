using System.ComponentModel.DataAnnotations;

namespace RedVictoria.WebUI.Models.Ciudadanos;

public sealed class RegistroCiudadanoRequestModel
{
    [Required(ErrorMessage = "Nombres completos es obligatorio.")]
    [MaxLength(200, ErrorMessage = "Nombres completos no puede superar 200 caracteres.")]
    public string NombresCompletos { get; set; } = string.Empty;

    public DateTime? FechaNacimiento { get; set; }

    [MaxLength(150, ErrorMessage = "Lugar de nacimiento no puede superar 150 caracteres.")]
    public string? LugarNacimiento { get; set; }

    [EmailAddress(ErrorMessage = "Email no tiene un formato valido.")]
    [MaxLength(150, ErrorMessage = "Email no puede superar 150 caracteres.")]
    public string? Email { get; set; }

    [MaxLength(30, ErrorMessage = "Celular no puede superar 30 caracteres.")]
    public string? Celular { get; set; }

    public bool? TieneWhatsapp { get; set; }

    public int? ParametroIdDondeVive { get; set; }

    [MaxLength(150, ErrorMessage = "Puesto de votacion no puede superar 150 caracteres.")]
    public string? PuestoVotacion { get; set; }

    public int? ParametroIdTipoIdentificacion { get; set; }

    [MaxLength(50, ErrorMessage = "Numero de identificacion no puede superar 50 caracteres.")]
    public string? NumeroIdentificacion { get; set; }

    [MaxLength(250, ErrorMessage = "Direccion no puede superar 250 caracteres.")]
    public string? Direccion { get; set; }

    public int? DepartamentoId { get; set; }

    public int? MunicipioId { get; set; }

    public int? ParametroIdGrupoEdad { get; set; }

    public int? ParametroIdGenero { get; set; }

    public int? ParametroIdSoy { get; set; }

    [MaxLength(50, ErrorMessage = "Codigo referido no puede superar 50 caracteres.")]
    public string? CodigoReferido { get; set; }

    public int? CiudadanoReferidorId { get; set; }

    public bool TieneAcceso { get; set; }

    public bool Estado { get; set; } = true;

    public string? Password { get; set; }

    public string? ConfirmPassword { get; set; }
}
