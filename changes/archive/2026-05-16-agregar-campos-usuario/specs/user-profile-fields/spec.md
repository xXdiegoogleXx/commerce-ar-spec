## ADDED Requirements

### Requirement: Número de documento obligatorio
El sistema DEBE incluir un campo `documentNumber` (mapeado a `numeroDocumento` en DB) de tipo String que sea obligatorio para el registro y edición de usuarios.

#### Scenario: Registro con documento válido
- **WHEN** usuario proporciona documentNumber válido
- **THEN** el sistema guarda el documento y permite completar el registro

#### Scenario: Registro sin documento
- **WHEN** usuario intenta registrarse sin documentNumber
- **THEN** el sistema muestra error indicando que el documento es obligatorio

### Requirement: Teléfono con validación de formato
El sistema DEBE incluir un campo `phone` (mapeado a `telefono` en DB) de tipo String que valide el formato argentino (+54 9XXXXXXXX).

#### Scenario: Teléfono con formato válido
- **WHEN** usuario proporciona teléfono en formato +54 9XXXXXXXX
- **THEN** el sistema guarda el teléfono exitosamente

#### Scenario: Teléfono con formato inválido
- **WHEN** usuario proporciona teléfono en formato inválido
- **THEN** el sistema muestra error indicando formato esperado (+54 9XXXXXXXX)

### Requirement: Fecha de nacimiento opcional
El sistema DEBE incluir un campo opcional `birthDate` (mapeado a `fechaNacimiento` en DB) de tipo Date que valide que la fecha sea válida.

#### Scenario: Fecha de nacimiento válida
- **WHEN** usuario proporciona fecha de nacimiento válida
- **THEN** el sistema guarda la fecha

#### Scenario: Fecha de nacimiento inválida
- **WHEN** usuario proporciona fecha de nacimiento inválida (futura o muy antigua)
- **THEN** el sistema muestra error indicando que la fecha no es válida

### Requirement: Sexo obligatorio con opciones predefinidas
El sistema DEBE incluir un campo `gender` (mapeado a `sexo` en DB) obligatorio con valores predefinidos: masculino, femenino, otros.

#### Scenario: Sexo seleccionado válidamente
- **WHEN** usuario selecciona una opción de gender (masculino/femenino/otros)
- **THEN** el sistema guarda la selección

#### Scenario: Sexo no seleccionado
- **WHEN** usuario intenta guardar sin seleccionar gender
- **THEN** el sistema muestra error indicando que el sexo es obligatorio