# Week 7 Individual Learning Notes - Python Pandas

These notes summarize my Week 7 individual learning focus and how it connects
to the portfolio project work.

## Business Context

UrbanStyle already had SQL summaries and Power BI dashboards, but Marko needed
deeper customer insight:

> Which customers buy often, which customers spend the most, and which
> customers may be drifting away?

The business goal was to turn sales and customer rows into useful customer
segments that could support retention and campaign decisions.

## Learning Focus

- Load data into pandas DataFrames.
- Use `head()`, `info()`, `describe()`, `shape`, and `dtypes` to inspect data.
- Connect SQL thinking to pandas:
  - SQL `WHERE` -> boolean filtering
  - SQL `GROUP BY` -> `groupby()`
  - SQL `JOIN` -> `merge()`
- Clean and transform customer and sales data.
- Build RFM metrics:
  - Recency: how recently the customer bought
  - Frequency: how often the customer bought
  - Monetary: how much the customer spent
- Visualize results with Plotly.

## Business Problem -> Solution

**Problem:** A dashboard can show total sales, but it does not explain which
customers deserve different treatment.

**Solution:** Use Python and pandas to calculate customer-level RFM metrics and
classify customers into business segments such as VIP, loyal, potential,
at-risk, and lost customers.

## How This Connects to My Portfolio

The individual Week 7 work prepared the Python setup and pandas workflow. The
team project then used the same direction to build the RFM segmentation
notebook for UrbanStyle.

This became the bridge between earlier SQL/Power BI reporting and Week 8
pipeline automation.
