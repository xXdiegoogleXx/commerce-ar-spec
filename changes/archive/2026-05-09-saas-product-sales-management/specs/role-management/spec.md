## ADDED Requirements

### Requirement: Admin role full access
The system SHALL grant users with role "admin" full access to all system features including user management, product management, sales management, and dashboard metrics.

#### Scenario: Admin accesses user management
- **WHEN** an admin user attempts to access user management endpoints
- **THEN** the system SHALL allow the request and return the requested data

#### Scenario: Admin creates new user with role
- **WHEN** an admin user creates a new user and assigns a role (admin or seller)
- **THEN** the system SHALL create the user with the specified role

### Requirement: Seller role restricted access
The system SHALL restrict users with role "seller" to viewing products, registering their own sales, and viewing their own sales history. Sellers SHALL NOT access user management or modify products.

#### Scenario: Seller views products
- **WHEN** a seller user requests the product list
- **THEN** the system SHALL return the product catalog

#### Scenario: Seller registers a sale
- **WHEN** a seller user submits a new sale with valid product and quantity
- **THEN** the system SHALL record the sale associated with the seller

#### Scenario: Seller views own sales history
- **WHEN** a seller user requests their sales history
- **THEN** the system SHALL return only sales recorded by that seller

#### Scenario: Seller attempts to access user management
- **WHEN** a seller user attempts to access user management endpoints
- **THEN** the system SHALL return a 403 Forbidden error

#### Scenario: Seller attempts to modify products
- **WHEN** a seller user attempts to create, update, or delete a product
- **THEN** the system SHALL return a 403 Forbidden error

### Requirement: Role-based authorization middleware
The system SHALL use middleware to check user roles on protected routes and deny access if the user lacks the required role.

#### Scenario: Middleware allows authorized role
- **WHEN** a request is made with a valid JWT containing a role that is authorized for the route
- **THEN** the system SHALL allow the request to proceed

#### Scenario: Middleware denies unauthorized role
- **WHEN** a request is made with a valid JWT containing a role that is NOT authorized for the route
- **THEN** the system SHALL return a 403 Forbidden error

#### Scenario: Middleware rejects missing or invalid token
- **WHEN** a request is made without a valid JWT
- **THEN** the system SHALL return a 401 Unauthorized error
