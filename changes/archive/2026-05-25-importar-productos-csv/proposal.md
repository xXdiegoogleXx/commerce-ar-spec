## Por qué

Actualmente los productos se crean manualmente uno por uno, sin soporte para carga masiva. Se necesita importar productos desde archivos CSV con capacidad de actualizar precios existentes, detectar duplicados por código de barra, y procesar asincrónicamente con notificaciones.

## Qué cambia

- Nuevos campos en Product: urlImage (nullable), brand (default "Genérica"), barcode (único), metadata (JSON string)
- `barcode` se vuelve único en la base de datos (UK) para identificar productos
- Nuevo endpoint POST /api/products/import para subir CSV
- Procesamiento asíncrono con cola/tarea en background
- Columnas del CSV se mapean: name, description, price, stock, urlImage, brand, barcode, category
- Stock default 0 si no se especifica
- Columnas no reconocidas se guardan como JSON en metadata
- Si el barcode ya existe, se actualiza precio y updatedAt (upsert)
- Sistema de notificaciones al finalizar importación
- Barra de progreso en vista de productos (abajo a la derecha)
- Toast de progreso que se oculta al cambiar de vista

## Capabilities

### Nuevas capacidades
- `product-fields-enrichment`: Nuevos campos urlImage, brand, barcode, metadata en Product
- `csv-import-products`: Importación masiva de productos desde CSV
- `async-import-processor`: Procesamiento asíncrono con progreso y notificaciones
- `import-progress-ui`: Barra de progreso en frontend con toast y ocultación al cambiar ruta

### Capacidades modificadas
- (ninguna - store-crud y store-scoped-data no cambian sus requisitos)

## Impacto

- Base de datos: Migración con nuevos campos en Product, índice único en barcode
- Backend: Nuevo endpoint de importación, procesador asíncrono, servicio de notificaciones
- Frontend: Formulario de subida CSV, barra de progreso, toast de notificación
- Dependencias: csv-parse (backend), react-hot-toast o similar (frontend)
- Store: Se respeta storeId scope (admin/seller importa solo a su tienda)
