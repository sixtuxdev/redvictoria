using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using Microsoft.Extensions.Configuration;
using RedVictoria.Application.Interfaces;

namespace RedVictoria.Infrastructure.Email;

public sealed class SmtpCorreoService : ICorreoService
{
    private const string RegistroCiudadanoBaseUrl = "https://localhost:7206/registro-ciudadano";
    private const string CrearPasswordBaseUrl = "https://localhost:7206/usr-ciudadanos";
    private readonly SmtpCorreoSettings _settings;

    public SmtpCorreoService(IConfiguration configuration)
    {
        var section = configuration.GetSection("SmtpCorreo");
        _settings = new SmtpCorreoSettings
        {
            Host = section["Host"] ?? string.Empty,
            Port = int.TryParse(section["Port"], out var port) ? port : 587,
            EnableSsl = !bool.TryParse(section["EnableSsl"], out var enableSsl) || enableSsl,
            UserName = section["UserName"] ?? string.Empty,
            Password = section["Password"] ?? string.Empty,
            FromEmail = section["FromEmail"] ?? string.Empty,
            FromName = section["FromName"] ?? "Red Victoria"
        };
    }

    public async Task EnviarRegistroCiudadanoAsync(
        string destinatario,
        string nombresCompletos,
        string codigoReferido,
        CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(destinatario))
            throw new InvalidOperationException("El destinatario del correo es obligatorio.");

        if (string.IsNullOrWhiteSpace(codigoReferido))
            throw new InvalidOperationException("El código referido es obligatorio para enviar el correo.");

        if (string.IsNullOrWhiteSpace(_settings.Host) || string.IsNullOrWhiteSpace(_settings.FromEmail))
            throw new InvalidOperationException("La configuración SMTP no está completa.");

        var linkRegistro = $"{RegistroCiudadanoBaseUrl}/{Uri.EscapeDataString(codigoReferido)}";
        var linkCrearPassword = $"{CrearPasswordBaseUrl}/{Uri.EscapeDataString(codigoReferido)}";

        using var message = new MailMessage
        {
            From = new MailAddress(_settings.FromEmail, _settings.FromName, Encoding.UTF8),
            Subject = "Tu registro en Red Victoria fue creado correctamente",
            SubjectEncoding = Encoding.UTF8,
            BodyEncoding = Encoding.UTF8,
            IsBodyHtml = true
        };
        message.To.Add(new MailAddress(destinatario));
        message.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(
            BuildRegistroCiudadanoTemplate(nombresCompletos, codigoReferido, linkRegistro, linkCrearPassword),
            Encoding.UTF8,
            MediaTypeNames.Text.Html));

        using var client = new SmtpClient(_settings.Host, _settings.Port)
        {
            EnableSsl = _settings.EnableSsl
        };

        if (!string.IsNullOrWhiteSpace(_settings.UserName))
        {
            client.Credentials = new NetworkCredential(_settings.UserName, _settings.Password);
        }

        using var registration = cancellationToken.Register(client.SendAsyncCancel);
        await client.SendMailAsync(message);
    }

    private static string BuildRegistroCiudadanoTemplate(
        string nombresCompletos,
        string codigoReferido,
        string linkRegistro,
        string linkCrearPassword)
    {
        var nombre = WebUtility.HtmlEncode(
            string.IsNullOrWhiteSpace(nombresCompletos) ? "ciudadano" : nombresCompletos.Trim());
        var codigo = WebUtility.HtmlEncode(codigoReferido.Trim());
        var registroUrl = WebUtility.HtmlEncode(linkRegistro);
        var passwordUrl = WebUtility.HtmlEncode(linkCrearPassword);

        return $$"""
            <!doctype html>
            <html lang="es">
            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Registro ciudadano creado</title>
            </head>
            <body style="margin:0;padding:0;background-color:#f4f6f8;font-family:Arial,Helvetica,sans-serif;color:#1f2933;">
                <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background-color:#f4f6f8;margin:0;padding:24px 0;">
                    <tr>
                        <td align="center" style="padding:0 16px;">
                            <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="max-width:640px;background-color:#ffffff;border-radius:10px;overflow:hidden;border:1px solid #e5e7eb;">
                                <tr>
                                    <td style="background-color:#0f4c81;padding:28px 32px;text-align:center;">
                                        <h1 style="margin:0;color:#ffffff;font-size:24px;line-height:32px;font-weight:700;">Red Victoria</h1>
                                        <p style="margin:8px 0 0;color:#dbeafe;font-size:14px;line-height:20px;">Registro ciudadano confirmado</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:32px;">
                                        <p style="margin:0 0 16px;font-size:16px;line-height:24px;">Hola {{nombre}},</p>
                                        <p style="margin:0 0 22px;font-size:16px;line-height:24px;">
                                            Tu registro ciudadano fue creado correctamente. Desde ahora puedes compartir tu enlace de referido con otras personas para que se sumen a tu red.
                                        </p>

                                        <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="margin:0 0 24px;background-color:#f8fafc;border:1px solid #e2e8f0;border-radius:8px;">
                                            <tr>
                                                <td style="padding:18px 20px;">
                                                    <p style="margin:0 0 6px;color:#64748b;font-size:13px;line-height:18px;text-transform:uppercase;font-weight:700;">Código referido</p>
                                                    <p style="margin:0;color:#0f172a;font-size:22px;line-height:28px;font-weight:700;letter-spacing:1px;">{{codigo}}</p>
                                                </td>
                                            </tr>
                                        </table>

                                        <p style="margin:0 0 8px;color:#334155;font-size:14px;line-height:20px;font-weight:700;">Link para compartir el registro ciudadano</p>
                                        <p style="margin:0 0 24px;font-size:14px;line-height:22px;word-break:break-word;">
                                            <a href="{{registroUrl}}" style="color:#0f4c81;text-decoration:underline;">{{registroUrl}}</a>
                                        </p>

                                        <p style="margin:0 0 18px;font-size:15px;line-height:23px;color:#334155;">
                                            Si aún no tienes contraseña asignada, puedes crearla usando el siguiente botón:
                                        </p>

                                        <table role="presentation" cellpadding="0" cellspacing="0" style="margin:0 0 26px;">
                                            <tr>
                                                <td align="center" bgcolor="#16a34a" style="border-radius:6px;">
                                                    <a href="{{passwordUrl}}" style="display:inline-block;padding:14px 24px;color:#ffffff;font-size:15px;line-height:20px;font-weight:700;text-decoration:none;border-radius:6px;">Crear mi contraseña</a>
                                                </td>
                                            </tr>
                                        </table>

                                        <p style="margin:0;color:#64748b;font-size:13px;line-height:20px;">
                                            Si el botón no funciona, copia y pega este enlace en tu navegador:<br>
                                            <a href="{{passwordUrl}}" style="color:#0f4c81;text-decoration:underline;word-break:break-word;">{{passwordUrl}}</a>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color:#f8fafc;padding:20px 32px;border-top:1px solid #e5e7eb;text-align:center;">
                                        <p style="margin:0;color:#64748b;font-size:12px;line-height:18px;">
                                            Este mensaje fue enviado automáticamente por Red Victoria. Por favor no respondas a este correo.
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </body>
            </html>
            """;
    }
}
