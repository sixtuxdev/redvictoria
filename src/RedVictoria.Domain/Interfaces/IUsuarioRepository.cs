using RedVictoria.Domain.Models.Usuarios;

namespace RedVictoria.Domain.Interfaces;

public interface IUsuarioRepository
{
    Task<RegistroUsuarioResult> RegistrarAsync(
        RegistroUsuarioCommand command,
        CancellationToken cancellationToken = default);

    Task<ActivarAccesoResult> ActivarAccesoAsync(
        ActivarAccesoCommand command,
        CancellationToken cancellationToken = default);
}
