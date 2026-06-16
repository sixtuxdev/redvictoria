using System.Data;
using Dapper;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Departamentos;

namespace RedVictoria.Infrastructure.Repositories;

public class DepartamentoRepository : IDepartamentoRepository
{
    private readonly IConnectionFactory _connectionFactory;

    public DepartamentoRepository(IConnectionFactory connectionFactory)
    {
        _connectionFactory = connectionFactory;
    }

    public async Task<IReadOnlyCollection<DepartamentoResult>> ObtenerDepartamentosAsync(
        CancellationToken cancellationToken = default)
    {
        using var connection = _connectionFactory.CreateConnection();
        var databaseCommand = new CommandDefinition(
            "dbo.spGetDepartamentos",
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        var departamentos = await connection.QueryAsync<DepartamentoResult>(databaseCommand);

        return departamentos.ToArray();
    }
}
