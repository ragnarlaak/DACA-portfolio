# Week 8 Individual Work - Python API Pipeline

## Business and Learning Purpose

This project turns the Week 7 notebook-style analysis into a small reusable
Python pipeline. The goal is to practice extracting data from Supabase,
preparing it with pandas, validating the merge, and saving a clean merged file
that could support later analysis, customer segmentation, or reporting.

The work focuses on learning good project habits: keeping credentials out of
GitHub, writing readable scripts, using simple logging, and separating
exploration from repeatable pipeline code.

## Business Value

This pipeline prepares sales and customer data for repeatable analysis instead
of relying only on one-time notebook exploration.

It supports future questions such as:

- Which customers are active, at risk, or lost?
- How does revenue differ by customer group?
- Which customer fields are needed for segmentation and reporting?
- Can the same dataset be refreshed consistently for dashboards or analysis?

## What the Pipeline Does

The pipeline:

- connects to Supabase using environment variables from a local `.env` file
- extracts all rows from the `sales` table
- extracts all rows from the `customers` table
- uses pagination so larger tables can be loaded in batches
- merges sales with selected customer fields using `customer_id`
- saves the result as `output/sales_customers_merged.csv`

## Folder Overview

```text
week8-python-api-pipeline/
  individual/
    extract.py
    pipeline.py
    requirements.txt
    .env.example
    learning/
    output/
    README.md
```

## File Overview

- `extract.py` - reusable Supabase extraction function
- `pipeline.py` - main pipeline that loads, merges, validates, and saves data
- `requirements.txt` - Python packages needed for this work
- `.env.example` - placeholder environment variable names, without real secrets
- `learning/` - summary notes from the Week 8 individual learning workbook
- `output/` - local output folder for generated CSV files

## Setup

Create and activate a virtual environment:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

Install dependencies:

```powershell
pip install -r requirements.txt
```

Create a local `.env` file in the `week8-python-api-pipeline/individual`
folder:

```text
SUPABASE_URL=your_real_supabase_project_url
SUPABASE_ANON_KEY=your_real_supabase_anon_key
```

The `.env` file should stay local and should not be committed to GitHub.

## How to Run

From the `week8-python-api-pipeline/individual` folder, run:

```powershell
python pipeline.py
```

To run the lightweight project check used by GitHub Actions:

```powershell
python test.py
```

## Expected Output

The script saves:

```text
output/sales_customers_merged.csv
```

It also prints the first five rows as a quick validation check.

## Key Learning

- Notebook exploration is useful for testing ideas, while scripts make the work
  reusable.
- API extraction often needs pagination because services return larger datasets
  in smaller batches.
- Environment variables help keep credentials separate from code.
- Logging makes the pipeline easier to follow and debug.
- A simple pipeline structure is easier to present, maintain, and reuse.
- GitHub Actions can check project files automatically without publishing real
  credentials.

## Connection to Team Work

The individual pipeline is the smaller version of the Week 8 automation idea.
The team project expands the same direction into a modular RFM and marketing
pipeline with separate extraction, transformation, visualization, orchestration,
and notification components.

My team role was **Role D - automation and orchestration**, documented in:

- [../team/README.md](../team/README.md)
- [../team/pipeline.py](../team/pipeline.py)

## Learning Notes

- [learning/README.md](learning/README.md)

## AI and Tooling Note

Used ChatGPT, Codex, NotebookLM, and other tooling support for debugging,
course-material review, README structure, repository cleanup, and wording
clarity. Analytical logic, validation checks, and final business interpretation
were reviewed manually.
