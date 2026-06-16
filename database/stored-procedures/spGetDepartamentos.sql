CREATE OR ALTER PROCEDURE dbo.spGetDepartamentos
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        DepartamentoId,
        DepartamentoNombre,
        Descripcion,
        FechaCreacion
    FROM dbo.Departamento
    ORDER BY DepartamentoNombre;
END;
