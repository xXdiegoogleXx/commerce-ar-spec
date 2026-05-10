## Context

The current application uses a horizontal top navigation bar. This design document outlines how to implement a new layout with a vertical sidebar navigation on the left and a header with search, notifications, settings, and user session information. This change supports the "Digital Curator" design system and improves usability.

## Goals / Non-Goals

**Goals:**
- Implement vertical sidebar navigation (left side)
- Add top header with:
  - Search input field
  - Notification bell icon
  - Settings/gear icon
  - User session info (avatar, name, role)
- Make layout fully responsive (sidebar collapses to hamburger menu on mobile)
- Apply "Digital Curator" colors and typography

**Non-Goals:**
- Add actual notification functionality (future feature)
- Add actual settings page (future feature)
- Add user profile editing (future feature)
- Change page content inside each component (just layout structure)

## Decisions

### Layout Structure
- **Sidebar:** Fixed width (240px on desktop), collapsible on mobile
- **Header:** Fixed height (64px), full width of content area
- **Main Content:** Flexible, fills remaining space
- **Responsive Breakpoints:**
  - Desktop: ≥1024px (sidebar visible)
  - Tablet: 768px-1023px (sidebar collapsible)
  - Mobile: <768px (sidebar hidden, hamburger menu)

### Sidebar Navigation
- Vertical navigation with icon + label for each item
- Active state highlighting using primary color
- Collapsible on smaller screens
- Uses existing lucide-react icons

### Header Components
- **Search:** Input field with search icon, placeholder "Search..."
- **Notifications:** Bell icon with notification dot indicator
- **Settings:** Gear icon
- **User Info:** Avatar circle with user initial, name, and role badge

### Technology
- **CSS Approach:** Use Tailwind CSS with flexbox/grid
- **Icons:** lucide-react (already installed)
- **State Management:** React useState for sidebar toggle
- **Responsive:** Use Tailwind's responsive prefixes (md:, lg:)

## Risks / Trade-offs

- [Risk] Sidebar might take too much horizontal space on small laptops → Mitigation: Make sidebar collapsible on screens <1024px
- [Risk] Search might not be functional → Mitigation: Add placeholder for future implementation
- [Risk] Icons might not align properly → Mitigation: Use flexbox with consistent padding

## Migration Plan

1. Update Layout.tsx with new sidebar + header structure
2. Add responsive CSS classes
3. Update each page to work with new layout structure (optional padding adjustments)
4. Test in browser at different screen sizes

## Open Questions

- Should the search input actually filter data? (placeholder for now)
- Should notifications have a dropdown panel? (future feature)
- Should settings open a modal or navigate to a page? (future feature)