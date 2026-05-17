## Contexto

Sistema SaaS monolitico con backend Express + Prisma (PostgreSQL) y frontend React + TypeScript. Actualmente existen los roles `admin` y `seller` sin distinción por tienda. Todos los datos (productos, ventas) son globales.

Se necesita implementar un modelo multi-tienda donde:
- Los usuarios se asignan a una o más tiendas
- Existe un Super Admin global que administra todo
- El Admin de tienda gestiona usuarios solo de su tienda
- El Vendedor opera solo dentro de su tienda asignada

## Goals / Non-Goals

**Goals:**
- Modelo Store con ABM exclusivo para Super Admin
- Asignación muchos-a-muchos de usuarios a tiendas
- Rol `super_admin` con permisos globales
- Rol `admin` de tienda puede ABM usuarios (admin y vendedor) de su tienda
- Rol `seller` limitado a su tienda
- Filtrado de productos, ventas y dashboard por tienda
- Migración de datos existentes (usuarios sin tienda no pierden acceso)

**Non-Goals:**
- Múltiples tiendas por producto (un producto pertenece a una sola tienda)
- Facturación o reportes multi-tienda
- Catálogos globales compartidos entre tiendas
- UI de cambio de tienda activa para usuarios con múltiples tiendas
- Internacionalización

## Decisions

### 1. Many-to-many via tabla pivote UserStore
Se crea una tabla `UserStore` en lugar de agregar `storeId` directo en User, porque un usuario puede pertenecer a varias tiendas.
**Alternativa:** campo `storeIds` como JSON array → se descarta por falta de integridad referencial y mal rendimiento en consultas.

### 2. Jerarquía de roles soft (middleware jerárquico)
Se implementa una función `requireRoleHierarchy(roles)` que acepta un array ordenado. `super_admin` puede hacer todo lo de `admin`. `admin` puede hacer todo lo de `seller`. El middleware actual `requireRole` se refactoriza internamente.
**Alternativa:** RBAC con permisos explícitos → se descarta por ahora por overhead innecesario (solo 3 roles).

### 3. Productos con storeId nullable (migración)
Se agrega `storeId` opcional a Product y Sale. Los productos/sales existentes quedan sin tienda (globales). Migración sin pérdida de datos.

**Alternativa:** forzar storeId en todos los productos → rompe datos existentes.

### 4. Filtrado en backend (no frontend)
El scope por tienda se aplica en las queries del backend según el rol del usuario autenticado. Los endpoints retornan solo datos de la(s) tienda(s) del usuario (excepto super_admin que ve todo).
**Alternativa:** filtrar en frontend → inseguro.

### 5. Super Admin no requiere asignación a tienda
El Super Admin puede ver y gestionar todas las tiendas sin estar asignado a ninguna tabla UserStore.
**Implementación:** en las queries, si rol === 'super_admin', se omite el filtro por tienda.

## Riesgos / Trade-offs

- **Riesgo: Usuarios existentes (admin, seller) sin tienda asignada** → Mitigación: solo super_admin puede asignar tiendas. Los admins existentes mantienen acceso a sus endpoints actuales hasta que se les asigne a una tienda.
- **Riesgo: Complejidad en consultas de scope** → Mitigación: crear helpers `withStoreScope(user)` que retornen el where condition según el rol.
- **Riesgo: Migración de datos** → Mitigación: storeId nullable, migraciones independientes y reversibles.
- **Trade-off: Filtrado en backend agrega latencia** → Mínimo, son índices simples en storeId.
- **Trade-off: Sin caché de tiendas activas** → Aceptable para esta fase, se optimiza después si es necesario.