## Por qué

El sistema actual de usuarios carece de información básica necesaria para un control adecuado de clientes y cumplimiento legal. Se requiere registrar datos como número de documento, teléfono, fecha de nacimiento y sexo para completar el perfil del usuario, además de implementar gestión ABM (Alta-Baja-Modificación) con permisos diferenciados por rol.

## Qué cambia

- Agregar campo `documentNumber` (String, obligatorio) - Identificación legal del usuario
- Agregar campo `phone` (String, obligatorio con validación de formato)
- Agregar campo `birthDate` (Date, opcional con validación de fecha válida)
- Agregar campo `gender` (Enum: masculino/femenino/otros, obligatorio)
- Implementar ABM de usuarios accesible solo para rol Administrador
- Limitar edición de campos para usuario común: solo puede modificar su teléfono
- Actualizar formularios de registro y edición de usuarios

## Capabilities

### Nuevas capacidades
- `user-profile-fields`: Gestión de campos extendidos del perfil de usuario (documento, teléfono, fecha nacimiento, sexo)
- `user-management-abm`: Sistema de Alta-Baja-Modificación de usuarios con permisos por rol
- `user-permissions`: Control de permisos según rol (Administrador vs Usuario común)

### Capacidades modificadas
- Ninguna. Este es un feature nuevo.

## Impacto

- Backend: Nuevos campos en modelo de usuario, endpoints API para ABM
- Frontend: Nuevos campos en formularios, página de gestión de usuarios para admin
- Base de datos: Migración para agregar columnas a tabla users
- Validaciones: Reglas de validación para teléfono, fecha de nacimiento, documento