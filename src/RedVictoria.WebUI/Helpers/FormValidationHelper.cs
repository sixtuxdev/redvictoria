namespace RedVictoria.WebUI.Helpers;

public static class FormValidationHelper
{
    public static string? Required(string? value, string message)
    {
        return string.IsNullOrWhiteSpace(value) ? message : null;
    }
}
