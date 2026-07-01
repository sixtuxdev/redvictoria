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
    private readonly ILogger<CiudadanosController> _logger;

    public CiudadanosController(
        ICiudadanoApplication ciudadanoApplication,
        ILogger<CiudadanosController> logger)
    {
        _ciudadanoApplication = ciudadanoApplication;
        _logger = logger;
    }

    [HttpPost("registrar")]
    public async Task<IActionResult> Registrar(
        [FromBody] RegistroCiudadanoRequest request,
        [FromQuery(Name = "ref")] string? codigoReferido,
        CancellationToken cancellationToken)
    {
        _logger.LogInformation(
            "Registro ciudadano API endpoint campos nuevos: ParametroIdTipoDiscapacidad={ParametroIdTipoDiscapacidad}, ParametroIdEstadoCivil={ParametroIdEstadoCivil}, TieneHijos={TieneHijos}, Cuantos={Cuantos}, TieneVehiculo={TieneVehiculo}, ParametroIdTipoVehiculo={ParametroIdTipoVehiculo}, ParametroIdReligion={ParametroIdReligion}, EsEmpleado={EsEmpleado}",
            request.ParametroIdTipoDiscapacidad,
            request.ParametroIdEstadoCivil,
            request.TieneHijos,
            request.Cuantos,
            request.TieneVehiculo,
            request.ParametroIdTipoVehiculo,
            request.ParametroIdReligion,
            request.EsEmpleado);

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
    [HttpGet("referidos/paginado")]
    public async Task<IActionResult> ObtenerRedReferidosPaginados(
        [FromQuery] CiudadanoReferidoPagedRequest request,
        CancellationToken cancellationToken)
    {
        var ciudadanoId = GetCiudadanoId();
        if (!ciudadanoId.HasValue)
        {
            return Unauthorized();
        }

        var response = await _ciudadanoApplication.ObtenerRedReferidosPaginadosAsync(
            ciudadanoId.Value,
            request,
            cancellationToken);

        return response.IsSuccess ? Ok(response) : BadRequest(response);
    }

    [Authorize]
    [HttpGet("referidos/exportar")]
    public async Task<IActionResult> ExportarRedReferidos(CancellationToken cancellationToken)
    {
        var ciudadanoId = GetCiudadanoId();
        if (!ciudadanoId.HasValue)
        {
            return Unauthorized();
        }

        var response = await _ciudadanoApplication.ExportarRedReferidosExcelAsync(
            ciudadanoId.Value,
            cancellationToken);

        if (!response.IsSuccess)
        {
            return BadRequest(response);
        }

        return File(response.Data!, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "RedReferidos.xlsx");
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
