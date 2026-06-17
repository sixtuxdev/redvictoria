using System.ComponentModel.DataAnnotations;

namespace RedVictoria.WebUI.Models.Ciudadanos;

public sealed class RegistroCiudadanoRequestModel
{
    [Required(ErrorMessage = "Nombres completos es obligatorio.")]
    [MaxLength(200, ErrorMessage = "Nombres completos no puede superar 200 caracteres.")]
    public string NombresCompletos { get; set; } = string.Empty;

    [Required(ErrorMessage = "Fecha de nacimiento es obligatoria.")]
    public DateTime? FechaNacimiento { get; set; }

    [MaxLength(150, ErrorMessage = "Lugar de nacimiento no puede superar 150 caracteres.")]
    public string? LugarNacimiento { get; set; }

    [Required(ErrorMessage = "Email es obligatorio.")]
    [EmailAddress(ErrorMessage = "Email no tiene un formato valido.")]
    [MaxLength(150, ErrorMessage = "Email no puede superar 150 caracteres.")]
    public string? Email { get; set; }

    [Required(ErrorMessage = "Celular es obligatorio.")]
    [MaxLength(30, ErrorMessage = "Celular no puede superar 30 caracteres.")]
    public string? Celular { get; set; }

    [Required(ErrorMessage = "Tiene WhatsApp es obligatorio.")]
    public bool? TieneWhatsapp { get; set; }

    [Required(ErrorMessage = "Donde vive es obligatorio.")]
    public int? ParametroIdDondeVive { get; set; }

    [Required(ErrorMessage = "Puesto de votacion es obligatorio.")]
    [MaxLength(150, ErrorMessage = "Puesto de votacion no puede superar 150 caracteres.")]
    public string? PuestoVotacion { get; set; }

    [Required(ErrorMessage = "Tipo de identificacion es obligatorio.")]
    public int? ParametroIdTipoIdentificacion { get; set; }

    [Required(ErrorMessage = "Numero de identificacion es obligatorio.")]
    [MaxLength(50, ErrorMessage = "Numero de identificacion no puede superar 50 caracteres.")]
    public string? NumeroIdentificacion { get; set; }

    [Required(ErrorMessage = "Direccion es obligatoria.")]
    [MaxLength(250, ErrorMessage = "Direccion no puede superar 250 caracteres.")]
    public string? Direccion { get; set; }

    [Required(ErrorMessage = "Departamento de nacimiento es obligatorio.")]
    public int? DepartamentoId { get; set; }

    [Required(ErrorMessage = "Ciudad de nacimiento es obligatoria.")]
    public int? MunicipioId { get; set; }

    public int? ParametroIdGrupoEdad { get; set; }

    [Required(ErrorMessage = "Genero es obligatorio.")]
    public int? ParametroIdGenero { get; set; }

    [Required(ErrorMessage = "Soy es obligatorio.")]
    public int? ParametroIdSoy { get; set; }

    [Required(ErrorMessage = "Codigo referido es obligatorio.")]
    [MaxLength(50, ErrorMessage = "Codigo referido no puede superar 50 caracteres.")]
    public string? CodigoReferido { get; set; }

    public int? CiudadanoReferidorId { get; set; }

    public bool TieneAcceso { get; set; }

    [Required(ErrorMessage = "Vereda es obligatoria.")]
    public int? ParametroIdVereda { get; set; }
    public bool Estado { get; set; } = true;

    public string? Password { get; set; }

    public string? ConfirmPassword { get; set; }
}
