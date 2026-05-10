## Context

El proyecto requiere un sistema de diseño unificado "Modern Bento" con tokens de colores, tipografía y estilos de UI. El usuario proporcionando una configuración específica con paleta de colores, fuentes y estilos de layout. El objetivo es crear un sistema de tokens reutilizable en todo el proyecto.

## Goals / Non-Goals

**Goals:**
- Definir tokens de colores CSS basados en la paleta "Modern Bento"
- Configurar tipografía con fuentes Manrope (headline) e Inter (body/label)
- Establecer estilos de UI: Bento Grid layout, border-radius 24px, botones tipo pill
- Crear archivo de configuración exportable para consumo en componentes

**Non-Goals:**
- No se crearán componentes de UI en esta etapa
- No se implementará theming dinámico (dark mode)
- No se usará CSS-in-JS Libraries (Mantine, Styled Components, etc.)

## Decisions

1. **Formato de tokens**: Tokens CSS (Custom Properties) en lugar de configuración JS
   - Alternativa considerada: Archivo de configuración TypeScript
   - Rationale: Mejor integración con cualquier framework, más performante, estándar web

2. **Ubicación del archivo**: `src/styles/theme.css` o similar
   - Alternativa considerada: Dentro del directorio de componentes
   - Rationale: Centraliza los estilos globales en un solo lugar, fácil de importar globalmente

3. **Nomenclatura de tokens**: Prefijo `dc-` (Digital Curator) para evitar conflictos
   - Rationale: Evita colisiones con librerías externas y permite coexistencia

## Risks / Trade-offs

- [Riesgo] Las fuentes Manrope/Inter necesitan cargarse desde Google Fonts
  - Mitigación: Añadir preconnect en index.html o importar desde CSS

- [Riesgo] Border radius 24px muy pronunciado en móvil
  - Mitigación: Añadir media queries para ajustar en viewports pequeños