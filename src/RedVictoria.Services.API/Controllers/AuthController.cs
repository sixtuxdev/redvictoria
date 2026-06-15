using Microsoft.AspNetCore.Mvc;
using RedVictoria.Application.DTOs.Auth;
using RedVictoria.Application.Interfaces;

namespace RedVictoria.Services.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AuthController : ControllerBase
{
    private readonly IAuthApplication _authApplication;

    public AuthController(IAuthApplication authApplication)
    {
        _authApplication = authApplication;
    }

    [HttpPost("login")]
    public async Task<IActionResult> Login(
        [FromBody] LoginRequest request,
        CancellationToken cancellationToken)
    {
        var response = await _authApplication.LoginAsync(request, cancellationToken);

        return response.IsSuccess ? Ok(response) : BadRequest(response);
    }
}
