using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Ciudades;
using RedVictoria.WebUI.Models.Ciudadanos;
using RedVictoria.WebUI.Models.Departamentos;
using RedVictoria.WebUI.Models.Parametros;

namespace RedVictoria.WebUI.ViewModels.Ciudadanos;

public sealed partial class RegistroCiudadanoViewModel(
    ICiudadanoService ciudadanoService,
    IParametroService parametroService,
    IDepartamentoService departamentoService,
    ICiudadService ciudadService)
{
    private const int PasswordMinimumLength = 6;
    private bool _isInitialized;
    private string? _initializedCodigoReferido;

    public RegistroCiudadanoRequestModel Request { get; } = new();

    public RegistroCiudadanoParametrosModel Parametros { get; private set; } = new();

    public IReadOnlyCollection<DepartamentoModel> Departamentos { get; private set; } = [];

    public IReadOnlyCollection<CiudadModel> Ciudades { get; private set; } = [];

    public bool IsLoading { get; private set; }

    public bool IsLoadingCiudades { get; private set; }

    public bool IsSubmitting { get; private set; }

    public string? CodigoReferido { get; private set; }

    public string? ErrorMessage { get; private set; }

    public string? SuccessMessage { get; private set; }

    public string? CodigoReferidoRegistrado { get; private set; }

    public bool IsCodigoReferidoValido { get; private set; }

    public bool BloquearRegistroPorReferido => !IsCodigoReferidoValido;

    public bool HasParametroOptions =>
        Parametros.DondeVive.Count > 0
        || Parametros.TiposIdentificacion.Count > 0
        || Parametros.GruposEdad.Count > 0
        || Parametros.Generos.Count > 0
        || Parametros.Soy.Count > 0
        || Parametros.Veredas.Count > 0;

    public bool AreRequiredParametrosLoaded =>
        Parametros.TiposIdentificacion.Count > 0
        && Parametros.GruposEdad.Count > 0
        && Parametros.Generos.Count > 0
        && Parametros.Soy.Count > 0
        && Parametros.DondeVive.Count > 0
        && Parametros.Veredas.Count > 0;

    public bool CanSubmit =>
        AreRequiredParametrosLoaded
        && IsCodigoReferidoValido
        && !IsSubmitting;

    public bool PuedeSeleccionarCiudad =>
        Request.DepartamentoId.HasValue
        && Request.DepartamentoId.Value > 0
        && !IsLoadingCiudades
        && Ciudades.Count > 0;

    public async Task InitializeAsync(string? codigoReferido, CancellationToken cancellationToken = default)
    {
        CodigoReferido = Normalize(codigoReferido);
        Request.CodigoReferido = CodigoReferido;
        Request.Estado = true;

        if (_isInitialized
            && string.Equals(_initializedCodigoReferido, CodigoReferido, StringComparison.Ordinal))
        {
            return;
        }

        IsLoading = true;
        ErrorMessage = null;
        IsCodigoReferidoValido = false;
        Departamentos = [];
        Ciudades = [];

        try
        {
            var referidoTask = ciudadanoService.ValidarCodigoReferidoAsync(CodigoReferido, cancellationToken);
            var parametrosTask = parametroService.ObtenerParametrosRegistroCiudadanoAsync(cancellationToken);
            var departamentosTask = departamentoService.ObtenerDepartamentosAsync(cancellationToken);

            await Task.WhenAll(referidoTask, parametrosTask, departamentosTask);

            var referidoResult = referidoTask.Result;
            IsCodigoReferidoValido = referidoResult.IsSuccess;
            if (!IsCodigoReferidoValido)
            {
                ErrorMessage = "No puede continuar porque el referido ingresado no existe.";
            }

            Parametros = parametrosTask.Result;
            Departamentos = departamentosTask.Result;

            if (!AreRequiredParametrosLoaded)
            {
                ErrorMessage = "No fue posible cargar todas las listas requeridas del formulario.";
            }

            if (Departamentos.Count == 0)
            {
                ErrorMessage = AppendError(
                    ErrorMessage,
                    "No fue posible cargar la lista de departamentos.");
            }

            _isInitialized = true;
            _initializedCodigoReferido = CodigoReferido;
        }
        catch
        {
            ErrorMessage = "No fue posible cargar la informacion inicial del formulario.";
        }
        finally
        {
            IsLoading = false;
        }
    }

    public async Task OnDepartamentoChangedAsync(int? departamentoId)
    {
        Request.DepartamentoId = departamentoId;
        Request.MunicipioId = null;
        Ciudades = [];

        if (!departamentoId.HasValue || departamentoId.Value <= 0)
        {
            return;
        }

        await CargarCiudadesPorDepartamentoAsync(departamentoId.Value);
    }

    public async Task CargarCiudadesPorDepartamentoAsync(
        int departamentoId,
        CancellationToken cancellationToken = default)
    {
        IsLoadingCiudades = true;
        ErrorMessage = null;

        try
        {
            Ciudades = await ciudadService.ObtenerCiudadesPorDepartamentoIdAsync(
                departamentoId,
                cancellationToken);

            if (Ciudades.Count == 0)
            {
                ErrorMessage = "No se encontraron ciudades para el departamento seleccionado.";
            }
        }
        catch
        {
            Ciudades = [];
            ErrorMessage = "No fue posible cargar las ciudades del departamento seleccionado.";
        }
        finally
        {
            IsLoadingCiudades = false;
        }
    }

    public async Task<bool> RegistrarAsync(CancellationToken cancellationToken = default)
    {
        ErrorMessage = null;
        SuccessMessage = null;
        CodigoReferidoRegistrado = null;

        if (!AreRequiredParametrosLoaded)
        {
            ErrorMessage = "No puedes registrar el ciudadano hasta que carguen las listas requeridas.";
            return false;
        }

        if (!IsCodigoReferidoValido)
        {
            ErrorMessage = "No puede continuar porque el referido ingresado no existe.";
            return false;
        }

        var errors = Validate();
        if (errors.Count > 0)
        {
            ErrorMessage = errors.First();
            return false;
        }

        if (IsSubmitting)
        {
            return false;
        }

        IsSubmitting = true;

        try
        {
            Request.CodigoReferido = CodigoReferido;
            Request.Estado = true;

            var result = await ciudadanoService.RegistrarAsync(Request, CodigoReferido, cancellationToken);
            if (!result.IsSuccess)
            {
                ErrorMessage = result.Message;
                return false;
            }

            SuccessMessage = result.Message ?? "Ciudadano registrado correctamente.";
            CodigoReferidoRegistrado = Normalize(result.CodigoReferido);
            return true;
        }
        catch (OperationCanceledException)
        {
            throw;
        }
        catch
        {
            ErrorMessage = "El servicio de registro ciudadano no esta disponible en este momento.";
            return false;
        }
        finally
        {
            IsSubmitting = false;
        }
    }

    public IReadOnlyCollection<string> Validate()
    {
        var results = new List<ValidationResult>();
        var context = new ValidationContext(Request);
        Validator.TryValidateObject(Request, context, results, validateAllProperties: true);

        var errors = results
            .Select(result => result.ErrorMessage)
            .Where(message => !string.IsNullOrWhiteSpace(message))
            .Select(message => message!)
            .ToList();

        if (Request.FechaNacimiento?.Date > DateTime.Today)
        {
            errors.Add("Fecha de nacimiento no puede ser una fecha futura.");
        }

        ValidateRequiredSelect(Request.DepartamentoId, "Departamento de nacimiento", errors);
        ValidateRequiredSelect(Request.MunicipioId, "Ciudad de nacimiento", errors);
        ValidateRequiredSelect(Request.ParametroIdTipoIdentificacion, "Tipo de identificacion", errors);
        ValidateRequiredSelect(Request.ParametroIdGenero, "Genero", errors);
        ValidateRequiredSelect(Request.ParametroIdSoy, "Soy", errors);
        ValidateRequiredSelect(Request.ParametroIdDondeVive, "Donde vive", errors);
        ValidateRequiredSelect(Request.ParametroIdVereda, "Vereda", errors);

        if (!Request.TieneWhatsapp.HasValue)
        {
            errors.Add("Tiene WhatsApp es obligatorio.");
        }

        if (!string.IsNullOrWhiteSpace(Request.Celular)
            && !PhoneRegex().IsMatch(Request.Celular.Trim()))
        {
            errors.Add("Celular solo debe contener numeros y puede iniciar con +.");
        }

        if (!string.IsNullOrWhiteSpace(Request.NumeroIdentificacion)
            && !DocumentRegex().IsMatch(Request.NumeroIdentificacion.Trim()))
        {
            errors.Add("Numero de identificacion solo debe contener letras, numeros, puntos o guiones.");
        }

        ValidatePassword(errors);

        return errors;
    }

    public IEnumerable<string> ValidateNombresCompletos(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            yield return "Nombres completos es obligatorio.";
        }
        else if (value.Trim().Length > 200)
        {
            yield return "Nombres completos no puede superar 200 caracteres.";
        }
    }

    public IEnumerable<string> ValidateEmail(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            yield return "Email es obligatorio.";
            yield break;
        }

        if (value.Trim().Length > 150)
        {
            yield return "Email no puede superar 150 caracteres.";
        }

        if (!new EmailAddressAttribute().IsValid(value.Trim()))
        {
            yield return "Email no tiene un formato valido.";
        }
    }

    public IEnumerable<string> ValidateCelular(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            yield return "Celular es obligatorio.";
            yield break;
        }

        if (value.Trim().Length > 30)
        {
            yield return "Celular no puede superar 30 caracteres.";
        }

        if (!PhoneRegex().IsMatch(value.Trim()))
        {
            yield return "Celular solo debe contener numeros y puede iniciar con +.";
        }
    }

    public IEnumerable<string> ValidateNumeroIdentificacion(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            yield return "Numero de identificacion es obligatorio.";
            yield break;
        }

        if (value.Trim().Length > 50)
        {
            yield return "Numero de identificacion no puede superar 50 caracteres.";
        }

        if (!DocumentRegex().IsMatch(value.Trim()))
        {
            yield return "Numero de identificacion solo debe contener letras, numeros, puntos o guiones.";
        }
    }

    public IEnumerable<string> ValidateFechaNacimiento(DateTime? value)
    {
        if (value?.Date > DateTime.Today)
        {
            yield return "Fecha de nacimiento no puede ser una fecha futura.";
        }
        else if (!value.HasValue)
        {
            yield return "Fecha de nacimiento es obligatoria.";
        }
    }

    public IEnumerable<string> ValidatePasswordField(string? value)
    {
        if (Request.TieneAcceso && string.IsNullOrWhiteSpace(value))
        {
            yield return "Contrasena es obligatoria cuando el ciudadano tendra acceso.";
        }

        if (!string.IsNullOrWhiteSpace(value) && value.Length < PasswordMinimumLength)
        {
            yield return $"Contrasena debe tener minimo {PasswordMinimumLength} caracteres.";
        }
    }

    public IEnumerable<string> ValidateConfirmPasswordField(string? value)
    {
        if (!Request.TieneAcceso && string.IsNullOrWhiteSpace(Request.Password))
        {
            yield break;
        }

        if (string.IsNullOrWhiteSpace(value))
        {
            yield return "Confirmacion de contrasena es obligatoria.";
        }
        else if (!string.Equals(Request.Password, value, StringComparison.Ordinal))
        {
            yield return "Contrasena y confirmacion deben coincidir.";
        }
    }

    public void ToggleTieneAcceso(bool value)
    {
        Request.TieneAcceso = value;

        if (!value)
        {
            Request.Password = null;
            Request.ConfirmPassword = null;
        }
    }

    public void LimpiarFormulario()
    {
        Request.NombresCompletos = string.Empty;
        Request.FechaNacimiento = null;
        Request.LugarNacimiento = null;
        Request.Email = null;
        Request.Celular = null;
        Request.TieneWhatsapp = null;
        Request.ParametroIdDondeVive = null;
        Request.ParametroIdVereda = null;
        Request.PuestoVotacion = null;
        Request.ParametroIdTipoIdentificacion = null;
        Request.NumeroIdentificacion = null;
        Request.Direccion = null;
        Request.DepartamentoId = null;
        Request.MunicipioId = null;
        Request.ParametroIdGrupoEdad = null;
        Request.ParametroIdGenero = null;
        Request.ParametroIdSoy = null;
        Request.CodigoReferido = CodigoReferido;
        Request.CiudadanoReferidorId = null;
        Request.TieneAcceso = false;
        Request.Estado = true;
        Request.Password = null;
        Request.ConfirmPassword = null;

        Ciudades = [];
        ErrorMessage = null;
        SuccessMessage = null;
        CodigoReferidoRegistrado = null;
    }

    private void ValidatePassword(ICollection<string> errors)
    {
        if (Request.TieneAcceso && string.IsNullOrWhiteSpace(Request.Password))
        {
            errors.Add("Contrasena es obligatoria cuando el ciudadano tendra acceso.");
        }

        if (!string.IsNullOrWhiteSpace(Request.Password))
        {
            if (string.IsNullOrWhiteSpace(Request.Email))
            {
                errors.Add("Email es obligatorio cuando se ingresa una contrasena.");
            }

            if (Request.Password.Length < PasswordMinimumLength)
            {
                errors.Add($"Contrasena debe tener minimo {PasswordMinimumLength} caracteres.");
            }

            if (string.IsNullOrWhiteSpace(Request.ConfirmPassword))
            {
                errors.Add("Confirmacion de contrasena es obligatoria.");
            }
            else if (!string.Equals(Request.Password, Request.ConfirmPassword, StringComparison.Ordinal))
            {
                errors.Add("Contrasena y confirmacion deben coincidir.");
            }
        }
        else if (!string.IsNullOrWhiteSpace(Request.ConfirmPassword))
        {
            errors.Add("Contrasena es obligatoria cuando se ingresa confirmacion.");
        }
    }

    private static string? Normalize(string? value)
    {
        return string.IsNullOrWhiteSpace(value) ? null : value.Trim();
    }

    private static string AppendError(string? currentError, string newError)
    {
        return string.IsNullOrWhiteSpace(currentError)
            ? newError
            : $"{currentError} {newError}";
    }

    private static void ValidateRequiredSelect(
        int? value,
        string fieldName,
        ICollection<string> errors)
    {
        if (!value.HasValue || value.Value <= 0)
        {
            errors.Add($"{fieldName} es obligatorio.");
        }
    }

    [GeneratedRegex(@"^\+?[0-9\s-]{7,30}$")]
    private static partial Regex PhoneRegex();

    [GeneratedRegex(@"^[A-Za-z0-9.-]{3,50}$")]
    private static partial Regex DocumentRegex();
}
