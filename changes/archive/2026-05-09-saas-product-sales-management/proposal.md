## Why

Small and medium businesses lack a tailored, modern SaaS solution for integrated product and sales management with role-based access control. This platform addresses the need for a scalable, secure, and user-friendly system to streamline operations and track key business metrics.

## What Changes

- Implement full user authentication system with JWT and bcrypt password hashing
- Add role-based access control (admin, seller) with restricted permissions per role
- Build product management module with ABM operations, search/filter, and stock tracking
- Develop sales management system with automatic stock updates on sales and sales history
- Create admin dashboard with key metrics: sales per period, top-selling products, total revenue
- Set up React-based frontend using Tailwind CSS + Shadcn/UI with React Router, TanStack Query, React Hook Form + Zod
- Deploy Node.js + Express backend with Prisma ORM, PostgreSQL database, and REST API
- Implement security middleware for authorization and data validation

## Capabilities

### New Capabilities
- `user-auth`: JWT-based authentication with login/logout, password hashing via bcrypt
- `role-management`: Role-based access control with admin and seller roles, permission restrictions
- `product-management`: CRUD operations for products, search/filtering, stock tracking, category management
- `sales-management`: Sales recording, automatic stock deduction, sales history per user and global
- `dashboard-metrics`: Display of key business metrics including sales by period, top products, total revenue
- `frontend-app`: React SPA with Tailwind CSS + Shadcn UI, form handling, API integration, navigation
- `backend-api`: RESTful API with Express, Prisma ORM, PostgreSQL, validation, and authorization middleware

### Modified Capabilities

(No existing capabilities to modify)

## Impact

- New codebase for frontend and backend applications
- New PostgreSQL database schema for users, products, sales, roles
- Dependency additions: React, Tailwind CSS, Shadcn/UI, TanStack Query, React Hook Form, Zod, Express, Prisma, PostgreSQL, JWT, bcrypt
- Creation of RESTful API endpoints for all modules
- Frontend component library and page structure implementation
