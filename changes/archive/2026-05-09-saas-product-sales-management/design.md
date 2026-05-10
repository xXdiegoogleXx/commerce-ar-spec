## Context

Building a new SaaS web application for small and medium businesses to manage products and sales with role-based access. The system requires a modern, scalable architecture with separate frontend and backend applications. No existing codebase is present — this is a greenfield project.

## Goals / Non-Goals

**Goals:**
- Deliver a full-stack SaaS application with product and sales management
- Implement secure JWT-based authentication with role-based access control (admin, seller)
- Provide a modern, responsive UI using React, Tailwind CSS, and Shadcn/UI
- Build a RESTful API with Node.js, Express, Prisma ORM, and PostgreSQL
- Ensure automatic stock updates on sales and role-restricted operations
- Include a dashboard with key business metrics

**Non-Goals:**
- Multi-tenant architecture (out of scope for initial version)
- GraphQL API (will use REST; GraphQL considered for future scaling)
- Mobile application (web-only for initial release)
- Payment/subscription integration (Stripe, etc. — future improvement)
- Advanced reporting (Excel/PDF export — future improvement)

## Decisions

### Frontend Framework: React + Tailwind CSS + Shadcn/UI
- **Rationale**: React is the industry standard SPA framework. Tailwind + Shadcn provides modern, accessible, and customizable UI components with excellent developer experience.
- **Alternatives considered**: Material UI (heavier bundle, less flexible styling), Ant Design (less modern look, larger bundle)

### State Management: TanStack Query
- **Rationale**: Ideal for server state management — handles caching, background refetching, and synchronization with minimal boilerplate.
- **Alternatives considered**: Redux Toolkit (more boilerplate, better for complex client state), Zustand (lighter but less features for server state)

### Form Handling: React Hook Form + Zod
- **Rationale**: React Hook Form provides performant form handling with minimal re-renders; Zod offers TypeScript-first schema validation with excellent error messages.
- **Alternatives considered**: Formik (older, more re-renders), Yup (less TypeScript-native than Zod)

### Backend Framework: Node.js + Express
- **Rationale**: Lightweight, widely adopted, and sufficient for RESTful API needs. Fast development cycle.
- **Alternatives considered**: NestJS (more opinionated, steeper learning curve, potentially overkill for initial scope)

### ORM: Prisma
- **Rationale**: Type-safe ORM with excellent developer experience, intuitive schema definition, and migration management. Strong typing with TypeScript.
- **Alternatives considered**: TypeORM (less intuitive schema, weaker type safety)

### Database: PostgreSQL
- **Rationale**: Robust, ACID-compliant relational database. Well-suited for structured data (users, products, sales) with relationships.

### API Style: REST
- **Rationale**: Simpler to implement and widely understood. Sufficient for the current feature set.
- **Alternatives considered**: GraphQL (more flexible queries but adds complexity; can migrate later if needed)

### Authentication: JWT + bcrypt
- **Rationale**: JWT provides stateless authentication suitable for SPAs. bcrypt is the standard for secure password hashing.
- **Token storage**: HTTP-only cookies for refresh tokens; access tokens stored in memory/secure context to mitigate XSS.

### Role-Based Access: Middleware
- **Rationale**: Express middleware pattern is clean and composable. Each protected route checks the user's role from the JWT payload.

## Risks / Trade-offs

- **Monolithic backend vs microservices** → Monolithic is simpler for initial scope; can extract services later if needed
- **REST vs GraphQL** → REST is simpler now; GraphQL adds flexibility but complexity. Mitigation: design clean, resource-oriented REST endpoints for easy future migration
- **No multi-tenancy initially** → Limits SaaS scalability per tenant isolation. Mitigation: design data models with `tenantId` field ready for future addition
- **JWT in HTTP-only cookies** → Requires refresh token rotation strategy. Mitigation: implement short-lived access tokens with refresh endpoint
- **Stock updates on sales** → Race conditions possible with concurrent sales. Mitigation: use database transactions via Prisma for atomic stock deduction and sales recording
