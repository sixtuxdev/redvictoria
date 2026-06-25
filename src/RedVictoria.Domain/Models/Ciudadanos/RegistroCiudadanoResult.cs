namespace RedVictoria.Domain.Models.Ciudadanos;

public class RegistroCiudadanoResult
{
    public bool IsSuccess { get; init; }
    public string Message { get; init; } = string.Empty;
    public int? CiudadanoId { get; init; }
    public string? NombresCompletos { get; init; }
    public DateTime? FechaNacimiento { get; init; }
    public string? LugarNacimiento { get; init; }
    public string? Email { get; init; }
    public string? Celular { get; init; }
    public bool? TieneWhatsapp { get; init; }
    public string? Celular2 { get; init; }
    public bool? TieneWhatsapp2 { get; init; }
    public int? ParametroIdDondeVive { get; init; }
    public int? ParametroIdTipoIdentificacion { get; init; }
    public string? NumeroIdentificacion { get; init; }
    public string? Direccion { get; init; }
    public int? DepartamentoId { get; init; }
    public int? MunicipioId { get; init; }
    public int? ParametroIdGrupoEdad { get; init; }
    public int? ParametroIdGenero { get; init; }
    public int? ParametroIdSoy { get; init; }
    public int? ParametroIdVereda { get; init; }

    public int? ParametroIdTipoDiscapacidad { get; init; }
    public int? ParametroIdEstadoCivil { get; init; }
    public bool? TieneHijos { get; init; }
    public int? Cuantos { get; init; }
    public bool? TieneVehiculo { get; init; }
    public int? ParametroIdTipoVehiculo { get; init; }
    public int? ParametroIdReligion { get; init; }
    public bool? EsEmpleado { get; init; }
    public string? CodigoReferido { get; init; }
    public int? CiudadanoReferidorId { get; init; }
    public bool TieneAcceso { get; init; }
    public bool Estado { get; init; }
    public DateTime FechaRegistro { get; init; }
}
