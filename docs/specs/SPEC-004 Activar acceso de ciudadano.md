# SPEC-004: Activar acceso de ciudadano

## 1. Información general

**Proyecto:** RedVictoria  
**Épica:** Épica 2 - Seguridad y acceso  
**Historia de Usuario:** HU-004 - Activar acceso de ciudadano  
**Tecnología:** .NET 9  
**Arquitectura:** Arquitectura Cebolla / Clean Architecture  
**Base de datos:** SQL Server  
**ORM/Micro ORM:** Dapper  
**Seguridad:** Password Hash  
**Estado:** Pendiente desarrollo  

---

# 2. Historia de Usuario

## HU-004: Activar acceso de ciudadano

**Como** ciudadano registrado sin contraseña  
**quiero** crear mi contraseña después  
**para** poder iniciar sesión en la plataforma RedVictoria.

---

# 3. Objetivo

Permitir que un ciudadano que fue registrado previamente sin credenciales de acceso pueda activar su cuenta creando una contraseña.

Actualmente un ciudadano puede existir en la tabla `Ciudadanos` sin tener acceso al sistema:

```sql
TieneAcceso = 0
```

Al activar la cuenta se debe:

1. Crear un usuario asociado.
2. Generar contraseña encriptada.
3. Registrar usuario.
4. Habilitar acceso.
5. Permitir inicio de sesión.

---

# 4. Alcance funcional

Esta SPEC incluye:

- Endpoint para activar acceso.
- DTO Request.
- DTO Response.
- Validaciones.
- Servicio Application.
- Repository.
- Procedimiento almacenado.
- Encriptación de contraseña.
- Actualización de acceso ciudadano.

---

# 5. Flujo esperado

```text
Ciudadano registrado
        |
        |
        v
TieneAcceso = 0
        |
        |
Crear contraseña
        |
        |
Validar ciudadano
        |
        |
Crear PasswordHash
        |
        |
Insertar Usuarios
        |
        |
Actualizar TieneAcceso = 1
        |
        |
Puede iniciar sesión
```

---

# 6. Tablas involucradas

## Tabla Ciudadanos

Campos:

```sql
CiudadanoId
NombresCompletos
Email
TieneAcceso
Estado
FechaRegistro
```

---

## Tabla Usuarios

Campos:

```sql
UsuarioId
CiudadanoId
Email
PasswordHash
Rol
Estado
FechaCreacion
```

---

# 7. Reglas de negocio

---

## RN-001: Validar ciudadano existente

Antes de activar acceso validar:

```sql
Ciudadanos.CiudadanoId
```

Debe existir.

Si no existe retornar:

```json
{
    "isSuccess": false,
    "message": "El ciudadano no existe."
}
```

---

# RN-002: Validar ciudadano activo

Debe cumplir:

```sql
Estado = 1
```

Si está inactivo retornar:

```json
{
    "isSuccess": false,
    "message": "El ciudadano está inactivo."
}
```

---

# RN-003: Validar usuario existente

Antes de crear usuario validar:

```sql
SELECT UsuarioId
FROM Usuarios
WHERE CiudadanoId = @CiudadanoId
```

Si existe:

```json
{
    "isSuccess": false,
    "message": "El ciudadano ya tiene acceso creado."
}
```

---

# RN-004: Validar TieneAcceso

El ciudadano debe estar:

```sql
TieneAcceso = 0
```

Si:

```sql
TieneAcceso = 1
```

Retornar:

```json
{
    "isSuccess": false,
    "message": "El ciudadano ya tiene acceso al sistema."
}
```

---

# RN-005: Seguridad contraseña

La contraseña:

- Nunca se almacena en texto plano.
- Siempre debe pasar por PasswordHasher.
- Guardar únicamente PasswordHash.

Ejemplo:

```text
Password:
123456

Guardar:
AQAAAAIAAYagAAAAEJ...
```

---

# RN-006: Actualización acceso

Después de crear usuario:

Actualizar:

```sql
UPDATE Ciudadanos
SET TieneAcceso = 1
WHERE CiudadanoId = @CiudadanoId
```

---

# 8. DTOs

## ActivarAccesoRequest

Ubicación:

```text
RedVictoria.Application
 └── DTOs
      └── Usuarios
          └── ActivarAccesoRequest.cs
```

Modelo:

```csharp
public class ActivarAccesoRequest
{
    public int CiudadanoId { get; set; }

    public string Email { get; set; } = string.Empty;

    public string Password { get; set; } = string.Empty;

    public string ConfirmPassword { get; set; } = string.Empty;
}
```

---

## ActivarAccesoResponse

Ubicación:

```text
DTOs/Usuarios/ActivarAccesoResponse.cs
```

Modelo:

```csharp
public class ActivarAccesoResponse
{
    public int UsuarioId { get; set; }

    public int CiudadanoId { get; set; }

    public string Nombre { get; set; } = string.Empty;

    public bool TieneAcceso { get; set; }
}
```

---

# 9. Validaciones Application

Validar:

## CiudadanoId

```text
Obligatorio
Mayor que cero
```

---

## Email

Validar:

```text
Obligatorio
Formato válido
Máximo 150 caracteres
```

---

## Password

Validar:

```text
Obligatorio
Mínimo 6 caracteres
```

---

## ConfirmPassword

Validar:

```text
Debe coincidir con Password
```

---

# 10. Application Layer

Crear/Actualizar:

```text
IUsuarioApplication
```

Método:

```csharp
Task<Response<ActivarAccesoResponse>> ActivarAccesoAsync(
    ActivarAccesoRequest request
);
```

---

Implementar:

```text
UsuarioApplication
```

Responsabilidades:

1. Validar request.
2. Crear PasswordHash.
3. Ejecutar repositorio.
4. Retornar Response.

---

# 11. Domain Layer

Crear/Actualizar:

```text
IUsuarioRepository
```

Método:

```csharp
Task<ActivarAccesoResponse> ActivarAccesoAsync(
    ActivarAccesoRequest request,
    string passwordHash
);
```

---

# 12. Infrastructure Layer

Actualizar:

```text
UsuarioRepository
```

Usar:

- Dapper.
- IConnectionFactory.
- Stored Procedure.

Ejecutar:

```sql
usp_Usuarios_ActivarAcceso
```

---

# 13. Procedimiento almacenado

Crear:

```sql
usp_Usuarios_ActivarAcceso
```

Ubicación:

```text
database/stored-procedures
```

---

## Parámetros

```sql
@CiudadanoId INT,
@Email NVARCHAR(150),
@PasswordHash NVARCHAR(MAX)
```

---

## Responsabilidades

Debe:

1. Abrir transacción.
2. Validar ciudadano.
3. Validar usuario existente.
4. Insertar usuario.
5. Actualizar ciudadano.
6. Confirmar transacción.

---

Insert:

```sql
INSERT INTO Usuarios
(
    CiudadanoId,
    Email,
    PasswordHash,
    Rol,
    Estado,
    FechaCreacion
)
VALUES
(
    @CiudadanoId,
    @Email,
    @PasswordHash,
    'Ciudadano',
    1,
    GETDATE()
)
```

---

Update:

```sql
UPDATE Ciudadanos
SET TieneAcceso = 1
WHERE CiudadanoId = @CiudadanoId
```

---

# 14. Endpoint

Crear:

```text
UsuariosController
```

Endpoint:

```http
POST /api/usuarios/activar-acceso
```

---

Request:

```json
{
    "ciudadanoId":1,
    "email":"correo@test.com",
    "password":"123456",
    "confirmPassword":"123456"
}
```

---

Response:

```json
{
    "data":{
        "usuarioId":10,
        "ciudadanoId":1,
        "nombre":"Juan Perez",
        "tieneAcceso":true
    },
    "isSuccess":true,
    "message":"Acceso activado correctamente."
}
```

---

# 15. Manejo de errores

Usar el manejador global existente.

No usar try/catch innecesarios.

Errores funcionales:

Retornar:

```csharp
Response<T>
```

Errores técnicos:

Enviar al Middleware global.

---

# 16. Seguridad

Obligatorio:

- No guardar password plano.
- No retornar PasswordHash.
- No escribir password en logs.
- No permitir doble usuario.
- No permitir doble activación.

---

# 17. Casos de prueba

---

## CP-001 Activación correcta

Entrada:

```json
{
 "ciudadanoId":1,
 "password":"123456"
}
```

Resultado:

```text
Usuario creado
TieneAcceso = 1
PasswordHash generado
```

---

## CP-002 Ciudadano inexistente

Resultado:

```text
IsSuccess=false
Mensaje: El ciudadano no existe
```

---

## CP-003 Usuario existente

Resultado:

```text
IsSuccess=false
Mensaje: El ciudadano ya tiene acceso creado
```

---

## CP-004 Contraseña inválida

Resultado:

```text
No crea usuario
No modifica ciudadano
```

---

# 18. Archivos esperados

```text
Application
│
├── DTOs
│   └── Usuarios
│       ├── ActivarAccesoRequest.cs
│       └── ActivarAccesoResponse.cs
│
├── Interfaces
│   └── IUsuarioApplication.cs
│
└── Services
    └── UsuarioApplication.cs


Domain
│
└── Interfaces
    └── IUsuarioRepository.cs


Infrastructure
│
└── Repositories
    └── UsuarioRepository.cs


Services.API
│
└── Controllers
    └── UsuariosController.cs
```

---

# 19. Definition Of Done

La historia termina cuando:

- Endpoint creado.
- DTOs creados.
- Application implementado.
- Repository implementado.
- SP creado.
- Password encriptado.
- Usuario insertado correctamente.
- TieneAcceso actualizado.
- Swagger funcionando.
- Login funciona después de activar cuenta.

---

# 20. Validación final

Ejecutar:

```bash
dotnet restore

dotnet build
```

Debe finalizar:

```text
Build succeeded
```

No avanzar a la siguiente SPEC hasta completar esta correctamente.
```