CREATE OR ALTER PROCEDURE dbo.usp_Usuarios_ObtenerPorEmail
    @Email NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (1)
        u.UsuarioId,
        u.CiudadanoId,
        COALESCE(c.NombresCompletos, N'') AS NombresCompletos,
        COALESCE(c.CodigoReferido, N'') AS CodigoReferido,
        u.Email,
        u.PasswordHash,
        COALESCE(u.Rol, N'Ciudadano') AS Rol,
        u.Estado AS UsuarioEstado,
        CAST(COALESCE(c.Estado, 0) AS BIT) AS CiudadanoEstado,
        CAST(COALESCE(c.TieneAcceso, 0) AS BIT) AS TieneAcceso
    FROM dbo.Usuarios AS u
    LEFT JOIN dbo.Ciudadanos AS c
        ON c.CiudadanoId = u.CiudadanoId
    WHERE u.Email = @Email;
END;
