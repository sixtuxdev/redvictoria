using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using Microsoft.Extensions.Configuration;
using RedVictoria.Application.Interfaces;

namespace RedVictoria.Infrastructure.Email;

public sealed class SmtpCorreoService : ICorreoService
{
    private readonly SmtpCorreoSettings _settings;
    private readonly ReferidosSettings _referidosSettings;

    public SmtpCorreoService(IConfiguration configuration)
    {
        var section = configuration.GetSection("SmtpCorreo");
        _settings = new SmtpCorreoSettings
        {
            Host = section["Host"] ?? string.Empty,
            Port = int.TryParse(section["Port"], out var port) ? port : 587,
            EnableSsl = !bool.TryParse(section["EnableSsl"], out var enableSsl) || enableSsl,
            EnableEmailSending = !bool.TryParse(section["EnableEmailSending"], out var enableEmailSending) || enableEmailSending,
            UserName = section["UserName"] ?? string.Empty,
            Password = section["Password"] ?? string.Empty,
            FromEmail = section["FromEmail"] ?? string.Empty,
            FromName = section["FromName"] ?? "Red Victoria"
        };

        var referidosSection = configuration.GetSection("ReferidosSettings");
        _referidosSettings = new ReferidosSettings
        {
            RegistroCiudadanoBaseUrl = referidosSection["RegistroCiudadanoBaseUrl"] ?? string.Empty,
            CrearPasswordBaseUrl = referidosSection["CrearPasswordBaseUrl"] ?? string.Empty
        };
    }

    public async Task EnviarRegistroCiudadanoAsync(
        string destinatario,
        string nombresCompletos,
        string codigoReferido,
        CancellationToken cancellationToken = default)
    {
        if (!ShouldSendEmails())
            return;

        if (string.IsNullOrWhiteSpace(destinatario))
            throw new InvalidOperationException("El destinatario del correo es obligatorio.");

        if (string.IsNullOrWhiteSpace(codigoReferido))
            throw new InvalidOperationException("El código referido es obligatorio para enviar el correo.");

        if (string.IsNullOrWhiteSpace(_settings.Host) || string.IsNullOrWhiteSpace(_settings.FromEmail))
            throw new InvalidOperationException("La configuración SMTP no está completa.");
        var linkRegistro = BuildReferidoUrl(
            _referidosSettings.RegistroCiudadanoBaseUrl,
            codigoReferido,
            nameof(ReferidosSettings.RegistroCiudadanoBaseUrl));
        var linkCrearPassword = BuildReferidoUrl(
            _referidosSettings.CrearPasswordBaseUrl,
            codigoReferido,
            nameof(ReferidosSettings.CrearPasswordBaseUrl));

        using var message = new MailMessage
        {
            From = new MailAddress(_settings.FromEmail, _settings.FromName, Encoding.UTF8),
            Subject = "Tu registro en Pablo Emilio Otero Alcalde fué creado correctamente",
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

    private bool ShouldSendEmails() => _settings.EnableEmailSending;

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
            <body style="margin:0;padding:0;background-color:#eef3ff;font-family:Arial,Helvetica,sans-serif;color:#0f172a;">
                <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="margin:0;padding:0;background:#eef3ff;background-image:linear-gradient(135deg,#ffffff 0%,#eef3ff 45%,#dbe6ff 100%);">
                    <tr>
                        <td align="center" style="padding:28px 14px;">
                            <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="max-width:640px;width:100%;background-color:#ffffff;border:1px solid rgba(255,255,255,0.78);border-radius:22px;overflow:hidden;box-shadow:0 32px 90px rgba(15,23,42,0.18);">
                                <tr>
                                    <td style="padding:34px 32px 30px;text-align:center;color:#ffffff;background:#0443FF;background-image:linear-gradient(155deg,#ffffff 0%,#dce7ff 34%,#0443FF 100%);">
                                        <table role="presentation" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto 18px;">
                                            <tr>
                                                <td align="center" valign="middle" style="width:58px;height:58px;border-radius:50%;background-color:#ffffff;border:1px solid rgba(255,255,255,0.62);box-shadow:0 18px 38px rgba(4,67,255,0.22);color:#0443FF;font-size:26px;line-height:58px;font-weight:800;">
                                                    OK
                                                </td>
                                            </tr>
                                        </table>
                                        <h1 style="margin:0;color:#ffffff;font-size:30px;line-height:36px;font-weight:900;letter-spacing:0;text-shadow:0 8px 24px rgba(0,45,179,0.36);">Registro ciudadano confirmado</h1>
                                        <p style="margin:12px auto 0;max-width:420px;color:rgba(255,255,255,0.96);font-size:15px;line-height:24px;text-shadow:0 6px 18px rgba(0,45,179,0.28);">
                                            Tu registro fue creado correctamente y ya puedes compartir tu enlace de referido.
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:34px 32px 30px;background:#ffffff;background-image:linear-gradient(180deg,#ffffff 0%,#f8faff 100%);">
                                        <p style="margin:0 0 16px;color:#0f172a;font-size:17px;line-height:26px;font-weight:700;">Hola {{nombre}},</p>
                                        <p style="margin:0 0 24px;color:#526174;font-size:16px;line-height:25px;">
                                            Tu registro ciudadano fue creado correctamente. Desde ahora puedes compartir tu enlace de referido con otras personas para que se sumen a tu red.
                                        </p>

                                        <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="margin:0 0 26px;background-color:#ffffff;border:1px solid rgba(82,97,116,0.18);border-radius:8px;box-shadow:0 16px 30px rgba(4,67,255,0.10);">
                                            <tr>
                                                <td style="padding:20px 22px;">
                                                    <p style="margin:0 0 6px;color:#64748b;font-size:13px;line-height:18px;text-transform:uppercase;font-weight:700;">Código referido</p>
                                                    <p style="margin:0;color:#0f172a;font-size:24px;line-height:30px;font-weight:900;letter-spacing:1px;">{{codigo}}</p>
                                                </td>
                                            </tr>
                                        </table>

                                        <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="margin:0 0 26px;background-color:#f8faff;border:1px solid rgba(4,67,255,0.14);border-radius:8px;">
                                            <tr>
                                                <td style="padding:20px 22px;">
                                                    <p style="margin:0 0 8px;color:#0f172a;font-size:14px;line-height:20px;font-weight:800;">Link para compartir el registro ciudadano</p>
                                                    <p style="margin:0;color:#526174;font-size:14px;line-height:22px;word-break:break-word;">
                                                        <a href="{{registroUrl}}" style="color:#0443FF;text-decoration:underline;font-weight:700;">{{registroUrl}}</a>
                                                    </p>
                                                </td>
                                            </tr>
                                        </table>

                                        <p style="margin:0 0 18px;color:#526174;font-size:15px;line-height:24px;">
                                            Si aún no tienes contraseña asignada, puedes crearla usando el siguiente botón:
                                        </p>

                                        <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="margin:0 0 28px;">
                                            <tr>
                                                <td align="center" bgcolor="#0443FF" style="border-radius:8px;background:#0443FF;background-image:linear-gradient(135deg,#0443FF 0%,#002DB3 100%);box-shadow:0 16px 30px rgba(4,67,255,0.30);">
                                                    <a href="{{passwordUrl}}" style="display:inline-block;padding:14px 24px;color:#ffffff;font-size:15px;line-height:20px;font-weight:700;text-decoration:none;border-radius:6px;">Crear mi contraseña</a>
                                                </td>
                                            </tr>
                                        </table>

                                        <p style="margin:0;color:#64748b;font-size:13px;line-height:20px;">
                                            Si el botón no funciona, copia y pega este enlace en tu navegador:<br>
                                            <a href="{{passwordUrl}}" style="color:#0443FF;text-decoration:underline;font-weight:700;word-break:break-word;">{{passwordUrl}}</a>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color:#f8faff;padding:20px 32px 22px;border-top:1px solid rgba(82,97,116,0.14);text-align:center;">
                                        <p style="margin:0;color:#526174;font-size:12px;line-height:18px;">
                                            Este mensaje fue enviado automáticamente. Por favor no respondas a este correo.
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

    private static string BuildReferidoUrl(string baseUrl, string codigoReferido, string settingName)
    {
        if (string.IsNullOrWhiteSpace(baseUrl))
            throw new InvalidOperationException($"ReferidosSettings:{settingName} es obligatorio.");

        return $"{baseUrl.TrimEnd('/')}/{Uri.EscapeDataString(codigoReferido.Trim())}";
    }
}
