# Week 7 Individual Work - Python Pandas Learning

## Folder Structure

- `notebooks/` - Individual setup, practice, and analysis notebooks.
- `data/` - Local datasets used by individual notebooks.
- `outputs/` - Generated charts, exports, or other notebook outputs.
- `learning/` - Summary notes from the Week 7 individual learning workbook.

The setup test notebook loads Supabase credentials from `week7-python/.env`, so
keep the real `.env` file in the Week 7 folder.

## Business Problem

UrbanStyle already had sales summaries, but Marko needed deeper customer
insight: which customers were high value, loyal, potential, at risk, or lost.
That problem required moving from table-level reporting to customer-level
analysis.

## Learning Purpose

The individual work focused on building the Python and pandas foundation for
that customer analysis:

- loading data into pandas DataFrames
- inspecting rows, columns, data types, and summary statistics
- translating SQL concepts into pandas operations
- using filtering, `groupby()`, and `merge()`
- preparing for RFM customer segmentation

## Portfolio Connection

This individual setup supported the Week 7 team notebook, where the same
Python/pandas workflow was used to calculate RFM metrics and recommend customer
segments for retention and campaign targeting.

## Files

- [learning/README.md](learning/README.md)
- [notebooks/week7_setup_test.ipynb](notebooks/week7_setup_test.ipynb)
- [notebooks/week7_role_c_rfm_customer_segmentation.ipynb](notebooks/week7_role_c_rfm_customer_segmentation.ipynb)
