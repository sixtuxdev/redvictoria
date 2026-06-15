CREATE OR ALTER PROCEDURE dbo.usp_Usuarios_Registrar
    @CiudadanoId INT,
    @Email NVARCHAR(150),
    @PasswordHash NVARCHAR(500),
    @Rol NVARCHAR(50) = N'Ciudadano'
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @UsuarioId INT;
    DECLARE @FechaCreacion DATETIME = GETUTCDATE();
    DECLARE @RolNormalizado NVARCHAR(50) = COALESCE(NULLIF(LTRIM(RTRIM(@Rol)), N''), N'Ciudadano');

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
                CAST(NULL AS NVARCHAR(150)) AS Email,
                CAST(NULL AS NVARCHAR(50)) AS Rol,
                CAST(0 AS BIT) AS Estado,
                CAST(NULL AS DATETIME) AS FechaCreacion;
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
                N'El ciudadano se encuentra inactivo.' AS Message,
                CAST(NULL AS INT) AS UsuarioId,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(150)) AS Email,
                CAST(NULL AS NVARCHAR(50)) AS Rol,
                CAST(0 AS BIT) AS Estado,
                CAST(NULL AS DATETIME) AS FechaCreacion;
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
                N'El ciudadano ya tiene un usuario registrado.' AS Message,
                CAST(NULL AS INT) AS UsuarioId,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(150)) AS Email,
                CAST(NULL AS NVARCHAR(50)) AS Rol,
                CAST(0 AS BIT) AS Estado,
                CAST(NULL AS DATETIME) AS FechaCreacion;
            RETURN;
        END

        IF EXISTS (
            SELECT 1
            FROM dbo.Usuarios WITH (UPDLOCK, HOLDLOCK)
            WHERE Email = @Email
        )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El email ya se encuentra registrado.' AS Message,
                CAST(NULL AS INT) AS UsuarioId,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(150)) AS Email,
                CAST(NULL AS NVARCHAR(50)) AS Rol,
                CAST(0 AS BIT) AS Estado,
                CAST(NULL AS DATETIME) AS FechaCreacion;
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
            @RolNormalizado,
            1,
            @FechaCreacion
        );

        SET @UsuarioId = CONVERT(INT, SCOPE_IDENTITY());

        UPDATE dbo.Ciudadanos
        SET TieneAcceso = 1
        WHERE CiudadanoId = @CiudadanoId;

        COMMIT TRANSACTION;

        SELECT
            CAST(1 AS BIT) AS IsSuccess,
            N'Usuario registrado correctamente.' AS Message,
            @UsuarioId AS UsuarioId,
            @CiudadanoId AS CiudadanoId,
            @Email AS Email,
            @RolNormalizado AS Rol,
            CAST(1 AS BIT) AS Estado,
            @FechaCreacion AS FechaCreacion;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
