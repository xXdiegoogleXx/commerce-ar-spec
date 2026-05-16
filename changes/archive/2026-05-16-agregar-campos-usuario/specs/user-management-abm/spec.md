## ADDED Requirements

### Requirement: Alta de usuario (Admin)
El sistema DEBE permitir al Administrador crear nuevos usuarios a través de la interfaz de ABM.

#### Scenario: Crear usuario exitosamente
- **WHEN** Administrador completa todos los campos obligatorios y envía el formulario
- **THEN** el sistema crea el nuevo usuario y lo muestra en la lista

#### Scenario: Crear usuario con datos inválidos
- **WHEN** Administrador intenta crear usuario con datos incompletos o inválidos
- **THEN** el sistema muestra errores de validación específicos

### Requirement: Baja de usuario (Admin)
El sistema DEBE permitir al Administrador eliminar usuarios existentes (soft delete).

#### Scenario: Eliminar usuario exitosamente
- **WHEN** Administrador confirma eliminación de usuario
- **THEN** el sistema marca el usuario como eliminado y lo oculta de la lista activa

### Requirement: Modificación de usuario (Admin)
El sistema DEBE permitir al Administrador editar cualquier campo de cualquier usuario.

#### Scenario: Editar usuario exitosamente
- **WHEN** Administrador modifica campos y guarda cambios
- **THEN** el sistema actualiza los datos del usuario

#### Scenario: Ver lista de usuarios (Admin)
- **WHEN** Administrador accede a la página de gestión de usuarios
- **THEN** el sistema muestra lista de todos los usuarios activos con opciones de editar/eliminar

### Requirement: Solo Administrador puede acceder a ABM
El sistema DEBE restringir el acceso a la página de gestión de usuarios únicamente al rol Administrador.

#### Scenario: Usuario común intenta acceder a ABM
- **WHEN** usuario con rol diferente a Administrador intenta acceder a /users
- **THEN** el sistema redirecciona a página de acceso denegado o dashboard