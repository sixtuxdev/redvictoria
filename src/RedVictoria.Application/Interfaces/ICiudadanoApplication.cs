using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Ciudadanos;

namespace RedVictoria.Application.Interfaces;

public interface ICiudadanoApplication
{
    Task<Response<RegistroCiudadanoResponse>> RegistrarAsync(
        RegistroCiudadanoRequest request,
        string? codigoReferidoUrl = null,
        CancellationToken cancellationToken = default);

    Task<Response<ValidarCodigoReferidoResponse>> ValidarCodigoReferidoAsync(
        string? codigoReferido,
        CancellationToken cancellationToken = default);

    Task<Response<IReadOnlyCollection<CiudadanoReferidoResponse>>> ObtenerRedReferidosAsync(
        int ciudadanoId,
        CancellationToken cancellationToken = default);

    Task<Response<bool>> DesactivarReferidoAsync(
        int ciudadanoAutenticadoId,
        int ciudadanoReferidoId,
        CancellationToken cancellationToken = default);
}
