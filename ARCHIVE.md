# Guía de Sincronización de Archives

Este documento describe el proceso para sincronizar los specs archivados entre los 3 repositorios del proyecto.

## Convenciones de Base de Datos

**IMPORTANTE:** Todas las columnas en la base de datos deben estar en **inglés**.

- Nombres de columnas: snake_case inglés (ej: `document_number`, `birth_date`, `phone`)
- En Prisma usar `@map()` para mapear nombres de propiedad TypeScript a nombres de columna en inglés

## Arquitectura de Repositorios

```
┌─────────────────────┐     ┌─────────────────────┐
│ commerce-ar-spec   │────▶│ commerce-ar-spec  │
│ (Source of Truth)  │     │ (localhost)     │
└─────────────────────┘     └─────────────────────┘
          │
          ▼ (sync manual)
┌─────────────────────┐     ┌─────────────────────┐
│ commerce-ar-     │     │ commerce-ar-     │
│ backend       │     │ frontend      │
└─────────────────────┘     └─────────────────────┘
```

## Flujo de Sincronización

### Cuando archivas un cambio en `commerce-ar-spec`:

1. **Obtener la ruta del archive**
   ```
   openspec/changes/archive/YYYY-MM-DD-<change-name>/
   ```

2. **Copiar a `commerce-ar-backend`**
   ```powershell
   # Copiar directorio completo
   Copy-Item -Recurse -Path "<spec-repo>/openspec/changes/archive/YYYY-MM-DD-<change>" -Destination "<backend-repo>/openspec/changes/archive/"
   ```

3. **Copiar a `commerce-ar-frontend`**
   ```powershell
   # Copiar directorio completo
   Copy-Item -Recurse -Path "<spec-repo>/openspec/changes/archive/YYYY-MM-DD-<change>" -Destination "<frontend-repo>/openspec/changes/archive/"
   ```

4. **Hacer commit en cada repositorio**
   ```bash
   git add openspec/changes/archive/YYYY-MM-DD-<change>/
   git commit -m "chore(specs): sync archive <change> from commerce-ar-spec"
   git push
   ```

## Usando el Script de Sincronización

### Requisitos previos

- Tener los 3 repositorios descargados localmente
- Conocer las rutas locales de cada repositorio

### Ejecutar sincronización

```powershell
# Desde el repositorio principal (commerce-ar-spec) - D:\Proyects\WEB\Saas\openspec
.\sync-archive.ps1 -ChangeName "add-global-styles"
```

El script:
1. Copia el archive a `D:\Proyects\WEB\Saas\backend`
2. Copia el archive a `D:\Proyects\WEB\Saas\frontend`
3. Muestra las instrucciones de commit para cada repositorio

## Rutas de Repositorios

| Repositorio | Ruta Local |
|------------|-----------|
| commerce-ar-spec | `D:\Proyects\WEB\Saas\openspec` |
| commerce-ar-backend | `D:\Proyects\WEB\Saas\backend` |
| commerce-ar-frontend | `D:\Proyects\WEB\Saas\frontend` |

## Lista de Archives para Sincronizar

| Fecha | Change | Specs | Backend | Frontend |
|-------|--------|------|--------|---------|
| 2026-05-09 | add-global-styles | ✓ | - | - |
| 2026-05-09 | update-main-layout | ✓ | - | - |
| 2026-05-09 | implement-design-system | ✓ | - | - |
| 2026-05-09 | update-login-style | ✓ | - | - |
| 2026-05-09 | saas-product-sales-management | ✓ | - | - |

## Notas

- **No renombrar** archivos archive después de sincronizar
- **Mantener** la estructura de fechas `YYYY-MM-DD-`
- **No modificar** specs archivados en backend/frontend - son solo lectura
- **Actualizar** esta tabla después de cada sync

## Resolución de Conflictos

Si hay conflictos al sincronizar:

1. **No sobrescribir** specs existentes manualmente
2. **Usar commerce-ar-spec como source of truth**
3. **Si hay cambios necesarios**, crear un nuevo cambio en spec y archivar de nuevo