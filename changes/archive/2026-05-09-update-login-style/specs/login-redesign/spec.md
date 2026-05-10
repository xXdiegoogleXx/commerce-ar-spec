## ADDED Requirements

### Requirement: Glassmorphism login panel
The login page SHALL display a glass-effect panel with backdrop blur, using rgba(255, 255, 255, 0.7) background, backdrop-filter blur(40px), and subtle border/shadow.

#### Scenario: Login page renders glass panel
- **WHEN** user loads the login page
- **THEN** the login card displays glassmorphism effect with blur and transparent border

### Requirement: Brand color palette applied
The login page SHALL use the Lumiere brand colors: primary green (#4e6700), lime accent (#c0f429), surface (#f9f9f9).

#### Scenario: Brand colors are applied
- **WHEN** login page renders
- **THEN** primary color displays as #4e6700, lime accent as #c0f429, surface as #f9f9f9

### Requirement: Typography using Manrope and Inter fonts
The login page SHALL use Manrope font for headlines and Inter font for body text.

#### Scenario: Fonts are loaded and applied
- **WHEN** login page loads
- **THEN** headlines use Manrope font, body text uses Inter font

### Requirement: Material Symbols icons displayed
The login page SHALL display Material Symbols icons (e.g., arrow_forward in submit button).

#### Scenario: Icons render correctly
- **WHEN** login page displays the submit button
- **THEN** arrow_forward icon appears next to button text

### Requirement: Minimal input fields with bottom border
The login page SHALL display email and password fields with only bottom border, changing to primary color on focus.

#### Scenario: Input focus state changes
- **WHEN** user clicks on email or password field
- **THEN** bottom border changes to primary color (#4e6700)

### Requirement: Primary container button styling
The submit button SHALL use primary-container background with on-primary-container text color and hover effects.

#### Scenario: Button hover state
- **WHEN** user hovers over submit button
- **THEN** button opacity becomes 0.9

#### Scenario: Button active state
- **WHEN** user clicks submit button
- **THEN** button scales to 0.98