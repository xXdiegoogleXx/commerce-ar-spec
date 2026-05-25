## Contexto

Sistema SaaS con modelo Product existente (name, description, price, stock, category, storeId, timestamps). No hay soporte para importación masiva ni campos enriquecidos (imagen, marca, código de barra). Los productos se crean individualmente desde el frontend.

Se necesita:
- Extender Product con campos multimedia/identificación
- Permitir importación CSV con detección de duplicados por barcode
- Procesamiento asíncrono para archivos grandes
- Retroalimentación visual del progreso

## Goals / Non-Goals

**Goals:**
- Nuevos campos: urlImage (String?), brand (String, default "Genérica", not null), barcode (String, único, not null), metadata (String)
- Endpoint POST /api/products/import que acepte multipart CSV
- Columnas CSV mapeadas a campos de base de datos
- Columnas no mapeadas → metadata JSON
- Upsert por barcode (si existe, actualiza precio y updatedAt)
- Stock default 0 si no se especifica
- Progreso vía WebSocket o polling
- Toast de notificación al completar
- Ocultar toast al cambiar de ruta

**Non-Goals:**
- Importación desde otros formatos (Excel, JSON)
- Validación de imágenes URL
- Catálogo compartido entre tiendas (se respeta storeId)
- Exportación de productos

## Decisions

### 1. Barcode como String (no Int/BigInt)
Los códigos EAN pueden tener leading zeros y superan el rango de Int32.
Se almacena como String con índice único.
**Alternativa:** BigInt → no soporta leading zeros correctamente.

### 2. Metadata como JSON string (no JSONB)
Se almacena como String para simplificar. Se parsea al leer y se serializa al guardar.
**Alternativa:** JSONB → overhead innecesario, el metadata es opaco para queries.

### 3. Procesamiento asíncrono vía endpoint síncrono + polling
El endpoint POST /api/products/import procesa el CSV en el mismo request pero devuelve un `importId`. El frontend hace polling a GET /api/products/import/:importId/status para obtener el progreso.
**Alternativa:** WebSocket → más complejo, polling es suficiente para este volumen.
**Alternativa:** Job queue con worker (Bull/bullmq) → overkill para un SaaS pequeño.

### 4. Progreso en memoria (no DB)
El estado de importación se guarda en un Map en memoria (objeto global). Al reiniciar el servidor se pierde, pero las importaciones en curso se abortan.
**Alternativa:** Guardar progreso en DB → más robusto pero innecesario.

### 5. csv-parse como parser
Librería liviana y madura para Node.js. Soporta streams, detecta columnas automáticamente.

### 6. Toast con estado global (React Context)
Contexto de importación que expone progreso y estado. El toast se suscribe y se oculta al cambiar ubicación (useEffect con location.pathname).
**Alternativa:** Estado local en ProductsPage → no sobrevive a navegación.

## Riesgos / Trade-offs

- **Riesgo: Archivos CSV muy grandes (>10k registros)** → Mitigación: procesar en lotes de 500 con setTimeout para no bloquear el event loop. Timeout total de 5 minutos.
- **Riesgo: Barcode duplicado en CSV** → Mitigación: el upsert maneja duplicados, el último registro del CSV gana.
- **Riesgo: Columnas mal nombradas** → Mitigación: logging de columnas no reconocidas, se guardan en metadata.
- **Riesgo: Progreso en memoria se pierde** → Mitigación: aceptable, el usuario puede reintentar.
- **Trade-off: Sin WebSocket** → El polling cada 2s es aceptable para importaciones que duran segundos/minutos.
