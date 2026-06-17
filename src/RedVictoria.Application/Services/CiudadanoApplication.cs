using System.ComponentModel.DataAnnotations;
using RedVictoria.Application.Common;
using RedVictoria.Application.DTOs.Ciudadanos;
using RedVictoria.Application.Interfaces;
using RedVictoria.Domain.Interfaces;
using RedVictoria.Domain.Models.Ciudadanos;

namespace RedVictoria.Application.Services;

public class CiudadanoApplication : ICiudadanoApplication
{
    private const int PasswordMinimumLength = 6;
    private readonly ICiudadanoRepository _ciudadanoRepository;
    private readonly IPasswordHasher _passwordHasher;
    private readonly ICorreoService _correoService;
    

    public CiudadanoApplication(
        ICiudadanoRepository ciudadanoRepository,
        IPasswordHasher passwordHasher,
        ICorreoService correoService)
    {
        _ciudadanoRepository = ciudadanoRepository;
        _passwordHasher = passwordHasher;
        _correoService = correoService;
    }

    public async Task<Response<RegistroCiudadanoResponse>> RegistrarAsync(
        RegistroCiudadanoRequest request,
        string? codigoReferidoUrl = null,
        CancellationToken cancellationToken = default)
    {
        var codigoReferido = Normalize(codigoReferidoUrl)
            ?? Normalize(request.CodigoReferido);
        var errors = Validate(request, codigoReferido);
        if (errors.Count > 0)
        {
            return Response<RegistroCiudadanoResponse>.Failure(
                "La solicitud contiene datos inválidos.",
                errors);
        }

        var hasPassword = !string.IsNullOrWhiteSpace(request.Password);
        var command = new RegistroCiudadanoCommand
        {
            NombresCompletos = request.NombresCompletos.Trim(),
            Celular = Normalize(request.Celular),
            FechaNacimiento = request.FechaNacimiento,
            LugarNacimiento = Normalize(request.LugarNacimiento),
            TieneWhatsapp = request.TieneWhatsapp,
            ParametroIdDondeVive = request.ParametroIdDondeVive,
            PuestoVotacion = Normalize(request.PuestoVotacion),
            Email = Normalize(request.Email)?.ToLowerInvariant(),
            ParametroIdTipoIdentificacion = request.ParametroIdTipoIdentificacion,
            NumeroIdentificacion = Normalize(request.NumeroIdentificacion),
            Direccion = Normalize(request.Direccion),
            DepartamentoId = request.DepartamentoId,
            MunicipioId = request.MunicipioId,
            ParametroIdGrupoEdad = request.ParametroIdGrupoEdad,
            ParametroIdGenero = request.ParametroIdGenero,
            ParametroIdSoy = request.ParametroIdSoy,
            ParametroIdVereda = request.ParametroIdVereda,
            Estado = request.Estado,
            CodigoReferidoInvitacion = codigoReferido,
            PasswordHash = hasPassword ? _passwordHasher.Hash(request.Password!) : null
        };

        var result = await _ciudadanoRepository.RegistrarAsync(command, cancellationToken);
        if (!result.IsSuccess)
        {
            return Response<RegistroCiudadanoResponse>.Failure(result.Message);
        }

        var response = new RegistroCiudadanoResponse
            {
                CiudadanoId = result.CiudadanoId!.Value,
                NombresCompletos = result.NombresCompletos!,
                FechaNacimiento = result.FechaNacimiento,
                LugarNacimiento = result.LugarNacimiento,
                Email = result.Email,
                Celular = result.Celular,
                TieneWhatsapp = result.TieneWhatsapp,
                ParametroIdDondeVive = result.ParametroIdDondeVive,
                PuestoVotacion = result.PuestoVotacion,
                ParametroIdTipoIdentificacion = result.ParametroIdTipoIdentificacion,
                NumeroIdentificacion = result.NumeroIdentificacion,
                Direccion = result.Direccion,
                DepartamentoId = result.DepartamentoId,
                MunicipioId = result.MunicipioId,
                ParametroIdGrupoEdad = result.ParametroIdGrupoEdad,
                ParametroIdGenero = result.ParametroIdGenero,
                ParametroIdSoy = result.ParametroIdSoy,
                ParametroIdVereda = result.ParametroIdVereda,
                CodigoReferido = result.CodigoReferido!,
                CiudadanoReferidorId = result.CiudadanoReferidorId,
                TieneAcceso = result.TieneAcceso,
                Estado = result.Estado,
                FechaRegistro = result.FechaRegistro
            };

        var message = result.Message;
        if (!string.IsNullOrWhiteSpace(response.Email)
            && !string.IsNullOrWhiteSpace(response.CodigoReferido))
        {
            try
            {
                await _correoService.EnviarRegistroCiudadanoAsync(
                    response.Email,
                    response.NombresCompletos,
                    response.CodigoReferido,
                    cancellationToken);
            }
            catch
            {
                message = $"{message} No fue posible enviar el correo de confirmacion.";
            }
        }

        return Response<RegistroCiudadanoResponse>.Success(response, message);
    }

    public async Task<Response<ValidarCodigoReferidoResponse>> ValidarCodigoReferidoAsync(
        string? codigoReferido,
        CancellationToken cancellationToken = default)
    {
        var normalizedCode = Normalize(codigoReferido);
        if (string.IsNullOrWhiteSpace(normalizedCode))
        {
            return Response<ValidarCodigoReferidoResponse>.Failure(
                "CodigoReferido es obligatorio.");
        }

        var existe = await _ciudadanoRepository.ExisteCodigoReferidoAsync(
            normalizedCode,
            cancellationToken);

        var response = new ValidarCodigoReferidoResponse
        {
            CodigoReferido = normalizedCode,
            Existe = existe
        };

        return Response<ValidarCodigoReferidoResponse>.Success(
            response,
            existe
                ? "El codigo de referido existe."
                : "No puede continuar porque el referido ingresado no existe.");
    }

    private static List<string> Validate(
        RegistroCiudadanoRequest request,
        string? codigoReferido)
    {
        var errors = new List<string>();

        if (string.IsNullOrWhiteSpace(request.NombresCompletos))
            errors.Add("NombresCompletos es obligatorio.");
        else if (request.NombresCompletos.Trim().Length > 200)
            errors.Add("NombresCompletos no puede superar 200 caracteres.");

        ValidateRequiredText(request.Celular, "Celular", errors);
        ValidateRequiredText(request.Email, "Email", errors);
        ValidateRequiredText(request.NumeroIdentificacion, "NumeroIdentificacion", errors);
        ValidateRequiredText(request.Direccion, "Direccion", errors);
        ValidateRequiredText(request.PuestoVotacion, "PuestoVotacion", errors);
        ValidateRequiredText(codigoReferido, "CodigoReferido", errors);
        ValidateRequiredValue(request.FechaNacimiento, "FechaNacimiento", errors);
        ValidateRequiredValue(request.TieneWhatsapp, "TieneWhatsapp", errors);
        ValidateRequiredValue(request.ParametroIdDondeVive, "ParametroIdDondeVive", errors);
        ValidateRequiredValue(request.ParametroIdTipoIdentificacion, "ParametroIdTipoIdentificacion", errors);
        ValidateRequiredValue(request.DepartamentoId, "DepartamentoId", errors);
        ValidateRequiredValue(request.MunicipioId, "MunicipioId", errors);
        ValidateRequiredValue(request.ParametroIdGenero, "ParametroIdGenero", errors);
        ValidateRequiredValue(request.ParametroIdSoy, "ParametroIdSoy", errors);
        ValidateRequiredValue(request.ParametroIdVereda, "ParametroIdVereda", errors);

        ValidateMaximumLength(request.Celular, 30, "Celular", errors);
        ValidateMaximumLength(request.Email, 150, "Email", errors);
        ValidateMaximumLength(request.NumeroIdentificacion, 50, "NumeroIdentificacion", errors);
        ValidateMaximumLength(request.Direccion, 250, "Direccion", errors);
        ValidateMaximumLength(request.LugarNacimiento, 150, "LugarNacimiento", errors);
        ValidateMaximumLength(request.PuestoVotacion, 150, "PuestoVotacion", errors);
        ValidateMaximumLength(codigoReferido, 50, "CodigoReferido", errors);

        if (request.FechaNacimiento?.Date > DateTime.Today)
            errors.Add("FechaNacimiento no puede ser una fecha futura.");

        if (!string.IsNullOrWhiteSpace(request.Email)
            && !new EmailAddressAttribute().IsValid(request.Email.Trim()))
        {
            errors.Add("Email no tiene un formato válido.");
        }

        if (request.TieneAcceso && string.IsNullOrWhiteSpace(request.Password))
            errors.Add("Password es obligatorio cuando el ciudadano tendra acceso.");

        if (!string.IsNullOrWhiteSpace(request.Password))
        {
            if (string.IsNullOrWhiteSpace(request.Email))
                errors.Add("Email es obligatorio cuando se ingresa una contraseña.");
            if (string.IsNullOrWhiteSpace(request.ConfirmPassword))
                errors.Add("ConfirmPassword es obligatorio cuando se ingresa una contraseña.");
            if (request.Password.Length < PasswordMinimumLength)
                errors.Add($"Password debe tener mínimo {PasswordMinimumLength} caracteres.");
            if (!string.Equals(request.Password, request.ConfirmPassword, StringComparison.Ordinal))
                errors.Add("Password y ConfirmPassword deben coincidir.");
        }
        else if (!string.IsNullOrWhiteSpace(request.ConfirmPassword))
        {
            errors.Add("Password es obligatorio cuando se ingresa ConfirmPassword.");
        }

        return errors;
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

    private static void ValidateRequiredText(
        string? value,
        string fieldName,
        ICollection<string> errors)
    {
        if (string.IsNullOrWhiteSpace(value))
            errors.Add($"{fieldName} es obligatorio.");
    }

    private static void ValidateRequiredValue<T>(
        T? value,
        string fieldName,
        ICollection<string> errors)
    {
        if (value is null)
            errors.Add($"{fieldName} es obligatorio.");
    }

    private static string? Normalize(string? value) =>
        string.IsNullOrWhiteSpace(value) ? null : value.Trim();
}
