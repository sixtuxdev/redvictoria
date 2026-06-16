using Microsoft.AspNetCore.Mvc;
using RedVictoria.Application.Interfaces;

namespace RedVictoria.Services.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ParametrosController : ControllerBase
{
    private readonly IParametrosApplication _parametrosApplication;

    public ParametrosController(IParametrosApplication parametrosApplication)
    {
        _parametrosApplication = parametrosApplication;
    }

    [HttpGet("clase/{descripcionClase}")]
    public async Task<IActionResult> ObtenerParametrosPorClaseDescripcion(
        string descripcionClase,
        CancellationToken cancellationToken)
    {
        var response = await _parametrosApplication.ObtenerParametrosPorClaseDescripcion(
            descripcionClase,
            cancellationToken);

        return response.IsSuccess ? Ok(response) : BadRequest(response);
    }
}
