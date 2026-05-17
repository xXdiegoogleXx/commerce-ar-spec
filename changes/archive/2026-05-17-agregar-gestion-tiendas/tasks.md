## 1. Modelo de Datos - Store y UserStore

- [x] 1.1 Agregar modelo Store al schema Prisma (id, name, address, createdAt, updatedAt)
- [x] 1.2 Agregar modelo UserStore con relación muchos-a-muchos (userId, storeId)
- [x] 1.3 Agregar storeId opcional a Product y Sale
- [x] 1.4 Agregar enum Role con super_admin, admin, seller
- [x] 1.5 Crear migración de base de datos
- [x] 1.6 Actualizar tipos TypeScript (Store, UserStore)

## 2. Backend - Middleware de Roles Jerárquico

- [x] 2.1 Refactorizar requireRole para aceptar jerarquía (super_admin > admin > seller)
- [x] 2.2 Crear middleware requireSuperAdmin para rutas exclusivas de Super Admin
- [x] 2.3 Crear helper withStoreScope que retorne filtro WHERE según rol y tiendas del usuario

## 3. Backend - API de Tiendas (CRUD)

- [x] 3.1 Crear endpoint GET /api/stores (listar - super_admin ve todas, admin ve las suyas)
- [x] 3.2 Crear endpoint POST /api/stores (crear - solo super_admin)
- [x] 3.3 Crear endpoint GET /api/stores/:id (obtener - solo super_admin)
- [x] 3.4 Crear endpoint PUT /api/stores/:id (actualizar - solo super_admin)
- [x] 3.5 Crear endpoint DELETE /api/stores/:id (eliminar - solo super_admin, validar sin usuarios)

## 4. Backend - Asignación de Usuarios a Tiendas

- [x] 4.1 Crear endpoint POST /api/stores/:storeId/users (asignar - super_admin o admin de esa tienda)
- [x] 4.2 Crear endpoint DELETE /api/stores/:storeId/users/:userId (desasignar)
- [x] 4.3 Crear endpoint GET /api/stores/:storeId/users (listar usuarios de una tienda)

## 5. Backend - Scope por Tienda en Productos

- [x] 5.1 Actualizar GET /api/products para filtrar por tienda del usuario (seller/admin ven solo su tienda, super_admin ve todo)
- [x] 5.2 Actualizar POST /api/products para asignar storeId automático según tienda del usuario
- [x] 5.3 Actualizar PUT /api/products/:id para verificar que el producto pertenece a la tienda del usuario
- [x] 5.4 Actualizar DELETE /api/products/:id para verificar scope de tienda
- [x] 6.1 Actualizar POST /api/sales para verificar que el producto pertenece a la tienda del vendedor
- [x] 6.2 Actualizar GET /api/sales para filtrar por tienda (admin ve ventas de su tienda, seller ve las suyas)
- [x] 6.3 Actualizar GET /api/dashboard para filtrar métricas por tienda
- [x] 7.1 Actualizar GET /api/users para que admin solo vea usuarios de su(s) tienda(s)
- [x] 7.2 Actualizar POST /api/users para que admin asigne automáticamente el nuevo usuario a su tienda
- [x] 7.3 Actualizar PUT /api/users/:id para que admin solo pueda editar usuarios de su tienda
- [x] 7.4 Actualizar DELETE /api/users/:id para que admin solo pueda eliminar usuarios de su tienda
- [x] 7.5 Actualizar middleware requireRole('admin') en rutas de usuarios para que también acepte super_admin

## 8. Frontend - Página de Gestión de Tiendas

- [x] 8.1 Crear StoresPage con tabla de tiendas (solo accesible para super_admin)
- [x] 8.2 Crear StoreFormPage para crear/editar tiendas
- [x] 8.3 Agregar StoresPage a las rutas del frontend
- [x] 8.4 Crear storeApi en services/api.ts
- [x] 9.1 Agregar sección de usuarios asignados en StoreFormPage o StoresPage
- [x] 9.2 Crear interfaz para asignar/desasignar usuarios a tiendas
- [x] 9.3 Actualizar UsersPage para mostrar tiendas del usuario y permitir filtro por tienda
- [x] 10.1 Actualizar AuthContext para exponer isSuperAdmin
- [x] 10.2 Actualizar Layout para mostrar enlace a Tiendas solo para super_admin
- [x] 10.3 Actualizar UsersPage para que admin solo vea usuarios de su tienda
- [x] 10.4 Ocultar acciones de ABM de usuarios para seller
- [x] 11.1 Probar CRUD de tiendas como super_admin
- [x] 11.2 Probar que admin de tienda NO puede crear/editar/eliminar tiendas
- [x] 11.3 Probar asignación de usuarios a tiendas
- [x] 11.4 Probar que admin solo gestiona usuarios de su tienda
- [x] 11.5 Probar filtrado de productos/ventas por tienda
- [x] 11.6 Probar jerarquía de roles (super_admin accede a rutas admin, admin NO accede a rutas super_admin)
