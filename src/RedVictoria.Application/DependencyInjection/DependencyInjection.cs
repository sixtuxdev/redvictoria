using Microsoft.Extensions.DependencyInjection;
using RedVictoria.Application.Interfaces;
using RedVictoria.Application.Services;

namespace RedVictoria.Application.DependencyInjection;

public static class DependencyInjection
{
    public static IServiceCollection AddApplication(this IServiceCollection services)
    {
        services.AddScoped<ICiudadanoApplication, CiudadanoApplication>();

        return services;
    }
}
