using RedVictoria.Domain.Models.Auth;

namespace RedVictoria.Domain.Interfaces;

public interface IAuthRepository
{
    Task<UsuarioLoginResult?> ObtenerPorEmailAsync(
        string email,
        CancellationToken cancellationToken = default);
}
