CREATE OR ALTER PROCEDURE dbo.usp_Ciudadanos_ObtenerRedReferidos
    @CiudadanoId INT,
    @PageNumber INT = NULL,
    @PageSize INT = NULL,
    @SearchText NVARCHAR(200) = NULL,
    @NombresCompletos NVARCHAR(200) = NULL,
    @NumeroIdentificacion NVARCHAR(50) = NULL,
    @Email NVARCHAR(150) = NULL,
    @Celular NVARCHAR(30) = NULL,
    @FechaNacimiento DATE = NULL,
    @CodigoReferido NVARCHAR(50) = NULL,
    @Referidor NVARCHAR(200) = NULL,
    @FechaRegistro DATE = NULL,
    @Estado BIT = NULL,
    @TipoReferido NVARCHAR(20) = NULL,
    @SortColumn NVARCHAR(80) = NULL,
    @SortDescending BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @EffectivePageNumber INT = ISNULL(NULLIF(@PageNumber, 0), 1);
    DECLARE @EffectivePageSize INT = ISNULL(NULLIF(@PageSize, 0), 2147483647);
    DECLARE @Offset INT = (@EffectivePageNumber - 1) * @EffectivePageSize;

    DECLARE @Referidos TABLE
    (
        CiudadanoId INT NOT NULL,
        NombresCompletos NVARCHAR(200) NOT NULL,
        FechaNacimiento DATE NULL,
        LugarNacimiento NVARCHAR(150) NULL,
        Email NVARCHAR(150) NULL,
        Celular NVARCHAR(30) NULL,
        TieneWhatsapp BIT NULL,
        ParametroIdDondeVive INT NULL,
        DondeViveDescripcion NVARCHAR(200) NULL,
        PuestoVotacion NVARCHAR(200) NULL,
        ParametroIdTipoIdentificacion INT NULL,
        TipoIdentificacionDescripcion NVARCHAR(200) NULL,
        NumeroIdentificacion NVARCHAR(50) NULL,
        Direccion NVARCHAR(250) NULL,
        DepartamentoId INT NULL,
        MunicipioId INT NULL,
        ParametroIdGrupoEdad INT NULL,
        GrupoEdadDescripcion NVARCHAR(200) NULL,
        ParametroIdGenero INT NULL,
        GeneroDescripcion NVARCHAR(200) NULL,
        ParametroIdSoy INT NULL,
        SoyDescripcion NVARCHAR(200) NULL,
        CodigoReferido NVARCHAR(50) NOT NULL,
        CiudadanoReferidorId INT NULL,
        TieneAcceso BIT NOT NULL,
        ParametroIdVereda INT NULL,
        VeredaDescripcion NVARCHAR(200) NULL,
        Estado BIT NOT NULL,
        FechaRegistro DATETIME NOT NULL,
        Celular2 NVARCHAR(30) NULL,
        TieneWhatsapp2 BIT NULL,
        ParametroIdTipoDiscapacidad INT NULL,
        TipoDiscapacidadDescripcion NVARCHAR(200) NULL,
        ParametroIdEstadoCivil INT NULL,
        EstadoCivilDescripcion NVARCHAR(200) NULL,
        TieneHijos BIT NULL,
        Cuantos INT NULL,
        TieneVehiculo BIT NULL,
        ParametroIdTipoVehiculo INT NULL,
        TipoVehiculoDescripcion NVARCHAR(200) NULL,
        ParametroIdReligion INT NULL,
        ReligionDescripcion NVARCHAR(200) NULL,
        EsEmpleado BIT NULL,
        Referidor NVARCHAR(200) NULL,
        Nivel INT NOT NULL,
        TipoReferido NVARCHAR(20) NOT NULL
    );

    ;WITH RedReferidos AS
    (
        SELECT
            c.CiudadanoId,
            c.NombresCompletos,
            c.FechaNacimiento,
            c.LugarNacimiento,
            c.Email,
            c.Celular,
            c.TieneWhatsapp,
            c.ParametroIdDondeVive,
            c.PuestoVotacion,
            c.ParametroIdTipoIdentificacion,
            c.NumeroIdentificacion,
            c.Direccion,
            c.DepartamentoId,
            c.MunicipioId,
            c.ParametroIdGrupoEdad,
            c.ParametroIdGenero,
            c.ParametroIdSoy,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            c.TieneAcceso,
            c.ParametroIdVereda,
            c.Estado,
            c.FechaRegistro,
            c.Celular2,
            c.TieneWhatsapp2,
            c.ParametroIdTipoDiscapacidad,
            c.ParametroIdEstadoCivil,
            c.TieneHijos,
            c.Cuantos,
            c.TieneVehiculo,
            c.ParametroIdTipoVehiculo,
            c.ParametroIdReligion,
            c.EsEmpleado,
            r.NombresCompletos AS Referidor,
            1 AS Nivel,
            CAST(N'Directo' AS NVARCHAR(20)) AS TipoReferido,
            CAST('/' + CAST(c.CiudadanoId AS VARCHAR(20)) + '/' AS VARCHAR(MAX)) AS Ruta
        FROM dbo.Ciudadanos c
        INNER JOIN dbo.Ciudadanos r
            ON r.CiudadanoId = c.CiudadanoReferidorId
        WHERE c.CiudadanoReferidorId = @CiudadanoId
          AND c.CiudadanoId <> @CiudadanoId

        UNION ALL

        SELECT
            c.CiudadanoId,
            c.NombresCompletos,
            c.FechaNacimiento,
            c.LugarNacimiento,
            c.Email,
            c.Celular,
            c.TieneWhatsapp,
            c.ParametroIdDondeVive,
            c.PuestoVotacion,
            c.ParametroIdTipoIdentificacion,
            c.NumeroIdentificacion,
            c.Direccion,
            c.DepartamentoId,
            c.MunicipioId,
            c.ParametroIdGrupoEdad,
            c.ParametroIdGenero,
            c.ParametroIdSoy,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            c.TieneAcceso,
            c.ParametroIdVereda,
            c.Estado,
            c.FechaRegistro,
            c.Celular2,
            c.TieneWhatsapp2,
            c.ParametroIdTipoDiscapacidad,
            c.ParametroIdEstadoCivil,
            c.TieneHijos,
            c.Cuantos,
            c.TieneVehiculo,
            c.ParametroIdTipoVehiculo,
            c.ParametroIdReligion,
            c.EsEmpleado,
            r.NombresCompletos AS Referidor,
            rr.Nivel + 1 AS Nivel,
            CAST(N'Indirecto' AS NVARCHAR(20)) AS TipoReferido,
            CAST(rr.Ruta + CAST(c.CiudadanoId AS VARCHAR(20)) + '/' AS VARCHAR(MAX)) AS Ruta
        FROM dbo.Ciudadanos c
        INNER JOIN dbo.Ciudadanos r
            ON r.CiudadanoId = c.CiudadanoReferidorId
        INNER JOIN RedReferidos rr
            ON rr.CiudadanoId = c.CiudadanoReferidorId
        WHERE c.CiudadanoId <> @CiudadanoId
          AND rr.Ruta NOT LIKE '%/' + CAST(c.CiudadanoId AS VARCHAR(20)) + '/%'
          AND rr.Nivel < 20
    )
    INSERT INTO @Referidos
    SELECT
        rr.CiudadanoId,
        rr.NombresCompletos,
        rr.FechaNacimiento,
        rr.LugarNacimiento,
        rr.Email,
        rr.Celular,
        rr.TieneWhatsapp,
        rr.ParametroIdDondeVive,
        pDondeVive.Descripcion AS DondeViveDescripcion,
        rr.PuestoVotacion,
        rr.ParametroIdTipoIdentificacion,
        pTipoIdentificacion.Descripcion AS TipoIdentificacionDescripcion,
        rr.NumeroIdentificacion,
        rr.Direccion,
        rr.DepartamentoId,
        rr.MunicipioId,
        rr.ParametroIdGrupoEdad,
        pGrupoEdad.Descripcion AS GrupoEdadDescripcion,
        rr.ParametroIdGenero,
        pGenero.Descripcion AS GeneroDescripcion,
        rr.ParametroIdSoy,
        pSoy.Descripcion AS SoyDescripcion,
        rr.CodigoReferido,
        rr.CiudadanoReferidorId,
        rr.TieneAcceso,
        rr.ParametroIdVereda,
        pVereda.Descripcion AS VeredaDescripcion,
        rr.Estado,
        rr.FechaRegistro,
        rr.Celular2,
        rr.TieneWhatsapp2,
        rr.ParametroIdTipoDiscapacidad,
        pDiscapacidad.Descripcion AS TipoDiscapacidadDescripcion,
        rr.ParametroIdEstadoCivil,
        pEstadoCivil.Descripcion AS EstadoCivilDescripcion,
        rr.TieneHijos,
        rr.Cuantos,
        rr.TieneVehiculo,
        rr.ParametroIdTipoVehiculo,
        pTipoVehiculo.Descripcion AS TipoVehiculoDescripcion,
        rr.ParametroIdReligion,
        pReligion.Descripcion AS ReligionDescripcion,
        rr.EsEmpleado,
        rr.Referidor,
        rr.Nivel,
        rr.TipoReferido
    FROM RedReferidos rr
    LEFT JOIN dbo.Parametros pDondeVive
        ON pDondeVive.ParametroId = rr.ParametroIdDondeVive
    LEFT JOIN dbo.Parametros pTipoIdentificacion
        ON pTipoIdentificacion.ParametroId = rr.ParametroIdTipoIdentificacion
    LEFT JOIN dbo.Parametros pGrupoEdad
        ON pGrupoEdad.ParametroId = rr.ParametroIdGrupoEdad
    LEFT JOIN dbo.Parametros pGenero
        ON pGenero.ParametroId = rr.ParametroIdGenero
    LEFT JOIN dbo.Parametros pSoy
        ON pSoy.ParametroId = rr.ParametroIdSoy
    LEFT JOIN dbo.Parametros pVereda
        ON pVereda.ParametroId = rr.ParametroIdVereda
    LEFT JOIN dbo.Parametros pDiscapacidad
        ON pDiscapacidad.ParametroId = rr.ParametroIdTipoDiscapacidad
    LEFT JOIN dbo.Parametros pEstadoCivil
        ON pEstadoCivil.ParametroId = rr.ParametroIdEstadoCivil
    LEFT JOIN dbo.Parametros pTipoVehiculo
        ON pTipoVehiculo.ParametroId = rr.ParametroIdTipoVehiculo
    LEFT JOIN dbo.Parametros pReligion
        ON pReligion.ParametroId = rr.ParametroIdReligion
    OPTION (MAXRECURSION 20);

    SELECT *
    INTO #Filtrados
    FROM @Referidos
    WHERE (@SearchText IS NULL
        OR NombresCompletos LIKE '%' + @SearchText + '%'
        OR NumeroIdentificacion LIKE '%' + @SearchText + '%'
        OR Celular LIKE '%' + @SearchText + '%'
        OR Celular2 LIKE '%' + @SearchText + '%'
        OR Email LIKE '%' + @SearchText + '%'
        OR CodigoReferido LIKE '%' + @SearchText + '%'
        OR Referidor LIKE '%' + @SearchText + '%'
        OR TipoReferido LIKE '%' + @SearchText + '%'
        OR DondeViveDescripcion LIKE '%' + @SearchText + '%'
        OR TipoIdentificacionDescripcion LIKE '%' + @SearchText + '%'
        OR GrupoEdadDescripcion LIKE '%' + @SearchText + '%'
        OR GeneroDescripcion LIKE '%' + @SearchText + '%'
        OR SoyDescripcion LIKE '%' + @SearchText + '%'
        OR VeredaDescripcion LIKE '%' + @SearchText + '%'
        OR TipoDiscapacidadDescripcion LIKE '%' + @SearchText + '%'
        OR EstadoCivilDescripcion LIKE '%' + @SearchText + '%'
        OR TipoVehiculoDescripcion LIKE '%' + @SearchText + '%'
        OR ReligionDescripcion LIKE '%' + @SearchText + '%'
        OR (Estado = 1 AND N'Activo' LIKE '%' + @SearchText + '%')
        OR (Estado = 0 AND N'Inactivo' LIKE '%' + @SearchText + '%'))
      AND (@NombresCompletos IS NULL OR NombresCompletos LIKE '%' + @NombresCompletos + '%')
      AND (@NumeroIdentificacion IS NULL OR NumeroIdentificacion LIKE '%' + @NumeroIdentificacion + '%')
      AND (@Email IS NULL OR Email LIKE '%' + @Email + '%')
      AND (@Celular IS NULL OR Celular LIKE '%' + @Celular + '%' OR Celular2 LIKE '%' + @Celular + '%')
      AND (@FechaNacimiento IS NULL OR CONVERT(DATE, FechaNacimiento) = @FechaNacimiento)
      AND (@CodigoReferido IS NULL OR CodigoReferido LIKE '%' + @CodigoReferido + '%')
      AND (@Referidor IS NULL OR Referidor LIKE '%' + @Referidor + '%')
      AND (@FechaRegistro IS NULL OR CONVERT(DATE, FechaRegistro) = @FechaRegistro)
      AND (@Estado IS NULL OR Estado = @Estado)
      AND (@TipoReferido IS NULL OR TipoReferido LIKE '%' + @TipoReferido + '%');

    SELECT *
    FROM #Filtrados
    ORDER BY
        CASE WHEN @SortColumn IS NULL THEN Nivel END ASC,
        CASE WHEN @SortColumn IS NULL THEN FechaRegistro END DESC,
        CASE WHEN @SortColumn IS NULL THEN NombresCompletos END ASC,
        CASE WHEN @SortColumn = N'NombresCompletos' AND @SortDescending = 0 THEN NombresCompletos END ASC,
        CASE WHEN @SortColumn = N'NombresCompletos' AND @SortDescending = 1 THEN NombresCompletos END DESC,
        CASE WHEN @SortColumn = N'Email' AND @SortDescending = 0 THEN Email END ASC,
        CASE WHEN @SortColumn = N'Email' AND @SortDescending = 1 THEN Email END DESC,
        CASE WHEN @SortColumn = N'FechaNacimiento' AND @SortDescending = 0 THEN FechaNacimiento END ASC,
        CASE WHEN @SortColumn = N'FechaNacimiento' AND @SortDescending = 1 THEN FechaNacimiento END DESC,
        CASE WHEN @SortColumn = N'CodigoReferido' AND @SortDescending = 0 THEN CodigoReferido END ASC,
        CASE WHEN @SortColumn = N'CodigoReferido' AND @SortDescending = 1 THEN CodigoReferido END DESC,
        CASE WHEN @SortColumn = N'Referidor' AND @SortDescending = 0 THEN Referidor END ASC,
        CASE WHEN @SortColumn = N'Referidor' AND @SortDescending = 1 THEN Referidor END DESC,
        CASE WHEN @SortColumn = N'FechaRegistro' AND @SortDescending = 0 THEN FechaRegistro END ASC,
        CASE WHEN @SortColumn = N'FechaRegistro' AND @SortDescending = 1 THEN FechaRegistro END DESC,
        CASE WHEN @SortColumn = N'Estado' AND @SortDescending = 0 THEN CAST(Estado AS INT) END ASC,
        CASE WHEN @SortColumn = N'Estado' AND @SortDescending = 1 THEN CAST(Estado AS INT) END DESC,
        CASE WHEN @SortColumn = N'TipoReferido' AND @SortDescending = 0 THEN TipoReferido END ASC,
        CASE WHEN @SortColumn = N'TipoReferido' AND @SortDescending = 1 THEN TipoReferido END DESC,
        Nivel ASC,
        FechaRegistro DESC,
        NombresCompletos ASC
    OFFSET @Offset ROWS FETCH NEXT @EffectivePageSize ROWS ONLY;

    SELECT COUNT(1)
    FROM #Filtrados;

    SELECT
        COUNT(CASE WHEN Nivel = 1 THEN 1 END) AS TotalDirectos,
        COUNT(CASE WHEN Nivel > 1 THEN 1 END) AS TotalIndirectos,
        COUNT(CASE WHEN Estado = 1 THEN 1 END) AS TotalActivos,
        COUNT(CASE WHEN Estado = 0 THEN 1 END) AS TotalInactivos
    FROM #Filtrados;
END;
