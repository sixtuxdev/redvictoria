# Prompt - Ejecutar SPEC-003 Inicio de sesión

En la solución **RedVictoria** necesito que leas completamente la SPEC ubicada en:

`docs/specs/SPEC-003 Inicio de sesión.md`

Después de leerla, ejecuta todo lo requerido respetando estrictamente la arquitectura actual del proyecto, basada en **.NET 9**, **Arquitectura Cebolla / Clean Architecture**, **SQL Server**, **Dapper** y buenas prácticas de desarrollo.

El objetivo es implementar la **HU-003 Inicio de sesión**:

**Como ciudadano con acceso quiero iniciar sesión para ver mi red de campaña.**

Debes implementar un sistema de autenticación seguro utilizando **JWT Bearer**, permitiendo validar credenciales de ciudadanos que tengan acceso habilitado en el sistema.

## Requerimientos principales

Debes realizar los siguientes ajustes:

1. Crear DTO `LoginRequest`.
2. Crear DTO `LoginResponse`.
3. Crear DTO interno `UsuarioLoginDto`.
4. Crear procedimiento almacenado `usp_Usuarios_ObtenerPorEmail`.
5. Crear contrato `IAuthApplication`.
6. Crear contrato `IAuthRepository`.
7. Crear contrato `IJwtTokenGenerator`.
8. Implementar servicio `AuthApplication`.
9. Implementar repositorio `AuthRepository`.
10. Implementar generador JWT `JwtTokenGenerator`.
11. Validar email y contraseña.
12. Validar contraseña usando el `IPasswordHasher` existente.
13. Implementar generación de JWT.
14. Retornar:
    - Token
    - UsuarioId
    - CiudadanoId
    - Nombre
    - Email
    - Rol
    - FechaExpiracion
15. Crear endpoint `POST /api/auth/login`.
16. Configurar autenticación JWT Bearer.
17. Permitir proteger endpoints privados usando `[Authorize]`.
18. Probar login exitoso.
19. Probar login con contraseña incorrecta.
20. Probar login de ciudadano sin acceso.

## Arquitectura obligatoria

Respeta completamente la arquitectura actual:

RedVictoria.Domain

- Entidades
- Interfaces de dominio
- Reglas centrales

RedVictoria.Application

- DTOs
- Interfaces de aplicación
- Servicios de aplicación
- Validaciones

RedVictoria.Infrastructure

- Repositories
- Dapper
- SQL Server
- Seguridad
- JWT

RedVictoria.Services.API

- Controllers
- Middlewares
- Extensions
- Configuración API

No debes romper la separación de responsabilidades.

## Archivos requeridos

Crear o actualizar:

`src/RedVictoria.Application/DTOs/Auth/LoginRequest.cs`

`src/RedVictoria.Application/DTOs/Auth/LoginResponse.cs`

`src/RedVictoria.Application/DTOs/Auth/UsuarioLoginDto.cs`

`src/RedVictoria.Application/Interfaces/IAuthApplication.cs`

`src/RedVictoria.Application/Interfaces/IJwtTokenGenerator.cs`

`src/RedVictoria.Application/Services/AuthApplication.cs`

`src/RedVictoria.Domain/Interfaces/IAuthRepository.cs`

`src/RedVictoria.Infrastructure/Repositories/AuthRepository.cs`

`src/RedVictoria.Infrastructure/Security/JwtTokenGenerator.cs`

`src/RedVictoria.Services.API/Controllers/AuthController.cs`

`src/RedVictoria.Services.API/Extensions/AuthenticationExtensions.cs`

`database/stored-procedures/usp_Usuarios_ObtenerPorEmail.sql`


## DTO LoginRequest

Debe contener:

```csharp
public class LoginRequest
{
    public string Email { get; set; } = string.Empty;

    public string Password { get; set; } = string.Empty;
}
```

## DTO LoginResponse

Debe retornar:

```csharp
public class LoginResponse
{
    public string Token { get; set; } = string.Empty;

    public int UsuarioId { get; set; }

    public int CiudadanoId { get; set; }

    public string Nombre { get; set; } = string.Empty;

    public string Email { get; set; } = string.Empty;

    public string Rol { get; set; } = string.Empty;

    public DateTime FechaExpiracion { get; set; }
}
```

## Reglas funcionales obligatorias

### Login exitoso

Cuando el usuario ingrese:

- Email válido.
- Password correcta.
- Usuario activo.
- Ciudadano activo.
- TieneAcceso = 1.

Debe retornar:

- IsSuccess = true.
- Token JWT.
- Información del usuario.


### Email inexistente

Si el email no existe:

Retornar:

`Credenciales inválidas.`

No indicar que el correo no existe.


### Contraseña incorrecta

Si la contraseña no coincide:

Retornar:

`Credenciales inválidas.`


### Usuario inactivo

Si:

Usuarios.Estado = 0

Retornar:

`Credenciales inválidas.`


### Ciudadano inactivo

Si:

Ciudadanos.Estado = 0

Retornar:

`Credenciales inválidas.`


### Ciudadano sin acceso

Si:

Ciudadanos.TieneAcceso = 0

Retornar:

`El ciudadano no tiene acceso al sistema.`


## JWT

Configurar JWT usando buenas prácticas.

Agregar configuración:

```json
"JwtSettings": {
    "SecretKey": "REDVICTORIA_SECRET_CAMBIAR_PRODUCCION",
    "Issuer": "RedVictoria",
    "Audience": "RedVictoriaUsers",
    "ExpirationMinutes": 120
}
```

El token debe contener claims:

- UsuarioId
- CiudadanoId
- Nombre
- Email
- Rol


## Password

Reutilizar la implementación existente:

`IPasswordHasher`

Si solamente existe:

HashPassword

Agregar:

VerifyPassword

sin romper el registro de ciudadanos.


La contraseña:

- Nunca debe compararse como texto plano.
- Nunca debe almacenarse sin cifrar.


## Procedimiento almacenado requerido

Crear:

`usp_Usuarios_ObtenerPorEmail`

Debe consultar:

Usuarios + Ciudadanos

Debe retornar:

- UsuarioId
- CiudadanoId
- NombresCompletos
- Email
- PasswordHash
- Rol
- UsuarioEstado
- CiudadanoEstado
- TieneAcceso


## Endpoint requerido

Crear:

`AuthController`

Endpoint:

POST

`/api/auth/login`

Debe recibir:

```json
{
    "email":"usuario@email.com",
    "password":"123456"
}
```

Debe retornar usando:

`Response<LoginResponse>`


## Protección de endpoints

Configurar correctamente:

```csharp
app.UseAuthentication();

app.UseAuthorization();
```

El orden debe respetarse.

Debe ser posible usar:

```csharp
[Authorize]
```

en endpoints privados.


No proteger:

- POST /api/auth/login
- POST /api/ciudadanos/registrar
- GET /api/health


## Inyección de dependencias

Registrar en Application:

IAuthApplication -> AuthApplication


Registrar en Infrastructure:

IAuthRepository -> AuthRepository

IJwtTokenGenerator -> JwtTokenGenerator


No registrar servicios directamente en Program.cs si existe:

AddApplication()

AddInfrastructure()


## Reglas técnicas obligatorias

Cumple estrictamente:

- No inyectes errores.
- No inventes arquitectura nueva.
- No crees capas adicionales.
- No cambies namespaces existentes.
- No modifiques funcionalidades existentes.
- No dañes SPEC anteriores.
- No rompas RegistroCiudadano.
- Mantén arquitectura cebolla.
- Mantén SOLID.
- No colocar lógica de negocio en Controllers.
- No acceder a SQL Server desde API.
- Usar Dapper.
- Usar IConnectionFactory existente.
- Mantener Program.cs limpio.
- Usar extensiones cuando corresponda.


## Pruebas obligatorias

Ejecutar pruebas:

1. Login correcto

Resultado esperado:

- Token generado.
- UsuarioId retornado.
- CiudadanoId retornado.
- Rol retornado.


2. Password incorrecta

Resultado:

- IsSuccess=false.
- Mensaje Credenciales inválidas.


3. Email inexistente

Resultado:

- IsSuccess=false.
- Mensaje Credenciales inválidas.


4. Ciudadano sin acceso

Resultado:

- IsSuccess=false.
- Mensaje El ciudadano no tiene acceso al sistema.


5. Endpoint protegido sin token

Resultado:

HTTP 401 Unauthorized


6. Endpoint protegido con token válido

Resultado:

HTTP 200 OK


## Validación final

Ejecutar:

dotnet restore

dotnet build


Debe finalizar:

Build succeeded.


Validar Swagger:

POST /api/auth/login


Confirmar:

- API inicia correctamente.
- Swagger funciona.
- JWT se genera correctamente.
- Token contiene claims.
- Endpoints protegidos funcionan.
- No se rompieron funcionalidades existentes.


No avances con otra SPEC hasta terminar completamente esta implementación.