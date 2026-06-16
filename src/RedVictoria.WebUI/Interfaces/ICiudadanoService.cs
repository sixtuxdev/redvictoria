using RedVictoria.WebUI.Models.Ciudadanos;
using RedVictoria.WebUI.Models.Common;

namespace RedVictoria.WebUI.Interfaces;

public interface ICiudadanoService
{
    Task<OperationResultModel> RegistrarAsync(
        RegistroCiudadanoRequestModel request,
        string? codigoReferido,
        CancellationToken cancellationToken = default);
}
