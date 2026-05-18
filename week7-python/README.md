# Week 7 - Python and RFM Customer Segmentation

This folder contains the Week 7 Python/Jupyter work for the DACA portfolio,
focused on customer-level RFM segmentation with UrbanStyle course data.

## Folder Structure

- `individual/` - Individual Week 7 notebook workspace, data folder, and
  generated outputs.
- `team/` - Week 7 group project notebook and project workbook.
- `.env.example` - Template for local environment variables.

## Team Project

The Week 7 team project is an UrbanStyle course-data RFM analysis built with
Python and pandas. The notebook loads sales and customer data from Supabase,
cleans the combined dataset, calculates customer-level recency, frequency, and
monetary metrics, and classifies customers into value and risk groups. The
result supports retention and campaign-targeting analysis while keeping
customer contact fields out of saved public outputs.

- [Open team project folder](team/README.md)
- [Open completed RFM notebook](team/week7_rfm_complete.ipynb)
- [Open individual setup notebook](individual/notebooks/week7_setup_test.ipynb)

## Collaboration and Documentation Support

During Week 7, I documented Python/Jupyter setup and debugging steps for the
team. This included recording error messages, asking for targeted fixes, and
reviewing notebook code flow before it was used in the group notebook.

## Setup Notes

Use Windows-compatible commands from this folder:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

If local environment variables are needed, copy `.env.example` to `.env` and
add your values there. Do not commit the real `.env` file.
