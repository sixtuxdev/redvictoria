CREATE OR ALTER PROCEDURE dbo.usp_Ciudadanos_DesactivarReferido
    @CiudadanoAutenticadoId INT,
    @CiudadanoReferidoId INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    UPDATE objetivo
    SET Estado = 0
    FROM dbo.Ciudadanos objetivo
    WHERE objetivo.CiudadanoId = @CiudadanoReferidoId
      AND objetivo.Estado = 1
      AND (
            objetivo.CiudadanoReferidorId = @CiudadanoAutenticadoId
            OR objetivo.CiudadanoReferidorId IN (
                SELECT directo.CiudadanoId
                FROM dbo.Ciudadanos directo
                WHERE directo.CiudadanoReferidorId = @CiudadanoAutenticadoId
            )
          );

    SELECT CAST(IIF(@@ROWCOUNT > 0, 1, 0) AS BIT) AS Desactivado;
END;
