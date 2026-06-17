using Microsoft.Extensions.DependencyInjection;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Infrastructure.Email;
using RedVictoria.Infrastructure.Persistence;
using RedVictoria.Infrastructure.Repositories;
using RedVictoria.Infrastructure.Security;

namespace RedVictoria.Infrastructure.DependencyInjection;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services)
    {
        services.AddScoped<IConnectionFactory, SqlConnectionFactory>();
        services.AddScoped<ICiudadanoRepository, CiudadanoRepository>();
        services.AddScoped<IAuthRepository, AuthRepository>();
        services.AddScoped<IUsuarioRepository, UsuarioRepository>();
        services.AddScoped<IParametrosRepository, ParametrosRepository>();
        services.AddScoped<IDepartamentoRepository, DepartamentoRepository>();
        services.AddScoped<ICiudadRepository, CiudadRepository>();
        services.AddScoped<ICorreoService, SmtpCorreoService>();
        services.AddScoped<IJwtTokenGenerator, JwtTokenGenerator>();
        services.AddSingleton<IPasswordHasher, PasswordHasher>();

        return services;
    }
}
