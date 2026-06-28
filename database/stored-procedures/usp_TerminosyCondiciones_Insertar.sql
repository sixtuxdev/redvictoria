IF OBJECT_ID(N'dbo.TerminosyCondiciones', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.TerminosyCondiciones
    (
        TerminosyCondicionesId INT IDENTITY(1,1) NOT NULL,
        TipoDocumentoId INT NULL,
        Documento NVARCHAR(50) NOT NULL,
        Nombres NVARCHAR(150) NOT NULL,        
        Fecha DATETIME NOT NULL CONSTRAINT DF_TerminosyCondiciones_Fecha DEFAULT(GETDATE()),
        CONSTRAINT PK_TerminosyCondiciones PRIMARY KEY (TerminosyCondicionesId)
    );
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_TerminosyCondiciones_Insertar
    @TipoDocumentoId INT = NULL,
    @Documento NVARCHAR(50),
    @Nombres NVARCHAR(150)    
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NULLIF(LTRIM(RTRIM(@Documento)), '') IS NULL
        BEGIN
            RAISERROR('El documento es obligatorio.', 16, 1);
            RETURN;
        END;

        IF NULLIF(LTRIM(RTRIM(@Nombres)), '') IS NULL
        BEGIN
            RAISERROR('Los nombres son obligatorios.', 16, 1);
            RETURN;
        END;

        INSERT INTO dbo.TerminosyCondiciones
        (
            TipoDocumentoId,
            Documento,
            Nombres,            
            Fecha
        )
        VALUES
        (
            @TipoDocumentoId,
            LTRIM(RTRIM(@Documento)),
            LTRIM(RTRIM(@Nombres)),            
            GETDATE()
        );

        SELECT
            CAST(SCOPE_IDENTITY() AS INT) AS TerminosyCondicionesId,
            CAST(1 AS BIT) AS IsSuccess,
            'Términos y condiciones registrados correctamente.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT
            CAST(0 AS INT) AS TerminosyCondicionesId,
            CAST(0 AS BIT) AS IsSuccess,
            ERROR_MESSAGE() AS Message;
    END CATCH
END;
GO
