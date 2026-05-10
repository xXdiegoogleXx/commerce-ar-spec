## Context

The login page currently uses a basic Tailwind styling. The reference HTML shows a modern glassmorphism design with specific colors and typography that should be implemented across the application. This change updates the login page to match the visual specification.

## Goals / Non-Goals

**Goals:**
- Implement glassmorphism panel effect (backdrop-filter: blur)
- Apply Lumiere brand colors from Tailwind config
- Use Manrope font for headlines, Inter for body text
- Add Material Symbols icon library
- Update form inputs to minimal bottom-border style

**Non-Goals:**
- Update other pages beyond login (future changes)
- Backend authentication logic changes
- Mobile-responsive breakpoints beyond what's in HTML reference

## Decisions

### Color Palette Implementation
Using the Tailwind config from reference:
- Primary: `#4e6700` (green)
- Primary Container / Lime Accent: `#c0f429`
- Surface: `#f9f9f9`
- On Surface: `#2d3435`
- Tertiary (Error): `#bb1824`

### Typography
- **Headlines**: Manrope (Google Fonts) - weights 400, 600, 700, 800
- **Body**: Inter (Google Fonts) - weights 300, 400, 500, 600
- **Icon library**: Material Symbols Outlined (Google Fonts)

### Panel Effect
- Background: `rgba(255, 255, 255, 0.7)`
- Backdrop filter: `blur(40px)`
- Border: `1px solid rgba(255, 255, 255, 0.2)`
- Shadow: `0 12px 48px rgba(45, 52, 53, 0.06)`

### Input Fields
- Remove full border, use only bottom border
- Focus state changes border color to primary
- Placeholder text uses outline-variant color

### Button Styling
- Uses primary-container background
- On-primary-container text color
- Hover: opacity-90, active: scale-[0.98]
- Shadow: shadow-sm

## Risks / Trade-offs

- [Risk] Glassmorphism may not work in all browsers → Mitigation: Use backdrop-filter: blur, works in modern browsers
- [Risk] Custom fonts may cause layout shift → Mitigation: Preload fonts in head
- [Risk] Input focus states accessibility → Mitigation: Maintain visible focus indicators with border color change

## Migration Plan

1. Copy Tailwind config to main tailwind.config.js
2. Add Google Fonts links to index.html
3. Update LoginPage component with new styles
4. Test in development environment
5. Deploy to staging for visual QA

## Open Questions

- Should this style be applied to the registration page too?
- Any other pages that should share this glassmorphism panel style?