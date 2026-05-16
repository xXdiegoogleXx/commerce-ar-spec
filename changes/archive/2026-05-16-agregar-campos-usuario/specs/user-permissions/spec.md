## ADDED Requirements

### Requirement: Usuario común puede editar solo teléfono
El sistema DEBE permitir que usuarios no-administradores editen únicamente su número de teléfono.

#### Scenario: Usuario común edita su teléfono
- **WHEN** usuario común accede a su perfil e intenta modificar solo teléfono
- **THEN** el sistema permite el cambio y actualiza el teléfono

#### Scenario: Usuario común intenta editar otros campos
- **WHEN** usuario común intenta editar documento, fecha de nacimiento o sexo
- **THEN** el sistema muestra esos campos como solo lectura o deshabilitados

### Requirement: Verificación de propiedad de perfil
El sistema DEBE verificar que el usuario que intenta editar sea el propietario del perfil.

#### Scenario: Usuario intenta editar perfil de otro usuario
- **WHEN** usuario intenta acceder a URL de edición de otro usuario (/users/:id/edit)
- **THEN** el sistema redirecciona a su propio perfil o muestra acceso denegado

### Requirement: Campos obligatorios al editar perfil propio
El sistema DEBE validar que el usuario tenga documento y teléfono al editar su perfil.

#### Scenario: Usuario sin documento intenta guardar
- **WHEN** usuario sin documento número intenta guardar cambios
- **THEN** el sistema muestra error indicando que el documento es obligatorio