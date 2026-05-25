## ADDED Requirements

### Requirement: Barra de progreso en vista de productos
El sistema SHALL mostrar una barra de progreso durante la importación en la esquina inferior derecha.

#### Scenario: Progreso visible durante importación
- **WHEN** hay una importación en curso y el usuario está en /products
- **THEN** se muestra una barra de progreso con porcentaje y contador (procesados/total)

#### Scenario: Sin importación activa
- **WHEN** no hay importación en curso
- **THEN** la barra de progreso no se muestra

### Requirement: Ocultar toast al cambiar de vista
El sistema SHALL ocultar el toast de progreso cuando el usuario navega a otra ruta.

#### Scenario: Navegación durante importación
- **WHEN** el usuario cambia de /products a /dashboard mientras hay una importación activa
- **THEN** el toast de progreso se oculta inmediatamente
- **AND** el polling se detiene

#### Scenario: Volver a vista de productos
- **WHEN** el usuario vuelve a /products
- **THEN** no se reanuda la barra (la importación continúa en backend pero la UI no la muestra hasta recargar)

### Requirement: Toast de notificación al finalizar
El sistema SHALL mostrar un toast con el resumen de la importación al completarse.

#### Scenario: Importación exitosa
- **WHEN** la importación se completa sin errores
- **THEN** se muestra un toast verde con "Importación completada: N productos procesados"

#### Scenario: Importación con errores
- **WHEN** la importación se completa con errores
- **THEN** se muestra un toast amarillo con "Importación completada con N errores"
