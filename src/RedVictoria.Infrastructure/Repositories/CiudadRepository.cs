using System.Data;
using Dapper;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Ciudades;

namespace RedVictoria.Infrastructure.Repositories;

public class CiudadRepository : ICiudadRepository
{
    private readonly IConnectionFactory _connectionFactory;

    public CiudadRepository(IConnectionFactory connectionFactory)
    {
        _connectionFactory = connectionFactory;
    }

    public async Task<IReadOnlyCollection<CiudadResult>> ObtenerCiudadesPorDepartamentoIdAsync(
        int departamentoId,
        CancellationToken cancellationToken = default)
    {
        using var connection = _connectionFactory.CreateConnection();
        var databaseCommand = new CommandDefinition(
            "dbo.spGetCiudadesPorDepartamentoId",
            new { DepartamentoId = departamentoId },
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        var ciudades = await connection.QueryAsync<CiudadResult>(databaseCommand);

        return ciudades.ToArray();
    }
}
