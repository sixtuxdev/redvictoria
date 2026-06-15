using Microsoft.AspNetCore.Mvc;

namespace RedVictoria.Services.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class HealthController : ControllerBase
{
    [HttpGet]
    public IActionResult Get()
    {
        return Ok(new
        {
            IsSuccess = true,
            Message = "RedVictoria API funcionando correctamente."
        });
    }
}
