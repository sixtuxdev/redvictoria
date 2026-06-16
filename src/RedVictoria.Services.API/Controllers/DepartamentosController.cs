using Microsoft.AspNetCore.Mvc;
using RedVictoria.Application.Interfaces;

namespace RedVictoria.Services.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class DepartamentosController : ControllerBase
{
    private readonly IDepartamentoApplication _departamentoApplication;

    public DepartamentosController(IDepartamentoApplication departamentoApplication)
    {
        _departamentoApplication = departamentoApplication;
    }

    [HttpGet]
    public async Task<IActionResult> ObtenerDepartamentos(CancellationToken cancellationToken)
    {
        var response = await _departamentoApplication.ObtenerDepartamentosAsync(cancellationToken);

        return Ok(response);
    }
}
