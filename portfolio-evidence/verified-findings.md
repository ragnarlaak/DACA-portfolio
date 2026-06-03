# Verified Portfolio Findings

Projects are based on an UrbanStyle retail business-simulation dataset completed during the Data Analyst Career Accelerator. This file separates reproduced results from documented project evidence so public portfolio claims stay credible.

## 1. Power BI - Sales Performance Dashboard

**Tools:** Power BI, DAX, PostgreSQL/Supabase, business reporting

**Business question:** How did UrbanStyle perform, and where is growth lagging?

**Evidence status:** DOCUMENTED EVIDENCE, NOT REPRODUCED

**Supported findings:**

- Week 5 dashboard documentation and screenshot show approximately 10K orders and approximately EUR 2.91M revenue in the dashboard scope.
- Week 5 dashboard documentation and notes show 19.08% revenue growth in 2024 versus 2023.
- Week 6 Tartu storytelling documentation reports approximately 13% Tartu revenue growth, below UrbanStyle's approximately 19% overall growth.

**Why it matters:** UrbanStyle was growing overall, but Tartu's slower growth points to a useful follow-up question instead of a generic "growth is good" conclusion.

**Recommendation/action:** Compare Tartu product mix, average order value, and customer segments with stronger-performing locations or channels.

**Public evidence source path:**

- `week5-power-bi/README.md`
- `week5-power-bi/team/ceo_view_notes.txt`
- `week5-power-bi/team/images/urbanstyle_revenue_dashboard.png`
- `week6-data-storytelling/README.md`
- `week6-data-storytelling/individual/week6_tartu_dashboard_storytelling.png`

## 2. Python/pandas - RFM Customer Segmentation

**Tools:** Python, pandas, CSV export, RFM analysis

**Business question:** Which customer groups should UrbanStyle prioritise for loyalty, retention and win-back actions?

**Evidence status:** VERIFIED / REPRODUCED FROM COMMITTED WEEK 7 TEAM EXPORT. Direct Supabase notebook rerun is BLOCKED by network/DNS access in this environment.

**Supported findings:**

- Reference date: 2025-02-28.
- Customers analysed: 2,540.
- Total monetary value in RFM export: EUR 2,676,850.54.
- VIP Champions: 455 customers, EUR 1,146,295.15, 42.82% of revenue.
- Potential: 758 customers, largest segment by customer count.
- At Risk: 533 customers, 7.24% of revenue, average recency 310.35 days.
- Lost: 116 customers, 0.73% of revenue, average recency 516.10 days.

**Why it matters:** VIP Champions contribute a disproportionate share of value, while Potential and At Risk customers show where repeat-purchase and win-back work should be focused.

**Recommendation/action:** Protect VIP Champions with loyalty and early-access offers, move Potential customers toward repeat purchasing, and target At Risk customers before they become Lost.

**Public evidence source path:**

- `week7-python/team/rfm_segments.csv`
- `portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_verification.md`
- `portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_segment_summary.csv`
- `portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_revenue_by_segment.png`
- `portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_customers_by_segment.png`

## 3. SQL - Data Quality Analysis

**Tools:** SQL, Supabase SQL Editor, data-quality checks

**Business question:** Is customer data reliable enough for reporting and segmentation?

**Evidence status:** DOCUMENTED EVIDENCE, NOT REPRODUCED

**Supported findings:**

- 128 duplicate email records.
- 380 missing email values.
- 12 city naming variations.

**Why it matters:** These issues can reduce reporting reliability and weaken customer segmentation or location-based analysis.

**Recommendation/action:** Standardise location values, resolve duplicate records and strengthen required-field validation before reporting or campaign use.

**Public evidence source path:**

- `week2-sql-data-cleaning/README.md`
- `week2-sql-data-cleaning/team/week2_group_project.sql`

## 4. Python Pipeline - Workflow Evidence

**Tools:** Python, pandas, Supabase API client, YAML config, validation, Plotly exports

**Business question:** How can recurring customer and sales analysis be refreshed without manually repeating notebook work?

**Evidence status:** VERIFIED / REPRODUCED for sample/fallback workflow execution. BLOCKED for live Supabase data because Week 8 credentials/CSV fallback files were unavailable in this environment.

**Supported findings:**

- `py -m pytest week8-python-api-pipeline\team\tests` passed 4/4 tests.
- `py week8-python-api-pipeline\team\pipeline.py --date 2025-02-28` completed.
- The run used built-in sample/fallback data, processed 21 sample sales rows, retained 13 rows after the date filter, validated core outputs and exported 24 HTML report files.

**Why it matters:** The project demonstrates repeatable extraction, transformation, validation and export orchestration, but it does not substantiate live UrbanStyle KPI claims.

**Recommendation/action:** Present Week 8 as supporting workflow evidence, not as authoritative Week 7 RFM business results or production automation.

**Public evidence source path:**

- `week8-python-api-pipeline/team/README.md`
- `week8-python-api-pipeline/team/pipeline.py`
- `week8-python-api-pipeline/team/transform.py`
- `week8-python-api-pipeline/team/config.yaml`
