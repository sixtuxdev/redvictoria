using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Usuarios;

namespace RedVictoria.Application.Interfaces;

public interface IUsuarioApplication
{
    Task<Response<RegistroUsuarioResponse>> RegistrarAsync(
        RegistroUsuarioRequest request,
        CancellationToken cancellationToken = default);
}
