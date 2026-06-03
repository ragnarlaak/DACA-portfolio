# Website Content Package

Use this copy for the public portfolio because each number is either reproduced from committed RFM output or explicitly supported by documented project evidence.

One-time context statement:

> Projects are based on an UrbanStyle retail business-simulation dataset completed during the Data Analyst Career Accelerator.

## Project 1

**Title:** Power BI - Sales Performance Dashboard

**Tool tags:** Power BI, DAX, Business Reporting

**Business question:** How did UrbanStyle perform, and where is growth lagging?

**Supported numerical highlights:**

- ~EUR 2.91M revenue analysed.
- ~10K orders.
- 19.08% revenue growth in 2024 versus 2023.
- ~13% Tartu growth, below overall company growth.

**Evidence status:** DOCUMENTED EVIDENCE, NOT REPRODUCED

**Key finding:** UrbanStyle grew overall, but Tartu grew more slowly than the company, making it the right location for deeper follow-up analysis.

**Why it matters:** The dashboard moves from a broad growth question to a practical location-performance question.

**Recommended action:** Compare Tartu product mix, average order value and customer segments with stronger-performing locations or channels.

**Evidence link:** `https://github.com/ragnarlaak/DACA-portfolio/tree/main/week5-power-bi`

**Visual asset filename:** `assets/powerbi-dashboard.png`

## Project 2

**Title:** Python/pandas - RFM Customer Segmentation

**Tool tags:** Python, pandas, Segmentation

**Business question:** Which customer groups should UrbanStyle prioritise for loyalty, retention and win-back actions?

**Supported numerical highlights:**

- 2,540 customers analysed.
- VIP Champions: 455 customers and 42.82% of revenue.
- Potential: 758 customers, largest customer segment.
- At Risk: 533 customers and 7.24% of revenue.

**Evidence status:** VERIFIED / REPRODUCED FROM COMMITTED WEEK 7 TEAM EXPORT

**Key finding:** VIP Champions are not the largest group, but they contribute the highest revenue share.

**Why it matters:** Customer value and customer count point to different actions: protect VIP value, develop Potential customers and reactivate At Risk customers.

**Recommended action:** Protect VIP Champions with loyalty offers, move Potential customers toward repeat purchases and target At Risk customers before they become Lost.

**Evidence link:** `https://github.com/ragnarlaak/DACA-portfolio/tree/main/portfolio-evidence/outputs/authoritative-rfm`

**Visual asset filename:** `assets/rfm_revenue_by_segment.png`

## Project 3

**Title:** SQL - Data Quality Analysis

**Tool tags:** SQL, Supabase, Data Cleaning

**Business question:** Is customer data reliable enough for reporting and segmentation?

**Supported numerical highlights:**

- 128 duplicate email records.
- 380 missing email values.
- 12 city naming variations.

**Evidence status:** DOCUMENTED EVIDENCE, NOT REPRODUCED

**Key finding:** Customer data contains duplicate, missing and inconsistent fields that can weaken reporting and segmentation.

**Why it matters:** These issues can reduce reporting reliability and weaken customer segmentation or location-based analysis.

**Recommended action:** Standardise location values, resolve duplicate records and strengthen required-field validation before reporting or campaign use.

**Evidence link:** `https://github.com/ragnarlaak/DACA-portfolio/tree/main/week2-sql-data-cleaning`

**Visual asset filename:** none; use metric tiles.

## Project 4

**Title:** Python API Pipeline

**Tool tags:** Python, pandas, Data Pipelines

**Business question:** How can recurring customer and sales analysis be refreshed without manually repeating notebook work?

**Supported numerical highlights:**

- 4/4 tests passed.
- Pipeline completed with configured sample/fallback data.
- Core outputs validated.
- 24 HTML reports exported in the local run.

**Evidence status:** VERIFIED / REPRODUCED FOR SAMPLE/FALLBACK WORKFLOW

**Key finding:** The pipeline demonstrates a repeatable extract, transform, validate and export workflow.

**Why it matters:** It shows movement from one-off analysis toward reusable reporting workflow, while staying transparent that the demonstration run is not live KPI evidence.

**Recommended action:** Use this as supporting workflow evidence, not as the primary business-results case study.

**Evidence link:** `https://github.com/ragnarlaak/DACA-portfolio/tree/main/week8-python-api-pipeline`

**Visual asset filename:** none required; use compact process steps.
