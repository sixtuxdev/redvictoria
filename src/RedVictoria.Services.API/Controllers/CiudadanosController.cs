using Microsoft.AspNetCore.Mvc;
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
}
