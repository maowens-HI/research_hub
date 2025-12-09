# Research Hub - Project Documentation

## Project Overview

This is a Quarto-based research website called "research_hub". Quarto is an open-source scientific and technical publishing system that allows you to create dynamic content with R, Python, Julia, and other languages.

## Project Structure

```
research_hub/
├── _quarto.yml          # Main Quarto configuration file
├── index.qmd            # Homepage content
├── about.qmd            # About page content
├── styles.css           # Custom CSS styles
├── docs/                # Output directory for rendered website
└── research_hub.Rproj   # RStudio project file
```

## Technologies

- **Quarto**: Website generation and rendering engine
- **R**: Programming language for computational content
- **HTML/CSS**: Output format with cosmo and brand themes
- **Git**: Version control

## Configuration

The `_quarto.yml` file contains the main configuration:
- **Project Type**: Website
- **Output Directory**: `docs/` (suitable for GitHub Pages)
- **Theme**: Cosmo with brand customizations
- **Navigation**: Home and About pages in navbar
- **Features**: Table of contents enabled

## Development Workflow

### Rendering the Website

To preview the website locally:
```bash
quarto preview
```

To render the website:
```bash
quarto render
```

### Adding New Pages

1. Create a new `.qmd` file in the root directory
2. Add the page to the navbar in `_quarto.yml`:
   ```yaml
   navbar:
     left:
       - href: newpage.qmd
         text: New Page
   ```

### Content Types

Quarto Markdown (`.qmd`) files support:
- Markdown formatting
- Embedded R code chunks (using `{r}`)
- YAML front matter for page metadata
- LaTeX equations
- Citations and cross-references

## Common Tasks

### Adding R Code

```markdown
{r}
# Your R code here
plot(1:10)
```

### Changing Theme

Edit `_quarto.yml`:
```yaml
format:
  html:
    theme: [minty, flatly, cosmo, etc.]
```

### Custom Styling

Add CSS rules to `styles.css` for custom styling.

## Writing Style Guidelines

When creating or editing content for this research hub:

### Formatting Rules
- Never use bold formatting (asterisks) in headers or labels
- Do not use bold for emphasis in callout boxes
- Keep text clean and concise without flowery language
- Avoid unnecessary formatting symbols in headers and subheadings

### Examples

Good:
```markdown
Topic: Analysis of spending patterns

::: {.callout-note}
The Issue: Data is missing for some counties.
:::

- Finding: Results show significant effects.
```

Bad:
```markdown
**Topic:** Analysis of spending patterns

::: {.callout-note}
**The Issue:** Data is missing for some counties.
:::

- **Finding:** Results show significant effects.
```

## Git Workflow

- Development branches follow the pattern: `claude/*-[session-id]`
- Always commit with descriptive messages
- Push changes to the feature branch using: `git push -u origin <branch-name>`

## Output

The rendered website is output to the `docs/` directory, which can be:
- Served locally for preview
- Deployed to GitHub Pages
- Hosted on other static site hosting services

## Resources

- [Quarto Documentation](https://quarto.org/)
- [Quarto Websites Guide](https://quarto.org/docs/websites)
- [R Documentation](https://www.r-project.org/)
