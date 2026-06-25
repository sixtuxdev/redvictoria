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
    [EmailAddress(ErrorMessage = "Email no tiene un formato válido.")]
    [MaxLength(150, ErrorMessage = "Email no puede superar 150 caracteres.")]
    public string? Email { get; set; }

    [Required(ErrorMessage = "Celular es obligatorio.")]
    [MaxLength(30, ErrorMessage = "Celular no puede superar 30 caracteres.")]
    public string? Celular { get; set; }

    [Required(ErrorMessage = "Tiene WhatsApp es obligatorio.")]
    public bool? TieneWhatsapp { get; set; }

    [MaxLength(30, ErrorMessage = "Celular 2 no puede superar 30 caracteres.")]
    public string? Celular2 { get; set; }

    public bool? TieneWhatsapp2 { get; set; }

    [Required(ErrorMessage = "Donde vive es obligatorio.")]
    public int? ParametroIdDondeVive { get; set; }    

    [Required(ErrorMessage = "Tipo de identificación es obligatorio.")]
    public int? ParametroIdTipoIdentificacion { get; set; }

    [Required(ErrorMessage = "Número de identificación es obligatorio.")]
    [MaxLength(50, ErrorMessage = "Número de identificación no puede superar 50 caracteres.")]
    public string? NumeroIdentificacion { get; set; }

    [Required(ErrorMessage = "Dirección es obligatoria.")]
    [MaxLength(250, ErrorMessage = "Dirección no puede superar 250 caracteres.")]
    public string? Direccion { get; set; }

    [Required(ErrorMessage = "Departamento de nacimiento es obligatorio.")]
    public int? DepartamentoId { get; set; }

    [Required(ErrorMessage = "Ciudad de nacimiento es obligatoria.")]
    public int? MunicipioId { get; set; }

    public int? ParametroIdGrupoEdad { get; set; }

    [Required(ErrorMessage = "Género es obligatorio.")]
    public int? ParametroIdGenero { get; set; }

    [Required(ErrorMessage = "Soy es obligatorio.")]
    public int? ParametroIdSoy { get; set; }

    [Required(ErrorMessage = "Tipo de discapacidad es obligatorio.")]
    public int? ParametroIdTipoDiscapacidad { get; set; }

    [Required(ErrorMessage = "Estado civil es obligatorio.")]
    public int? ParametroIdEstadoCivil { get; set; }

    [Required(ErrorMessage = "Indica si tiene hijos.")]
    public bool? TieneHijos { get; set; }

    public int? Cuantos { get; set; }

    [Required(ErrorMessage = "Indica si tiene vehiculo.")]
    public bool? TieneVehiculo { get; set; }

    public int? ParametroIdTipoVehiculo { get; set; }

    [Required(ErrorMessage = "Religion es obligatoria.")]
    public int? ParametroIdReligion { get; set; }

    [Required(ErrorMessage = "Indica si es empleado.")]
    public bool? EsEmpleado { get; set; }
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
