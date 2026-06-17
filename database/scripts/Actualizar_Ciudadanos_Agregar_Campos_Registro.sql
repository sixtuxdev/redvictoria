SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRANSACTION;

    IF OBJECT_ID(N'dbo.Ciudadanos', N'U') IS NULL
        THROW 50001, 'La tabla dbo.Ciudadanos no existe.', 1;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'NombresCompletos') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD NombresCompletos NVARCHAR(200) NOT NULL
                CONSTRAINT DF_Ciudadanos_NombresCompletos DEFAULT (N'') WITH VALUES;
    ELSE
        ALTER TABLE dbo.Ciudadanos
            ALTER COLUMN NombresCompletos NVARCHAR(200) NOT NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'FechaNacimiento') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD FechaNacimiento DATETIME NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'LugarNacimiento') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD LugarNacimiento NVARCHAR(150) NULL;
    ELSE
        ALTER TABLE dbo.Ciudadanos
            ALTER COLUMN LugarNacimiento NVARCHAR(150) NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'Celular') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD Celular NVARCHAR(30) NULL;
    ELSE
        ALTER TABLE dbo.Ciudadanos
            ALTER COLUMN Celular NVARCHAR(30) NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'TieneWhatsapp') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD TieneWhatsapp BIT NULL;
    ELSE
        ALTER TABLE dbo.Ciudadanos
            ALTER COLUMN TieneWhatsapp BIT NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'ParametroIdDondeVive') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD ParametroIdDondeVive INT NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'PuestoVotacion') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD PuestoVotacion NVARCHAR(150) NULL;
    ELSE
        ALTER TABLE dbo.Ciudadanos
            ALTER COLUMN PuestoVotacion NVARCHAR(150) NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'ParametroIdSoy') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD ParametroIdSoy INT NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'ParametroIdVereda') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD ParametroIdVereda INT NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'Email') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD Email NVARCHAR(150) NULL;
    ELSE
        ALTER TABLE dbo.Ciudadanos
            ALTER COLUMN Email NVARCHAR(150) NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'ParametroIdTipoIdentificacion') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD ParametroIdTipoIdentificacion INT NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'NumeroIdentificacion') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD NumeroIdentificacion NVARCHAR(50) NULL;
    ELSE
        ALTER TABLE dbo.Ciudadanos
            ALTER COLUMN NumeroIdentificacion NVARCHAR(50) NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'Direccion') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD Direccion NVARCHAR(250) NULL;
    ELSE
        ALTER TABLE dbo.Ciudadanos
            ALTER COLUMN Direccion NVARCHAR(250) NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'DepartamentoId') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD DepartamentoId INT NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'MunicipioId') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD MunicipioId INT NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'ParametroIdGrupoEdad') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD ParametroIdGrupoEdad INT NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'ParametroIdGenero') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD ParametroIdGenero INT NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'CodigoReferido') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD CodigoReferido NVARCHAR(50) NULL;
    ELSE
        ALTER TABLE dbo.Ciudadanos
            ALTER COLUMN CodigoReferido NVARCHAR(50) NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'CiudadanoReferidorId') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD CiudadanoReferidorId INT NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'TieneAcceso') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD TieneAcceso BIT NOT NULL
                CONSTRAINT DF_Ciudadanos_TieneAcceso DEFAULT (0) WITH VALUES;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'Estado') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD Estado BIT NOT NULL
                CONSTRAINT DF_Ciudadanos_Estado DEFAULT (1) WITH VALUES;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'FechaRegistro') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD FechaRegistro DATETIME NOT NULL
                CONSTRAINT DF_Ciudadanos_FechaRegistro DEFAULT (GETUTCDATE()) WITH VALUES;

    IF NOT EXISTS (
        SELECT 1
        FROM sys.indexes
        WHERE name = N'UX_Ciudadanos_CodigoReferido'
          AND object_id = OBJECT_ID(N'dbo.Ciudadanos')
    )
    BEGIN
        CREATE UNIQUE INDEX UX_Ciudadanos_CodigoReferido
            ON dbo.Ciudadanos (CodigoReferido)
            WHERE CodigoReferido IS NOT NULL;
    END

    IF NOT EXISTS (
        SELECT 1
        FROM sys.indexes
        WHERE name = N'UX_Ciudadanos_Email'
          AND object_id = OBJECT_ID(N'dbo.Ciudadanos')
    )
    BEGIN
        CREATE UNIQUE INDEX UX_Ciudadanos_Email
            ON dbo.Ciudadanos (Email)
            WHERE Email IS NOT NULL;
    END

    IF NOT EXISTS (
        SELECT 1
        FROM sys.indexes
        WHERE name = N'UX_Ciudadanos_Celular'
          AND object_id = OBJECT_ID(N'dbo.Ciudadanos')
    )
    BEGIN
        CREATE UNIQUE INDEX UX_Ciudadanos_Celular
            ON dbo.Ciudadanos (Celular)
            WHERE Celular IS NOT NULL;
    END

    IF NOT EXISTS (
        SELECT 1
        FROM sys.indexes
        WHERE name = N'UX_Ciudadanos_NumeroIdentificacion'
          AND object_id = OBJECT_ID(N'dbo.Ciudadanos')
    )
    BEGIN
        CREATE UNIQUE INDEX UX_Ciudadanos_NumeroIdentificacion
            ON dbo.Ciudadanos (NumeroIdentificacion)
            WHERE NumeroIdentificacion IS NOT NULL;
    END

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;
