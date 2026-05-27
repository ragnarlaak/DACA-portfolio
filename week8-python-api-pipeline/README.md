# Week 8 - Python API Pipeline and Automation

Week 8 focused on turning notebook-style customer analysis into repeatable
Python data pipelines. The work connects the earlier SQL, Power BI, and Python
portfolio pieces by showing how UrbanStyle sales, customer, and product data
can be extracted, cleaned, segmented, exported, and prepared for business
decisions.

## English Summary

This week shows the move from analysis to automation. My individual work built
a smaller Supabase-to-pandas pipeline for sales and customer data. The team
project extended that idea into a modular API pipeline with extraction,
transformation, validation, visualization, RFM segmentation, campaign planning,
and optional notifications.

My team role was **Role D - automation and orchestration**. I was responsible
for the main pipeline flow that connects the module work into one repeatable
process: `extract -> transform -> validate -> export -> notify`.

## Business Problem and Solution

**Problem:** Week 7 created useful RFM analysis, but manually refreshing CSV
files would make recurring reporting slow and easy to forget.

**Solution:** Week 8 turns that analysis into repeatable Python pipeline work.
The individual project proves the API extraction and merge workflow, while the
team project expands it into a modular pipeline for RFM, retention, marketing
planning, validation, and HTML reporting.

## Folder Structure

- `individual/` - Individual Python API pipeline work.
- `individual/learning/` - Summary notes from the Week 8 individual learning
  workbook.
- `team/` - Imported Week 8 team pipeline and notebook.

## Individual Project

The individual Week 8 project turns the Week 7 notebook-style analysis into a
small reusable Python pipeline. It extracts UrbanStyle sales and customer data
from Supabase, prepares it with pandas, validates the merge, and saves a clean
file for later analysis or reporting.

- [Open individual project](individual/README.md)
- [Open individual learning notes](individual/learning/README.md)
- [Open pipeline script](individual/pipeline.py)
- [Open extraction helper](individual/extract.py)

## Team Project

The team Week 8 project is a modular API pipeline for UrbanStyle RFM and
marketing analysis. It extracts sales, customer, and product data from
Supabase, applies cleaning and business transformations, calculates RFM
segments and retention reports, exports Plotly HTML dashboards, and can send
pipeline-status notifications when channels are configured.

- [Open team project](team/README.md)
- [Open Role D pipeline script](team/pipeline.py)
- [Open completed team notebook](team/week8_api_pipeline_complete.ipynb)

## My Role D Contribution

My contribution was focused on automation, pipeline control, and end-to-end
execution. The Role D script:

- loads configuration from `config.yaml`
- accepts an optional analysis end date from the command line
- coordinates extraction, transformation, validation, export, and notification
  steps
- applies retry logic around pipeline stages
- writes logs for normal runs and errors
- validates that key outputs are not empty and that revenue totals match
- prints a short RFM segment summary after a successful run

## Setup and Run

For the individual pipeline:

```powershell
cd week8-python-api-pipeline/individual
python -m pip install -r requirements.txt
python pipeline.py
```

For the team pipeline:

```powershell
python -m pip install -r week8-python-api-pipeline/team/requirements.txt
python week8-python-api-pipeline/team/pipeline.py
```

To run the team pipeline with a specific analysis end date:

```powershell
python week8-python-api-pipeline/team/pipeline.py --date 2025-02-28
```

## Expected Outputs

The individual pipeline saves:

```text
individual/output/sales_customers_merged.csv
```

The team pipeline saves timestamped HTML reports and stable `*_latest.html`
copies under:

```text
team/output/
```

The team outputs include weekly and monthly revenue views, city and channel
reports, KPI summaries, RFM segment charts, cohort retention, segment-category
profiles, a marketing campaign plan, and a combined team dashboard.

## Automation

GitHub Actions runs a small Week 8 check on pushes to `main`, on manual runs,
and once each Monday morning. The check installs the individual project
requirements and confirms that the individual pipeline files are present and
valid Python.

The imported team project also includes focused tests for transformation,
RFM, cohort retention, and campaign-plan logic:

```powershell
python -m pytest week8-python-api-pipeline/team/tests
```
