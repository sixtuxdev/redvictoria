using RedVictoria.WebUI.Models.Common;
using RedVictoria.WebUI.Models.TerminosyCondiciones;

namespace RedVictoria.WebUI.Interfaces;

public interface ITerminosyCondicionesService
{
    Task<OperationResultModel> InsertarAsync(
        TerminosyCondicionesRequestModel request,
        CancellationToken cancellationToken = default);
}
