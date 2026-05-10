## ADDED Requirements

### Requirement: Bento Grid layout
El sistema DEBE exponer tokens para implementar un layout tipo Bento Grid.

#### Scenario: Bento Grid tokens
- **WHEN** se usan los tokens de layout del sistema
- **THEN** el resultado es un grid con celdas de tamaño variable tipo bento

### Requirement: Border radius 24px
El sistema DEBE exponer un token `--dc-radius` con valor `24px` para bordes redondeados.

#### Scenario: Border radius usage
- **WHEN** un componente usa el token `--dc-radius`
- **THEN** el borde tiene un radio de 24px

### Requirement: Pill button shape
El sistema DEBE aplicar forma de píldora (border-radius exaggerado) para botones.

#### Scenario: Pill button styling
- **WHEN** un botón usa los estilos del sistema
- **THEN** tiene border-radius que genera forma de píldora