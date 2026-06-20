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
builder.Services.AddScoped<IAuthSessionService, AuthSessionService>();
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<ICiudadanoService, CiudadanoService>();
builder.Services.AddScoped<IReferidosUrlBuilder, ReferidosUrlBuilder>();
builder.Services.AddScoped<IParametroService, ParametroService>();
builder.Services.AddScoped<IDepartamentoService, DepartamentoService>();
builder.Services.AddScoped<ICiudadService, CiudadService>();
builder.Services.AddScoped<LoginViewModel>();
builder.Services.AddScoped<RegistroCiudadanoViewModel>();
builder.Services.AddScoped<DashboardViewModel>();

await builder.Build().RunAsync();
