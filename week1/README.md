# Week 1 - SQL Basics and Sales Data Exploration

## Focus

Week 1 focused on exploring UrbanStyle's database with SQL, understanding the structure of the `sales`, `customers`, and `products` tables, and contributing verified findings to the team presentation.

## My Contribution

- Worked on **Role A - Sales Transactions** (`sales`: totals and dates)
- Queried the `sales` table in Supabase using SQL
- Verified row counts, duplicates, missing values, and transaction extremes
- Replaced inaccurate AI-generated notes with checked SQL-based results
- Created the final PDF version of the team presentation
- Helped coordinate the final structure of the shared group output

## Tools Used

- GitHub
- Supabase
- Google Slides / PDF export
- Google Chat
- VS Code
- ChatGPT

## Key Findings

### Sales Table

- `sales` table contained **15,234 rows**
- Found **5,116 duplicates**
- `customer_id` was missing in **1,487** rows
- `store_location` was missing in **5,204** rows
- Smallest transaction: **-1405.32**
- Largest transaction: **2170.4**

### General Structure

- `customers` table contained **3,150 rows**
- `products` table contained **362 rows**
- Sales channels included `online` and `pood`
- Store locations included Tallinn, Tartu, and Parnu

## What I Learned

- Basic SQL syntax: `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `DISTINCT`, `COUNT`
- How to detect missing values with `IS NULL`
- How to distinguish between similar columns like `channel` and `store_location`
- Why database findings should be verified directly instead of relying on rough summaries
- How to turn SQL output into a presentation-friendly summary for group work

## Reflection

Week 1 was more demanding than Week 0 because setup, workbook tasks, SQL practice, group work, and presentation prep all happened at the same time. Alongside learning core SQL basics, I also saw how important it is to check outputs carefully and keep team conclusions grounded in actual query results.

## Evidence

## Structure

- `individual/` contains my own SQL work and screenshots
- `team/` contains shared group deliverables

### Individual SQL Files

- [individual/week1_sales_exploration.sql](individual/week1_sales_exploration.sql)  
  Exploration queries used to check row counts, duplicates, missing values, transaction extremes, sales channels, and store locations.
- [individual/week1_individual_practice.sql](individual/week1_individual_practice.sql)  
  Individual practice queries used to explore grouped results such as total sales by channel, average transaction value by location, top customers, and transaction counts.

### Individual SQL Result Screenshots

Stored in [individual/images/](individual/images/), including:

- [sales_row_count.png](individual/images/sales_row_count.png)
- [sales_rows_and_columns.png](individual/images/sales_rows_and_columns.png)
- [sales_missing_customer_id.png](individual/images/sales_missing_customer_id.png)
- [sales_10_largest_orders.png](individual/images/sales_10_largest_orders.png)
- [sales_10_smallest_orders.png](individual/images/sales_10_smallest_orders.png)

### Team Deliverable

[team/urbanstyle_week1_presentation.pdf](team/urbanstyle_week1_presentation.pdf)
