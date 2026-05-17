## ADDED Requirements

### Requirement: Asignar usuario a tienda
El sistema SHALL permitir al Super Admin o al Admin de tienda asignar un usuario a una tienda.

#### Scenario: Super Admin asigna usuario a tienda
- **WHEN** el Super Admin envía POST /api/stores/:storeId/users con { userId }
- **THEN** el sistema retorna 201 con la asignación creada

#### Scenario: Admin de tienda asigna usuario a su tienda
- **WHEN** un Admin envía POST /api/stores/:storeId/users con { userId } y el admin pertenece a esa tienda
- **THEN** el sistema retorna 201 con la asignación creada

#### Scenario: Admin intenta asignar a tienda que no le pertenece
- **WHEN** un Admin envía POST /api/stores/:storeId/users a una tienda donde no está asignado
- **THEN** el sistema retorna 403

#### Scenario: Usuario ya asignado a la tienda
- **WHEN** se intenta asignar un usuario que ya pertenece a la tienda
- **THEN** el sistema retorna 400 con mensaje de error

### Requirement: Desasignar usuario de tienda
El sistema SHALL permitir desasignar un usuario de una tienda.

#### Scenario: Desasignación exitosa
- **WHEN** el Super Admin o Admin de tienda envía DELETE /api/stores/:storeId/users/:userId
- **THEN** el sistema retorna 200 con { ok: true }

### Requirement: Listar usuarios de una tienda
El sistema SHALL permitir listar los usuarios asignados a una tienda.

#### Scenario: Listado exitoso
- **WHEN** se envía GET /api/stores/:storeId/users
- **THEN** el sistema retorna 200 con un array de usuarios de esa tienda
