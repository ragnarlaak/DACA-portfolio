# Website Content Package

This copy is safe for public website use because each numerical claim is either
reproduced from committed RFM output or clearly documented in the source
portfolio repository.

## Flagship Project 1

**Title:** Sales Performance Dashboard

**Tools:** Power BI, DAX, PostgreSQL/Supabase

**Business question:** How did UrbanStyle perform, and where is growth lagging?

**Key outcome:** The dashboard story shows approximately 10K orders,
approximately EUR 2.91M revenue, and 19.08% revenue growth in 2024 versus 2023.
The Tartu storytelling view shows that Tartu also grew, but at approximately
13%, below UrbanStyle's approximately 19% overall growth.

**Why it matters:** The result turns a broad growth question into a practical
next step: UrbanStyle is growing, but not every location is keeping pace.

**Recommendation/action:** Compare Tartu product mix, average order value, and
customer segments with stronger-performing locations or channels.

**Source evidence path:** `week5-power-bi/README.md`;
`week5-power-bi/team/images/urbanstyle_revenue_dashboard.png`;
`week6-data-storytelling/README.md`;
`week6-data-storytelling/individual/week6_tartu_dashboard_storytelling.png`

**Suggested website visual filename:** `assets/powerbi-dashboard.png`

## Flagship Project 2

**Title:** RFM Customer Segmentation

**Tools:** Python, pandas

**Business question:** Which customer groups should be prioritised for loyalty,
retention, and win-back actions?

**Key outcome:** The RFM export analysed 2,540 customers using a 2025-02-28
reference date. VIP Champions represented 455 customers but contributed
EUR 1,146,295.15, or 42.82% of segment revenue. Potential was the largest
segment with 758 customers. At Risk contained 533 customers with an average
recency of 310.35 days.

**Why it matters:** The analysis separates high-value customers from customers
who need repeat-purchase or win-back attention, making campaign priorities more
defensible.

**Recommendation/action:** Protect VIP Champions with loyalty offers, encourage
Potential customers toward repeat purchases, and target At Risk customers with
win-back actions before they become Lost.

**Source evidence path:** `week7-python/team/rfm_segments.csv`;
`portfolio-evidence/outputs/rfm_segment_summary.csv`

**Suggested website visual filename:** `assets/rfm_revenue_by_segment.png`

## Flagship Project 3

**Title:** SQL Data Quality Analysis

**Tools:** SQL, Supabase

**Business question:** Is customer data reliable enough for reporting and
segmentation?

**Key outcome:** Week 2 data-quality evidence identified 128 duplicate email
records, 380 missing email values, and 12 city naming variations.

**Why it matters:** Duplicate, missing, and inconsistent customer fields can
weaken segmentation, campaign targeting, and location-level reporting.

**Recommendation/action:** Standardise city values, resolve duplicate emails,
and strengthen required-field validation before using customer data for
customer reporting or campaigns.

**Source evidence path:** `week2-sql-data-cleaning/README.md`;
`week2-sql-data-cleaning/team/week2_group_project.sql`

**Suggested website visual filename:** `assets/sql_data_quality_findings.png`

## Supporting Project

**Title:** Python API Pipeline / Automation

**Tools:** Python, pandas, Supabase API, YAML, validation and export logic

**Business question:** How can recurring customer and sales analysis be
refreshed without manually repeating notebook work?

**Key outcome:** The Week 8 pipeline was executed successfully with its
configured sample-data fallback, validated core outputs, and exported 24 HTML
reports. Supabase/live-data access was blocked in the environment, so public
copy should not use the sample-data KPI values as UrbanStyle findings.

**Why it matters:** The project shows the transition from one-off analysis to a
repeatable data workflow that coordinates extraction, cleaning, validation and
report export.

**Recommendation/action:** Present Week 8 as an additional workflow project
focused on repeatable reporting and pipeline orchestration, not as a primary
business-outcome case study.

**Source evidence path:** `week8-python-api-pipeline/README.md`;
`week8-python-api-pipeline/team/README.md`;
`week8-python-api-pipeline/team/pipeline.py`;
`portfolio-evidence/outputs/pipeline_summary.md`

**Suggested website visual filename:** `assets/pipeline_workflow_visual.png`
