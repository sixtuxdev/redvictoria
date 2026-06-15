# SPEC-002: Registro de ciudadano con acceso opcional

## 1. Historia de usuario

**HU-002: Registro de ciudadano con acceso opcional**

Como ciudadano,
quiero registrarme con o sin contrasena,
para quedar vinculado a una red de campana.

## 2. Objetivo

Implementar el registro de ciudadanos mediante API. El registro puede crear
solamente el ciudadano o, cuando se suministra una contrasena, crear tambien
su usuario de acceso.

## 3. Endpoint

```http
POST /api/ciudadanos/registrar?ref={codigoReferido}
Content-Type: application/json
```

El parametro `ref` es opcional. Cuando se recibe, tiene prioridad sobre
`codigoReferidoInvitacion` enviado en el cuerpo.

## 4. Solicitud

```json
{
  "nombresCompletos": "Juan Perez",
  "celular": "3001234567",
  "fechaNacimiento": "1990-05-20T00:00:00",
  "lugarNacimiento": "Bogota",
  "tieneWhatsapp": true,
  "parametroIdDondeVive": 8,
  "puestoVotacion": "Colegio Central",
  "email": "juan@example.com",
  "parametroIdTipoIdentificacion": 1,
  "numeroIdentificacion": "123456789",
  "direccion": "Calle 1",
  "departamentoId": 1,
  "municipioId": 1,
  "parametroIdGrupoEdad": 1,
  "parametroIdGenero": 1,
  "parametroIdSoy": 1,
  "codigoReferido": "RV-ABC123",
  "estado": true,
  "password": "secreto",
  "confirmPassword": "secreto"
}
```

`nombresCompletos` es obligatorio. `password` y `confirmPassword` son
opcionales, pero deben enviarse juntos y coincidir. Cuando se solicita acceso,
el email es obligatorio.

## 5. Respuesta exitosa

```json
{
  "isSuccess": true,
  "message": "Ciudadano registrado correctamente.",
  "data": {
    "ciudadanoId": 10,
    "codigoReferido": "RV-ABC123",
    "tieneAcceso": true,
    "ciudadanoReferidorId": 5,
    "fechaNacimiento": "1990-05-20T00:00:00",
    "lugarNacimiento": "Bogota",
    "celular": "3001234567",
    "tieneWhatsapp": true,
    "parametroIdDondeVive": 8,
    "puestoVotacion": "Colegio Central",
    "parametroIdSoy": 1,
    "estado": true,
    "fechaRegistro": "2026-06-15T12:00:00"
  },
  "errors": []
}
```

## 6. Reglas de negocio

1. Generar un codigo de referido unico para cada ciudadano.
2. Validar el codigo de invitacion cuando sea suministrado.
3. Guardar `CiudadanoReferidorId` cuando el referido sea valido.
4. Rechazar el registro cuando el referido no exista.
5. Crear un registro en `Usuarios` solamente cuando se suministre contrasena.
6. Almacenar un hash PBKDF2-SHA256 con salt aleatorio, nunca la contrasena.
7. Marcar `TieneAcceso = 1` cuando se cree el usuario.
8. Rechazar un email duplicado cuando se solicite acceso.
9. Ejecutar la creacion de ciudadano y usuario en una misma transaccion.
10. Rechazar una fecha de nacimiento futura.
11. Limitar lugar de nacimiento y puesto de votacion a 150 caracteres.

## 7. Componentes

```text
Application
  DTOs/Ciudadanos/RegistroCiudadanoRequest.cs
  DTOs/Ciudadanos/RegistroCiudadanoResponse.cs
  Services/CiudadanoApplication.cs

Domain
  Interfaces/ICiudadanoRepository.cs
  Models/Ciudadanos/RegistroCiudadanoCommand.cs
  Models/Ciudadanos/RegistroCiudadanoResult.cs

Infrastructure
  Repositories/CiudadanoRepository.cs
  Security/PasswordHasher.cs

API
  Controllers/CiudadanosController.cs

Database
  stored-procedures/usp_Ciudadanos_Registrar.sql
```

## 8. Criterios de aceptacion

### CA-001: Registro sin acceso

Dado un nombre valido y sin contrasena, cuando se registra el ciudadano,
entonces se crea el ciudadano con `TieneAcceso = false` y no se crea usuario.

### CA-002: Registro con acceso

Dado un email, contrasena y confirmacion validos, cuando se registra el
ciudadano, entonces se crea el usuario con la contrasena encriptada y el
ciudadano queda con `TieneAcceso = true`.

### CA-003: Referido valido

Dado un codigo de referido existente, cuando se registra el ciudadano,
entonces se guarda el identificador del ciudadano referidor.

### CA-004: Referido invalido

Dado un codigo inexistente, cuando se intenta registrar el ciudadano,
entonces no se crean registros y se informa que el codigo no es valido.

### CA-005: Email duplicado

Dado un email que ya pertenece a un usuario, cuando se solicita un nuevo
registro con acceso, entonces no se crean registros y se informa el duplicado.

### CA-006: Validaciones

El endpoint rechaza nombres vacios, formatos de email invalidos, contrasenas de
menos de 6 caracteres y contrasenas que no coinciden.

## 9. Definition of Done

1. DTOs, servicio de aplicacion, repositorio y endpoint implementados.
2. Hash de contrasena implementado fuera de la capa de aplicacion.
3. Procedimiento almacenado transaccional implementado.
4. Dependencias registradas en el contenedor.
5. Pruebas automatizadas para registro sin referido, referido valido,
   referido invalido, acceso y validaciones.
6. La solucion compila sin advertencias ni errores.
7. Todas las pruebas automatizadas pasan.
