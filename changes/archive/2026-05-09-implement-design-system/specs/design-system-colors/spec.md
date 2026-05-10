## ADDED Requirements

### Requirement: Electric Lime primary color
The application SHALL use Electric Lime (#BEF226) as the primary accent color for high-visibility action buttons and key interactive elements.

#### Scenario: Primary button displays Electric Lime
- **WHEN** a primary button (e.g., "Sign In", "Create") renders
- **THEN** the background color is #BEF226 with high-contrast dark text

### Requirement: Surface hierarchy with tonal shifts
The application SHALL use background color shifts to define sections instead of 1px borders.

#### Scenario: Dashboard base background
- **WHEN** the main dashboard loads
- **THEN** the background is neutral #F7F7F7

#### Scenario: Secondary sections use surface-container-low
- **WHEN** secondary content areas render (e.g., sidebar, filter panel)
- **THEN** background is #F2F4F4

#### Scenario: Primary content cards use white
- **WHEN** primary content cards (e.g., data tables, forms) render
- **THEN** background is #FFFFFF creating natural "pop"

### Requirement: Secondary button styling
The application SHALL use black (#000000) background for secondary buttons.

#### Scenario: Secondary button renders
- **WHEN** a secondary action button renders
- **THEN** background is #000000 with white text

### Requirement: Tertiary button for alerts
The application SHALL use red (#FF4D4D) for destructive actions and alerts.

#### Scenario: Tertiary button renders
- **WHEN** a destructive action button (e.g., "Delete") renders
- **THEN** background is #FF4D4D with white text

### Requirement: No-line sectioning
The application SHALL NOT use 1px solid borders for sectioning. Boundaries are defined by background color shifts.

#### Scenario: Components do not have border lines
- **WHEN** UI components render
- **THEN** no 1px solid borders are visible between sections