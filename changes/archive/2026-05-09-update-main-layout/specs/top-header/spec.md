## ADDED Requirements

### Requirement: Top header displays search input
The application SHALL display a search input field in the top header area.

#### Scenario: Search input renders
- **WHEN** header renders
- **THEN** a search input field with a search icon is visible in the header

### Requirement: Top header displays notification icon
The application SHALL display a notification bell icon in the top header.

#### Scenario: Notification icon renders
- **WHEN** header renders
- **THEN** a bell icon is visible in the header

### Requirement: Top header displays settings icon
The application SHALL display a settings/gear icon in the top header.

#### Scenario: Settings icon renders
- **WHEN** header renders
- **THEN** a gear icon is visible in the header

### Requirement: Top header displays user session info
The application SHALL display the current user's name, role, and avatar in the top header.

#### Scenario: User info displays
- **WHEN** user is logged in
- **THEN** the header shows user avatar (initial), name, and role badge

### Requirement: Header has fixed height
The top header SHALL have a fixed height of 64px.

#### Scenario: Header height is fixed
- **WHEN** header renders
- **THEN** the header has a fixed height of 64px