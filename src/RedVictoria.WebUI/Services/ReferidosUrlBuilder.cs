using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Settings;

namespace RedVictoria.WebUI.Services;

public sealed class ReferidosUrlBuilder(IConfiguration configuration) : IReferidosUrlBuilder
{
    private readonly ReferidosSettings _settings = new()
    {
        RegistroCiudadanoBaseUrl = configuration["ReferidosSettings:RegistroCiudadanoBaseUrl"] ?? string.Empty,
        CrearPasswordBaseUrl = configuration["ReferidosSettings:CrearPasswordBaseUrl"] ?? string.Empty
    };

    public string BuildRegistroCiudadanoUrl(string codigoReferido) =>
        BuildUrl(_settings.RegistroCiudadanoBaseUrl, codigoReferido, nameof(ReferidosSettings.RegistroCiudadanoBaseUrl));

    public string BuildCrearPasswordUrl(string codigoReferido) =>
        BuildUrl(_settings.CrearPasswordBaseUrl, codigoReferido, nameof(ReferidosSettings.CrearPasswordBaseUrl));

    private static string BuildUrl(string baseUrl, string codigoReferido, string settingName)
    {
        if (string.IsNullOrWhiteSpace(baseUrl))
        {
            throw new InvalidOperationException($"ReferidosSettings:{settingName} es obligatorio.");
        }

        if (string.IsNullOrWhiteSpace(codigoReferido))
        {
            throw new ArgumentException("El codigo referido es obligatorio.", nameof(codigoReferido));
        }

        return $"{baseUrl.TrimEnd('/')}/{Uri.EscapeDataString(codigoReferido.Trim())}";
    }
}
