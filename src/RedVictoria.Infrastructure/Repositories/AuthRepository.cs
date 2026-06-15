using System.Data;
using Dapper;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Auth;

namespace RedVictoria.Infrastructure.Repositories;

public class AuthRepository : IAuthRepository
{
    private readonly IConnectionFactory _connectionFactory;

    public AuthRepository(IConnectionFactory connectionFactory)
    {
        _connectionFactory = connectionFactory;
    }

    public async Task<UsuarioLoginResult?> ObtenerPorEmailAsync(
        string email,
        CancellationToken cancellationToken = default)
    {
        using var connection = _connectionFactory.CreateConnection();
        var command = new CommandDefinition(
            "dbo.usp_Usuarios_ObtenerPorEmail",
            new { Email = email },
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        return await connection.QuerySingleOrDefaultAsync<UsuarioLoginResult>(command);
    }
}
