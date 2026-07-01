using RedVictoria.Domain.Models.Ciudadanos;

namespace RedVictoria.Domain.Interfaces;

public interface ICiudadanoRepository
{
    Task<RegistroCiudadanoResult> RegistrarAsync(
        RegistroCiudadanoCommand command,
        CancellationToken cancellationToken = default);

    Task<bool> ExisteCodigoReferidoAsync(
        string codigoReferido,
        CancellationToken cancellationToken = default);

    Task<IReadOnlyCollection<CiudadanoReferidoResult>> ObtenerRedReferidosAsync(
        int ciudadanoId,
        CancellationToken cancellationToken = default);

    Task<CiudadanoReferidoPagedResult> ObtenerRedReferidosPaginadosAsync(
        CiudadanoReferidoQuery query,
        CancellationToken cancellationToken = default);

    Task<bool> DesactivarReferidoAsync(
        int ciudadanoAutenticadoId,
        int ciudadanoReferidoId,
        CancellationToken cancellationToken = default);
}
