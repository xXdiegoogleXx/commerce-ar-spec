## 1. Modelo de Datos - Nuevos campos en Product

- [x] 1.1 Agregar campos al schema Prisma: urlImage (String?), brand (String @default("Genérica")), barcode (String @unique), metadata (String?)
- [x] 1.2 Crear migración de base de datos
- [x] 1.3 Actualizar tipos TypeScript (Product)
- [x] 1.4 Actualizar seed/data si existe

## 2. Backend - Validaciones y schemas

- [x] 2.1 Actualizar Zod schemas de producto para incluir nuevos campos
- [x] 2.2 Agregar validación de barcode (formato EAN, solo números, 8-13 dígitos)
- [x] 2.3 Agregar validación de urlImage (URL válida opcional)

## 3. Backend - CRUD de productos actualizado

- [x] 3.1 Actualizar POST /api/products para aceptar nuevos campos
- [x] 3.2 Actualizar PUT /api/products/:id para aceptar nuevos campos
- [x] 3.3 Actualizar GET /api/products para incluir nuevos campos en respuesta
- [x] 3.4 Actualizar GET /api/products/:id para incluir nuevos campos

## 4. Backend - Importación CSV

- [x] 4.1 Instalar csv-parse como dependencia
- [x] 4.2 Crear servicio de importación (backend/services/csvImportService.js)
- [x] 4.3 Implementar parser CSV con detección de columnas
- [x] 4.4 Implementar mapeo de columnas a campos de Product
- [x] 4.5 Implementar lógica de columnas no reconocidas → metadata JSON
- [x] 4.6 Implementar upsert por barcode
- [x] 4.7 Implementar progreso en memoria (Map de importId → estado)
- [x] 4.8 Implementar procesamiento por lotes (batch de 500)

## 5. Backend - API de importación

- [x] 5.1 Crear endpoint POST /api/products/import (multipart CSV, solo admin/super_admin)
- [x] 5.2 Crear endpoint GET /api/products/import/:importId/status
- [x] 5.3 Implementar middleware de scope por tienda en importación

## 6. Frontend - ImportContext y polling

- [x] 6.1 Crear ImportContext con estado global de importación
- [x] 6.2 Implementar polling automático (cada 2s) cuando hay import activa
- [x] 6.3 Implementar stop polling al cambiar de ruta
- [x] 6.4 Implementar notificación toast al completar

## 7. Frontend - Subida de CSV

- [x] 7.1 Agregar botón "Importar CSV" en vista de productos (solo admin/super_admin)
- [x] 7.2 Crear modal/formulario de subida de archivo
- [x] 7.3 Implementar llamada POST /api/products/import con FormData

## 8. Frontend - Barra de progreso

- [x] 8.1 Crear componente ImportProgressBar (esquina inferior derecha)
- [x] 8.2 Suscribir barra a ImportContext
- [x] 8.3 Ocultar barra al cambiar de ruta
- [x] 8.4 Mostrar toast de resultado al completar

## 9. Frontend - Formulario de producto actualizado

- [x] 9.1 Agregar campos urlImage, brand, barcode al formulario de producto
- [x] 9.2 Agregar campo metadata (textarea opcional para JSON)
- [x] 9.3 Mostrar barcode en tabla de productos

## 10. Testing y Validación

- [x] 10.1 Probar creación de producto con todos los campos nuevos
- [x] 10.2 Probar importación CSV con columnas estándar
- [x] 10.3 Probar importación CSV con columnas adicionales (metadata)
- [x] 10.4 Probar upsert por barcode (mismo barcode, actualiza precio)
- [x] 10.5 Probar barra de progreso durante importación
- [x] 10.6 Probar ocultación del toast al cambiar de ruta
