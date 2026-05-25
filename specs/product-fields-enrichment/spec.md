## ADDED Requirements

### Requirement: Producto con urlImage
El sistema SHALL permitir almacenar una URL de imagen por producto.

#### Scenario: Crear producto con urlImage
- **WHEN** se crea un producto con urlImage
- **THEN** el sistema guarda la URL y la retorna en la respuesta

#### Scenario: urlImage nulo
- **WHEN** se crea o actualiza un producto sin urlImage
- **THEN** el sistema guarda null en el campo

### Requirement: Producto con brand
El sistema SHALL requerir una marca para cada producto, con valor por defecto "Genérica".

#### Scenario: Crear producto sin brand
- **WHEN** se crea un producto sin especificar brand
- **THEN** el sistema asigna "Genérica" automáticamente

#### Scenario: Crear producto con brand personalizada
- **WHEN** se crea un producto con brand "MarcaX"
- **THEN** el sistema guarda "MarcaX"

### Requirement: Producto con barcode único
El sistema SHALL requerir un código de barra único por producto, usado como identificador para importación.

#### Scenario: Crear producto con barcode
- **WHEN** se crea un producto con barcode "1234567890123"
- **THEN** el sistema guarda el barcode y permite consultarlo

#### Scenario: Barcode duplicado
- **WHEN** se intenta crear un producto con un barcode ya existente
- **THEN** el sistema retorna error 400

### Requirement: Producto con metadata
El sistema SHALL permitir almacenar metadatos adicionales como string JSON.

#### Scenario: Crear producto con metadata
- **WHEN** se crea un producto con metadata '{"color":"rojo","talle":"M"}'
- **THEN** el sistema guarda el JSON como string

#### Scenario: Metadata null
- **WHEN** se crea un producto sin metadata
- **THEN** el sistema guarda null
