# UrbanStyle Retail Growth Analysis: Revenue, Customer Quality and Retention Priorities

Junior Data Analyst portfolio case study using SQL, Power BI and Python/pandas to evaluate UrbanStyle's retail growth, customer data quality and customer-segment opportunities.

The analysis shows that UrbanStyle grew in 2024, but growth was uneven by location and customer value was concentrated in a smaller high-value segment. The recommendation is to protect VIP customers, improve repeat purchase among Potential customers, and investigate why Tartu is growing slower than the company overall.

Live portfolio website: https://ragnarlaak.github.io/

## Business Problem

UrbanStyle needed a practical answer to three business questions:

- Is the business growing, and where is growth lagging?
- Is customer data reliable enough for reporting and segmentation?
- Which customer groups should be prioritized for loyalty, repeat purchase and win-back campaigns?

## Dataset

- Source: UrbanStyle retail business-simulation dataset from the Data Analyst Career Accelerator.
- Business scope: sales, customer, product, store/location and campaign-style reporting work.
- Main evidence used: SQL cleaning outputs, Power BI dashboard screenshots/files, RFM export and verified portfolio audit outputs.
- Limitation: some claims are verified from committed exports, while some Power BI and SQL findings are documented evidence that could not be fully rerun without the original live Supabase environment.

Evidence tracking is documented in [portfolio-evidence/verified-findings.md](portfolio-evidence/verified-findings.md).

## Tools Used

- SQL: data quality checks, aggregation, joins and business KPI logic
- Power BI: executive dashboarding, DAX measures and stakeholder reporting
- Python/pandas: customer segmentation, reproducible summaries and pipeline workflow
- PostgreSQL/Supabase: source system used during the course project
- GitHub: portfolio documentation and evidence structure

## Data Cleaning

High-impact checks found customer data issues that could affect reporting and segmentation:

- 128 duplicate email records could double-count or misclassify customers.
- 380 missing email values reduce campaign reach and customer identity matching.
- 12 city naming variations weaken location-level analysis.

Business impact: customer reporting should not be used for campaign decisions until duplicate records, missing contact fields and city standardization are addressed.

Evidence: [Week 2 SQL data cleaning](week2-sql-data-cleaning/README.md)

## SQL Approach

The SQL work focused on business reliability rather than query volume:

- Profiled customer records for duplicates, missing values and inconsistent location names.
- Aggregated sales by month, year and location to support revenue trend analysis.
- Used joins and grouped summaries to connect products, sales and inventory-style questions.
- Translated raw checks into business risks: unreliable segmentation, weaker campaign targeting and less trustworthy location reporting.

Representative SQL files:

- [Customer data quality SQL](week2-sql-data-cleaning/team/week2_group_project.sql)
- [Sales aggregation SQL](week4-sql-aggregation/team/week4_group_project.sql)
- [Inventory and product join analysis](week3-sql-joins/team/week3_roll_c_tooted_inventuur.sql)

## Key Insights

- UrbanStyle's documented dashboard view showed about EUR 2.91M in revenue and about 10K orders.
- 2024 revenue was documented as 19.08% higher than 2023 in the comparable full-year dashboard view.
- Tartu grew about 13% in 2024 versus 2023, but lagged the overall company growth rate of 19.08%.
- VIP Champions represented 455 of 2,540 customers and contributed 42.82% of monetary value.
- Potential customers were the largest segment by count, with 758 customers available for repeat-purchase targeting.
- At Risk customers included 533 customers and should be contacted before they become Lost.
- Missing and duplicate customer fields create direct risk for segmentation, campaign targeting and location reporting.

## Recommendation

Prioritize three actions:

- Protect VIP Champions with loyalty benefits, early access and personalized offers because they contribute 42.82% of monetary value.
- Convert Potential customers with repeat-purchase campaigns, because this is the largest customer segment by count.
- Investigate Tartu's slower growth by comparing product mix, average order value and customer segments against stronger locations or online sales.

Before campaign rollout, clean duplicate emails, missing emails and city naming variations so segmentation and location reporting are reliable.

## Dashboard

- Flagship Tartu growth dashboard: [screenshot](week6-data-storytelling/individual/week6_tartu_dashboard_storytelling.png), [PBIX file](week6-data-storytelling/individual/week6_tartu_dashboard_role_b.pbix)
- Week 6 team copy of the Tartu dashboard: [screenshot](week6-data-storytelling/team/week6_tartu_dashboard_storytelling.png), [PBIX file](week6-data-storytelling/team/week6_tartu_dashboard_role_b.pbix)
- Week 5 CEO revenue dashboard: [screenshot](week5-power-bi/team/images/urbanstyle_revenue_dashboard.png), [PBIX file](week5-power-bi/team/week5_powerbi_urbanstyle_dashboard_revenue.pbix)
- RFM revenue by segment chart: [PNG](portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_revenue_by_segment.png)

![RFM revenue by customer segment](portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_revenue_by_segment.png)

## Project Evidence

| Area | Business purpose | Evidence |
| --- | --- | --- |
| SQL data quality | Check whether customer data is reliable enough for reporting | [Week 2](week2-sql-data-cleaning/README.md) |
| SQL joins | Connect product, sales and inventory-style questions | [Week 3](week3-sql-joins/README.md) |
| SQL aggregation | Build revenue and KPI summaries | [Week 4](week4-sql-aggregation/README.md) |
| Power BI dashboard | Answer whether the company is growing | [Week 5](week5-power-bi/README.md) |
| Data storytelling | Explain why Tartu needs follow-up analysis | [Week 6](week6-data-storytelling/README.md) |
| Python RFM | Segment customers for loyalty, repeat purchase and win-back | [Week 7](week7-python/README.md) |
| Python pipeline | Demonstrate repeatable reporting workflow | [Week 8](week8-python-api-pipeline/README.md) |

## Suggested Portfolio Structure

The current repository keeps the original course-week folders for traceability. For a recruiter-facing refactor, I would move the strongest assets into this simpler structure:

```text
/data          sample or approved public data extracts
/sql           data cleaning, KPI and segmentation queries
/notebooks     Python RFM and validation notebooks
/dashboard     Power BI files and exported screenshots
/evidence      verified findings, audit notes and output charts
README.md      recruiter-ready case study
```

## Completed Evidence and Remaining Limits

Completed portfolio evidence:

- Added an exported SQL findings table for the main customer data-quality checks: [sql_data_quality_findings.csv](portfolio-evidence/outputs/sql_data_quality_findings.csv).
- Added reproduced RFM evidence, including segment summary, verification notes and charts: [authoritative RFM outputs](portfolio-evidence/outputs/authoritative-rfm/).
- Added a Week 8 pipeline run summary showing the repeatable sample/fallback workflow: [pipeline_summary.md](portfolio-evidence/outputs/pipeline_summary.md).
- Added a Power BI manual improvement checklist for future dashboard polish: [powerbi-manual-improvement-checklist.md](portfolio-evidence/powerbi-manual-improvement-checklist.md).

Remaining limits:

- A public sample dataset or data dictionary can be added only if sharing is allowed.
- Power BI screenshots and PBIX files remain documented evidence rather than independently reproduced calculations.
- A hosted Power BI link, walkthrough GIF or final business-facing slide can be added later if publishing is allowed.

## Role Positioning

This project is presented as Junior Data Analyst evidence:

- I used SQL to identify data-quality risks before analysis.
- I built Power BI dashboards focused on executive questions, not visual clutter.
- I used Python/pandas to segment customers and verify business findings.
- I documented which claims are verified, documented or blocked by missing credentials.

## Contact

- GitHub: [ragnarlaak](https://github.com/ragnarlaak)
- Website: [ragnarlaak.github.io](https://ragnarlaak.github.io/)
- LinkedIn: [Ragnar Laak](https://www.linkedin.com/in/ragnar-laak-612249230/)
- Email: ragnarlaak@gmail.com
