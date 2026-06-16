namespace RedVictoria.WebUI.Models.Parametros;

public sealed class RegistroCiudadanoParametrosModel
{
    public IReadOnlyCollection<ParametroOptionModel> DondeVive { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> TiposIdentificacion { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> GruposEdad { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> Generos { get; init; } = [];
    public IReadOnlyCollection<ParametroOptionModel> Soy { get; init; } = [];
}
