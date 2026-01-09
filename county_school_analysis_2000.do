/*==============================================================================
Project    : Florida Private School Exposure Analysis
File       : county_school_analysis_2000.do
Purpose    : Analyze relationship between demographics and private school access
Author     : Myles Owens
Institution: Hoover Institution, Stanford University
Date       : 2025-12-01
───────────────────────────────────────────────────────────────────────────────
Description:
    This script performs bivariate regression analysis examining the
    relationship between PUMA-level demographic characteristics and private
    school exposure measures. For each school exposure measure (total schools,
    religious schools, non-religious schools, school diversity), it runs
    separate regressions with each demographic variable to identify
    correlations between community characteristics and school access.

Inputs:
    - school_count_final.dta    Final merged dataset with demographics + schools

Outputs:
    - summary_stats.doc              Summary statistics for all variables
    - reg_total_school.tex           Regression results using total schools
    - reg_non_relig.tex              Regression results using non-religious schools
    - reg_relig.tex                  Regression results using religious schools
    - reg_distinct_fine.tex          Regression results using fine school diversity
    - reg_distinct_collapsed.tex     Regression results using collapsed school diversity

Analysis Specifications:
    - Distance Buffer: 5 miles (filters distance == 5)
    - Model Type: Bivariate OLS regression (Y ~ X, no controls)
    - Standard Errors: Default (non-robust)

    For each school exposure measure, run:
        demographic_variable = β₀ + β₁ × school_exposure + ε

==============================================================================*/

clear all
set more off
cd "$florida/data"

*** ---------------------------------------------------------------------------
*** Section 1: Load Data and Apply Distance Filter
*** ---------------------------------------------------------------------------

* Load final merged dataset with demographics and school exposure
use sch_county_count_2000, clear

* Filter to 5-mile distance buffer (most relevant for school access)
* This buffer represents a reasonable driving distance for private school choice
keep if distance == 5

*** ---------------------------------------------------------------------------
*** Section 2: Rename Variables and Harmonize Units
*** ---------------------------------------------------------------------------

* Rename demographic variables for clarity (all will be percentages 0-100)
rename hisp_share  pct_hispanic
rename black_share pct_black
rename white_share pct_white
rename less_hs     pct_less_hs
rename hs_grad     pct_hs_grad
rename some_college pct_some_college
rename college_plus pct_college_plus

* Convert education variables from 0-1 to 0-100 scale
replace pct_less_hs      = pct_less_hs * 100
replace pct_hs_grad      = pct_hs_grad * 100
replace pct_some_college = pct_some_college * 100
replace pct_college_plus = pct_college_plus * 100

*** ---------------------------------------------------------------------------
*** Section 3: Apply Variable Labels
*** ---------------------------------------------------------------------------

* Apply descriptive labels for tables and output
* Demographic variables (all percentages 0-100)
label var avg_income       "Average income"
label var pct_black        "Percent Black"
label var pct_hispanic     "Percent Hispanic"
label var pct_white        "Percent White"
label var avg_age          "Average age"
label var pct_hs_grad      "Percent HS graduate"
label var pct_less_hs      "Percent less than HS"
label var pct_some_college "Percent some college"
label var pct_college_plus "Percent college+"

* School exposure variables
label var total_school       "Total schools"
label var non_relig          "Non-religious schools"
label var relig              "Religious schools"
label var distinct_fine      "Distinct types (fine)"
label var distinct_collapsed "Distinct types (collapsed)"

*** ---------------------------------------------------------------------------
*** Section 4: Summary Statistics
*** ---------------------------------------------------------------------------

* Generate summary statistics for all key variables
* This provides descriptive overview of the data before regression analysis
summarize avg_income pct_hispanic pct_black pct_white avg_age ///
         pct_less_hs pct_hs_grad pct_some_college pct_college_plus ///
         total_school relig non_relig distinct_fine distinct_collapsed

* Export summary statistics to Word document
outreg2 using summary_stats.doc, sum(log) replace

*** ---------------------------------------------------------------------------
*** Section 5: Bivariate Regression Analysis
*** ---------------------------------------------------------------------------

* For each school exposure measure, run bivariate regressions with all
* demographic variables. This identifies which demographics are correlated
* with private school access.

* Loop over each school exposure measure
foreach exp in total_school non_relig relig distinct_fine distinct_collapsed {

    * Clear stored estimates from previous iteration
    eststo clear

    * Run bivariate regressions: each demographic ~ school exposure
    * Specification: demographic_i = β₀ + β₁ × school_exposure + ε

    eststo: reg avg_income       `exp'    // Income and school access
    eststo: reg pct_black        `exp'    // Race and school access
    eststo: reg pct_hispanic     `exp'    // Ethnicity and school access
    eststo: reg avg_age          `exp'    // Age and school access
    eststo: reg pct_hs_grad      `exp'    // High school education and school access
    eststo: reg pct_less_hs      `exp'    // Less than HS and school access
    eststo: reg pct_some_college `exp'    // Some college and school access
    eststo: reg pct_college_plus `exp'    // College education and school access

    * Export regression results to LaTeX table
    * se: Include standard errors
    * r2: Include R-squared
    * ar2: Include adjusted R-squared
    * label: Use variable labels in output
    * style(tex): Format for LaTeX
    esttab using "$florida/output/reg_county_`exp'.tex", replace ///
        se r2 ar2 label style(tex) ///
        title("Regression Results using `exp'")
}

*** ---------------------------------------------------------------------------
*** Section 6: Multivariate Regression
*** ---------------------------------------------------------------------------

reg total_school avg_income avg_age pct_hs_grad pct_white pct_hispanic pct_black

reg relig avg_income avg_age pct_hs_grad pct_white pct_hispanic pct_black

reg non_relig avg_income avg_age pct_hs_grad pct_white pct_hispanic pct_black

reg distinct_fine avg_income avg_age pct_hs_grad pct_white pct_hispanic pct_black

reg distinct_collapsed avg_income avg_age pct_hs_grad pct_white pct_hispanic pct_black

*** ---------------------------------------------------------------------------
*** End of Script
*** ---------------------------------------------------------------------------
