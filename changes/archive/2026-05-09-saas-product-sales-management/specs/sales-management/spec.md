## ADDED Requirements

### Requirement: Record a sale
The system SHALL allow seller and admin users to record a new sale, associating it with the authenticated user, deducting stock automatically, and preventing overselling.

#### Scenario: Successful sale recording
- **WHEN** an authenticated user records a sale with valid product ID and quantity that is available in stock
- **THEN** the system SHALL create the sale record, deduct the quantity from product stock, and return the sale details

#### Scenario: Sale with insufficient stock
- **WHEN** an authenticated user records a sale with a quantity exceeding available stock
- **THEN** the system SHALL return an error indicating insufficient stock and SHALL NOT create the sale or modify stock

#### Scenario: Sale for non-existent product
- **WHEN** an authenticated user records a sale for a product that does not exist
- **THEN** the system SHALL return a 404 Not Found error and SHALL NOT create the sale

#### Scenario: Atomic stock update on sale
- **WHEN** an authenticated user records a sale
- **THEN** the system SHALL use a database transaction to ensure the sale and stock update either both succeed or both fail

### Requirement: View sales history per user
The system SHALL allow users to view their own sales history, and allow admins to view all sales.

#### Scenario: Seller views own sales history
- **WHEN** a seller user requests their sales history
- **THEN** the system SHALL return only sales recorded by that seller

#### Scenario: Admin views all sales
- **WHEN** an admin user requests the sales history
- **THEN** the system SHALL return all sales in the system

#### Scenario: Seller attempts to view another seller's sales
- **WHEN** a seller user requests sales history filtered by another seller's ID
- **THEN** the system SHALL return only their own sales or a 403 Forbidden error

### Requirement: Sales data includes product details
The system SHALL include product name, price, and quantity sold in each sale record returned to the user.

#### Scenario: Sale record includes product information
- **WHEN** a user views sales history
- **THEN** each sale record SHALL include product name, unit price, quantity sold, and total amount
