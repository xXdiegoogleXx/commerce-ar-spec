## Context

The "Digital Curator" design system replaces the current basic Tailwind styling with a sophisticated, museum-like interface. This is a cross-cutting change affecting multiple components and pages. The current UI uses default Tailwind colors and basic component styling.

## Goals / Non-Goals

**Goals:**
- Implement "The Digital Curator" design philosophy across all pages
- Apply Electric Lime (#BEF226) as primary accent color
- Use Manrope for headlines and Inter for body text
- Implement tonal surface hierarchy (no heavy borders)
- Apply moderate rounding (Level 2) consistently
- Remove glassmorphism effects from login and use clean white cards

**Non-Goals:**
- Add new functionality beyond styling changes
- Refactor backend API behavior
- Create new pages not in the existing roadmap

## Decisions

### Color Updates
- **Primary:** #BEF226 (Electric Lime) - replaces #4e6700
- **Background Base:** #F7F7F7 (neutral gray)
- **Surface Container Low:** #F2F4F4 - for secondary groupings
- **Surface Container Lowest:** #FFFFFF - for primary content cards
- **Secondary:** #000000 (black) - for secondary buttons
- **Tertiary:** #FF4D4D - for destructive actions/alerts

### Typography Implementation
- **Headlines (Manrope):** font-weight 600-800 for display, sales totals, page headings
- **Body (Inter):** font-weight 300-500 for inventory lists, SKU codes, labels

### Surface Hierarchy
- Base: #F7F7F7 background
- Secondary sections: surface-container-low
- Primary cards: surface-container-lowest (#ffffff)
- This creates natural "pop" without borders

### Rounding & Spacing
- Border radius: moderate (rounded-lg/rounded-xl)
- Spacing: normal density (consistent padding)

## Risks / Trade-offs

- [Risk] Existing components may break with color changes → Mitigation: Test all pages after update
- [Risk] Font loading may cause FOUT (flash of unstyled text) → Mitigation: Preload fonts in HTML head
- [Risk] Previous login glass panel effect conflicts with new design → Mitigation: Remove glass-panel, use clean white card

## Migration Plan

1. Update tailwind.config.js with new color palette
2. Add/replace font links in index.html
3. Remove glass-panel CSS from index.css
4. Update LoginPage to use new white card style
5. Update Layout component with new surface colors
6. Update all page components (Products, Sales, Dashboard, Users)
7. Test each page in browser

## Open Questions

- Should we keep Material Symbols icons or switch to a different icon set?
- Any specific pages that need priority attention?