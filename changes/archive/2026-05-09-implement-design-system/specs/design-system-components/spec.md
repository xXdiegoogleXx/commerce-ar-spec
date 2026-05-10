## ADDED Requirements

### Requirement: Rounded components
The application SHALL use moderate rounding (Level 2, rounded-lg) on all components.

#### Scenario: Buttons have moderate rounding
- **WHEN** buttons render
- **THEN** border-radius is moderate (rounded-lg)

#### Scenario: Cards have moderate rounding
- **WHEN** content cards render
- **THEN** border-radius is moderate (rounded-lg or rounded-xl)

### Requirement: Input fields with minimal styling
Input fields SHALL use surface-variant fill with clear focus states.

#### Scenario: Input field renders
- **WHEN** text input fields render
- **THEN** background is surface-variant with no strong borders

#### Scenario: Input field focus state
- **WHEN** user clicks an input field
- **THEN** border or shadow changes to indicate focus

### Requirement: Data tables with rhythmic spacing
Data tables SHALL use standard padding to maintain rhythmic flow.

#### Scenario: Product table rows
- **WHEN** inventory tables render
- **THEN** rows have consistent spacing via padding

### Requirement: Buttons with appropriate variants
The application SHALL have three button variants.

#### Scenario: Primary button
- **WHEN** primary call-to-action button renders
- **THEN** background is #BEF226 (Electric Lime) with dark text

#### Scenario: Secondary button
- **WHEN** secondary action button renders
- **THEN** background is #000000 with white text

#### Scenario: Tertiary button
- **WHEN** destructive action button renders
- **THEN** background is #FF4D4D with white text