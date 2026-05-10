## Why

The application needs a cohesive, premium design system called "The Digital Curator" that elevates the UI beyond traditional SaaS dashboards. The current interface lacks the tonal depth, editorial typography, and sophisticated feel required for a high-end inventory management experience.

## What Changes

- Apply the "Digital Curator" design philosophy across all pages
- Implement Electric Lime (#BEF226) as primary accent color replacing previous green
- Use spatial containers and tonal shifts instead of 1px borders
- Apply Manrope for display/headlines and Inter for body text throughout
- Implement moderate rounding (Level 2) on all components
- Update button styles with primary (Electric Lime), secondary (black), and tertiary (red) variants
- Refactor input fields and data tables with minimal styling
- Apply white card on neutral background (#F7F7F7) hierarchy
- Ensure the UI feels professional, premium, and calm

## Capabilities

### New Capabilities
- `design-system-colors`: New color palette with Electric Lime primary and tonal surfaces
- `design-system-typography`: Manrope + Inter font pairing implementation
- `design-system-components`: Button, input, and card component styling
- `design-system-layout`: Surface hierarchy and spacing rules

### Modified Capabilities
- `login-ui`: Update existing login to match the new design system (previously updated with different colors)
- `dashboard-ui`: Apply new design principles to dashboard
- `products-ui`: Refactor product list with new table styling
- `sales-ui`: Apply new design system to sales pages

## Impact

- Frontend: Update tailwind.config.js with new colors, fonts, border radius
- Frontend: Add Google Fonts links for Manrope and Inter
- Frontend: Update CSS utilities for glass panel removal
- Frontend: Refactor all page components with new design system