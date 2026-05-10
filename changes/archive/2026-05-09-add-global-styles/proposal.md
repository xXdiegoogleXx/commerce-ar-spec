## Why

El proyecto necesita un sistema de diseño unificado para mantener consistencia visual en todas las vistas de la página. Actualmente no existen estilos globales definidos, lo que causa inconsistencias en colores, tipografía y componentes de UI. Un design system centralizado mejora la experiencia de desarrollo y la coherencia visual del producto.

## What Changes

- Sistema de tokens de colores con paleta completa (primary, secondary, tertiary, neutral)
- Configuración global de tipografía (headline, body, label)
- Estilos de UI unificados (Bento Grid layout, border radius 24px, botones pill)
- Tokens CSS o configuración de theme para uso en componentes

## Capabilities

### New Capabilities
- `global-colors`: Define tokens de color primarios, secundarios, terciarios y neutrales del design system
- `global-typography`: Configura familias tipográficas para headline, body y label
- `global-ui-styles`: Establece estilos de layout, border radius y formas de botones

### Modified Capabilities
- Ninguno. Este es un feature nuevo.

## Impact

- Nuevo archivo de configuración de theme/design system
- Tokens CSS o variables de tema para consumo en componentes