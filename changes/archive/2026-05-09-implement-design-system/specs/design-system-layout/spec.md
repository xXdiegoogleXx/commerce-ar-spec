## ADDED Requirements

### Requirement: Base background is neutral
The application SHALL use #F7F7F7 as the main dashboard background.

#### Scenario: Dashboard renders base background
- **WHEN** main application loads
- **THEN** background color is #F7F7F7 (neutral gray)

### Requirement: White cards for primary content
Primary content areas SHALL use white (#FFFFFF) cards to create visual hierarchy.

#### Scenario: Primary content panel
- **WHEN** main content panels (e.g., product list, sales history) render
- **THEN** background is #FFFFFF creating a natural "pop"

### Requirement: Use whitespace for distinction
The application SHALL use white space rather than heavy dividers to separate content.

#### Scenario: Sections use spacing not borders
- **WHEN** UI sections are visually separated
- **THEN** separation is achieved through spacing, not border lines

### Requirement: Normal spacing density
The application SHALL use normal spacing (Spacing Level 2) for consistent rhythm.

#### Scenario: Components have consistent spacing
- **WHEN** UI components render
- **THEN** padding and margin follow normal spacing density