namespace RedVictoria.WebUI.Models.Ciudadanos;

public sealed class ValidarCodigoReferidoResponseModel
{
    public string CodigoReferido { get; init; } = string.Empty;
    public bool Existe { get; init; }
}
