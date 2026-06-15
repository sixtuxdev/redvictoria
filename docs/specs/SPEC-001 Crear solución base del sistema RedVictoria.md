# SPEC-001: Crear solución base del sistema RedVictoria

## 1. Historia de Usuario

**HU-001: Crear solución base del sistema**

Como desarrollador,
quiero crear la estructura inicial del proyecto,
para iniciar el desarrollo de forma organizada, escalable y mantenible.

---

## 2. Objetivo funcional

Crear la solución backend **RedVictoria** usando **.NET 9**, aplicando **Arquitectura Cebolla / Clean Architecture**, separando responsabilidades por capas y dejando preparada la base técnica para futuros módulos como autenticación, ciudadanos, referidos, catálogos, ubicación territorial y dashboard.

---

## 3. Alcance

Esta SPEC contempla:

* Creación de solución backend.
* Creación de proyectos por capas.
* Configuración base de SQL Server.
* Configuración de Dapper como ORM ligero.
* Configuración de Swagger.
* Configuración de inyección de dependencias.
* Estructura base de carpetas.
* Configuración inicial de `appsettings.json`.
* Preparación para futuras APIs.

No incluye todavía lógica de negocio de ciudadanos, login, referidos ni dashboard.

---

## 4. Arquitectura seleccionada

Se usará **Arquitectura Cebolla**, donde el dominio queda en el centro y no depende de capas externas.

Estructura lógica:

```text
RedVictoria.Domain
        ↑
RedVictoria.Application
        ↑
RedVictoria.Infrastructure
        ↑
RedVictoria.Services.API
```

Regla principal:

```text
Domain no depende de nadie.
Application depende de Domain.
Infrastructure depende de Application y Domain.
API depende de Application e Infrastructure.
```

---

## 5. Proyectos requeridos

La solución deberá contener los siguientes proyectos:

```text
RedVictoria.sln

src/
 ├── RedVictoria.Domain
 ├── RedVictoria.Application
 ├── RedVictoria.Infrastructure
 └── RedVictoria.Services.API
```

---

## 6. Responsabilidad de cada proyecto

### RedVictoria.Domain

Contiene la lógica central del negocio.

Debe incluir:

```text
Entities/
Interfaces/
Enums/
Exceptions/
ValueObjects/
```

Ejemplo:

```text
RedVictoria.Domain
 ├── Entities
 ├── Interfaces
 ├── Enums
 ├── Exceptions
 └── ValueObjects
```

---

### RedVictoria.Application

Contiene casos de uso, DTOs, servicios de aplicación y contratos.

Debe incluir:

```text
DTOs/
Interfaces/
Services/
Validators/
Mappings/
Common/
```

Ejemplo:

```text
RedVictoria.Application
 ├── DTOs
 ├── Interfaces
 ├── Services
 ├── Validators
 ├── Mappings
 └── Common
```

---

### RedVictoria.Infrastructure

Contiene acceso a datos, repositorios, conexión SQL Server y servicios externos.

Debe incluir:

```text
Persistence/
Repositories/
DependencyInjection/
```

Ejemplo:

```text
RedVictoria.Infrastructure
 ├── Persistence
 ├── Repositories
 └── DependencyInjection
```

---

### RedVictoria.Services.API

Contiene los controladores, configuración de API, Swagger y middleware.

Debe incluir:

```text
Controllers/
Middlewares/
Extensions/
```

Ejemplo:

```text
RedVictoria.Services.API
 ├── Controllers
 ├── Middlewares
 ├── Extensions
 ├── appsettings.json
 └── Program.cs
```

---

## 7. Tecnología base

```text
Framework: .NET 9
Base de datos: SQL Server
Acceso a datos: Dapper
API: ASP.NET Core Web API
Documentación API: Swagger / OpenAPI
Arquitectura: Cebolla / Clean Architecture
```

Se selecciona **Dapper** porque el sistema trabajará con SQL Server y procedimientos almacenados, permitiendo mayor control sobre consultas, rendimiento y estructura de datos.

---

## 8. Paquetes NuGet requeridos

### RedVictoria.Infrastructure

```bash
dotnet add package Dapper
dotnet add package Microsoft.Data.SqlClient
dotnet add package Microsoft.Extensions.Configuration.Abstractions
dotnet add package Microsoft.Extensions.DependencyInjection.Abstractions
```

### RedVictoria.Services.API

```bash
dotnet add package Swashbuckle.AspNetCore
```

---

## 9. Comandos para crear la solución

```bash
mkdir RedVictoria
cd RedVictoria

dotnet new sln -n RedVictoria

mkdir src
cd src

dotnet new classlib -n RedVictoria.Domain -f net9.0
dotnet new classlib -n RedVictoria.Application -f net9.0
dotnet new classlib -n RedVictoria.Infrastructure -f net9.0
dotnet new webapi -n RedVictoria.Services.API -f net9.0

cd ..

dotnet sln add src/RedVictoria.Domain/RedVictoria.Domain.csproj
dotnet sln add src/RedVictoria.Application/RedVictoria.Application.csproj
dotnet sln add src/RedVictoria.Infrastructure/RedVictoria.Infrastructure.csproj
dotnet sln add src/RedVictoria.Services.API/RedVictoria.Services.API.csproj
```

---

## 10. Referencias entre proyectos

```bash
dotnet add src/RedVictoria.Application/RedVictoria.Application.csproj reference src/RedVictoria.Domain/RedVictoria.Domain.csproj

dotnet add src/RedVictoria.Infrastructure/RedVictoria.Infrastructure.csproj reference src/RedVictoria.Domain/RedVictoria.Domain.csproj
dotnet add src/RedVictoria.Infrastructure/RedVictoria.Infrastructure.csproj reference src/RedVictoria.Application/RedVictoria.Application.csproj

dotnet add src/RedVictoria.Services.API/RedVictoria.Services.API.csproj reference src/RedVictoria.Application/RedVictoria.Application.csproj
dotnet add src/RedVictoria.Services.API/RedVictoria.Services.API.csproj reference src/RedVictoria.Infrastructure/RedVictoria.Infrastructure.csproj
```

---

## 11. Configuración de conexión SQL Server

En `RedVictoria.Services.API/appsettings.json`:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=.;Database=RedVictoriaDB;Trusted_Connection=True;TrustServerCertificate=True;"
  },
  "AllowedHosts": "*"
}
```

---

## 12. Contrato de conexión

Crear interfaz en:

```text
RedVictoria.Application/Interfaces/IConnectionFactory.cs
```

```csharp
using System.Data;

namespace RedVictoria.Application.Interfaces;

public interface IConnectionFactory
{
    IDbConnection CreateConnection();
}
```

---

## 13. Implementación de conexión

Crear clase en:

```text
RedVictoria.Infrastructure/Persistence/SqlConnectionFactory.cs
```

```csharp
using System.Data;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using RedVictoria.Application.Interfaces;

namespace RedVictoria.Infrastructure.Persistence;

public class SqlConnectionFactory : IConnectionFactory
{
    private readonly IConfiguration _configuration;

    public SqlConnectionFactory(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    public IDbConnection CreateConnection()
    {
        var connectionString = _configuration.GetConnectionString("DefaultConnection");

        if (string.IsNullOrWhiteSpace(connectionString))
            throw new InvalidOperationException("La cadena de conexión 'DefaultConnection' no está configurada.");

        return new SqlConnection(connectionString);
    }
}
```

---

## 14. Inyección de dependencias Infrastructure

Crear clase en:

```text
RedVictoria.Infrastructure/DependencyInjection/DependencyInjection.cs
```

```csharp
using Microsoft.Extensions.DependencyInjection;
using RedVictoria.Application.Interfaces;
using RedVictoria.Infrastructure.Persistence;

namespace RedVictoria.Infrastructure.DependencyInjection;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services)
    {
        services.AddScoped<IConnectionFactory, SqlConnectionFactory>();

        return services;
    }
}
```

---

## 15. Inyección de dependencias Application

Crear clase en:

```text
RedVictoria.Application/DependencyInjection/DependencyInjection.cs
```

```csharp
using Microsoft.Extensions.DependencyInjection;

namespace RedVictoria.Application.DependencyInjection;

public static class DependencyInjection
{
    public static IServiceCollection AddApplication(this IServiceCollection services)
    {
        return services;
    }
}
```

---

## 16. Configuración de Program.cs

En `RedVictoria.Services.API/Program.cs`:

```csharp
using RedVictoria.Application.DependencyInjection;
using RedVictoria.Infrastructure.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddApplication();
builder.Services.AddInfrastructure();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
```

---

## 17. Endpoint de prueba

Crear controlador:

```text
RedVictoria.Services.API/Controllers/HealthController.cs
```

```csharp
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
```

---

## 18. Criterios de aceptación

### CA-001: Solución creada correctamente

Dado que el desarrollador ejecuta los comandos de creación,
cuando abra la solución `RedVictoria.sln`,
entonces debe visualizar los proyectos:

```text
RedVictoria.Domain
RedVictoria.Application
RedVictoria.Infrastructure
RedVictoria.Services.API
```

---

### CA-002: Referencias correctamente configuradas

Dado que la solución usa arquitectura cebolla,
cuando se revisen las dependencias,
entonces `Domain` no debe depender de ningún otro proyecto.

---

### CA-003: API ejecuta correctamente

Dado que el desarrollador ejecuta la API,
cuando ingrese a Swagger,
entonces debe visualizar la documentación de endpoints.

---

### CA-004: Endpoint Health funciona

Dado que la API está en ejecución,
cuando se consuma:

```text
GET /api/health
```

entonces debe retornar:

```json
{
  "isSuccess": true,
  "message": "RedVictoria API funcionando correctamente."
}
```

---

### CA-005: Conexión SQL Server configurada

Dado que existe la cadena `DefaultConnection`,
cuando se inyecte `IConnectionFactory`,
entonces debe poder crear una instancia de conexión SQL Server.

---

## 19. Definition of Done

La SPEC-001 se considera finalizada cuando:

```text
1. La solución RedVictoria.sln existe.
2. Los cuatro proyectos están creados.
3. Las referencias entre capas respetan arquitectura cebolla.
4. Swagger está configurado.
5. Dapper está instalado en Infrastructure.
6. SQL Server está configurado en appsettings.json.
7. La inyección de dependencias está centralizada.
8. El endpoint Health responde correctamente.
9. La API compila sin errores.
10. La solución puede ejecutarse desde Visual Studio o CLI.
```

---

## 20. Casos de prueba

### CP-001: Compilar solución

```bash
dotnet build
```

Resultado esperado:

```text
Build succeeded.
```

---

### CP-002: Ejecutar API

```bash
dotnet run --project src/RedVictoria.Services.API
```

Resultado esperado:

```text
Now listening on...
```

---

### CP-003: Validar Swagger

Abrir:

```text
https://localhost:{puerto}/swagger
```

Resultado esperado:

```text
Swagger carga correctamente.
```

---

### CP-004: Validar Health

Consumir:

```text
GET /api/health
```

Resultado esperado:

```json
{
  "isSuccess": true,
  "message": "RedVictoria API funcionando correctamente."
}
```

---

## 21. Notas técnicas

* No se debe colocar lógica de negocio en los controladores.
* No se debe acceder directamente a SQL Server desde la API.
* Los repositorios deben vivir en Infrastructure.
* Las interfaces deben vivir en Application o Domain según responsabilidad.
* Las entidades centrales deben vivir en Domain.
* Los DTOs deben vivir en Application.
* El proyecto Domain debe permanecer limpio y sin dependencias externas.
* La solución debe quedar preparada para futuras SPECs de ciudadanos, autenticación, referidos y dashboard.
