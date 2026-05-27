# Week 8 Team Project - Modular API RFM Pipeline

This folder contains the Week 8 team project imported from the shared team
work. The project turns the Week 7 RFM customer analysis into a modular Python
pipeline that can be run from the command line and reused for updated
UrbanStyle data.

## Project Focus

The pipeline supports a practical business question:

> Which customer segments should UrbanStyle prioritize for retention,
> loyalty, and marketing campaigns?

To support that question, the pipeline extracts sales, customer, and product
data, cleans and combines the tables, calculates business KPIs, builds RFM
segments, creates retention and campaign-planning outputs, and exports HTML
visual reports.

## Team Roles

- `data_fetcher.py` - Role A: Supabase API extraction, pagination, retry logic,
  and fallback data.
- `transform.py` - Role B: cleaning, table joins, KPI reporting, RFM,
  cohort retention, and campaign-plan logic.
- `visualize_export.py` - Role C: Plotly visualizations, HTML exports, and
  combined dashboard output.
- `pipeline.py` - Role D: end-to-end pipeline orchestration, validation,
  logging, command-line date handling, retry flow, and optional notifications.
- `notifications.py` - optional webhook and email pipeline notifications.
- `config.yaml` - table names, date filter, retry settings, output folder, and
  RFM reference date.
- `tests/` - focused checks for transformation, RFM, retention, and marketing
  logic.

## My Contribution - Role D

My role was **Role D - automation script**. This part connects the separate
team modules into one repeatable pipeline:

```text
extract -> transform -> validate -> export -> notify
```

The Role D script handles:

- loading `config.yaml`
- accepting an optional `--date` argument for the analysis cutoff date
- running API extraction and fallback-data logic
- calling the transformation and RFM reporting steps
- validating key outputs and revenue totals
- exporting the dashboard and report files
- writing run logs and error logs
- sending optional success or failure notifications when configured

This role was important because it turned separate analysis functions into a
workflow that can be run again with one command.

## How to Run

Install the team requirements from the repository root:

```powershell
python -m pip install -r week8-python-api-pipeline/team/requirements.txt
```

Run the team pipeline:

```powershell
python week8-python-api-pipeline/team/pipeline.py
```

Run with an explicit analysis end date:

```powershell
python week8-python-api-pipeline/team/pipeline.py --date 2025-02-28
```

The pipeline looks for Supabase credentials in a local `.env` file:

```text
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

Use `.env.example` as the template and keep the real `.env` file out of Git.

If the API is unavailable and fallback mode is enabled in `config.yaml`, the
pipeline can use local CSV fallback data or built-in sample data so the workflow
still runs for testing and demonstration.

## Outputs

Generated files are saved under `team/output/`. Timestamped HTML files are
created for each run, and stable `*_latest.html` copies are also written for
quick review.

Expected report types include:

- weekly revenue
- monthly revenue
- city revenue
- channel revenue
- KPI summary
- cohort retention
- segment category profile
- marketing campaign plan
- RFM segment distribution
- RFM scatter chart
- top VIP customers
- combined team dashboard

Generated outputs and logs are intentionally ignored by Git so the repository
keeps the reusable pipeline code and documentation without committing local run
artifacts.

## Tests

Run the team tests from the repository root:

```powershell
python -m pytest week8-python-api-pipeline/team/tests
```

The tests check core transformation logic, RFM revenue matching, data-quality
counts, cohort retention fields, and campaign-plan structure.

## Business Interpretation

The pipeline connects RFM segmentation with a marketing action plan. VIP
customers can be protected with loyalty offers, At Risk customers can receive
win-back campaigns, and Loyal or Potential customers can be targeted with
cross-sell and repeat-purchase offers.

This makes the output more than a technical pipeline: it prepares a repeatable
customer decision workflow for UrbanStyle.

## Source Note

The team project files were imported from the shared Week 8 team work published
in Katlin Tootmaa's GitHub repository:

[katlintootmaa-cmd/daca-portfolio - week-08](https://github.com/katlintootmaa-cmd/daca-portfolio/tree/main/week-08)
