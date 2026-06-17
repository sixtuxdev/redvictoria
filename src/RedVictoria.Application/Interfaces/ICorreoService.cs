namespace RedVictoria.Application.Interfaces;

public interface ICorreoService
{
    Task EnviarRegistroCiudadanoAsync(
        string destinatario,
        string nombresCompletos,
        string codigoReferido,
        CancellationToken cancellationToken = default);
}
