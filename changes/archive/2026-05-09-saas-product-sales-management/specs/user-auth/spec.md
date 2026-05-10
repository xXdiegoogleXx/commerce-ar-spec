## ADDED Requirements

### Requirement: User registration
The system SHALL allow new users to register with email, password, name, and role (default: seller).

#### Scenario: Successful user registration
- **WHEN** a user submits valid registration data (email, password, name)
- **THEN** the system SHALL create a new user with hashed password using bcrypt, assign default role "seller", and return a success response

#### Scenario: Registration with duplicate email
- **WHEN** a user submits registration with an email that already exists
- **THEN** the system SHALL return an error indicating the email is already registered

### Requirement: User login
The system SHALL allow registered users to log in with email and password, returning a JWT access token and refresh token.

#### Scenario: Successful login
- **WHEN** a user submits valid email and password
- **THEN** the system SHALL verify the password against the stored hash, generate a JWT access token and refresh token, and return them to the user

#### Scenario: Failed login with incorrect password
- **WHEN** a user submits a valid email but incorrect password
- **THEN** the system SHALL return an authentication error and SHALL NOT issue tokens

#### Scenario: Failed login with non-existent email
- **WHEN** a user submits an email that does not exist in the system
- **THEN** the system SHALL return an authentication error

### Requirement: User logout
The system SHALL allow authenticated users to log out, invalidating their refresh token.

#### Scenario: Successful logout
- **WHEN** an authenticated user calls the logout endpoint with a valid refresh token
- **THEN** the system SHALL invalidate the refresh token and return a success response

### Requirement: JWT token refresh
The system SHALL allow users to obtain a new access token using a valid refresh token.

#### Scenario: Successful token refresh
- **WHEN** a user submits a valid, non-expired refresh token
- **THEN** the system SHALL issue a new access token

#### Scenario: Refresh with expired token
- **WHEN** a user submits an expired refresh token
- **THEN** the system SHALL return an error and require re-authentication

### Requirement: Password hashing
The system SHALL hash all user passwords using bcrypt before storing them in the database.

#### Scenario: Password stored securely
- **WHEN** a user is created or password is updated
- **THEN** the system SHALL hash the password with bcrypt and SHALL NEVER store plain-text passwords
