# Regression Interpretation Cheat Sheet
## January 9, 2026 Analysis

---

## Bivariate Regressions (Tables 1-5)

**Structure:** Demographic Variable ~ School Exposure Measure

Each cell shows a separate regression where a demographic characteristic is predicted by a school measure.

### How to Read Coefficients

| Variable Type | Unit | Interpretation Template |
|--------------|------|------------------------|
| **pct_** variables | Percentage points (0-100 scale) | "A 1-unit increase in [school measure] is associated with a [coef] **percentage point** change in [demographic]" |
| **avg_income** | Dollars | "A 1-unit increase in [school measure] is associated with a $[coef] change in average income" |
| **avg_age** | Years | "A 1-unit increase in [school measure] is associated with a [coef] year change in average age" |

### Example Interpretations

**From Table 1 (Total Private Schools):**
```
total_school → pct_black: 0.526**
```
> "A 1-school increase in average private school access is associated with a **0.53 percentage point increase** in the percent Black population."

**From Table 2 (Religious Schools):**
```
relig → pct_hispanic: 0.375*
```
> "A 1-school increase in religious private school access is associated with a **0.38 percentage point increase** in the percent Hispanic population."

**From Table 3 (Non-Religious Schools):**
```
non_relig → pct_college_plus: 1.134**
```
> "A 1-school increase in non-religious private school access is associated with a **1.13 percentage point increase** in the percent with a college degree or higher."

---

## Multivariate Regressions (Tables 6-10)

**Structure:** School Exposure Measure ~ Multiple Demographics

These show which demographic characteristics predict school access, controlling for other demographics.

### How to Read Coefficients

| Predictor Variable | Unit Change | Interpretation Template |
|-------------------|-------------|------------------------|
| **avg_income** | $1 | "A $1 increase in average income is associated with a [coef] change in [school measure], holding other demographics constant" |
| **avg_income** | $1,000 | Multiply coefficient by 1,000: "A $1,000 increase..." |
| **pct_** variables | 1 percentage point | "A 1 percentage point increase in [demographic share] is associated with a [coef] change in [school measure], holding other demographics constant" |
| **avg_age** | 1 year | "A 1-year increase in average age is associated with a [coef] change in [school measure], holding other demographics constant" |

### Example Interpretations

**From Table 6 (Total Private Schools):**
```
pct_white → total_school: -1.256
```
> "A 1 percentage point increase in the white population share is associated with **1.26 fewer private schools** on average, holding income, age, education, Hispanic share, and Black share constant."

**From Table 7 (Religious Schools):**
```
avg_age → relig: 0.212
```
> "A 1-year increase in average county age is associated with **0.21 more religious private schools** on average, holding other demographics constant."

**From Table 8 (Non-Religious Schools):**
```
avg_income → non_relig: 0.0000385
```
> "A $1,000 increase in average income is associated with **0.039 more non-religious private schools** (0.0000385 × 1,000), holding other demographics constant."

---

## Quick Reference: What the School Measures Mean

| Variable | Definition | 1-Unit = |
|----------|------------|----------|
| `total_school` | Average private school count within 5 miles | 1 additional school |
| `relig` | Religious private schools within 5 miles | 1 additional religious school |
| `non_relig` | Non-religious private schools within 5 miles | 1 additional non-religious school |
| `distinct_fine` | Count of unique school types (granular) | 1 additional school type |
| `distinct_collapsed` | Count of unique school types (10 categories) | 1 additional broad category |

---

## Statistical Significance Key

| Symbol | p-value | Meaning |
|--------|---------|---------|
| *** | p < 0.01 | Strong evidence |
| ** | p < 0.05 | Moderate evidence |
| * | p < 0.1 | Weak evidence |
| (none) | p >= 0.1 | Not statistically significant |
