using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Ciudadanos;

namespace RedVictoria.Application.Interfaces;

public interface ICiudadanoApplication
{
    Task<Response<RegistroCiudadanoResponse>> RegistrarAsync(
        RegistroCiudadanoRequest request,
        string? codigoReferidoUrl = null,
        CancellationToken cancellationToken = default);
}
