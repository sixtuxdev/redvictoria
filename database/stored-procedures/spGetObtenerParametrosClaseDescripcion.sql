CREATE OR ALTER PROCEDURE dbo.spGetObtenerParametrosClaseDescripcion
    @DescripcionClase NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.ParametroId,
        p.ClaseId,
        p.Descripcion,
        p.Observacion,
        p.Estado,
        p.FechaCreacion
    FROM dbo.Clase c
    INNER JOIN dbo.Parametros p
        ON p.ClaseId = c.ClaseId
    WHERE c.Descripcion = @DescripcionClase
      AND c.Estado = 1
      AND p.Estado = 1
    ORDER BY p.Descripcion;
END;
