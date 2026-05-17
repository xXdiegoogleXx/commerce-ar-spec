## ADDED Requirements

### Requirement: Crear tienda
El sistema SHALL permitir al Super Admin crear una tienda con nombre y dirección.

#### Scenario: Creación exitosa
- **WHEN** el Super Admin envía POST /api/stores con name y address
- **THEN** el sistema retorna 201 con los datos de la tienda creada

#### Scenario: Super Admin no autenticado
- **WHEN** un usuario sin token envía POST /api/stores
- **THEN** el sistema retorna 401

#### Scenario: Admin común intenta crear tienda
- **WHEN** un usuario con rol admin envía POST /api/stores
- **THEN** el sistema retorna 403

### Requirement: Listar tiendas
El sistema SHALL permitir al Super Admin listar todas las tiendas.

#### Scenario: Listado exitoso
- **WHEN** el Super Admin envía GET /api/stores
- **THEN** el sistema retorna 200 con un array de tiendas

#### Scenario: Admin común lista tiendas
- **WHEN** un usuario con rol admin envía GET /api/stores
- **THEN** el sistema retorna solo las tiendas a las que está asignado

### Requirement: Obtener tienda por ID
El sistema SHALL permitir obtener una tienda por su ID.

#### Scenario: Tienda existe
- **WHEN** el Super Admin envía GET /api/stores/:id
- **THEN** el sistema retorna 200 con los datos de la tienda

#### Scenario: Tienda no existe
- **WHEN** se envía GET /api/stores/:id con un ID inválido
- **THEN** el sistema retorna 404

### Requirement: Actualizar tienda
El sistema SHALL permitir al Super Admin actualizar nombre y/o dirección de una tienda.

#### Scenario: Actualización exitosa
- **WHEN** el Super Admin envía PUT /api/stores/:id con name y/o address
- **THEN** el sistema retorna 200 con los datos actualizados

### Requirement: Eliminar tienda
El sistema SHALL permitir al Super Admin eliminar una tienda.

#### Scenario: Eliminación exitosa
- **WHEN** el Super Admin envía DELETE /api/stores/:id
- **THEN** el sistema retorna 200 con { ok: true }

#### Scenario: Tienda con usuarios asignados
- **WHEN** el Super Admin intenta eliminar una tienda que tiene usuarios asignados
- **THEN** el sistema retorna 400 con mensaje de error

### Requirement: Validar nombre y dirección
El sistema SHALL requerir name y address al crear una tienda.

#### Scenario: Falta nombre
- **WHEN** se envía POST /api/stores sin name
- **THEN** el sistema retorna 400 con mensaje de error

#### Scenario: Falta dirección
- **WHEN** se envía POST /api/stores sin address
- **THEN** el sistema retorna 400 con mensaje de error
