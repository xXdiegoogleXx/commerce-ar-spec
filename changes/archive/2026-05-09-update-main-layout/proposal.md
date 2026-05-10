## Why

The current layout has a horizontal top navigation bar. The new design requires a sidebar navigation on the left side for better usability and to match the "Digital Curator" design system. Additionally, the header needs a search input, notification icon, settings icon, and user session info for a more complete dashboard experience.

## What Changes

- Move navigation from top header to left sidebar (vertical navigation)
- Add search input field in the top header area
- Add notification bell icon in the top header
- Add settings/gear icon in the top header
- Add user session info (avatar, name, role) in the top header
- Make the layout fully responsive (sidebar collapses to hamburger menu on mobile)
- Apply the "Digital Curator" design system colors and typography

## Capabilities

### New Capabilities
- `sidebar-navigation`: Vertical sidebar navigation with icons and labels
- `top-header`: Header with search, notifications, settings, and user info
- `responsive-layout`: Collapsible sidebar for mobile devices

### Modified Capabilities
- `layout-component`: Update existing Layout component with new structure
- `dashboard-page`: Adjust dashboard to work with new layout
- `products-page`: Adjust products page to work with new layout
- `sales-page`: Adjust sales page to work with new layout
- `users-page`: Adjust users page to work with new layout

## Impact

- Frontend: Complete refactor of `Layout.tsx` component
- Frontend: Update all page components to work with new layout structure
- Frontend: Add new icons using lucide-react (already installed)
- CSS: Update layout styles for sidebar and responsive behavior