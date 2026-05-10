## ADDED Requirements

### Requirement: React application setup
The system SHALL provide a React-based single-page application with project structure including components/, pages/, services/, hooks/, and store/ directories.

#### Scenario: Application boots successfully
- **WHEN** the React application is started
- **THEN** it SHALL render the root component and set up routing without errors

### Requirement: Tailwind CSS + Shadcn/UI integration
The system SHALL use Tailwind CSS for styling and Shadcn/UI as the primary component library.

#### Scenario: UI components render with Shadcn/UI
- **WHEN** a page uses Shadcn/UI components (e.g., Button, Input, Card)
- **THEN** the components SHALL render correctly with Tailwind styling applied

### Requirement: Navigation with React Router
The system SHALL use React Router for client-side navigation with protected routes based on authentication state and user role.

#### Scenario: Unauthenticated user redirects to login
- **WHEN** an unauthenticated user attempts to access a protected route
- **THEN** the system SHALL redirect to the login page

#### Scenario: Authenticated seller accesses restricted route
- **WHEN** an authenticated seller attempts to access an admin-only route (e.g., user management)
- **THEN** the system SHALL redirect or show a forbidden page

#### Scenario: Authenticated user navigates between pages
- **WHEN** an authenticated user clicks on navigation links
- **THEN** the system SHALL render the corresponding page without full page reload

### Requirement: Server state management with TanStack Query
The system SHALL use TanStack Query for API data fetching, caching, and synchronization.

#### Scenario: Product list fetches and caches data
- **WHEN** the products page loads
- **THEN** the system SHALL fetch products via TanStack Query and cache the response

#### Scenario: Mutation invalidates cache
- **WHEN** a product is created or updated
- **THEN** the system SHALL invalidate the products query cache to refetch fresh data

### Requirement: Form handling with React Hook Form + Zod
The system SHALL use React Hook Form with Zod validation for all forms (login, registration, product creation/editing, sales recording).

#### Scenario: Form validates input with Zod schema
- **WHEN** a user submits a form with invalid data
- **THEN** the system SHALL display validation errors for the invalid fields

#### Scenario: Form submits successfully
- **WHEN** a user submits a form with valid data
- **THEN** the system SHALL call the appropriate API endpoint and show a success message

### Requirement: API communication layer
The system SHALL provide a services/ layer for API calls using fetch or axios, with automatic JWT token injection from auth state.

#### Scenario: Authenticated request includes token
- **WHEN** an authenticated user makes an API request
- **THEN** the system SHALL include the JWT access token in the Authorization header

#### Scenario: API request handles errors
- **WHEN** an API request returns an error (401, 403, 500, etc.)
- **THEN** the system SHALL display an appropriate error message to the user

### Requirement: Authentication pages
The system SHALL provide login and registration pages with form validation.

#### Scenario: User logs in via login page
- **WHEN** a user submits valid credentials on the login page
- **THEN** the system SHALL store the JWT tokens and redirect to the dashboard or products page

#### Scenario: User registers via registration page
- **WHEN** a user submits valid registration data
- **THEN** the system SHALL create the account and redirect to login or automatically log in

### Requirement: Product management pages
The system SHALL provide pages for listing products, creating products, and editing products (admin only).

#### Scenario: Admin views product list with search/filter
- **WHEN** an admin user visits the products page
- **THEN** the system SHALL display the product list with search input and category filter

#### Scenario: Admin creates a product
- **WHEN** an admin user fills out and submits the product creation form
- **THEN** the system SHALL create the product and redirect to the product list

### Requirement: Sales pages
The system SHALL provide a page for recording sales and viewing sales history.

#### Scenario: Seller records a sale
- **WHEN** a seller selects a product, enters quantity, and submits the sale form
- **THEN** the system SHALL record the sale and show a success message

#### Scenario: User views sales history
- **WHEN** a user visits the sales history page
- **THEN** the system SHALL display their own sales (for sellers) or all sales (for admins)

### Requirement: Dashboard page
The system SHALL provide a dashboard page displaying key metrics (sales by period, top products, total revenue) accessible only to admin users.

#### Scenario: Admin views dashboard
- **WHEN** an admin user visits the dashboard page
- **THEN** the system SHALL display metrics cards and charts for sales, top products, and revenue
