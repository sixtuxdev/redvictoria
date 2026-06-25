namespace RedVictoria.WebUI.Models.Parametros;

public sealed class RegistroCiudadanoParametrosModel
{
    public IReadOnlyCollection<ParametroOptionModel> DondeVive { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> TiposIdentificacion { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> GruposEdad { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> Generos { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> Soy { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> Veredas { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> TiposDiscapacidad { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> EstadosCivil { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> TiposVehiculo { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> Religiones { get; init; } = [];
}
