using System.Reflection;
using System.Security.Cryptography;

namespace RedVictoria.Application.Interfaces;

public static class PasswordHasherVerification
{
    public static bool Verify(
        IPasswordHasher passwordHasher,
        string password,
        string passwordHash)
    {
        ArgumentNullException.ThrowIfNull(passwordHasher);

        var implementationVerify = passwordHasher
            .GetType()
            .GetMethod(
                nameof(Verify),
                BindingFlags.Instance | BindingFlags.Public,
                binder: null,
                types: [typeof(string), typeof(string)],
                modifiers: null);

        if (implementationVerify is not null
            && implementationVerify.DeclaringType != typeof(PasswordHasherVerification))
        {
            return (bool)implementationVerify.Invoke(
                passwordHasher,
                [password, passwordHash])!;
        }

        return VerifyPbkdf2Sha256(password, passwordHash);
    }

    private static bool VerifyPbkdf2Sha256(string password, string passwordHash)
    {
        if (string.IsNullOrWhiteSpace(password) || string.IsNullOrWhiteSpace(passwordHash))
            return false;

        var parts = passwordHash.Split('$');
        if (parts.Length != 4
            || !string.Equals(parts[0], "PBKDF2-SHA256", StringComparison.Ordinal)
            || !int.TryParse(parts[1], out var iterations))
        {
            return false;
        }

        try
        {
            var salt = Convert.FromBase64String(parts[2]);
            var expectedHash = Convert.FromBase64String(parts[3]);
            var actualHash = Rfc2898DeriveBytes.Pbkdf2(
                password,
                salt,
                iterations,
                HashAlgorithmName.SHA256,
                expectedHash.Length);

            return CryptographicOperations.FixedTimeEquals(actualHash, expectedHash);
        }
        catch (FormatException)
        {
            return false;
        }
    }
}
