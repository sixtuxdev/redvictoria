namespace RedVictoria.Application.DTOs.Ciudadanos;

public class ValidarCodigoReferidoResponse
{
    public string CodigoReferido { get; init; } = string.Empty;
    public bool Existe { get; init; }
}
