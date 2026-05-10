## ADDED Requirements

### Requirement: Sidebar navigation displays on left side
The application SHALL display a vertical sidebar navigation on the left side of the screen.

#### Scenario: Sidebar renders on left
- **WHEN** user loads the application on desktop
- **THEN** the navigation sidebar displays on the left side with a fixed width of 240px

### Requirement: Sidebar contains navigation items
The sidebar SHALL contain navigation items with icons and labels for each section.

#### Scenario: Navigation items display with icons
- **WHEN** sidebar renders
- **THEN** each navigation item shows an icon from lucide-react and a text label

### Requirement: Sidebar shows active state
The sidebar SHALL highlight the currently active navigation item using primary color.

#### Scenario: Active item is highlighted
- **WHEN** user is on a specific page (e.g., /products)
- **THEN** the corresponding navigation item shows active state (primary color background or text)

### Requirement: Sidebar is collapsible
The sidebar SHALL collapse on smaller screens and can be toggled with a hamburger menu.

#### Scenario: Sidebar collapses on mobile
- **WHEN** screen width is less than 1024px
- **THEN** sidebar is hidden by default and can be toggled with a menu button