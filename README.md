# OpenSpec - Sistema de Gestión de Decisiones y Trazabilidad

Este directorio contiene el sistema de especificación y trazabilidad del proyecto.

## Propósito

OpenSpec documenta:
- **Propuestas de cambio** (proposals)
- **Decisiones de diseño** (designs)
- **Especificaciones** (specs)
- **Tareas de implementación** (tasks)

## Estructura

```
openspec/
├── config.yaml              # Configuración principal
├── changes/              # Cambios activos y archivados
│   └── archive/         # Specs completados (YYYY-MM-DD-name/)
│       └── <change>/
│           ├── proposal.md
│           ├── design.md
│           ├── specs/
│           └── tasks.md
└── .git/               # Git repository
```

## Repositorios

Este proyecto usa **3 repositorios sincronizados**:

| Repositorio | Propósito |
|------------|-----------|
| `commerce-ar-spec` | Source of truth para specs archivados |
| `commerce-ar-backend` | Backend del proyecto |
| `commerce-ar-frontend` | Frontend del proyecto |

## Sincronización

Cuando se archiva un change en `commerce-ar-spec`, es necesario sincronizar a los otros repositorios.

### Flujo de Sincronización

1. **Archivar** → Usar `/opsx-archive <change-name>`
2. **Sincronizar** → Copiar el directorio archivado a los otros repos:
   - `commerce-ar-backend/openspec/changes/archive/<date>-<change>/`
   - `commerce-ar-frontend/openspec/changes/archive/<date>-<change>/`

### Guías de Sincronización

Ver [ARCHIVE.md](ARCHIVE.md) para instrucciones detalladas.

## Workflow

1. **Proponer** → `/opsx-propose <nombre>` → Crear proposal, design, specs, tasks
2. **Implementar** → `/opsx-apply <nombre>` → Ejecutar tareas
3. **Archivar** → `/opsx-archive <nombre>` → Mover a archive
4. **Sincronizar** → Copiar archive a otros repositorios

## Comandos

```bash
# Listar cambios activos
openspec list

# Estado de un cambio
openspec status --change <nombre>

# Crear nuevo cambio
openspec new change <nombre>

# Instrucciones de un artefacto
openspec instructions <artefacto> --change <nombre> --json
```

## Contacto

Para preguntas sobre el sistema, consultar la documentación en [ARCHIVE.md](ARCHIVE.md).