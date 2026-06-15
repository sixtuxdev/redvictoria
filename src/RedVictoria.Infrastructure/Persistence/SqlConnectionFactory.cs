using System.Data;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using RedVictoria.Application.Interfaces;

namespace RedVictoria.Infrastructure.Persistence;

public class SqlConnectionFactory : IConnectionFactory
{
    private readonly IConfiguration _configuration;

    public SqlConnectionFactory(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    public IDbConnection CreateConnection()
    {
        var connectionString = _configuration.GetConnectionString("DefaultConnection");

        if (string.IsNullOrWhiteSpace(connectionString))
            throw new InvalidOperationException("La cadena de conexión 'DefaultConnection' no está configurada.");

        return new SqlConnection(connectionString);
    }
}
