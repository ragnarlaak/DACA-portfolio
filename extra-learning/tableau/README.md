# Tableau Portfolio Extension

This folder is for independent post-course Tableau and BI dashboard practice.

It is outside the original DACA course assignments. The goal is to use the existing Supabase database tables as source data for new Tableau Public portfolio projects.

## Purpose

- Build Tableau dashboards from existing portfolio data.
- Practice BI storytelling, chart selection, dashboard layout, and portfolio presentation.
- Keep new independent learning separate from the original course week folders.

## Portfolio case studies

- [Repeat Customer Revenue Impact Analysis](repeat-customer-revenue-impact-analysis.md) - Tableau dashboard analyzing repeat customer revenue share, average revenue per customer and a simple 10% repeat-customer improvement scenario.

## Structure

- `data/` - CSV exports from Supabase tables such as customers, products, orders, order items, sales, stores, or other business tables.
- `screenshots/` - Dashboard screenshots for portfolio documentation.
- `notes/` - Project notes, dashboard ideas, and analysis decisions.

## Tableau Public Workflow

Tableau Public does not provide the PostgreSQL connector needed for a direct Supabase database connection. For the unpaid version, export the actual Supabase tables to CSV files first:

1. In Supabase, open the project.
2. Go to **Table Editor**.
3. Open a table such as `customers`, `products`, `orders`, `order_items`, `sales`, or `stores`.
4. Export/download the table as CSV.
5. Save the CSV in `extra-learning/tableau/data/supabase/`.
6. In Tableau Public, choose **Text file** and open the CSV.
7. Build and publish the dashboard in Tableau Public.
8. Save screenshots in `screenshots/` and write project notes in `notes/`.

## Starting Tables

Useful starting exports:

- `customers.csv`
- `products.csv`
- `orders.csv`
- `order_items.csv`
- `sales.csv`
- `stores.csv`

Use whatever exact table names exist in Supabase. Keep the filenames close to the source table names so joins are easy to track in Tableau.

See `notes/supabase-export-steps.md` for the exact workflow.
