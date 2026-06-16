CREATE OR ALTER PROCEDURE dbo.usp_Usuarios_ActivarAcceso
    @CiudadanoId INT,
    @Email NVARCHAR(150),
    @PasswordHash NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @UsuarioId INT;
    DECLARE @Nombre NVARCHAR(200);

    BEGIN TRY
        BEGIN TRANSACTION;

        IF NOT EXISTS (
            SELECT 1
            FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
            WHERE CiudadanoId = @CiudadanoId
        )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El ciudadano no existe.' AS Message,
                CAST(NULL AS INT) AS UsuarioId,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(200)) AS Nombre,
                CAST(0 AS BIT) AS TieneAcceso;
            RETURN;
        END

        IF EXISTS (
            SELECT 1
            FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
            WHERE CiudadanoId = @CiudadanoId
              AND Estado = 0
        )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El ciudadano está inactivo.' AS Message,
                CAST(NULL AS INT) AS UsuarioId,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(200)) AS Nombre,
                CAST(0 AS BIT) AS TieneAcceso;
            RETURN;
        END

        IF EXISTS (
            SELECT 1
            FROM dbo.Usuarios WITH (UPDLOCK, HOLDLOCK)
            WHERE CiudadanoId = @CiudadanoId
        )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El ciudadano ya tiene acceso creado.' AS Message,
                CAST(NULL AS INT) AS UsuarioId,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(200)) AS Nombre,
                CAST(0 AS BIT) AS TieneAcceso;
            RETURN;
        END

        IF EXISTS (
            SELECT 1
            FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
            WHERE CiudadanoId = @CiudadanoId
              AND TieneAcceso = 1
        )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El ciudadano ya tiene acceso al sistema.' AS Message,
                CAST(NULL AS INT) AS UsuarioId,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(200)) AS Nombre,
                CAST(1 AS BIT) AS TieneAcceso;
            RETURN;
        END

        INSERT INTO dbo.Usuarios
        (
            CiudadanoId,
            Email,
            PasswordHash,
            Rol,
            Estado,
            FechaCreacion
        )
        VALUES
        (
            @CiudadanoId,
            @Email,
            @PasswordHash,
            N'Ciudadano',
            1,
            GETDATE()
        );

        SET @UsuarioId = CONVERT(INT, SCOPE_IDENTITY());

        UPDATE dbo.Ciudadanos
        SET TieneAcceso = 1
        WHERE CiudadanoId = @CiudadanoId;

        SELECT @Nombre = NombresCompletos
        FROM dbo.Ciudadanos
        WHERE CiudadanoId = @CiudadanoId;

        COMMIT TRANSACTION;

        SELECT
            CAST(1 AS BIT) AS IsSuccess,
            N'Acceso activado correctamente.' AS Message,
            @UsuarioId AS UsuarioId,
            @CiudadanoId AS CiudadanoId,
            @Nombre AS Nombre,
            CAST(1 AS BIT) AS TieneAcceso;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
