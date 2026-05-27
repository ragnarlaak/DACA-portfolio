# Week 8 Individual Learning Notes - Python APIs

These notes summarize my Week 8 individual learning focus and how it connects
to the portfolio project work.

## Business Context

The Week 7 RFM analysis answered an important customer question, but it still
depended on manual data refreshes. Marko's next problem was automation:

> How can the RFM analysis use fresh database data without manually exporting
> CSV files every week?

The business goal was to move from one-time analysis toward a repeatable data
pipeline.

## Learning Focus

- Connect Python to Supabase through the Supabase API client.
- Store credentials in `.env` instead of hardcoding API keys.
- Convert API responses into pandas DataFrames.
- Use API filters, ordering, and limits where possible.
- Write reusable functions for repeated reporting tasks.
- Add logging and basic error handling so a script is easier to monitor.
- Structure a simplified ETL pipeline:
  - Extract: pull data from Supabase
  - Transform: clean, merge, and calculate outputs
  - Load: save outputs for reporting or later analysis

## Business Problem -> Solution

**Problem:** Manually refreshed CSV files become stale and make recurring
customer reporting slower and harder to trust.

**Solution:** Use Python API extraction and a repeatable pipeline so sales and
customer data can be refreshed, merged, validated, and saved with one command.

## How This Connects to My Portfolio

The individual Week 8 project is the smaller pipeline proof. It extracts sales
and customer data from Supabase, merges the tables with pandas, validates the
result, and saves a clean output file.

The team project expands the same idea into a modular pipeline for RFM,
retention, marketing campaign planning, HTML dashboard exports, validation,
logging, and optional notifications.
