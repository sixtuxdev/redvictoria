using RedVictoria.WebUI.Models.Ciudadanos;
using RedVictoria.WebUI.Models.Common;

namespace RedVictoria.WebUI.Interfaces;

public interface ICiudadanoService
{
    Task<OperationResultModel> RegistrarAsync(
        RegistroCiudadanoRequestModel request,
        string? codigoReferido,
        CancellationToken cancellationToken = default);

    Task<OperationResultModel> RegistrarAsync(
        RegisterCiudadanoRequestModel request,
        string? codigoReferido,
        CancellationToken cancellationToken = default);

    Task<OperationResultModel> ValidarCodigoReferidoAsync(
        string? codigoReferido,
        CancellationToken cancellationToken = default);

    Task<ReferidosResultModel> ObtenerRedReferidosAsync(
        CancellationToken cancellationToken = default);

    Task<ReferidosPageResultModel> ObtenerRedReferidosPaginadosAsync(
        ReferidosPageRequestModel request,
        CancellationToken cancellationToken = default);

    Task<OperationResultModel> DesactivarReferidoAsync(
        int ciudadanoReferidoId,
        CancellationToken cancellationToken = default);

    Task<byte[]> ExportarRedReferidosExcelAsync(
        CancellationToken cancellationToken = default);
}
