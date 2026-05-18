# Week 8 - Python API Pipeline

This folder keeps Week 8 individual and team materials separate.

## Folder Structure

- `individual/` - Individual Python API pipeline work.
- `team/` - Team Week 8 materials.

## Individual Project

The individual Week 8 project turns the Week 7 notebook-style analysis into a
small reusable Python pipeline. It extracts UrbanStyle course data from
Supabase, prepares it with pandas, and saves a clean merged file for later
analysis or reporting.

- [Open individual project](individual/README.md)
- [Open pipeline script](individual/pipeline.py)
- [Open extraction helper](individual/extract.py)

## Setup and Run

From the `week8-python-api-pipeline/individual` folder:

```powershell
python -m pip install -r requirements.txt
python pipeline.py
```

The pipeline saves the merged file to:

```text
individual/output/sales_customers_merged.csv
```

## Automation

GitHub Actions runs a small Week 8 check on pushes to `main`, on manual runs,
and once each Monday morning. The check installs the project requirements and
confirms that the pipeline files are present and valid Python.

## Team Project

Team materials will be added when the Week 8 group work is complete.
