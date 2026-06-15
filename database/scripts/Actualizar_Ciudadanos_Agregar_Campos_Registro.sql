SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRANSACTION;

    IF OBJECT_ID(N'dbo.Ciudadanos', N'U') IS NULL
        THROW 50001, 'La tabla dbo.Ciudadanos no existe.', 1;

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

    IF COL_LENGTH(N'dbo.Ciudadanos', N'Estado') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD Estado BIT NOT NULL
                CONSTRAINT DF_Ciudadanos_Estado DEFAULT (1) WITH VALUES;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'FechaRegistro') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD FechaRegistro DATETIME NOT NULL
                CONSTRAINT DF_Ciudadanos_FechaRegistro DEFAULT (GETUTCDATE()) WITH VALUES;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;
