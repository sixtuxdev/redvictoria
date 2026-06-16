using System.Reflection;
using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Usuarios;

namespace RedVictoria.Application.Interfaces;

public static class UsuarioApplicationActivationExtensions
{
    public static async Task<Response<ActivarAccesoResponse>> ActivarAccesoAsync(
        this IUsuarioApplication usuarioApplication,
        ActivarAccesoRequest request,
        CancellationToken cancellationToken = default)
    {
        ArgumentNullException.ThrowIfNull(usuarioApplication);

        var method = usuarioApplication
            .GetType()
            .GetMethod(
                nameof(ActivarAccesoAsync),
                BindingFlags.Instance | BindingFlags.Public,
                binder: null,
                types: [typeof(ActivarAccesoRequest), typeof(CancellationToken)],
                modifiers: null);

        if (method is null)
        {
            return Response<ActivarAccesoResponse>.Failure(
                "No fue posible activar el acceso del ciudadano.");
        }

        var task = (Task<Response<ActivarAccesoResponse>>)method.Invoke(
            usuarioApplication,
            [request, cancellationToken])!;

        return await task;
    }
}
