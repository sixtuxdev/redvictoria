using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.TerminosyCondiciones;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.TerminosyCondiciones;

namespace RedVictoria.Application.Services;

public sealed class TerminosyCondicionesApplication(
    ITerminosyCondicionesRepository repository) : ITerminosyCondicionesApplication
{
    public async Task<Response<TerminosyCondicionesResponse>> InsertarAsync(
        TerminosyCondicionesRequest request,
        CancellationToken cancellationToken = default)
    {
        var errors = Validate(request);
        if (errors.Count > 0)
        {
            return Response<TerminosyCondicionesResponse>.Failure(
                "La solicitud contiene datos invalidos.",
                errors);
        }

        var command = new TerminosyCondicionesCommand
        {
            TipoDocumentoId = request.TipoDocumentoId,
            Documento = request.Documento.Trim(),
            Nombres = request.Nombres.Trim(),
            Apellidos = Normalize(request.Apellidos)
        };

        var result = await repository.InsertarAsync(command, cancellationToken);
        if (!result.IsSuccess)
        {
            return Response<TerminosyCondicionesResponse>.Failure(result.Message);
        }

        var response = new TerminosyCondicionesResponse
        {
            TerminosyCondicionesId = result.TerminosyCondicionesId
        };

        return Response<TerminosyCondicionesResponse>.Success(response, result.Message);
    }

    private static List<string> Validate(TerminosyCondicionesRequest request)
    {
        var errors = new List<string>();

        ValidateRequiredText(request.Documento, "Documento", errors);
        ValidateRequiredText(request.Nombres, "Nombres", errors);
        ValidateMaximumLength(request.Documento, 50, "Documento", errors);
        ValidateMaximumLength(request.Nombres, 150, "Nombres", errors);
        ValidateMaximumLength(request.Apellidos, 150, "Apellidos", errors);

        return errors;
    }

    private static void ValidateRequiredText(
        string? value,
        string fieldName,
        ICollection<string> errors)
    {
        if (string.IsNullOrWhiteSpace(value))
            errors.Add($"{fieldName} es obligatorio.");
    }

    private static void ValidateMaximumLength(
        string? value,
        int maximumLength,
        string fieldName,
        ICollection<string> errors)
    {
        if (value?.Trim().Length > maximumLength)
            errors.Add($"{fieldName} no puede superar {maximumLength} caracteres.");
    }

    private static string? Normalize(string? value) =>
        string.IsNullOrWhiteSpace(value) ? null : value.Trim();
}
