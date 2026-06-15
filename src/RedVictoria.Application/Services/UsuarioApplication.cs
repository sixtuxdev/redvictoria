using System.ComponentModel.DataAnnotations;
using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Usuarios;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Usuarios;

namespace RedVictoria.Application.Services;

public class UsuarioApplication : IUsuarioApplication
{
    private const int PasswordMinimumLength = 6;
    private const string DefaultRole = "Ciudadano";
    private readonly IUsuarioRepository _usuarioRepository;
    private readonly IPasswordHasher _passwordHasher;

    public UsuarioApplication(
        IUsuarioRepository usuarioRepository,
        IPasswordHasher passwordHasher)
    {
        _usuarioRepository = usuarioRepository;
        _passwordHasher = passwordHasher;
    }

    public async Task<Response<RegistroUsuarioResponse>> RegistrarAsync(
        RegistroUsuarioRequest request,
        CancellationToken cancellationToken = default)
    {
        var errors = Validate(request);
        if (errors.Count > 0)
        {
            return Response<RegistroUsuarioResponse>.Failure(
                "La solicitud contiene datos invÃ¡lidos.",
                errors);
        }

        var command = new RegistroUsuarioCommand
        {
            CiudadanoId = request.CiudadanoId,
            Email = request.Email.Trim().ToLowerInvariant(),
            PasswordHash = _passwordHasher.Hash(request.Password),
            Rol = NormalizeRole(request.Rol)
        };

        var result = await _usuarioRepository.RegistrarAsync(command, cancellationToken);
        if (!result.IsSuccess)
        {
            return Response<RegistroUsuarioResponse>.Failure(result.Message);
        }

        return Response<RegistroUsuarioResponse>.Success(
            new RegistroUsuarioResponse
            {
                UsuarioId = result.UsuarioId!.Value,
                CiudadanoId = result.CiudadanoId!.Value,
                Email = result.Email!,
                Rol = result.Rol!,
                Estado = result.Estado,
                FechaCreacion = result.FechaCreacion!.Value,
                Mensaje = result.Message
            },
            result.Message);
    }

    private static List<string> Validate(RegistroUsuarioRequest request)
    {
        var errors = new List<string>();

        if (request.CiudadanoId <= 0)
            errors.Add("CiudadanoId debe ser mayor que 0.");

        if (string.IsNullOrWhiteSpace(request.Email))
        {
            errors.Add("Email es obligatorio.");
        }
        else
        {
            var email = request.Email.Trim();
            if (email.Length > 150)
                errors.Add("Email no puede superar 150 caracteres.");
            if (!new EmailAddressAttribute().IsValid(email))
                errors.Add("Email no tiene un formato vÃ¡lido.");
        }

        if (string.IsNullOrWhiteSpace(request.Password))
            errors.Add("Password es obligatorio.");
        else if (request.Password.Length < PasswordMinimumLength)
            errors.Add($"Password debe tener mÃ­nimo {PasswordMinimumLength} caracteres.");

        if (string.IsNullOrWhiteSpace(request.ConfirmPassword))
            errors.Add("ConfirmPassword es obligatorio.");
        else if (!string.Equals(request.Password, request.ConfirmPassword, StringComparison.Ordinal))
            errors.Add("La contraseÃ±a y la confirmaciÃ³n no coinciden.");

        if (!string.IsNullOrWhiteSpace(request.Rol) && request.Rol.Trim().Length > 50)
            errors.Add("Rol no puede superar 50 caracteres.");

        return errors;
    }

    private static string NormalizeRole(string? role) =>
        string.IsNullOrWhiteSpace(role) ? DefaultRole : role.Trim();
}
