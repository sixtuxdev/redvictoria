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
            c.Email,
            c.Celular,
            c.Celular2,
            c.TieneWhatsapp2,
            c.NumeroIdentificacion,
            c.FechaNacimiento,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            r.NombresCompletos AS Referidor,
            c.FechaRegistro,
            c.Estado,
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
            c.Email,
            c.Celular,
            c.Celular2,
            c.TieneWhatsapp2,
            c.NumeroIdentificacion,
            c.FechaNacimiento,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            r.NombresCompletos AS Referidor,
            c.FechaRegistro,
            c.Estado,
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
        CiudadanoId,
        NombresCompletos,
        Email,
        Celular,
        Celular2,
        TieneWhatsapp2,
        NumeroIdentificacion,
        FechaNacimiento,
        CodigoReferido,
        CiudadanoReferidorId,
        Referidor,
        FechaRegistro,
        Estado,
        Nivel,
        TipoReferido
    FROM RedReferidos
    ORDER BY 
        Nivel,
        FechaRegistro DESC,
        NombresCompletos
    OPTION (MAXRECURSION 20);
END;