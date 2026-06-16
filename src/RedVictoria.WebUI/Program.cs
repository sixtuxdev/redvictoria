using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using MudBlazor.Services;
using RedVictoria.WebUI;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Services;
using RedVictoria.WebUI.ViewModels.Auth;
using RedVictoria.WebUI.ViewModels.Ciudadanos;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });
builder.Services.AddMudServices();
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<ICiudadanoService, CiudadanoService>();
builder.Services.AddScoped<IParametroService, ParametroService>();
builder.Services.AddScoped<LoginViewModel>();
builder.Services.AddScoped<RegistroCiudadanoViewModel>();

await builder.Build().RunAsync();
