## ADDED Requirements

### Requirement: RESTful API structure
The system SHALL provide a RESTful API with Express, organized into controllers/, services/, routes/, and middlewares/ directories.

#### Scenario: API responds to health check
- **WHEN** a GET request is made to /api/health
- **THEN** the system SHALL return a 200 OK response with status "ok"

#### Scenario: API handles undefined routes
- **WHEN** a request is made to a non-existent endpoint
- **THEN** the system SHALL return a 404 Not Found error

### Requirement: Authentication routes
The system SHALL provide POST /api/auth/register, POST /api/auth/login, POST /api/auth/logout, and POST /api/auth/refresh endpoints.

#### Scenario: Register endpoint creates user
- **WHEN** a POST request is made to /api/auth/register with valid user data
- **THEN** the system SHALL create a new user and return a success response

#### Scenario: Login endpoint returns tokens
- **WHEN** a POST request is made to /api/auth/login with valid credentials
- **THEN** the system SHALL return a JWT access token and refresh token

#### Scenario: Refresh endpoint issues new access token
- **WHEN** a POST request is made to /api/auth/refresh with a valid refresh token
- **THEN** the system SHALL return a new access token

### Requirement: Product API routes
The system SHALL provide RESTful endpoints for products: GET /api/products, GET /api/products/:id, POST /api/products, PUT /api/products/:id, DELETE /api/products/:id.

#### Scenario: List products endpoint
- **WHEN** a GET request is made to /api/products with optional query params (search, category)
- **THEN** the system SHALL return the product list with filtering applied

#### Scenario: Create product endpoint
- **WHEN** an authenticated admin sends a POST request to /api/products with valid product data
- **THEN** the system SHALL create the product and return 201 Created with the product data

#### Scenario: Delete product endpoint
- **WHEN** an authenticated admin sends a DELETE request to /api/products/:id
- **THEN** the system SHALL delete the product if no sales exist, or return an error

### Requirement: Sales API routes
The system SHALL provide endpoints: POST /api/sales (record sale), GET /api/sales (list sales), GET /api/sales/:id (sale details).

#### Scenario: Record sale endpoint
- **WHEN** an authenticated user sends a POST request to /api/sales with product ID and quantity
- **THEN** the system SHALL create the sale, deduct stock, and return the sale record

#### Scenario: List sales endpoint with role filter
- **WHEN** an authenticated user sends a GET request to /api/sales
- **THEN** the system SHALL return sales for that user (seller) or all sales (admin)

### Requirement: Dashboard API routes
The system SHALL provide GET /api/dashboard endpoints returning metrics, restricted to admin users.

#### Scenario: Dashboard metrics endpoint
- **WHEN** an authenticated admin sends a GET request to /api/dashboard with optional date range params
- **THEN** the system SHALL return sales by period, top products, and total revenue

### Requirement: User management routes (admin only)
The system SHALL provide endpoints: GET /api/users, POST /api/users, PUT /api/users/:id, DELETE /api/users/:id for admin users.

#### Scenario: List users endpoint
- **WHEN** an authenticated admin sends a GET request to /api/users
- **THEN** the system SHALL return the list of all users with their roles

#### Scenario: Create user with role
- **WHEN** an authenticated admin sends a POST request to /api/users with user data and role
- **THEN** the system SHALL create the user with the specified role

### Requirement: Database models with Prisma
The system SHALL define Prisma models for User, Product, Sale, and SaleItem with proper relations.

#### Scenario: User model includes role and relations
- **WHEN** the Prisma schema is introspected
- **THEN** the User model SHALL include id, email, passwordHash, name, role, createdAt, updatedAt, and relations to Sale

#### Scenario: Product model includes stock and category
- **WHEN** the Prisma schema is introspected
- **THEN** the Product model SHALL include id, name, description, price, stock, category, createdAt, updatedAt

#### Scenario: Sale model includes user and items
- **WHEN** the Prisma schema is introspected
- **THEN** the Sale model SHALL include id, userId, totalAmount, createdAt, and relation to SaleItem

### Requirement: Input validation middleware
The system SHALL validate all incoming request bodies and query parameters using a validation library (e.g., Zod) and return 400 for invalid input.

#### Scenario: Validation rejects invalid input
- **WHEN** a request is made with invalid or missing required fields
- **THEN** the system SHALL return a 400 Bad Request with validation error details

### Requirement: Error handling middleware
The system SHALL include global error handling middleware that catches errors and returns appropriate HTTP status codes and messages.

#### Scenario: Unhandled error returns 500
- **WHEN** an unexpected error occurs during request processing
- **THEN** the system SHALL return a 500 Internal Server Error with a generic message (not exposing internals)
