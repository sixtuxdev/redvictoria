using System.Data;
using Dapper;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Ciudadanos;

namespace RedVictoria.Infrastructure.Repositories;

public class CiudadanoRepository : ICiudadanoRepository
{
    private readonly IConnectionFactory _connectionFactory;
    private readonly ILogger<CiudadanoRepository> _logger;

    public CiudadanoRepository(
        IConnectionFactory connectionFactory,
        ILogger<CiudadanoRepository>? logger = null)
    {
        _connectionFactory = connectionFactory;
        _logger = logger ?? NullLogger<CiudadanoRepository>.Instance;
    }

    public async Task<RegistroCiudadanoResult> RegistrarAsync(
        RegistroCiudadanoCommand command,
        CancellationToken cancellationToken = default)
    {
        using var connection = _connectionFactory.CreateConnection();
        var parameters = BuildRegistrarParameters(command);

        //_logger.LogInformation(
        //    "Registro ciudadano Repository DynamicParameters campos nuevos: ParametroIdTipoDiscapacidad={ParametroIdTipoDiscapacidad}, ParametroIdEstadoCivil={ParametroIdEstadoCivil}, TieneHijos={TieneHijos}, Cuantos={Cuantos}, TieneVehiculo={TieneVehiculo}, ParametroIdTipoVehiculo={ParametroIdTipoVehiculo}, ParametroIdReligion={ParametroIdReligion}, EsEmpleado={EsEmpleado}. Parametros={Parametros}",
        //    command.ParametroIdTipoDiscapacidad,
        //    command.ParametroIdEstadoCivil,
        //    command.TieneHijos,
        //    command.Cuantos,
        //    command.TieneVehiculo,
        //    command.ParametroIdTipoVehiculo,
        //    command.ParametroIdReligion,
        //    command.EsEmpleado,
        //    string.Join(",", parameters.ParameterNames));

        var databaseCommand = new CommandDefinition(
            "dbo.usp_Ciudadanos_Registrar",
            parameters,
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

    public async Task<IReadOnlyCollection<CiudadanoReferidoResult>> ObtenerRedReferidosAsync(
        int ciudadanoId,
        CancellationToken cancellationToken = default)
    {
        using var connection = _connectionFactory.CreateConnection();
        var databaseCommand = new CommandDefinition(
            "dbo.usp_Ciudadanos_ObtenerRedReferidos",
            new { CiudadanoId = ciudadanoId },
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        var result = await connection.QueryAsync<CiudadanoReferidoResult>(databaseCommand);
        return result.ToArray();
    }

    public async Task<bool> DesactivarReferidoAsync(
        int ciudadanoAutenticadoId,
        int ciudadanoReferidoId,
        CancellationToken cancellationToken = default)
    {
        using var connection = _connectionFactory.CreateConnection();
        var databaseCommand = new CommandDefinition(
            "dbo.usp_Ciudadanos_DesactivarReferido",
            new
            {
                CiudadanoAutenticadoId = ciudadanoAutenticadoId,
                CiudadanoReferidoId = ciudadanoReferidoId
            },
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        return await connection.QuerySingleAsync<bool>(databaseCommand);
    }

    private static DynamicParameters BuildRegistrarParameters(RegistroCiudadanoCommand command)
    {
        var parameters = new DynamicParameters();
        parameters.Add("NombresCompletos", command.NombresCompletos);
        parameters.Add("Celular", command.Celular);
        parameters.Add("Celular2", command.Celular2);
        parameters.Add("FechaNacimiento", command.FechaNacimiento);
        parameters.Add("LugarNacimiento", command.LugarNacimiento);
        parameters.Add("TieneWhatsapp", command.TieneWhatsapp);
        parameters.Add("TieneWhatsapp2", command.TieneWhatsapp2);
        parameters.Add("ParametroIdDondeVive", command.ParametroIdDondeVive);
        parameters.Add("Email", command.Email);
        parameters.Add("ParametroIdTipoIdentificacion", command.ParametroIdTipoIdentificacion);
        parameters.Add("NumeroIdentificacion", command.NumeroIdentificacion);
        parameters.Add("Direccion", command.Direccion);
        parameters.Add("DepartamentoId", command.DepartamentoId);
        parameters.Add("MunicipioId", command.MunicipioId);
        parameters.Add("ParametroIdGrupoEdad", command.ParametroIdGrupoEdad);
        parameters.Add("ParametroIdGenero", command.ParametroIdGenero);
        parameters.Add("ParametroIdSoy", command.ParametroIdSoy);
        parameters.Add("ParametroIdVereda", command.ParametroIdVereda);
        parameters.Add("ParametroIdTipoDiscapacidad", command.ParametroIdTipoDiscapacidad);
        parameters.Add("ParametroIdEstadoCivil", command.ParametroIdEstadoCivil);
        parameters.Add("TieneHijos", command.TieneHijos);
        parameters.Add("Cuantos", command.Cuantos);
        parameters.Add("TieneVehiculo", command.TieneVehiculo);
        parameters.Add("ParametroIdTipoVehiculo", command.ParametroIdTipoVehiculo);
        parameters.Add("ParametroIdReligion", command.ParametroIdReligion);
        parameters.Add("EsEmpleado", command.EsEmpleado);
        parameters.Add("Estado", command.Estado);
        parameters.Add("CodigoReferidoInvitacion", command.CodigoReferidoInvitacion);
        parameters.Add("PasswordHash", command.PasswordHash);
        return parameters;
    }
}