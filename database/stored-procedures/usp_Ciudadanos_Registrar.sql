CREATE OR ALTER PROCEDURE dbo.usp_Ciudadanos_Registrar
    @NombresCompletos NVARCHAR(200),
    @Celular NVARCHAR(30) = NULL,
    @Celular2 NVARCHAR(30) = NULL,
    @FechaNacimiento DATETIME = NULL,
    @LugarNacimiento NVARCHAR(150) = NULL,
    @TieneWhatsapp BIT = NULL,
    @TieneWhatsapp2 BIT = NULL,
    @ParametroIdDondeVive INT = NULL,
    @Email NVARCHAR(150) = NULL,
    @ParametroIdTipoIdentificacion INT = NULL,
    @NumeroIdentificacion NVARCHAR(50) = NULL,
    @Direccion NVARCHAR(250) = NULL,
    @DepartamentoId INT = NULL,
    @MunicipioId INT = NULL,
    @ParametroIdGrupoEdad INT = NULL,
    @ParametroIdGenero INT = NULL,
    @ParametroIdSoy INT = NULL,
    @ParametroIdVereda INT = NULL,
    @ParametroIdTipoDiscapacidad INT = NULL,
    @ParametroIdEstadoCivil INT = NULL,
    @TieneHijos BIT = NULL,
    @Cuantos INT = NULL,
    @TieneVehiculo BIT = NULL,
    @ParametroIdTipoVehiculo INT = NULL,
    @ParametroIdReligion INT = NULL,
    @EsEmpleado BIT = NULL,
    @Estado BIT = 1,
    @CodigoReferidoInvitacion NVARCHAR(50) = NULL,
    @PasswordHash NVARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @CiudadanoReferidorId INT = NULL;
    DECLARE @CiudadanoId INT;
    DECLARE @CodigoReferido NVARCHAR(50);
    DECLARE @TieneAcceso BIT = IIF(@PasswordHash IS NULL, 0, 1);
    DECLARE @FechaRegistro DATETIME = GETUTCDATE();

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @CodigoReferidoInvitacion IS NOT NULL
        BEGIN
            SELECT @CiudadanoReferidorId = CiudadanoId
            FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
            WHERE CodigoReferido = @CodigoReferidoInvitacion;

            IF @CiudadanoReferidorId IS NULL
            BEGIN
                ROLLBACK TRANSACTION;
                SELECT
                    CAST(0 AS BIT) AS IsSuccess,
                    N'El código de referido no es válido.' AS Message,
                    CAST(NULL AS INT) AS CiudadanoId,
                    CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                    CAST(0 AS BIT) AS TieneAcceso,
                    CAST(NULL AS INT) AS CiudadanoReferidorId,
                    CAST(NULL AS DATETIME) AS FechaNacimiento,
                    CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                    CAST(NULL AS NVARCHAR(30)) AS Celular,
                    CAST(NULL AS BIT) AS TieneWhatsapp,
                    CAST(NULL AS NVARCHAR(30)) AS Celular2,
                    CAST(NULL AS BIT) AS TieneWhatsapp2,
                    CAST(NULL AS INT) AS ParametroIdDondeVive,
                    CAST(NULL AS INT) AS ParametroIdVereda,
                    CAST(NULL AS INT) AS ParametroIdTipoDiscapacidad,
                    CAST(NULL AS INT) AS ParametroIdEstadoCivil,
                    CAST(NULL AS BIT) AS TieneHijos,
                    CAST(NULL AS INT) AS Cuantos,
                    CAST(NULL AS BIT) AS TieneVehiculo,
                    CAST(NULL AS INT) AS ParametroIdTipoVehiculo,
                    CAST(NULL AS INT) AS ParametroIdReligion,
                    CAST(NULL AS BIT) AS EsEmpleado;
                RETURN;
            END
        END

        IF @PasswordHash IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Usuarios WITH (UPDLOCK, HOLDLOCK)
               WHERE Email = @Email
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El email ya se encuentra registrado.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda,
                CAST(NULL AS INT) AS ParametroIdTipoDiscapacidad,
                CAST(NULL AS INT) AS ParametroIdEstadoCivil,
                CAST(NULL AS BIT) AS TieneHijos,
                CAST(NULL AS INT) AS Cuantos,
                CAST(NULL AS BIT) AS TieneVehiculo,
                CAST(NULL AS INT) AS ParametroIdTipoVehiculo,
                CAST(NULL AS INT) AS ParametroIdReligion,
                CAST(NULL AS BIT) AS EsEmpleado;
            RETURN;
        END

        IF @Email IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
               WHERE Email = @Email
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El email ya se encuentra registrado en ciudadanos.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda,
                CAST(NULL AS INT) AS ParametroIdTipoDiscapacidad,
                CAST(NULL AS INT) AS ParametroIdEstadoCivil,
                CAST(NULL AS BIT) AS TieneHijos,
                CAST(NULL AS INT) AS Cuantos,
                CAST(NULL AS BIT) AS TieneVehiculo,
                CAST(NULL AS INT) AS ParametroIdTipoVehiculo,
                CAST(NULL AS INT) AS ParametroIdReligion,
                CAST(NULL AS BIT) AS EsEmpleado;
            RETURN;
        END

        IF @Celular IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
               WHERE Celular = @Celular
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El celular ya se encuentra registrado en ciudadanos.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda,
                CAST(NULL AS INT) AS ParametroIdTipoDiscapacidad,
                CAST(NULL AS INT) AS ParametroIdEstadoCivil,
                CAST(NULL AS BIT) AS TieneHijos,
                CAST(NULL AS INT) AS Cuantos,
                CAST(NULL AS BIT) AS TieneVehiculo,
                CAST(NULL AS INT) AS ParametroIdTipoVehiculo,
                CAST(NULL AS INT) AS ParametroIdReligion,
                CAST(NULL AS BIT) AS EsEmpleado;
            RETURN;
        END

        IF @NumeroIdentificacion IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
               WHERE NumeroIdentificacion = @NumeroIdentificacion
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El numero de identificacion ya se encuentra registrado en ciudadanos.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda,
                CAST(NULL AS INT) AS ParametroIdTipoDiscapacidad,
                CAST(NULL AS INT) AS ParametroIdEstadoCivil,
                CAST(NULL AS BIT) AS TieneHijos,
                CAST(NULL AS INT) AS Cuantos,
                CAST(NULL AS BIT) AS TieneVehiculo,
                CAST(NULL AS INT) AS ParametroIdTipoVehiculo,
                CAST(NULL AS INT) AS ParametroIdReligion,
                CAST(NULL AS BIT) AS EsEmpleado;
            RETURN;
        END

        WHILE @CodigoReferido IS NULL
        BEGIN
            SET @CodigoReferido = N'RV-' + UPPER(LEFT(REPLACE(CONVERT(NVARCHAR(36), NEWID()), N'-', N''), 12));

            IF EXISTS (
                SELECT 1
                FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
                WHERE CodigoReferido = @CodigoReferido
            )
                SET @CodigoReferido = NULL;
        END

        INSERT INTO dbo.Ciudadanos
        (
            NombresCompletos,
            Celular,
            Celular2,
            FechaNacimiento,
            LugarNacimiento,
            TieneWhatsapp,
            TieneWhatsapp2,
            ParametroIdDondeVive,
            Email,
            ParametroIdTipoIdentificacion,
            NumeroIdentificacion,
            Direccion,
            DepartamentoId,
            MunicipioId,
            ParametroIdGrupoEdad,
            ParametroIdGenero,
            ParametroIdSoy,
            ParametroIdVereda,
            ParametroIdTipoDiscapacidad,
            ParametroIdEstadoCivil,
            TieneHijos,
            Cuantos,
            TieneVehiculo,
            ParametroIdTipoVehiculo,
            ParametroIdReligion,
            EsEmpleado,
            CodigoReferido,
            CiudadanoReferidorId,
            TieneAcceso,
            Estado,
            FechaRegistro
        )
        VALUES
        (
            @NombresCompletos,
            @Celular,
            @Celular2,
            @FechaNacimiento,
            @LugarNacimiento,
            @TieneWhatsapp,
            @TieneWhatsapp2,
            @ParametroIdDondeVive,
            @Email,
            @ParametroIdTipoIdentificacion,
            @NumeroIdentificacion,
            @Direccion,
            @DepartamentoId,
            @MunicipioId,
            @ParametroIdGrupoEdad,
            @ParametroIdGenero,
            @ParametroIdSoy,
            @ParametroIdVereda,
            @ParametroIdTipoDiscapacidad,
            @ParametroIdEstadoCivil,
            @TieneHijos,
            @Cuantos,
            @TieneVehiculo,
            @ParametroIdTipoVehiculo,
            @ParametroIdReligion,
            @EsEmpleado,
            @CodigoReferido,
            @CiudadanoReferidorId,
            @TieneAcceso,
            @Estado,
            @FechaRegistro
        );

        SET @CiudadanoId = CONVERT(INT, SCOPE_IDENTITY());

        IF @PasswordHash IS NOT NULL
        BEGIN
            INSERT INTO dbo.Usuarios
            (
                CiudadanoId,
                Email,
                PasswordHash,
                Estado,
                FechaCreacion
            )
            VALUES
            (
                @CiudadanoId,
                @Email,
                @PasswordHash,
                1,
                SYSUTCDATETIME()
            );
        END

        COMMIT TRANSACTION;

        SELECT
            CAST(1 AS BIT) AS IsSuccess,
            N'Ciudadano registrado correctamente.' AS Message,
            @CiudadanoId AS CiudadanoId,
            @NombresCompletos AS NombresCompletos,
            @FechaNacimiento AS FechaNacimiento,
            @LugarNacimiento AS LugarNacimiento,
            @Email AS Email,
            @Celular AS Celular,
            @TieneWhatsapp AS TieneWhatsapp,
            @Celular2 AS Celular2,
            @TieneWhatsapp2 AS TieneWhatsapp2,
            @ParametroIdDondeVive AS ParametroIdDondeVive,
            @ParametroIdTipoIdentificacion AS ParametroIdTipoIdentificacion,
            @NumeroIdentificacion AS NumeroIdentificacion,
            @Direccion AS Direccion,
            @DepartamentoId AS DepartamentoId,
            @MunicipioId AS MunicipioId,
            @ParametroIdGrupoEdad AS ParametroIdGrupoEdad,
            @ParametroIdGenero AS ParametroIdGenero,
            @ParametroIdSoy AS ParametroIdSoy,
            @ParametroIdVereda AS ParametroIdVereda,
            @ParametroIdTipoDiscapacidad AS ParametroIdTipoDiscapacidad,
            @ParametroIdEstadoCivil AS ParametroIdEstadoCivil,
            @TieneHijos AS TieneHijos,
            @Cuantos AS Cuantos,
            @TieneVehiculo AS TieneVehiculo,
            @ParametroIdTipoVehiculo AS ParametroIdTipoVehiculo,
            @ParametroIdReligion AS ParametroIdReligion,
            @EsEmpleado AS EsEmpleado,
            @CodigoReferido AS CodigoReferido,
            @CiudadanoReferidorId AS CiudadanoReferidorId,
            @TieneAcceso AS TieneAcceso,
            @Estado AS Estado,
            @FechaRegistro AS FechaRegistro;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
