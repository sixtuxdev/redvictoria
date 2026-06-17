using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using RedVictoria.Application.DTOs.Ciudadanos;
using RedVictoria.Application.Interfaces;

namespace RedVictoria.Services.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class CiudadanosController : ControllerBase
{
    private readonly ICiudadanoApplication _ciudadanoApplication;

    public CiudadanosController(ICiudadanoApplication ciudadanoApplication)
    {
        _ciudadanoApplication = ciudadanoApplication;
    }

    [HttpPost("registrar")]
    public async Task<IActionResult> Registrar(
        [FromBody] RegistroCiudadanoRequest request,
        [FromQuery(Name = "ref")] string? codigoReferido,
        CancellationToken cancellationToken)
    {
        var response = await _ciudadanoApplication.RegistrarAsync(
            request,
            codigoReferido,
            cancellationToken);

        return response.IsSuccess ? Ok(response) : BadRequest(response);
    }

    [HttpGet("validar-referido/{codigoReferido}")]
    public async Task<IActionResult> ValidarCodigoReferido(
        [FromRoute] string codigoReferido,
        CancellationToken cancellationToken)
    {
        var response = await _ciudadanoApplication.ValidarCodigoReferidoAsync(
            codigoReferido,
            cancellationToken);

        return response.IsSuccess ? Ok(response) : BadRequest(response);
    }

    [Authorize]
    [HttpGet("referidos")]
    public async Task<IActionResult> ObtenerRedReferidos(CancellationToken cancellationToken)
    {
        var ciudadanoId = GetCiudadanoId();
        if (!ciudadanoId.HasValue)
        {
            return Unauthorized();
        }

        var response = await _ciudadanoApplication.ObtenerRedReferidosAsync(
            ciudadanoId.Value,
            cancellationToken);

        return response.IsSuccess ? Ok(response) : BadRequest(response);
    }

    [Authorize]
    [HttpPut("referidos/{ciudadanoReferidoId:int}/desactivar")]
    public async Task<IActionResult> DesactivarReferido(
        [FromRoute] int ciudadanoReferidoId,
        CancellationToken cancellationToken)
    {
        var ciudadanoId = GetCiudadanoId();
        if (!ciudadanoId.HasValue)
        {
            return Unauthorized();
        }

        var response = await _ciudadanoApplication.DesactivarReferidoAsync(
            ciudadanoId.Value,
            ciudadanoReferidoId,
            cancellationToken);

        return response.IsSuccess ? Ok(response) : BadRequest(response);
    }

    private int? GetCiudadanoId()
    {
        var value = User.FindFirstValue("CiudadanoId");
        return int.TryParse(value, out var ciudadanoId)
            ? ciudadanoId
            : null;
    }
}
