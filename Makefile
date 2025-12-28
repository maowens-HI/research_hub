# Research Hub - Build Automation
# Run 'make help' for available commands

.PHONY: all render preview clean validate new-meeting sync compress lint help

# Default target
all: render

# Render the full Quarto site
render: ## Render the full site and sync styles
	@echo "Rendering Quarto site..."
	quarto render
	cp styles.css docs/styles.css
	@echo "✓ Site rendered successfully"

# Start local preview server
preview: ## Start local preview server with hot reload
	quarto preview

# Clean build artifacts
clean: ## Clean build artifacts and cache
	rm -rf docs/_site .quarto _freeze
	@echo "✓ Build artifacts cleaned"

# Validate links and images
validate: ## Check for broken links and missing images
	@echo "Validating content..."
	@./scripts/validate-content.sh

# Create new meeting notes
new-meeting: ## Create new meeting notes file for today
	@./scripts/new-meeting.sh

# Sync styles to docs folder
sync: ## Manually sync styles.css to docs folder
	cp styles.css docs/styles.css
	@echo "✓ Styles synced to docs/"

# Compress images for web
compress: ## Compress PNG images to reduce file size
	@echo "Compressing images..."
	@./scripts/compress-images.sh
	@echo "✓ Images compressed"

# Lint QMD files for style issues
lint: ## Check QMD files for style compliance
	@echo "Linting Quarto files..."
	@./scripts/lint-qmd.sh

# Check everything before commit
check: validate lint ## Run all validation checks
	@echo "✓ All checks passed"

# Show help
help: ## Show this help message
	@echo "Research Hub - Available Commands:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Examples:"
	@echo "  make render       # Build the site"
	@echo "  make preview      # Start live preview"
	@echo "  make new-meeting  # Create today's meeting notes"
