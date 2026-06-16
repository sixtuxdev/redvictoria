using Microsoft.Extensions.Configuration;
using RedVictoria.WebUI.Constants;

namespace RedVictoria.WebUI.Services;

internal static class ApiEndpointBuilder
{
    public static string Build(IConfiguration configuration, string relativeEndpoint)
    {
        var apiBaseUrl = configuration["ApiBaseUrl"];

        if (string.IsNullOrWhiteSpace(apiBaseUrl))
        {
            return relativeEndpoint;
        }

        return new Uri(new Uri(apiBaseUrl, UriKind.Absolute), relativeEndpoint).ToString();
    }
}
