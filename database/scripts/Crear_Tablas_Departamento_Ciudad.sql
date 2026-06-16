IF OBJECT_ID(N'dbo.Departamento', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Departamento
    (
        DepartamentoId INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Departamento PRIMARY KEY,
        DepartamentoNombre NVARCHAR(150) NOT NULL,
        Descripcion NVARCHAR(250) NULL,
        FechaCreacion DATETIME NOT NULL CONSTRAINT DF_Departamento_FechaCreacion DEFAULT (GETUTCDATE())
    );

    CREATE INDEX IX_Departamento_DepartamentoNombre
        ON dbo.Departamento (DepartamentoNombre);
END;

IF OBJECT_ID(N'dbo.Ciudad', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Ciudad
    (
        CiudadId INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Ciudad PRIMARY KEY,
        DepartamentoId INT NOT NULL,
        CiudadNombre NVARCHAR(150) NOT NULL,
        Descripcion NVARCHAR(250) NULL,
        FechaCreacion DATETIME NOT NULL CONSTRAINT DF_Ciudad_FechaCreacion DEFAULT (GETUTCDATE()),
        CONSTRAINT FK_Ciudad_Departamento FOREIGN KEY (DepartamentoId)
            REFERENCES dbo.Departamento (DepartamentoId)
    );

    CREATE INDEX IX_Ciudad_DepartamentoId_CiudadNombre
        ON dbo.Ciudad (DepartamentoId, CiudadNombre);
END;
