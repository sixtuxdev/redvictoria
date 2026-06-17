CREATE OR ALTER PROCEDURE dbo.usp_Ciudadanos_ObtenerRedReferidos
    @CiudadanoId INT
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH Directos AS
    (
        SELECT
            c.CiudadanoId,
            c.NombresCompletos,
            c.Email,
            c.Celular,
            c.NumeroIdentificacion,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            r.NombresCompletos AS Referidor,
            c.FechaRegistro,
            c.Estado,
            1 AS Nivel,
            CAST(N'Directo' AS NVARCHAR(20)) AS TipoReferido
        FROM dbo.Ciudadanos c
        INNER JOIN dbo.Ciudadanos r
            ON r.CiudadanoId = c.CiudadanoReferidorId
        WHERE c.CiudadanoReferidorId = @CiudadanoId
    ),
    Indirectos AS
    (
        SELECT
            c.CiudadanoId,
            c.NombresCompletos,
            c.Email,
            c.Celular,
            c.NumeroIdentificacion,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            r.NombresCompletos AS Referidor,
            c.FechaRegistro,
            c.Estado,
            2 AS Nivel,
            CAST(N'Indirecto' AS NVARCHAR(20)) AS TipoReferido
        FROM dbo.Ciudadanos c
        INNER JOIN dbo.Ciudadanos r
            ON r.CiudadanoId = c.CiudadanoReferidorId
        INNER JOIN Directos d
            ON d.CiudadanoId = c.CiudadanoReferidorId
    )
    SELECT *
    FROM Directos
    UNION ALL
    SELECT *
    FROM Indirectos
    ORDER BY Nivel, FechaRegistro DESC, NombresCompletos;
END;
