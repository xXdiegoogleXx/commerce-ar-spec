## 1. Modelo de Datos

- [x] 1.1 Agregar campos al esquema Prisma (documentNumber, phone, birthDate, gender) con @map para nombres en español en DB
- [x] 1.2 Crear migración de base de datos
- [x] 1.3 Actualizar tipos TypeScript del modelo User

## 2. Backend - Validaciones

- [x] 2.1 Crear función de validación de teléfono (formato argentino)
- [x] 2.2 Crear función de validación de documento
- [x] 2.3 Crear función de validación de fecha de nacimiento
- [x] 2.4 Crear validadores Zod para los nuevos campos

## 3. Backend - API

- [x] 3.1 Crear endpoint GET /api/users (listar usuarios - solo Admin)
- [x] 3.2 Crear endpoint POST /api/users (crear usuario - solo Admin)
- [x] 3.3 Crear endpoint PUT /api/users/:id (actualizar usuario - solo Admin)
- [x] 3.4 Crear endpoint DELETE /api/users/:id (eliminar usuario - solo Admin)
- [x] 3.5 Actualizar endpoint PUT /api/users/me para permitir editar solo teléfono

## 4. Frontend - Componentes

- [x] 4.1 Crear componente UserFormFields con campos de documento, teléfono, fecha nacimiento, sexo
- [x] 4.2 Crear componente SelectSexo (masculino/femenino/otros)
- [x] 4.3 Crear validaciones para los campos en frontend

## 5. Frontend - Pages

- [x] 5.1 Crear página UsersManagementPage (lista de usuarios con acciones)
- [x] 5.2 Crear página UserFormPage (formulario para crear/editar - solo Admin)
- [x] 5.3 Actualizar LoginPage para incluir campos nuevos en registro
- [x] 5.4 Actualizar perfil de usuario para permitir edición solo de teléfono

## 6. Permisos y Seguridad

- [x] 6.1 Agregar middleware de verificación de rol Administrador para rutas de ABM
- [x] 6.2 Restringir campos editables según rol en frontend
- [x] 6.3 Proteger rutas de gestión de usuarios

## 7. Testing y Validación

- [x] 7.1 Probar registro con todos los campos obligatorios (documentNumber, phone, gender)
- [x] 7.2 Probar validación de teléfono inválido (formato +54 9XXXXXXXX)
- [x] 7.3 Probar ABM como Administrador
- [x] 7.4 Probar que usuario común solo puede editar teléfono (ruta /users/me solo permite phone)