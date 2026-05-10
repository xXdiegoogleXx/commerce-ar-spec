- [x] 1.1 Initialize Node.js project with package.json and install dependencies (express, prisma, bcrypt, jsonwebtoken, zod, cors, dotenv)
- [x] 1.2 Set up project structure: controllers/, services/, routes/, middlewares/, prisma/ directories
- [x] 1.3 Configure environment variables (.env) with DATABASE_URL, JWT_SECRET, PORT
- [x] 1.4 Create Prisma schema with User, Product, Sale, and SaleItem models and run initial migration
- [x] 1.5 Set up Express app entry point with middleware (cors, json parser, error handler)

## 2. Authentication System

- [x] 2.1 Implement password hashing utility using bcrypt
- [x] 2.2 Create auth service with register and login functions
- [x] 2.3 Create JWT token generation and verification utilities
- [x] 2.4 Implement POST /api/auth/register endpoint with validation
- [x] 2.5 Implement POST /api/auth/login endpoint with credential verification
- [x] 2.6 Implement POST /api/auth/refresh endpoint for token refresh
- [x] 2.7 Implement POST /api/auth/logout endpoint to invalidate refresh tokens

## 3. Authorization Middleware

- [x] 3.1 Create authentication middleware to verify JWT and attach user to request
- [x] 3.2 Create role-based authorization middleware to restrict routes by role (admin, seller)
- [x] 3.3 Integrate auth middleware into protected routes

## 4. Product Management API

- [x] 4.1 Implement product service with create, update, delete, and list functions
- [x] 4.2 Create GET /api/products endpoint with search and category filtering
- [x] 4.3 Create GET /api/products/:id endpoint for product details
- [x] 4.4 Create POST /api/products endpoint (admin only) with validation
- [x] 4.5 Create PUT /api/products/:id endpoint (admin only) with validation
- [x] 4.6 Create DELETE /api/products/:id endpoint (admin only) with sales check

## 5. Sales Management API

- [x] 5.1 Implement sales service with record sale and list sales functions
- [x] 5.2 Create POST /api/sales endpoint with atomic transaction (sale + stock update)
- [x] 5.3 Create GET /api/sales endpoint with role-based filtering (own sales vs all sales)
- [x] 5.4 Create GET /api/sales/:id endpoint for sale details with product info

## 6. Dashboard API

- [x] 6.1 Implement dashboard service with metrics calculation functions
- [x] 6.2 Create GET /api/dashboard/sales-by-period endpoint (admin only)
- [x] 6.3 Create GET /api/dashboard/top-products endpoint (admin only)
- [x] 6.4 Create GET /api/dashboard/total-revenue endpoint (admin only)
- [x] 6.5 Create GET /api/dashboard endpoint returning combined metrics (admin only)

## 7. User Management API (Admin)

- [x] 7.1 Implement user service with list, create, update, delete functions
- [x] 7.2 Create GET /api/users endpoint (admin only)
- [x] 7.3 Create POST /api/users endpoint (admin only) with role assignment
- [x] 7.4 Create PUT /api/users/:id endpoint (admin only)
- [x] 7.5 Create DELETE /api/users/:id endpoint (admin only)

## 8. Frontend Setup

- [x] 8.1 Initialize React project with Vite and set up project structure (components/, pages/, services/, hooks/, store/)
- [x] 8.2 Install dependencies: react-router-dom, @tanstack/react-query, react-hook-form, @hookform/resolvers, zod, tailwindcss, shadcn/ui, axios
- [x] 8.3 Configure Tailwind CSS and initialize Shadcn/UI component library
- [x] 8.4 Set up React Router with routes for login, register, products, sales, dashboard, users (admin)
- [x] 8.5 Create protected route component with auth and role checks

## 9. Frontend Authentication

- [x] 9.1 Create auth service with login, register, logout, and token refresh API calls
- [x] 9.2 Implement auth context/store for managing auth state and tokens
- [x] 9.3 Create login page with form validation using React Hook Form + Zod
- [x] 9.4 Create registration page with form validation
- [x] 9.5 Implement JWT token storage (HTTP-only cookies or secure storage) and automatic injection into API requests

## 10. Frontend Product Management

- [x] 10.1 Create product service with API calls for list, create, update, delete
- [x] 10.2 Build product list page with search input, category filter, and TanStack Query
- [x] 10.3 Build product create/edit form using React Hook Form + Zod with Shadcn/UI components
- [x] 10.4 Implement product delete with confirmation dialog

## 11. Frontend Sales Management

- [x] 11.1 Create sales service with API calls for record sale and list sales
- [x] 11.2 Build sales history page with TanStack Query and role-based view (own vs all)
- [x] 11.3 Build record sale page with product selector, quantity input, and form validation

## 12. Frontend Dashboard

- [x] 12.1 Create dashboard service with API calls for metrics
- [x] 12.2 Build dashboard page with metric cards for sales by period, top products, and total revenue
- [x] 12.3 Integrate charts or tables for top products and sales data (admin only access)

## 13. Frontend User Management (Admin)

- [x] 13.1 Create user management service with API calls
- [x] 13.2 Build user list page with role display (admin only)
- [x] 13.3 Build create/edit user form with role assignment (admin only)

## 14. Integration and Testing

- [x] 14.1 Connect frontend to backend API and verify all CRUD flows end-to-end
- [x] 14.2 Test role-based access restrictions on frontend and backend
- [x] 14.3 Test automatic stock deduction on sales and error handling for insufficient stock
- [x] 14.4 Verify dashboard metrics display correctly with test data
