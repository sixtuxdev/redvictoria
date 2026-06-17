CREATE OR ALTER PROCEDURE dbo.usp_Ciudadanos_ExisteCodigoReferido
    @CodigoReferido NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT CAST(
        CASE
            WHEN EXISTS (
                SELECT 1
                FROM dbo.Ciudadanos
                WHERE CodigoReferido = @CodigoReferido
            )
            THEN 1
            ELSE 0
        END AS BIT) AS Existe;
END;
