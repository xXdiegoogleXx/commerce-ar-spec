## ADDED Requirements

### Requirement: Manrope font for display and headlines
The application SHALL use Manrope font for all display text and page headlines.

#### Scenario: Headlines use Manrope
- **WHEN** page headings render (e.g., "Dashboard", "Products")
- **THEN** the font family is "Manrope" with font-weight 600-800

### Requirement: Inter font for body text
The application SHALL use Inter font for body text, labels, and data.

#### Scenario: Body text uses Inter
- **WHEN** body paragraphs and labels render
- **THEN** the font family is "Inter" with font-weight 300-500

### Requirement: Typography hierarchy
The application SHALL maintain clear hierarchy through font weight and size.

#### Scenario: Display totals
- **WHEN** large numbers (e.g., sales totals) display
- **THEN** font-weight is 700-800 for emphasis

#### Scenario: Metadata labels
- **WHEN** metadata (e.g., "Last Updated") renders
- **THEN** font-weight is 300-400 to keep focus on primary content