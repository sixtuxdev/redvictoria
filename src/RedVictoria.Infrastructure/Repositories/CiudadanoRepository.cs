using System.Data;
using Dapper;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Ciudadanos;

namespace RedVictoria.Infrastructure.Repositories;

public class CiudadanoRepository : ICiudadanoRepository
{
    private readonly IConnectionFactory _connectionFactory;

    public CiudadanoRepository(IConnectionFactory connectionFactory)
    {
        _connectionFactory = connectionFactory;
    }

    public async Task<RegistroCiudadanoResult> RegistrarAsync(
        RegistroCiudadanoCommand command,
        CancellationToken cancellationToken = default)
    {
        using var connection = _connectionFactory.CreateConnection();
        var databaseCommand = new CommandDefinition(
            "dbo.usp_Ciudadanos_Registrar",
            new
            {
                command.NombresCompletos,
                command.Celular,
                command.FechaNacimiento,
                command.LugarNacimiento,
                command.TieneWhatsapp,
                command.ParametroIdDondeVive,
                command.PuestoVotacion,
                command.Email,
                command.ParametroIdTipoIdentificacion,
                command.NumeroIdentificacion,
                command.Direccion,
                command.DepartamentoId,
                command.MunicipioId,
                command.ParametroIdGrupoEdad,
                command.ParametroIdGenero,
                command.ParametroIdSoy,
                command.ParametroIdVereda,
                command.Estado,
                command.CodigoReferidoInvitacion,
                command.PasswordHash
            },
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        return await connection.QuerySingleAsync<RegistroCiudadanoResult>(databaseCommand);
    }

    public async Task<bool> ExisteCodigoReferidoAsync(
        string codigoReferido,
        CancellationToken cancellationToken = default)
    {
        using var connection = _connectionFactory.CreateConnection();
        var databaseCommand = new CommandDefinition(
            "dbo.usp_Ciudadanos_ExisteCodigoReferido",
            new { CodigoReferido = codigoReferido },
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        return await connection.QuerySingleAsync<bool>(databaseCommand);
    }
}
