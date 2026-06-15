using Microsoft.AspNetCore.Mvc;
using RedVictoria.Application.DTOs.Usuarios;
using RedVictoria.Application.Interfaces;

namespace RedVictoria.Services.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class UsuariosController : ControllerBase
{
    private readonly IUsuarioApplication _usuarioApplication;

    public UsuariosController(IUsuarioApplication usuarioApplication)
    {
        _usuarioApplication = usuarioApplication;
    }

    [HttpPost("registrar")]
    public async Task<IActionResult> Registrar(
        [FromBody] RegistroUsuarioRequest request,
        CancellationToken cancellationToken)
    {
        var response = await _usuarioApplication.RegistrarAsync(request, cancellationToken);

        return Ok(response);
    }
}
