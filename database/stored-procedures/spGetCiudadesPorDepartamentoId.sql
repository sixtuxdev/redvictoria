CREATE OR ALTER PROCEDURE dbo.spGetCiudadesPorDepartamentoId
    @DepartamentoId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        CiudadId,
        DepartamentoId,
        CiudadNombre,
        Descripcion,
        FechaCreacion
    FROM dbo.Ciudad
    WHERE DepartamentoId = @DepartamentoId
    ORDER BY CiudadNombre;
END;
