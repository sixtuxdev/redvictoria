using System.ComponentModel.DataAnnotations;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Auth;

namespace RedVictoria.WebUI.ViewModels.Auth;

public sealed class LoginViewModel(IAuthService authService)
{
    public LoginRequestModel Request { get; } = new();

    public bool IsBusy { get; private set; }

    public string? ErrorMessage { get; private set; }

    public string? SuccessMessage { get; private set; }

    public IReadOnlyCollection<string> Validate()
    {
        var results = new List<ValidationResult>();
        var context = new ValidationContext(Request);

        Validator.TryValidateObject(Request, context, results, validateAllProperties: true);

        return results
            .Select(result => result.ErrorMessage)
            .Where(message => !string.IsNullOrWhiteSpace(message))
            .Select(message => message!)
            .ToArray();
    }

    public async Task<bool> LoginAsync(CancellationToken cancellationToken = default)
    {
        ErrorMessage = null;
        SuccessMessage = null;

        var validationMessages = Validate();
        if (validationMessages.Count > 0)
        {
            ErrorMessage = validationMessages.First();
            return false;
        }

        IsBusy = true;

        try
        {
            var result = await authService.LoginAsync(Request, cancellationToken);

            if (!result.IsSuccess)
            {
                ErrorMessage = result.Message;
                return false;
            }

            SuccessMessage = result.Message ?? "Inicio de sesion exitoso.";
            return true;
        }
        catch (OperationCanceledException)
        {
            throw;
        }
        catch
        {
            ErrorMessage = "El servicio de autenticacion no esta disponible en este momento.";
            return false;
        }
        finally
        {
            IsBusy = false;
        }
    }
}
