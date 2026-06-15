CREATE OR ALTER PROCEDURE dbo.usp_Usuarios_ObtenerPorEmail
    @Email NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (1)
        u.UsuarioId,
        u.CiudadanoId,
        c.NombresCompletos,
        u.Email,
        u.PasswordHash,
        COALESCE(u.Rol, N'Ciudadano') AS Rol,
        u.Estado AS UsuarioEstado,
        c.Estado AS CiudadanoEstado,
        c.TieneAcceso
    FROM dbo.Usuarios AS u
    INNER JOIN dbo.Ciudadanos AS c
        ON c.CiudadanoId = u.CiudadanoId
    WHERE u.Email = @Email;
END;
