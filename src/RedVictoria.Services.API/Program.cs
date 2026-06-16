using RedVictoria.Application.DependencyInjection;
using RedVictoria.Infrastructure.DependencyInjection;
using RedVictoria.Services.API.Extensions;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddCors(options =>
{
    options.AddPolicy("WebUI", policy =>
    {
        policy
            .WithOrigins(
                "http://localhost:5175",
                "https://localhost:7206",
                "http://127.0.0.1:5175")
            .AllowAnyHeader()
            .AllowAnyMethod();
    });
});
builder.Services.AddJwtAuthentication(builder.Configuration);

builder.Services.AddApplication();
builder.Services.AddInfrastructure();

var app = builder.Build();

app.UseGlobalExceptionHandler();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors("WebUI");

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
