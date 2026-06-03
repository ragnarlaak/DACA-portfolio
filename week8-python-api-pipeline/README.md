# Week 8 - Python API Pipeline

This week focused on turning notebook-style analysis into a repeatable Python workflow for extraction, transformation, validation and reporting exports.

## Business Question

How can recurring customer and sales analysis be refreshed without manually repeating notebook work?

## Evidence Status

VERIFIED / REPRODUCED FOR SAMPLE/FALLBACK WORKFLOW.

During the portfolio audit, the team tests passed and the pipeline completed. The run used configured built-in sample/fallback data because Week 8 Supabase credentials were not available and local CSV fallback files were absent. This project is therefore public workflow evidence, not live UrbanStyle KPI evidence.

## Confirmed Audit Results

- `py -m pytest week8-python-api-pipeline\team\tests` passed 4/4 tests.
- `py week8-python-api-pipeline\team\pipeline.py --date 2025-02-28` completed.
- The sample/fallback run processed 21 sample sales rows.
- After the date filter, 13 sample sales rows remained.
- Core validation checks passed.
- 24 HTML report files were exported locally.

## My Contribution

My team role was Role D - automation and orchestration. This connected the separate team modules into one repeatable workflow:

```text
extract -> transform -> validate -> export -> notify
```

The orchestration script handles configuration loading, date arguments, extraction/fallback flow, transformation calls, validation checks, report exports, logging and optional notifications.

## Public Wording

Safe public wording:

> Built a repeatable Python data pipeline for extracting, transforming, validating and exporting analysis-ready reporting outputs. The portfolio demonstration uses configured sample/fallback data and is presented as workflow evidence rather than live business KPI evidence.

## Folders

- `team/` - Modular team pipeline with extraction, transformation, validation, export and tests.
- `individual/` - Individual pipeline practice.

## Evidence

- [Team pipeline README](team/README.md)
- [Pipeline orchestration script](team/pipeline.py)
- [Transformation logic](team/transform.py)
- [Configuration](team/config.yaml)
- [Tests](team/tests/test_transform.py)
