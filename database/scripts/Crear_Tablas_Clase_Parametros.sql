IF OBJECT_ID(N'dbo.Clase', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Clase
    (
        ClaseId INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Clase PRIMARY KEY,
        Descripcion NVARCHAR(150) NOT NULL,
        Estado BIT NOT NULL CONSTRAINT DF_Clase_Estado DEFAULT (1),
        FechaCreacion DATETIME NOT NULL CONSTRAINT DF_Clase_FechaCreacion DEFAULT (GETUTCDATE())
    );

    CREATE UNIQUE INDEX UX_Clase_Descripcion
        ON dbo.Clase (Descripcion);
END;

IF OBJECT_ID(N'dbo.Parametros', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Parametros
    (
        ParametroId INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Parametros PRIMARY KEY,
        ClaseId INT NOT NULL,
        Descripcion NVARCHAR(150) NOT NULL,
        Observacion NVARCHAR(250) NULL,
        Estado BIT NOT NULL CONSTRAINT DF_Parametros_Estado DEFAULT (1),
        FechaCreacion DATETIME NOT NULL CONSTRAINT DF_Parametros_FechaCreacion DEFAULT (GETUTCDATE()),
        CONSTRAINT FK_Parametros_Clase FOREIGN KEY (ClaseId)
            REFERENCES dbo.Clase (ClaseId)
    );

    CREATE INDEX IX_Parametros_ClaseId_Estado
        ON dbo.Parametros (ClaseId, Estado);
END;
