# Week 7 Python/Jupyter Workspace

This folder is a clean Python and Jupyter workspace for Week 7 work in the
DACA portfolio.

## Folder Structure

- `notebooks/` - Jupyter notebooks for analysis and exploration.
- `data/` - Local datasets used by notebooks or scripts.
- `outputs/` - Generated charts, exports, or other analysis outputs.
- `.env.example` - Template for local environment variables.

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
