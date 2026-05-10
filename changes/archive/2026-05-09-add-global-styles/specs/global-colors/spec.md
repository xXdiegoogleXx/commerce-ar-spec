## ADDED Requirements

### Requirement: Primary color token
El sistema DEBE exponer un token CSS `--dc-primary` con el valor hex `#BEF226` (Neon Lime) para uso como color principal en elementos destacados.

#### Scenario: Primary color usage
- **WHEN** un componente usa el token `--dc-primary`
- **THEN** el color renderizado es exactamente `#BEF226`

### Requirement: Secondary color token
El sistema DEBE exponer un token CSS `--dc-secondary` con el valor hex `#000000` (Deep Black) para uso como color secundario/fondo.

#### Scenario: Secondary color usage
- **WHEN** un componente usa el token `--dc-secondary`
- **THEN** el color renderizado es exactamente `#000000`

### Requirement: Tertiary color token
El sistema DEBE exponer un token CSS `--dc-tertiary` con el valor hex `#FF4D4D` (Coral Red) para uso en estados de error o accents.

#### Scenario: Tertiary color usage
- **WHEN** un componente usa el token `--dc-tertiary`
- **THEN** el color renderizado es exactamente `#FF4D4D`

### Requirement: Neutral color token
El sistema DEBE exponer un token CSS `--dc-neutral` con el valor hex `#F7F7F7` (Off-White) para fondos neutrales.

#### Scenario: Neutral color usage
- **WHEN** un componente usa el token `--dc-neutral`
- **THEN** el color renderizado es exactamente `#F7F7F7`