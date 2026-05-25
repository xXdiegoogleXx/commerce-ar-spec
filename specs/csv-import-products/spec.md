## ADDED Requirements

### Requirement: Subir CSV de productos
El sistema SHALL permitir a admin y super_admin subir un archivo CSV para importar/actualizar productos.

#### Scenario: Subida exitosa
- **WHEN** un admin o super_admin envía POST /api/products/import con un CSV válido
- **THEN** el sistema retorna 202 con un importId para tracking

#### Scenario: Usuario no autorizado intenta importar
- **WHEN** un seller envía POST /api/products/import
- **THEN** el sistema retorna 403

### Requirement: Mapeo de columnas CSV
El sistema SHALL mapear las columnas del CSV a los campos de Product automáticamente.

#### Scenario: Columnas reconocidas
- **WHEN** el CSV contiene columnas name, description, price, stock, urlImage, brand, barcode, category
- **THEN** el sistema mapea cada columna a su campo correspondiente

#### Scenario: Stock no especificado
- **WHEN** el CSV no incluye columna stock
- **THEN** el sistema asigna stock = 0

#### Scenario: Columnas no reconocidas
- **WHEN** el CSV contiene columnas adicionales como "color", "talle"
- **THEN** el sistema guarda esas columnas como JSON en metadata del producto

### Requirement: Upsert por barcode
El sistema SHALL usar el barcode como clave única para crear o actualizar productos.

#### Scenario: Producto nuevo (barcode no existe)
- **WHEN** el CSV contiene un barcode que no existe en la DB
- **THEN** el sistema crea un nuevo producto con todos los campos del CSV

#### Scenario: Producto existente (barcode existe)
- **WHEN** el CSV contiene un barcode que ya existe
- **THEN** el sistema actualiza el precio y updatedAt, y los demás campos si se especifican

#### Scenario: Múltiples registros con mismo barcode en el CSV
- **WHEN** el CSV tiene dos filas con el mismo barcode
- **THEN** el sistema procesa en orden, el último registro gana
