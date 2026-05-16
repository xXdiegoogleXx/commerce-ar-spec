## Contexto

El proyecto actual tiene un sistema de usuarios básico con email y contraseña. Se necesita extender el modelo de usuario para incluir datos personales adicionales y crear un sistema de gestión diferenciado por roles.

Tecnologías actuales:
- Backend: Node.js con Express, Prisma ORM
- Frontend: React con React Router
- Base de datos: PostgreSQL

## Objetivos / No-objetivos

**Objetivos:**
- Agregar campos: documentNumber, phone, birthDate, gender (nombres en inglés en código, español en DB)
- Implementar validación de teléfono (formato argentino: +54 9XXXXXXXX)
- Crear página de ABM de usuarios para Administrador
- Restringir edición de campos para usuarios comunes (solo teléfono)
- Actualizar registro para incluir campos obligatorios

**No-objetivos:**
- No implementar autenticación de dos factores
- No modificar sistema de roles existente (solo usar rol actual)
- No crear exportación de usuarios a CSV/PDF

## Decisiones

1. **Almacenamiento de teléfono**: Formato string con prefijo internacional
   - Alternativa: Número sin prefijo
   - Rationale: Formato estandarizado permite internacionalización

2. **Enum de sexo**: Valores fijos en base de datos
   - Alternativa: Campo libre tipo string
   - Rationale: Consistencia de datos, facilita filtros y reportes

3. **Validación de fecha de nacimiento**: Validar que sea fecha válida y persona mayor de edad
   - Rationale: Requisito de negocio para ciertos servicios

4. **API REST para ABM**: Endpoint `/api/users` con métodos CRUD
   - Alternativa: Usar mismo endpoint de perfil
   - Rationale: Separación clara entre gestión admin y perfil propio

5. **Frontend: Componente reutilizable**: FormFieldsUser para ambos formularios
   - Rationale: DRY, misma validación en registro y edición

## Riesgos / Compensaciones

- [Riesgo] Validación de documento puede requerir algoritmo de verificación (DNI, CUIL)
  - Compensación: Por ahora solo validación de formato, no verificación real

- [Riesgo] Fecha de nacimiento puede exponer datos sensibles
  - Compensación: Solo mostrar año en lista de usuarios, fecha completa en detalle

- [Riesgo] Campo documento obligatorio puede rechazar usuarios existentes sin documento
  - Compensación: Migración permite valores nulos temporalmente

## Plan de Migración

1. Agregar columnas a tabla users en Prisma (nullable inicialmente)
2. Actualizar tipos TypeScript para nuevos campos
3. Crear endpoints API para ABM
4. Crear página de gestión de usuarios en frontend
5. Actualizar formulario de registro
6. Hacer obligatorio documento y teléfono después de migración de datos

## Preguntas Abiertas

- ¿Qué formato específico de documento? (DNI, CUIL, CUIT,护照)
- ¿Longitud máxima del número de documento?
- ¿Los usuarios existentes deben completar los campos?