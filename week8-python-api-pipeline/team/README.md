# Week 8 Team Project - Modular API RFM Pipeline

This folder contains the Week 8 team pipeline. It demonstrates a repeatable data workflow for extraction, transformation, validation and report export.

## Evidence Status

VERIFIED / REPRODUCED FOR SAMPLE/FALLBACK WORKFLOW.

The pipeline can attempt Supabase extraction, but the audited local run used configured built-in sample/fallback data because Week 8 credentials were unavailable and CSV fallback files were absent. Do not use this sample run to support live UrbanStyle KPI or Week 7 RFM business claims.

## Team Roles

- `data_fetcher.py` - Role A: Supabase API extraction, pagination, retry logic and fallback data.
- `transform.py` - Role B: cleaning, table joins, KPI reporting, RFM, cohort retention and campaign-plan logic.
- `visualize_export.py` - Role C: Plotly visualizations, HTML exports and combined dashboard output.
- `pipeline.py` - Role D: end-to-end orchestration, validation, logging, command-line date handling and optional notifications.
- `notifications.py` - Optional webhook and email notifications.
- `config.yaml` - Table names, date filter, retry settings, output folder and RFM reference date.
- `tests/` - Focused tests for transformation, RFM, retention and campaign-plan logic.

## My Contribution - Role D

My role was Role D - automation script. This connects the separate modules into one repeatable workflow:

```text
extract -> transform -> validate -> export -> notify
```

The script handles:

- loading `config.yaml`;
- accepting an optional `--date` argument;
- running API extraction and fallback-data logic;
- calling transformation and RFM reporting steps;
- validating key outputs and revenue totals;
- exporting dashboard/report files;
- writing run logs and error logs;
- sending optional success or failure notifications when configured.

## Confirmed Audit Run

Command:

```powershell
py week8-python-api-pipeline\team\pipeline.py --date 2025-02-28
```

Result:

- Pipeline completed.
- Built-in sample/fallback data was used.
- 21 sample sales rows were processed.
- 13 rows remained after the date filter.
- Core validation checks passed.
- 24 HTML report files were exported locally.

## Tests

Command:

```powershell
py -m pytest week8-python-api-pipeline\team\tests
```

Result: 4/4 tests passed.

## How to Run

From the repository root:

```powershell
py -m pip install -r week8-python-api-pipeline\team\requirements.txt
py week8-python-api-pipeline\team\pipeline.py --date 2025-02-28
```

The pipeline looks for Supabase credentials in a local `.env` file:

```text
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

Keep real `.env` files out of Git.

## Public Portfolio Interpretation

This project is best presented as supporting workflow evidence: it shows how analysis logic can be made repeatable, validated and exported. It should not be presented as a production pipeline or as authoritative live KPI evidence unless live-data execution is later reproduced and documented.
