# Research Hub: Style & Layout Brief

**Design Vision Document**
*A comprehensive guide to the visual identity, layout structure, and user experience for a modern policy-research institute website.*

---

## Executive Summary

This brief establishes the design direction for a research hub website that communicates **credibility, expertise, and modern professionalism**. The aesthetic balances academic seriousness with contemporary elegance—approachable enough for media and policymakers, rigorous enough for economists and researchers.

**Core Design Principles:**
- Clarity over complexity
- Authority without stuffiness
- Timeless elegance, not fleeting trends
- Content as the hero

---

## 1. Color Palette

### Primary Colors

| Role | Color | Hex | Usage |
|:-----|:------|:----|:------|
| **Background** | Warm Off-White | `#FAFAF8` | Page backgrounds, cards |
| **Surface** | Soft Pearl | `#F5F5F3` | Secondary surfaces, alternating sections |
| **Primary Text** | Deep Charcoal | `#2D3436` | Body copy, headings |
| **Secondary Text** | Slate Grey | `#636E72` | Captions, metadata, dates |

### Accent Colors

| Role | Color | Hex | Usage |
|:-----|:------|:----|:------|
| **Primary Accent** | Oxford Blue | `#1E3A5F` | CTA buttons, links, key highlights |
| **Accent Hover** | Deep Navy | `#152A45` | Button hover states |
| **Accent Light** | Mist Blue | `#E8EEF4` | Subtle backgrounds, tags, badges |
| **Success/Highlight** | Teal Accent | `#0A7B7B` | Optional secondary accent for variety |

### Color Philosophy

The palette draws from institutional design—think established universities, respected journals, serious think tanks. The **Oxford Blue** accent conveys trust and intellectual depth without the coldness of pure navy. The warm off-white base prevents the clinical sterility common in academic sites while maintaining professionalism.

**Usage Rules:**
- Accent color appears sparingly: buttons, links, active states, key highlights
- Never more than 15% of any given page should be accent-colored
- Text always maintains high contrast ratios (WCAG AA minimum)

---

## 2. Typography

### Font Stack

```css
/* Primary: Headings & Display */
font-family: 'Inter', 'SF Pro Display', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;

/* Body Text */
font-family: 'Inter', 'SF Pro Text', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;

/* Monospace (code, data) */
font-family: 'JetBrains Mono', 'SF Mono', 'Fira Code', monospace;
```

### Type Scale

| Element | Size | Weight | Line Height | Letter Spacing |
|:--------|:-----|:-------|:------------|:---------------|
| **Hero Headline** | 48–56px | 700 (Bold) | 1.1 | -0.02em |
| **Hero Tagline** | 20–24px | 400 (Regular) | 1.5 | 0 |
| **Section Headers (H2)** | 32–36px | 600 (Semi-bold) | 1.2 | -0.01em |
| **Card Titles (H3)** | 20–24px | 600 (Semi-bold) | 1.3 | 0 |
| **Body Text** | 16–18px | 400 (Regular) | 1.7 | 0.01em |
| **Small/Meta Text** | 14px | 400 (Regular) | 1.5 | 0.02em |
| **Button Text** | 15–16px | 600 (Semi-bold) | 1 | 0.03em |

### Typography Principles

- **Generous line height** (1.6–1.7) for body text ensures academic content remains digestible
- **Tight tracking** on headlines creates visual impact
- **No decorative fonts**—readability is paramount
- Headlines use sentence case, not ALL CAPS (more approachable, less aggressive)

---

## 3. Homepage / Hero Landing

### Hero Section (Above the Fold)

**Structure:**
```
┌─────────────────────────────────────────────────────────────────────┐
│  [Navigation Bar]                                                    │
│  Logo (left)              Home | About | People | Research | Blog   │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│                                                                      │
│         ADVANCING SOUND ECONOMIC POLICY                             │
│              FOR THE 21ST CENTURY                                   │
│                                                                      │
│      Rigorous research. Real-world impact. Transparent insight.     │
│                                                                      │
│                    [ Explore Research ]                             │
│                                                                      │
│                                                                      │
│                     ░░░ Abstract geometric element ░░░               │
└─────────────────────────────────────────────────────────────────────┘
```

**Visual Treatment:**

1. **Background Option A — Subtle Gradient:**
   - Soft gradient from `#FAFAF8` (top) to `#E8EEF4` (bottom)
   - Clean, minimal, lets typography breathe

2. **Background Option B — Abstract Geometric:**
   - Faint geometric pattern (interconnected nodes, subtle grid, flowing lines)
   - 8–12% opacity maximum
   - Suggests networks, data, interconnection without being literal

3. **Background Option C — Photography (if used):**
   - Desaturated, high-contrast architectural or abstract image
   - Dark overlay gradient (60–70% opacity at text area)
   - Never stock photos of "business people shaking hands"

**Hero Content Specifications:**

| Element | Specification |
|:--------|:--------------|
| **Headline** | 48–56px, Bold, Deep Charcoal or White (on dark bg) |
| **Tagline** | 20–24px, Regular weight, Slate Grey or Light grey |
| **CTA Button** | Oxford Blue bg, white text, 16px padding vertical, 32px horizontal |
| **Vertical Spacing** | 24px between headline and tagline, 32px above button |
| **Hero Height** | 70–85vh (not full viewport—hint at content below) |

**CTA Button Styling:**
```css
.cta-primary {
  background-color: #1E3A5F;
  color: #FFFFFF;
  padding: 16px 32px;
  border-radius: 4px;  /* Subtle rounding, not pill-shaped */
  font-weight: 600;
  font-size: 15px;
  letter-spacing: 0.03em;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease;
}

.cta-primary:hover {
  background-color: #152A45;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(30, 58, 95, 0.25);
}
```

---

### Featured Research Section (Below Hero)

**Layout:** 3-column card grid on desktop, single column stacked on mobile

```
┌─────────────────────────────────────────────────────────────────────┐
│                                                                      │
│                    LATEST RESEARCH                                  │
│                                                                      │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐   │
│  │ Working Paper    │  │ Policy Brief     │  │ Working Paper    │   │
│  │                  │  │                  │  │                  │   │
│  │ Title of the     │  │ Title of the     │  │ Title of the     │   │
│  │ Research Paper   │  │ Policy Brief     │  │ Research Paper   │   │
│  │                  │  │                  │  │                  │   │
│  │ Brief excerpt... │  │ Brief excerpt... │  │ Brief excerpt... │   │
│  │                  │  │                  │  │                  │   │
│  │ Dec 2025 · Smith │  │ Nov 2025 · Jones │  │ Nov 2025 · Lee   │   │
│  │        →         │  │        →         │  │        →         │   │
│  └──────────────────┘  └──────────────────┘  └──────────────────┘   │
│                                                                      │
│                    [ View All Research → ]                          │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

**Card Specifications:**

```css
.research-card {
  background: #FFFFFF;
  border: 1px solid #E8E8E6;
  border-radius: 8px;
  padding: 28px;
  transition: all 0.25s ease;
}

.research-card:hover {
  border-color: #1E3A5F;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
  transform: translateY(-4px);
}

.card-category {
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: #1E3A5F;
  margin-bottom: 12px;
}

.card-title {
  font-size: 20px;
  font-weight: 600;
  line-height: 1.3;
  color: #2D3436;
  margin-bottom: 12px;
}

.card-excerpt {
  font-size: 15px;
  line-height: 1.6;
  color: #636E72;
  margin-bottom: 16px;
}

.card-meta {
  font-size: 13px;
  color: #636E72;
}
```

---

### Mission Summary Section (Optional)

A brief 2–3 sentence block reinforcing credibility:

```
┌─────────────────────────────────────────────────────────────────────┐
│                                                                      │
│  ─────────────────────────────────────────────────────────          │
│                                                                      │
│  The [Institute Name] produces independent, nonpartisan research    │
│  on economic policy. Our work informs policymakers, advances        │
│  academic discourse, and serves the public interest.                │
│                                                                      │
│                       [ Learn About Us → ]                          │
│                                                                      │
│  ─────────────────────────────────────────────────────────          │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

**Styling:** Centered text, slightly larger font (18–20px), generous padding above and below, horizontal rule accents.

---

## 4. Navigation & Header

### Desktop Navigation

```
┌─────────────────────────────────────────────────────────────────────┐
│                                                                      │
│  [LOGO]          Home   About   People   Research   Publications    │
│                                   Blog   Contact          [Search]  │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

**Specifications:**
- Height: 72–80px
- Background: White or transparent over hero, white on scroll
- Logo: Left-aligned, max-height 40px
- Nav links: 15px, medium weight, 24–32px horizontal spacing
- Active state: Oxford Blue underline (2px, offset 4px from text)
- Hover: Color shift to Oxford Blue
- Search: Icon button (magnifying glass), expands on click

**Sticky Behavior:**
- Nav becomes sticky after scrolling past hero
- Subtle shadow appears: `box-shadow: 0 2px 8px rgba(0,0,0,0.06)`

### Mobile Navigation

- Hamburger icon (3-line) replaces nav items below 768px
- Slide-in drawer from right (full-height, 280px width)
- White background, full nav items stacked vertically
- Close button (X) top-right of drawer

---

## 5. Footer

**Structure:**
```
┌─────────────────────────────────────────────────────────────────────┐
│  ═══════════════════════════════════════════════════════════════    │
│                                                                      │
│  [LOGO]                                                              │
│                                                                      │
│  Research    About       Connect         Stay Updated               │
│  ────────    ────────    ────────        ────────────               │
│  Working     Mission     Contact         [Email           ]         │
│  Papers      Team        Press           [ Subscribe →    ]         │
│  Policy      History     Careers                                    │
│  Briefs      Partners                    Follow Us                  │
│  Data                                    [Twitter] [LinkedIn]       │
│                                                                      │
│  ───────────────────────────────────────────────────────────────    │
│                                                                      │
│  Built with Quarto                                                  │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

**Styling:**
- Background: `#F5F5F3` or very light grey
- 4-column grid on desktop, stacking on mobile
- Link color: Slate Grey, hover: Oxford Blue
- Newsletter input: Clean single-line with adjacent button
- Social icons: Line-style, 20x20px, consistent stroke weight

---

## 6. UI Components

### Buttons

**Primary Button:**
- Background: Oxford Blue (`#1E3A5F`)
- Text: White, 15px, semi-bold
- Padding: 14px 28px (comfortable touch target)
- Border-radius: 4px (not rounded pill)
- Hover: Darker shade + subtle lift + shadow

**Secondary Button:**
- Background: Transparent
- Border: 2px solid Oxford Blue
- Text: Oxford Blue, 15px, semi-bold
- Hover: Fill with Oxford Blue, text turns white

**Ghost/Text Button:**
- No background or border
- Text: Oxford Blue with subtle arrow (→)
- Hover: Underline appears

### Cards

```css
.card {
  background: #FFFFFF;
  border: 1px solid #E8E8E6;
  border-radius: 8px;
  padding: 24px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.04);
}

.card:hover {
  border-color: #1E3A5F;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
  transform: translateY(-3px);
}
```

### Tags/Badges

- Background: `#E8EEF4` (Mist Blue)
- Text: Oxford Blue, 12px, semi-bold
- Padding: 4px 10px
- Border-radius: 4px
- Used for: Categories, topics, document types

### Form Inputs

- Border: 1px solid `#DDD`
- Border-radius: 4px
- Padding: 12px 16px
- Focus: Border changes to Oxford Blue, subtle glow
- Background: White

---

## 7. Layout & Spacing System

### Grid System

- 12-column grid on desktop (max-width: 1200px, centered)
- 24px gutters between columns
- Content max-width: 720px for long-form text (optimal reading width)
- Full-bleed sections break out of max-width where appropriate

### Spacing Scale

Use consistent spacing multiples:

| Token | Value | Usage |
|:------|:------|:------|
| `xs` | 4px | Tight internal spacing |
| `sm` | 8px | Related element gaps |
| `md` | 16px | Standard component padding |
| `lg` | 24px | Section internal padding |
| `xl` | 48px | Major section breaks |
| `xxl` | 80px | Hero padding, page sections |

### Section Rhythm

- Hero: 80–120px padding top/bottom
- Major sections: 64–80px vertical padding
- Cards within sections: 24px gaps
- Paragraphs: 24px margin-bottom

---

## 8. Imagery & Graphics

### Photography Guidelines

**If using photos, choose:**
- Abstract architectural details (columns, light through windows)
- Conceptual imagery (stacked books, documents, data visualizations)
- Professional environments (libraries, research settings—NOT staged)
- Desaturated, muted tones that match the palette

**Never use:**
- Cheesy stock photos (handshakes, pointing at charts, diverse groups looking at laptops)
- Overly saturated or processed images
- Literal policy imagery (Capitol buildings, gavels—too on-the-nose)

### Abstract Graphics Alternative

Consider a signature graphic style using:
- Thin-line geometric patterns (nodes, grids, flowing lines)
- Subtle data-visualization motifs (abstract charts, graph patterns)
- Low-opacity textures for section backgrounds

### Icons

- Style: Line icons (outlined, not filled)
- Stroke weight: 1.5–2px consistent
- Size: 24px standard, 20px in navigation
- Color: Slate Grey default, Oxford Blue on hover/active
- Source: Feather Icons, Phosphor Icons, or custom set

---

## 9. Responsive Behavior

### Breakpoints

| Breakpoint | Width | Behavior |
|:-----------|:------|:---------|
| Mobile | <768px | Single column, hamburger nav, stacked cards |
| Tablet | 768–1024px | 2-column grids, compressed spacing |
| Desktop | 1024–1440px | Full layout, 3-column cards |
| Large | >1440px | Max-width container, centered |

### Mobile Adaptations

- Hero headline: 32–36px (scaled down)
- Hero height: Auto (content determines)
- Cards: Full-width, stacked vertically
- Navigation: Hamburger menu with slide-out drawer
- Buttons: Full-width on mobile forms
- Footer: Single-column stacked layout

---

## 10. Animation & Interaction

### Principles

- Subtle, purposeful animations only
- Never distracting or playful
- Enhances understanding of state changes

### Specific Treatments

**Hover States:**
```css
transition: all 0.2s ease;
```
- Buttons: Color darkens, slight lift (translateY: -2px), shadow appears
- Cards: Border color changes, lift effect, shadow deepens
- Links: Underline appears or color shifts

**Page Load:**
- Hero content fades in with slight upward motion (0.4s ease)
- Cards stagger in subtly (0.1s delay each)
- No spinning loaders—use skeleton screens if needed

**Scroll Effects:**
- Navigation shadow appears after scroll threshold
- Subtle parallax on hero background (optional, tasteful)

---

## 11. Accessibility Checklist

- [ ] Color contrast ratios meet WCAG AA (4.5:1 for body text, 3:1 for large text)
- [ ] All interactive elements have visible focus states
- [ ] Alt text on all images
- [ ] Semantic HTML structure (proper heading hierarchy)
- [ ] Keyboard navigation works throughout
- [ ] Form labels properly associated with inputs
- [ ] Skip-to-content link for screen readers
- [ ] Responsive text (scales with user preferences)

---

## 12. Sample Page Layouts

### Research/Publications Listing Page

```
┌─────────────────────────────────────────────────────────────────────┐
│  [Navigation]                                                        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  RESEARCH & PUBLICATIONS                                            │
│  Explore our working papers, policy briefs, and data resources.     │
│                                                                      │
│  [Filter: All ▼]  [Topic: All ▼]  [Year: All ▼]     [Search... 🔍]  │
│                                                                      │
│  ───────────────────────────────────────────────────────────────    │
│                                                                      │
│  ┌────────────────────────────────────────────────────────────┐     │
│  │ Working Paper                              December 2025   │     │
│  │                                                            │     │
│  │ Title of the Research Paper Goes Here                      │     │
│  │ Author Name, Co-Author Name                                │     │
│  │                                                            │     │
│  │ Brief abstract or excerpt text that gives readers a        │     │
│  │ sense of what the paper covers...                          │     │
│  │                                                            │     │
│  │ [Fiscal Policy] [Education] [State & Local]                │     │
│  │                                            Read More →     │     │
│  └────────────────────────────────────────────────────────────┘     │
│                                                                      │
│  ┌────────────────────────────────────────────────────────────┐     │
│  │ Policy Brief                               November 2025   │     │
│  │ ...                                                        │     │
│  └────────────────────────────────────────────────────────────┘     │
│                                                                      │
│  [Load More]                                                        │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

### Individual Paper Page

```
┌─────────────────────────────────────────────────────────────────────┐
│  [Navigation]                                                        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  Research ← Back to all research                                    │
│                                                                      │
│  ═══════════════════════════════════════════════════════════════    │
│                                                                      │
│  WORKING PAPER                                                      │
│                                                                      │
│  Title of the Research Paper:                                       │
│  A Subtitle if Applicable                                           │
│                                                                      │
│  Author Name · Co-Author Name                                       │
│  December 2025                                                       │
│                                                                      │
│  [Download PDF]  [Cite]  [Share]                                    │
│                                                                      │
│  ───────────────────────────────────────────────────────────────    │
│                                                                      │
│  ABSTRACT                                                           │
│                                                                      │
│  Full abstract text appears here with comfortable line              │
│  spacing and optimal reading width...                               │
│                                                                      │
│  ───────────────────────────────────────────────────────────────    │
│                                                                      │
│  KEY FINDINGS                                                       │
│                                                                      │
│  • First major finding...                                           │
│  • Second major finding...                                          │
│                                                                      │
│  ───────────────────────────────────────────────────────────────    │
│                                                                      │
│  Related Research                                                   │
│  [Card] [Card] [Card]                                               │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 13. Implementation Notes for Quarto

Since this site uses Quarto, implement the design via:

1. **Custom SCSS/CSS** in `styles.css` or create a `custom.scss`
2. **`_quarto.yml` configuration** for theme settings
3. **Custom HTML partials** for header/footer if needed
4. **Bootstrap 5 variables** can be overridden in SCSS

### Key Quarto Settings

```yaml
format:
  html:
    theme:
      light: [cosmo, custom.scss]
    css: styles.css
    fontsize: 1rem
    linestretch: 1.7
    linkcolor: "#1E3A5F"
    mainfont: "Inter, sans-serif"
```

### CSS Custom Properties (for consistency)

```css
:root {
  --color-bg: #FAFAF8;
  --color-surface: #F5F5F3;
  --color-text: #2D3436;
  --color-text-muted: #636E72;
  --color-accent: #1E3A5F;
  --color-accent-hover: #152A45;
  --color-accent-light: #E8EEF4;

  --font-sans: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
  --font-mono: 'JetBrains Mono', monospace;

  --space-xs: 4px;
  --space-sm: 8px;
  --space-md: 16px;
  --space-lg: 24px;
  --space-xl: 48px;
  --space-xxl: 80px;

  --radius-sm: 4px;
  --radius-md: 8px;

  --shadow-sm: 0 1px 3px rgba(0,0,0,0.04);
  --shadow-md: 0 4px 12px rgba(0,0,0,0.08);
  --shadow-lg: 0 8px 24px rgba(0,0,0,0.12);
}
```

---

## 14. Summary: The "Feel"

When someone lands on this site, they should immediately sense:

1. **Authority** — This is a serious institution with serious research
2. **Clarity** — The content is accessible, well-organized, easy to navigate
3. **Modernity** — Contemporary design sensibility, not a dusty academic relic
4. **Trust** — Clean, professional presentation signals credibility
5. **Focus** — The research is the star; design supports, never distracts

The design should age gracefully. In 5 years, it should still feel current—because it relies on timeless principles (clarity, whitespace, strong typography) rather than trendy effects.

---

*Document Version: 1.0*
*Created: December 2025*
