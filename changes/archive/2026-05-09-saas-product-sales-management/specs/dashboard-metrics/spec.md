## ADDED Requirements

### Requirement: Sales by period metric
The system SHALL provide a dashboard metric showing total sales within a specified date range (daily, weekly, monthly, or custom range). Access is restricted to admin users only.

#### Scenario: Admin views sales for a specific period
- **WHEN** an admin user requests sales metrics for a valid date range
- **THEN** the system SHALL return the total sales amount and count of sales within that period

#### Scenario: Non-admin attempts to view sales metrics
- **WHEN** a seller user attempts to access dashboard sales metrics
- **THEN** the system SHALL return a 403 Forbidden error

#### Scenario: Invalid date range
- **WHEN** an admin user requests sales metrics with an invalid date range (end date before start date)
- **THEN** the system SHALL return a validation error

### Requirement: Top-selling products metric
The system SHALL provide a metric listing the top-selling products by quantity or revenue within a specified period. Access is restricted to admin users only.

#### Scenario: Admin views top products by quantity
- **WHEN** an admin user requests top-selling products by quantity for a given period
- **THEN** the system SHALL return a list of products sorted by total quantity sold, including product name, quantity sold, and revenue

#### Scenario: Admin views top products by revenue
- **WHEN** an admin user requests top-selling products by revenue for a given period
- **THEN** the system SHALL return a list of products sorted by total revenue generated

### Requirement: Total revenue metric
The system SHALL provide a metric showing total revenue within a specified period. Access is restricted to admin users only.

#### Scenario: Admin views total revenue
- **WHEN** an admin user requests total revenue for a given period
- **THEN** the system SHALL return the sum of all sales amounts within that period

### Requirement: Dashboard summary endpoint
The system SHALL provide a combined dashboard endpoint that returns all key metrics (sales by period, top products, total revenue) in a single response for the current month by default.

#### Scenario: Admin views dashboard summary
- **WHEN** an admin user requests the dashboard summary
- **THEN** the system SHALL return sales by period, top-selling products, and total revenue in a single response

#### Scenario: Dashboard with custom period
- **WHEN** an admin user requests the dashboard summary with a custom date range
- **THEN** the system SHALL return all metrics calculated for the specified period
