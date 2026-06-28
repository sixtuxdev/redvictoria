using System.Data;
using Dapper;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.TerminosyCondiciones;

namespace RedVictoria.Infrastructure.Repositories;

public sealed class TerminosyCondicionesRepository(
    IConnectionFactory connectionFactory) : ITerminosyCondicionesRepository
{
    public async Task<TerminosyCondicionesResult> InsertarAsync(
        TerminosyCondicionesCommand command,
        CancellationToken cancellationToken = default)
    {
        using var connection = connectionFactory.CreateConnection();
        var parameters = new DynamicParameters();
        parameters.Add("TipoDocumentoId", command.TipoDocumentoId);
        parameters.Add("Documento", command.Documento);
        parameters.Add("Nombres", command.Nombres);        

        var databaseCommand = new CommandDefinition(
            "dbo.usp_TerminosyCondiciones_Insertar",
            parameters,
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        return await connection.QuerySingleAsync<TerminosyCondicionesResult>(databaseCommand);
    }
}
