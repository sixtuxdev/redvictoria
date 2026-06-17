using System.ComponentModel.DataAnnotations;
using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Auth;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Auth;

namespace RedVictoria.Application.Services;

public class AuthApplication : IAuthApplication
{
    private const int PasswordMinimumLength = 6;
    private const string InvalidCredentialsMessage = "Credenciales inválidas.";
    private readonly IAuthRepository _authRepository;
    private readonly IPasswordHasher _passwordHasher;
    private readonly IJwtTokenGenerator _jwtTokenGenerator;

    public AuthApplication(
        IAuthRepository authRepository,
        IPasswordHasher passwordHasher,
        IJwtTokenGenerator jwtTokenGenerator)
    {
        _authRepository = authRepository;
        _passwordHasher = passwordHasher;
        _jwtTokenGenerator = jwtTokenGenerator;
    }

    public async Task<Response<LoginResponse>> LoginAsync(
        LoginRequest request,
        CancellationToken cancellationToken = default)
    {
        var errors = Validate(request);
        if (errors.Count > 0)
        {
            return Response<LoginResponse>.Failure(
                "La solicitud contiene datos inválidos.",
                errors);
        }

        var email = request.Email.Trim().ToLowerInvariant();
        var userResult = await _authRepository.ObtenerPorEmailAsync(email, cancellationToken);
        if (userResult is null)
        {
            return Response<LoginResponse>.Failure(InvalidCredentialsMessage);
        }

        var user = Map(userResult);
        if (string.IsNullOrWhiteSpace(user.CodigoReferido))
        {
            return Response<LoginResponse>.Failure(
                "El usuario no tiene un ciudadano asociado.");
        }

        if (!user.UsuarioEstado || !user.CiudadanoEstado)
        {
            return Response<LoginResponse>.Failure(InvalidCredentialsMessage);
        }

        if (!user.TieneAcceso)
        {
            return Response<LoginResponse>.Failure(
                "El ciudadano no tiene acceso al sistema.");
        }

        if (!PasswordHasherVerification.Verify(
                _passwordHasher,
                request.Password,
                user.PasswordHash))
        {
            return Response<LoginResponse>.Failure(InvalidCredentialsMessage);
        }

        var response = new LoginResponse
        {
            UsuarioId = user.UsuarioId,
            CiudadanoId = user.CiudadanoId,
            Nombre = user.NombresCompletos,
            CodigoReferido = user.CodigoReferido,
            Email = user.Email,
            Rol = user.Rol
        };
        var token = _jwtTokenGenerator.Generate(response);
        response.Token = token.Token;
        response.FechaExpiracion = token.FechaExpiracion;

        return Response<LoginResponse>.Success(
            response,
            "Inicio de sesión exitoso.");
    }

    private static List<string> Validate(LoginRequest request)
    {
        var errors = new List<string>();

        if (string.IsNullOrWhiteSpace(request.Email))
        {
            errors.Add("Email es obligatorio.");
        }
        else if (!new EmailAddressAttribute().IsValid(request.Email.Trim()))
        {
            errors.Add("Email no tiene un formato válido.");
        }

        if (string.IsNullOrWhiteSpace(request.Password))
        {
            errors.Add("Password es obligatorio.");
        }
        else if (request.Password.Length < PasswordMinimumLength)
        {
            errors.Add($"Password debe tener mínimo {PasswordMinimumLength} caracteres.");
        }

        return errors;
    }

    private static UsuarioLoginDto Map(UsuarioLoginResult user) =>
        new()
        {
            UsuarioId = user.UsuarioId,
            CiudadanoId = user.CiudadanoId,
            NombresCompletos = user.NombresCompletos,
            CodigoReferido = user.CodigoReferido,
            Email = user.Email,
            PasswordHash = user.PasswordHash,
            Rol = user.Rol,
            UsuarioEstado = user.UsuarioEstado,
            CiudadanoEstado = user.CiudadanoEstado,
            TieneAcceso = user.TieneAcceso
        };
}
