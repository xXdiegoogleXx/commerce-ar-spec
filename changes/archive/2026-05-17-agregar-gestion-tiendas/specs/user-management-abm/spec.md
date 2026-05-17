## ADDED Requirements

### Requirement: Admin de tienda solo gestiona usuarios de su tienda
El sistema SHALL restringir al Admin de tienda para que solo pueda crear, editar y eliminar usuarios asignados a su misma tienda.

#### Scenario: Admin lista solo usuarios de su tienda
- **WHEN** un admin consulta GET /api/users
- **THEN** el sistema retorna solo los usuarios que pertenecen a su(s) tienda(s)

#### Scenario: Admin crea usuario y lo asigna a su tienda
- **WHEN** un admin crea un usuario vía POST /api/users
- **THEN** el sistema crea el usuario y lo asigna automáticamente a la tienda del admin

#### Scenario: Admin edita usuario de su tienda
- **WHEN** un admin edita un usuario vía PUT /api/users/:id que pertenece a su tienda
- **THEN** el sistema permite la actualización

#### Scenario: Admin intenta editar usuario de otra tienda
- **WHEN** un admin intenta editar un usuario que no pertenece a su tienda
- **THEN** el sistema retorna 403

#### Scenario: Admin elimina usuario de su tienda
- **WHEN** un admin elimina un usuario vía DELETE /api/users/:id que pertenece a su tienda
- **THEN** el sistema permite la eliminación

#### Scenario: Super Admin gestiona todos los usuarios
- **WHEN** un super_admin consulta GET /api/users
- **THEN** el sistema retorna todos los usuarios sin filtro por tienda
