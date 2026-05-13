# Week 7 Python/Jupyter Workspace

This folder is a clean Python and Jupyter workspace for Week 7 work in the
DACA portfolio.

## Folder Structure

- `individual/` - Individual Week 7 notebook workspace, data folder, and
  generated outputs.
- `team/` - Week 7 group project notebook and project workbook.
- `.env.example` - Template for local environment variables.

## Team Project

The Week 7 team project is an UrbanStyle RFM analysis built in Python and
Pandas. The notebook loads sales and customer data from Supabase, cleans the
combined dataset, calculates customer-level recency, frequency, and monetary
metrics, creates customer segments, and summarizes business recommendations.

- [Open team project folder](team/README.md)
- [Open completed RFM notebook](team/week7_rfm_complete.ipynb)
- [Open individual setup notebook](individual/notebooks/week7_setup_test.ipynb)

## Setup Notes

Use Windows-compatible commands from this folder:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install jupyter pandas matplotlib plotly python-dotenv supabase
```

If local environment variables are needed, copy `.env.example` to `.env` and
add your values there. Do not commit the real `.env` file.
