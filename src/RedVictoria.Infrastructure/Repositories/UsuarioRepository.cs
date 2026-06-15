using System.Data;
using Dapper;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Usuarios;

namespace RedVictoria.Infrastructure.Repositories;

public class UsuarioRepository : IUsuarioRepository
{
    private readonly IConnectionFactory _connectionFactory;

    public UsuarioRepository(IConnectionFactory connectionFactory)
    {
        _connectionFactory = connectionFactory;
    }

    public async Task<RegistroUsuarioResult> RegistrarAsync(
        RegistroUsuarioCommand command,
        CancellationToken cancellationToken = default)
    {
        using var connection = _connectionFactory.CreateConnection();
        var databaseCommand = new CommandDefinition(
            "dbo.usp_Usuarios_Registrar",
            new
            {
                command.CiudadanoId,
                command.Email,
                command.PasswordHash,
                command.Rol
            },
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        return await connection.QuerySingleAsync<RegistroUsuarioResult>(databaseCommand);
    }
}
