## ADDED Requirements

### Requirement: Filtrar productos por tienda
El sistema SHALL filtrar los productos según la tienda del usuario autenticado.

#### Scenario: Admin ve productos de su tienda
- **WHEN** un admin autenticado consulta GET /api/products
- **THEN** el sistema retorna solo productos de su(s) tienda(s)

#### Scenario: Seller ve productos de su tienda
- **WHEN** un seller autenticado consulta GET /api/products
- **THEN** el sistema retorna solo productos de su(s) tienda(s)

#### Scenario: Super Admin ve todos los productos
- **WHEN** un super_admin consulta GET /api/products
- **THEN** el sistema retorna todos los productos (globales + de todas las tiendas)

### Requirement: Filtrar ventas por tienda
El sistema SHALL filtrar las ventas según la tienda del usuario autenticado.

#### Scenario: Admin ve ventas de su tienda
- **WHEN** un admin consulta GET /api/sales
- **THEN** el sistema retorna solo ventas de productos de su(s) tienda(s)

#### Scenario: Seller ve sus ventas
- **WHEN** un seller consulta GET /api/sales
- **THEN** el sistema retorna solo sus ventas (filtro por userId + storeId del producto)

#### Scenario: Super Admin ve todas las ventas
- **WHEN** un super_admin consulta GET /api/sales
- **THEN** el sistema retorna todas las ventas

### Requirement: Filtrar dashboard por tienda
El sistema SHALL filtrar las métricas del dashboard según la tienda del usuario.

#### Scenario: Admin ve dashboard de su tienda
- **WHEN** un admin consulta GET /api/dashboard
- **THEN** el sistema retorna métricas limitadas a su(s) tienda(s)

#### Scenario: Super Admin ve dashboard global
- **WHEN** un super_admin consulta GET /api/dashboard
- **THEN** el sistema retorna métricas de todas las tiendas
