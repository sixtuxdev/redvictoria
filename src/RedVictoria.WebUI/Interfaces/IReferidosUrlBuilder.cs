namespace RedVictoria.WebUI.Interfaces;

public interface IReferidosUrlBuilder
{
    string BuildRegistroCiudadanoUrl(string codigoReferido);

    string BuildCrearPasswordUrl(string codigoReferido);
}
