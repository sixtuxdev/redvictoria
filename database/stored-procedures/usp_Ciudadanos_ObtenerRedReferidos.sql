CREATE OR ALTER PROCEDURE dbo.usp_Ciudadanos_ObtenerRedReferidos
    @CiudadanoId INT
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH RedReferidos AS
    (
        SELECT
            c.CiudadanoId,
            c.NombresCompletos,
            c.FechaNacimiento,
            c.LugarNacimiento,
            c.Email,
            c.Celular,
            c.TieneWhatsapp,
            c.ParametroIdDondeVive,
            c.PuestoVotacion,
            c.ParametroIdTipoIdentificacion,
            c.NumeroIdentificacion,
            c.Direccion,
            c.DepartamentoId,
            c.MunicipioId,
            c.ParametroIdGrupoEdad,
            c.ParametroIdGenero,
            c.ParametroIdSoy,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            c.TieneAcceso,
            c.ParametroIdVereda,
            c.Estado,
            c.FechaRegistro,
            c.Celular2,
            c.TieneWhatsapp2,
            c.ParametroIdTipoDiscapacidad,
            c.ParametroIdEstadoCivil,
            c.TieneHijos,
            c.Cuantos,
            c.TieneVehiculo,
            c.ParametroIdTipoVehiculo,
            c.ParametroIdReligion,
            c.EsEmpleado,
            r.NombresCompletos AS Referidor,
            1 AS Nivel,
            CAST(N'Directo' AS NVARCHAR(20)) AS TipoReferido,
            CAST('/' + CAST(c.CiudadanoId AS VARCHAR(20)) + '/' AS VARCHAR(MAX)) AS Ruta
        FROM dbo.Ciudadanos c
        INNER JOIN dbo.Ciudadanos r
            ON r.CiudadanoId = c.CiudadanoReferidorId
        WHERE c.CiudadanoReferidorId = @CiudadanoId
          AND c.CiudadanoId <> @CiudadanoId

        UNION ALL

        SELECT
            c.CiudadanoId,
            c.NombresCompletos,
            c.FechaNacimiento,
            c.LugarNacimiento,
            c.Email,
            c.Celular,
            c.TieneWhatsapp,
            c.ParametroIdDondeVive,
            c.PuestoVotacion,
            c.ParametroIdTipoIdentificacion,
            c.NumeroIdentificacion,
            c.Direccion,
            c.DepartamentoId,
            c.MunicipioId,
            c.ParametroIdGrupoEdad,
            c.ParametroIdGenero,
            c.ParametroIdSoy,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            c.TieneAcceso,
            c.ParametroIdVereda,
            c.Estado,
            c.FechaRegistro,
            c.Celular2,
            c.TieneWhatsapp2,
            c.ParametroIdTipoDiscapacidad,
            c.ParametroIdEstadoCivil,
            c.TieneHijos,
            c.Cuantos,
            c.TieneVehiculo,
            c.ParametroIdTipoVehiculo,
            c.ParametroIdReligion,
            c.EsEmpleado,
            r.NombresCompletos AS Referidor,
            rr.Nivel + 1 AS Nivel,
            CAST(N'Indirecto' AS NVARCHAR(20)) AS TipoReferido,
            CAST(rr.Ruta + CAST(c.CiudadanoId AS VARCHAR(20)) + '/' AS VARCHAR(MAX)) AS Ruta
        FROM dbo.Ciudadanos c
        INNER JOIN dbo.Ciudadanos r
            ON r.CiudadanoId = c.CiudadanoReferidorId
        INNER JOIN RedReferidos rr
            ON rr.CiudadanoId = c.CiudadanoReferidorId
        WHERE c.CiudadanoId <> @CiudadanoId
          AND rr.Ruta NOT LIKE '%/' + CAST(c.CiudadanoId AS VARCHAR(20)) + '/%'
          AND rr.Nivel < 20
    )
    SELECT
        rr.CiudadanoId,
        rr.NombresCompletos,
        rr.FechaNacimiento,
        rr.LugarNacimiento,
        rr.Email,
        rr.Celular,
        rr.TieneWhatsapp,
        rr.ParametroIdDondeVive,
        pDondeVive.Descripcion AS DondeViveDescripcion,
        rr.PuestoVotacion,
        rr.ParametroIdTipoIdentificacion,
        pTipoIdentificacion.Descripcion AS TipoIdentificacionDescripcion,
        rr.NumeroIdentificacion,
        rr.Direccion,
        rr.DepartamentoId,
        rr.MunicipioId,
        rr.ParametroIdGrupoEdad,
        pGrupoEdad.Descripcion AS GrupoEdadDescripcion,
        rr.ParametroIdGenero,
        pGenero.Descripcion AS GeneroDescripcion,
        rr.ParametroIdSoy,
        pSoy.Descripcion AS SoyDescripcion,
        rr.CodigoReferido,
        rr.CiudadanoReferidorId,
        rr.TieneAcceso,
        rr.ParametroIdVereda,
        pVereda.Descripcion AS VeredaDescripcion,
        rr.Estado,
        rr.FechaRegistro,
        rr.Celular2,
        rr.TieneWhatsapp2,
        rr.ParametroIdTipoDiscapacidad,
        pDiscapacidad.Descripcion AS TipoDiscapacidadDescripcion,
        rr.ParametroIdEstadoCivil,
        pEstadoCivil.Descripcion AS EstadoCivilDescripcion,
        rr.TieneHijos,
        rr.Cuantos,
        rr.TieneVehiculo,
        rr.ParametroIdTipoVehiculo,
        pTipoVehiculo.Descripcion AS TipoVehiculoDescripcion,
        rr.ParametroIdReligion,
        pReligion.Descripcion AS ReligionDescripcion,
        rr.EsEmpleado,
        rr.Referidor,
        rr.Nivel,
        rr.TipoReferido
    FROM RedReferidos rr
    LEFT JOIN dbo.Parametros pDondeVive
        ON pDondeVive.ParametroId = rr.ParametroIdDondeVive
    LEFT JOIN dbo.Parametros pTipoIdentificacion
        ON pTipoIdentificacion.ParametroId = rr.ParametroIdTipoIdentificacion
    LEFT JOIN dbo.Parametros pGrupoEdad
        ON pGrupoEdad.ParametroId = rr.ParametroIdGrupoEdad
    LEFT JOIN dbo.Parametros pGenero
        ON pGenero.ParametroId = rr.ParametroIdGenero
    LEFT JOIN dbo.Parametros pSoy
        ON pSoy.ParametroId = rr.ParametroIdSoy
    LEFT JOIN dbo.Parametros pVereda
        ON pVereda.ParametroId = rr.ParametroIdVereda
    LEFT JOIN dbo.Parametros pDiscapacidad
        ON pDiscapacidad.ParametroId = rr.ParametroIdTipoDiscapacidad
    LEFT JOIN dbo.Parametros pEstadoCivil
        ON pEstadoCivil.ParametroId = rr.ParametroIdEstadoCivil
    LEFT JOIN dbo.Parametros pTipoVehiculo
        ON pTipoVehiculo.ParametroId = rr.ParametroIdTipoVehiculo
    LEFT JOIN dbo.Parametros pReligion
        ON pReligion.ParametroId = rr.ParametroIdReligion
    ORDER BY 
        rr.Nivel,
        rr.FechaRegistro DESC,
        rr.NombresCompletos
    OPTION (MAXRECURSION 20);
END;
