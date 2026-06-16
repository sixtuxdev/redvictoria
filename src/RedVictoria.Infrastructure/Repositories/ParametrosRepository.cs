using System.Data;
using Dapper;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Parametros;

namespace RedVictoria.Infrastructure.Repositories;

public class ParametrosRepository : IParametrosRepository
{
    private readonly IConnectionFactory _connectionFactory;

    public ParametrosRepository(IConnectionFactory connectionFactory)
    {
        _connectionFactory = connectionFactory;
    }

    public async Task<IReadOnlyCollection<ParametroResult>> ObtenerParametrosPorClaseDescripcion(
        string descripcionClase,
        CancellationToken cancellationToken = default)
    {
        using var connection = _connectionFactory.CreateConnection();
        var databaseCommand = new CommandDefinition(
            "dbo.spGetObtenerParametrosClaseDescripcion",
            new
            {
                DescripcionClase = descripcionClase
            },
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        var parametros = await connection.QueryAsync<ParametroResult>(databaseCommand);

        return parametros.ToArray();
    }
}
