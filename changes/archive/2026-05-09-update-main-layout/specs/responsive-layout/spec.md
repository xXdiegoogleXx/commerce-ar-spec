## ADDED Requirements

### Requirement: Layout is responsive
The application SHALL be responsive and adapt to different screen sizes.

#### Scenario: Desktop layout
- **WHEN** screen width is >=1024px
- **THEN** sidebar is visible, content fills available space

#### Scenario: Tablet layout
- **WHEN** screen width is between 768px and 1023px
- **THEN** sidebar can be toggled, content fills available space

#### Scenario: Mobile layout
- **WHEN** screen width is <768px
- **THEN** sidebar is hidden, hamburger menu visible, full-width content

### Requirement: Sidebar toggle works
The sidebar SHALL be toggleable via hamburger menu button.

#### Scenario: Sidebar toggles
- **WHEN** user clicks hamburger menu button
- **THEN** sidebar slides in/out of view

### Requirement: Main content adapts to layout
The main content area SHALL adapt to fill the remaining space after the sidebar.

#### Scenario: Content fills space
- **WHEN** layout renders
- **THEN** main content takes remaining width/height