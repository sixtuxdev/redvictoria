using System.ComponentModel.DataAnnotations;

namespace RedVictoria.WebUI.Models.Auth;

public sealed class LoginRequestModel
{
    [Required(ErrorMessage = "Ingresa tu usuario, correo o documento.")]
    public string UserIdentifier { get; set; } = string.Empty;

    [Required(ErrorMessage = "Ingresa tu contraseña.")]
    public string Password { get; set; } = string.Empty;
}
