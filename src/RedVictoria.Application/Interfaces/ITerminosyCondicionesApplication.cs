using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.TerminosyCondiciones;

namespace RedVictoria.Application.Interfaces;

public interface ITerminosyCondicionesApplication
{
    Task<Response<TerminosyCondicionesResponse>> InsertarAsync(
        TerminosyCondicionesRequest request,
        CancellationToken cancellationToken = default);
}
