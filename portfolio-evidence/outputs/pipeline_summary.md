# Week 8 Pipeline Run Summary

Execution date: 2026-06-02

Command: `py week8-python-api-pipeline\team\pipeline.py --date 2025-02-28`

## Result

The Week 8 team pipeline executed successfully and exported HTML reports under `week8-python-api-pipeline/team/output/`.

## Data Source Classification

The run did not use live Supabase data. Supabase credentials were unavailable in the Week 8 environment, and local CSV fallback files were not present. The pipeline therefore used its configured built-in sample data so the workflow could complete.

This means the Week 8 run is valid evidence of workflow orchestration, validation and report export behavior, but the sample-data KPI numbers should not be presented publicly as UrbanStyle business findings.

## Sample Run Details

- Data source used: `sample_data`
- Raw sales rows: 21
- Raw customer rows: 8
- Raw product rows: 21
- Clean sales rows after date filter: 13
- Unique customers in clean sales: 7
- RFM customers in sample run: 7
- Pipeline run revenue total: EUR 2,048.80
- HTML reports exported: 24

## Validation Checks Observed

The pipeline validation step reported OK for clean sales, weekly revenue, RFM,
monthly revenue, city revenue, data quality, campaign plan, cohort retention,
RFM revenue matching, and monthly revenue matching.

## Recruiter-Safe Public Wording

Built a repeatable Python data pipeline that coordinates extraction, cleaning,
validation, RFM/customer reporting and HTML report export. In this environment,
the pipeline completed with its configured sample-data fallback, so public copy
should emphasise workflow automation rather than sample-data business KPIs.
