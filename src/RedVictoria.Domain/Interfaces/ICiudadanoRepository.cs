using RedVictoria.Domain.Models.Ciudadanos;

namespace RedVictoria.Domain.Interfaces;

public interface ICiudadanoRepository
{
    Task<RegistroCiudadanoResult> RegistrarAsync(
        RegistroCiudadanoCommand command,
        CancellationToken cancellationToken = default);
}
