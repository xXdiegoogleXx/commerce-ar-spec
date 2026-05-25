## ADDED Requirements

### Requirement: Procesamiento asíncrono de importación
El sistema SHALL procesar la importación en segundo plano y permitir consultar el estado.

#### Scenario: Consultar progreso
- **WHEN** se envía GET /api/products/import/:importId/status
- **THEN** el sistema retorna el progreso actual { total, processed, errors, status }

#### Scenario: Estado inicial
- **WHEN** se consulta el estado inmediatamente después de iniciar la importación
- **THEN** el sistema retorna status "processing" con processed=0

#### Scenario: Importación completada
- **WHEN** la importación termina exitosamente
- **THEN** el sistema retorna status "completed" con processed = total y lista de errores

### Requirement: Manejo de errores por fila
El sistema SHALL continuar procesando aunque una fila individual falle.

#### Scenario: Fila con error
- **WHEN** una fila del CSV tiene datos inválidos (barcode vacío, price no numérico)
- **THEN** el sistema la salta, registra el error y continúa con la siguiente

#### Scenario: Consultar errores al finalizar
- **WHEN** la importación termina con errores
- **THEN** el sistema retorna status "completed_with_errors" con el detalle de cada error

### Requirement: Notificación al completar
El sistema SHALL notificar al usuario cuando la importación finalice.

#### Scenario: Notificación push
- **WHEN** la importación cambia a estado "completed" o "completed_with_errors"
- **THEN** el frontend muestra una notificación toast con el resumen

#### Scenario: Polling automático
- **WHEN** el frontend inicia una importación
- **THEN** hace polling cada 2 segundos hasta que el estado sea "completed" o "completed_with_errors"
