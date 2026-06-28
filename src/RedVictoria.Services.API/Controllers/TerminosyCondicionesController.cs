using Microsoft.AspNetCore.Mvc;
using RedVictoria.Application.DTOs.TerminosyCondiciones;
using RedVictoria.Application.Interfaces;

namespace RedVictoria.Services.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public sealed class TerminosyCondicionesController(
    ITerminosyCondicionesApplication application) : ControllerBase
{
    [HttpPost("insertar")]
    public async Task<IActionResult> Insertar(
        [FromBody] TerminosyCondicionesRequest request,
        CancellationToken cancellationToken)
    {
        var response = await application.InsertarAsync(request, cancellationToken);
        return response.IsSuccess ? Ok(response) : BadRequest(response);
    }
}
