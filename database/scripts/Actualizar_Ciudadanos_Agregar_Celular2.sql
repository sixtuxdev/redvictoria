SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRANSACTION;

    IF OBJECT_ID(N'dbo.Ciudadanos', N'U') IS NULL
        THROW 50001, 'La tabla dbo.Ciudadanos no existe.', 1;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'Celular2') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD Celular2 NVARCHAR(30) NULL;
    ELSE
        ALTER TABLE dbo.Ciudadanos
            ALTER COLUMN Celular2 NVARCHAR(30) NULL;

    IF COL_LENGTH(N'dbo.Ciudadanos', N'TieneWhatsapp2') IS NULL
        ALTER TABLE dbo.Ciudadanos
            ADD TieneWhatsapp2 BIT NULL;
    ELSE
        ALTER TABLE dbo.Ciudadanos
            ALTER COLUMN TieneWhatsapp2 BIT NULL;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;
