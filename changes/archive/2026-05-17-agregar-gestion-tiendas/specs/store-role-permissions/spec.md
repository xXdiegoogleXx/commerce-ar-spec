## ADDED Requirements

### Requirement: Definir jerarquía de roles
El sistema SHALL tener una jerarquía de roles: super_admin > admin > seller.

#### Scenario: Super Admin tiene todos los permisos
- **WHEN** un usuario con rol super_admin accede a cualquier ruta protegida
- **THEN** el sistema permite el acceso sin restricciones

#### Scenario: Admin accede a ruta de admin
- **WHEN** un usuario con rol admin accede a una ruta que requiere admin
- **THEN** el sistema permite el acceso

#### Scenario: Admin accede a ruta de super_admin
- **WHEN** un usuario con rol admin accede a una ruta exclusiva de super_admin
- **THEN** el sistema retorna 403

#### Scenario: Seller accede a ruta de admin
- **WHEN** un usuario con rol seller accede a una ruta que requiere admin
- **THEN** el sistema retorna 403

### Requirement: Middleware requireRole jerárquico
El sistema SHALL actualizar el middleware requireRole para soportar jerarquía.

#### Scenario: requireRole('admin') permite super_admin
- **WHEN** un super_admin accede a una ruta con requireRole('admin')
- **THEN** el sistema permite el acceso

#### Scenario: requireRole('super_admin') bloquea admin
- **WHEN** un admin accede a una ruta con requireRole('super_admin')
- **THEN** el sistema retorna 403

### Requirement: Super Admin global no requiere asignación a tienda
El sistema SHALL permitir al Super Admin operar sin estar asignado a ninguna tienda.

#### Scenario: Super Admin lista productos globales
- **WHEN** un super_admin accede a GET /api/products
- **THEN** el sistema retorna todos los productos sin filtro por tienda

#### Scenario: Super Admin crea producto sin tienda
- **WHEN** un super_admin crea un producto sin especificar storeId
- **THEN** el sistema crea el producto como global (storeId null)
