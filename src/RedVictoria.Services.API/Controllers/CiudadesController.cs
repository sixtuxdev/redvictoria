using Microsoft.AspNetCore.Mvc;
using RedVictoria.Application.Interfaces;

namespace RedVictoria.Services.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class CiudadesController : ControllerBase
{
    private readonly ICiudadApplication _ciudadApplication;

    public CiudadesController(ICiudadApplication ciudadApplication)
    {
        _ciudadApplication = ciudadApplication;
    }

    [HttpGet("departamento/{departamentoId:int}")]
    public async Task<IActionResult> ObtenerCiudadesPorDepartamentoId(
        int departamentoId,
        CancellationToken cancellationToken)
    {
        var response = await _ciudadApplication.ObtenerCiudadesPorDepartamentoIdAsync(
            departamentoId,
            cancellationToken);

        return response.IsSuccess ? Ok(response) : BadRequest(response);
    }
}
