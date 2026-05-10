## ADDED Requirements

### Requirement: Create product
The system SHALL allow admin users to create new products with name, description, price, stock, and category.

#### Scenario: Admin creates a product successfully
- **WHEN** an admin user submits valid product data (name, description, price, stock, category)
- **THEN** the system SHALL create the product and return the product details with a unique ID

#### Scenario: Create product with invalid data
- **WHEN** an admin user submits product data with missing required fields or invalid values (e.g., negative price)
- **THEN** the system SHALL return a validation error with details

#### Scenario: Non-admin attempts to create product
- **WHEN** a seller or unauthenticated user attempts to create a product
- **THEN** the system SHALL return a 403 Forbidden or 401 Unauthorized error

### Requirement: Update product
The system SHALL allow admin users to update existing product information.

#### Scenario: Admin updates product details
- **WHEN** an admin user submits updated data for an existing product
- **THEN** the system SHALL update the product and return the updated product details

#### Scenario: Update non-existent product
- **WHEN** an admin user attempts to update a product that does not exist
- **THEN** the system SHALL return a 404 Not Found error

### Requirement: Delete product
The system SHALL allow admin users to delete products, but only if no sales exist for that product.

#### Scenario: Admin deletes a product with no sales
- **WHEN** an admin user deletes a product that has no associated sales
- **THEN** the system SHALL delete the product and return a success response

#### Scenario: Admin attempts to delete product with sales
- **WHEN** an admin user attempts to delete a product that has associated sales
- **THEN** the system SHALL return an error indicating the product cannot be deleted

### Requirement: List products
The system SHALL allow all authenticated users to view the product catalog with support for search and filtering by name, category, and stock status.

#### Scenario: List all products
- **WHEN** an authenticated user requests the product list
- **THEN** the system SHALL return all products with their details

#### Scenario: Search products by name
- **WHEN** an authenticated user searches for products by name
- **THEN** the system SHALL return products whose name matches the search term

#### Scenario: Filter products by category
- **WHEN** an authenticated user filters products by category
- **THEN** the system SHALL return only products belonging to the specified category

### Requirement: View product details
The system SHALL allow all authenticated users to view detailed information for a specific product.

#### Scenario: View existing product details
- **WHEN** an authenticated user requests details for an existing product by ID
- **THEN** the system SHALL return the full product details

#### Scenario: View non-existent product
- **WHEN** an authenticated user requests details for a product that does not exist
- **THEN** the system SHALL return a 404 Not Found error
