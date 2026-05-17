## Por qué

El sistema actual no soporta el concepto de tiendas. Todos los usuarios comparten un mismo contexto sin distinción por sucursal. Se necesita implementar un sistema multi-tienda donde los usuarios sean asignados a una o más tiendas, con roles jerárquicos (Super Admin, Admin de tienda, Vendedor) y permisos acotados al ámbito de cada tienda.

## Qué cambia

- Nuevo modelo `Store` con campos: id, name, address
- Relación muchos-a-muchos entre usuarios y tiendas (UserStore)
- Nuevo rol `super_admin` con capacidad de crear/ABM tiendas y asignar usuarios
- Rol `admin` de tienda puede ABM usuarios (admin y vendedor) solo de su tienda
- Rol `seller` limitado a su tienda asignada
- Los endpoints de productos, ventas y dashboard deben filtrar por tienda según el rol

## Capabilities

### Nuevas capacidades
- `store-crud`: Modelo Store y endpoints ABM (solo super_admin)
- `user-store-assignment`: Asignación y desasignación de usuarios a tiendas
- `store-role-permissions`: Sistema de roles jerárquico (super_admin → admin → seller)
- `store-scoped-data`: Filtrado de datos (productos, ventas) por tienda según rol

### Capacidades modificadas
- `user-management-abm`: Actualizar para que admin de tienda solo gestione usuarios de su tienda

## Impacto

- Base de datos: Nuevas tablas Store y UserStore, migración de roles
- Backend: Nuevos endpoints, modelos y middlewares de scope por tienda
- Frontend: Páginas de gestión de tiendas, selector de tienda en UI, filtros por tienda
- Roles: Refactor del sistema de roles actual para soportar jerarquía multi-tienda