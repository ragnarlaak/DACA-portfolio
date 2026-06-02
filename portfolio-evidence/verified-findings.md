# Verified Portfolio Findings

This file summarizes the strongest portfolio findings that are either reproduced
from committed project outputs or clearly documented in the course repository.

## Sales Performance Dashboard - Power BI

**Tools:** Power BI, DAX, PostgreSQL/Supabase connection, dashboard storytelling

**Business question:** How did UrbanStyle perform, and where is growth lagging?

**Findings:** The Week 5 Power BI dashboard documentation and exported
dashboard screenshot show approximately 10K orders, approximately EUR 2.91M in
revenue, and 19.08% revenue growth in 2024 versus 2023. Week 6 documented the
Tartu story: Tartu grew approximately 13% in 2024 versus 2023, which lagged
UrbanStyle's approximately 19% overall growth.

**Why it matters:** The story is stronger than a simple "growth/no growth"
answer. UrbanStyle was growing overall, but Tartu's slower growth suggests a
need for deeper location-level comparison.

**Recommendation/action:** Compare Tartu product mix, average order value, and
customer segments with stronger-performing locations or channels.

**Evidence source/path:**

- `week5-power-bi/README.md`
- `week5-power-bi/team/ceo_view_notes.txt`
- `week5-power-bi/team/images/urbanstyle_revenue_dashboard.png`
- `week6-data-storytelling/README.md`
- `week6-data-storytelling/individual/week6_tartu_dashboard_storytelling.png`

## RFM Customer Segmentation - Python/pandas

**Tools:** Python, pandas, CSV export, RFM analysis

**Business question:** Which customer groups should be prioritised for loyalty,
retention, and win-back actions?

**Findings reproduced from `week7-python/team/rfm_segments.csv`:**

- Reference date: 2025-02-28
- Customers analysed: 2,540
- Total monetary value in the RFM export: EUR 2,676,850.54
- Highest-value segment: VIP Champions, 455 customers, EUR 1,146,295.15,
  42.82% of segment revenue
- Largest segment: Potential, 758 customers, 29.84% of customers, 19.49% of
  segment revenue
- At Risk segment: 533 customers, 20.98% of customers, EUR 193,876.62, 7.24%
  of segment revenue, average recency 310.35 days
- Lost segment: 116 customers, 4.57% of customers, EUR 19,540.79, 0.73% of
  segment revenue, average recency 516.10 days

**Why it matters:** A relatively small VIP Champions group contributes a large
share of monetary value, while At Risk and Lost groups show where retention and
win-back work should be targeted.

**Recommendation/action:** Protect VIP Champions with loyalty and early-access
offers, move Potential customers toward repeat purchasing, and run targeted
win-back actions for At Risk customers before they become Lost.

**Evidence source/path:**

- `week7-python/team/rfm_segments.csv`
- `portfolio-evidence/outputs/rfm_segment_summary.csv`
- `portfolio-evidence/outputs/rfm_revenue_by_segment.png`
- `portfolio-evidence/outputs/rfm_customers_by_segment.png`

## Data Quality Analysis - SQL

**Tools:** SQL, Supabase SQL Editor, data quality checks

**Business question:** Is customer data reliable enough for reporting and
segmentation?

**Findings:** Week 2 documentation reports 128 duplicate email records, 380
missing email values, and 12 city naming variations.

**Why it matters:** Duplicate and missing customer data can weaken segmentation
and campaign targeting. Inconsistent city naming can distort location-level
analysis.

**Recommendation/action:** Standardise city values, resolve duplicate emails,
and strengthen required-field validation before using customer data for
reporting or campaigns.

**Evidence source/path:**

- `week2-sql-data-cleaning/README.md`
- `week2-sql-data-cleaning/individual/week2_individual_practice.sql`
- `week2-sql-data-cleaning/team/week2_group_project.sql`
- `portfolio-evidence/outputs/sql_data_quality_findings.csv`
- `portfolio-evidence/outputs/sql_data_quality_findings.png`

## API Pipeline / Automation - Python

**Tools:** Python, pandas, Supabase API, YAML config, pipeline orchestration,
validation, Plotly export logic

**Business question:** How can recurring customer and sales analysis be
refreshed without manually repeating notebook work?

**Findings:** The Week 8 project documents and executes a modular pipeline that
connects extraction, transformation, validation, export, and optional
notification steps. In this environment, the pipeline ran successfully using its
configured sample-data fallback after Supabase credentials and CSV fallback
files were unavailable. The run processed 21 sample sales rows, produced 13
clean sample sales rows after the date filter, validated core outputs, and
exported 24 HTML reports.

**Why it matters:** The project shows movement from one-off analysis toward
repeatable reporting and customer-segmentation workflow.

**Recommendation/action:** Mention as supporting project/workflow experience,
not as a quantified UrbanStyle business finding. Public copy should emphasize
repeatable extraction, validation, reporting exports, and workflow
orchestration.

**Evidence source/path:**

- `week8-python-api-pipeline/README.md`
- `week8-python-api-pipeline/team/README.md`
- `week8-python-api-pipeline/team/pipeline.py`
- `week8-python-api-pipeline/team/transform.py`
- `week8-python-api-pipeline/team/config.yaml`
- `portfolio-evidence/outputs/pipeline_summary.md`
- `portfolio-evidence/outputs/pipeline_output_summary.csv`
- `portfolio-evidence/outputs/pipeline_workflow_visual.png`

## Power BI Portfolio Edit Copies

Safe copies of selected Power BI files were created under
`portfolio-evidence/powerbi-edits/`:

- `portfolio-evidence/powerbi-edits/week5_ceo_dashboard_portfolio_edit.pbix`
- `portfolio-evidence/powerbi-edits/week6_tartu_dashboard_portfolio_edit.pbix`

Power BI Desktop was not discoverable in the shell environment, so the copied
reports were not opened or edited. Original `.pbix` files were not modified.
