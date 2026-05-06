# Week 1 - SQL Basics and Sales Data Exploration

## Problem

The goal for Week 1 was to understand the structure and quality of UrbanStyle's
retail database, especially the `sales` table, and turn those findings into
reliable input for the team presentation.

## Approach

- worked on **Role A - Sales Transactions**
- queried the `sales` table in Supabase using SQL
- checked row counts, duplicates, missing values, and transaction extremes
- compared table structure across `sales`, `customers`, and `products`
- replaced inaccurate rough notes with verified SQL-based findings
- supported the final formatting and export of the team presentation
- presented my assigned part during the group presentation

## Result

The week produced a verified baseline view of the sales data:

- `sales` contained **15,234 rows**
- duplicate rows found: **5,116**
- missing `customer_id` values: **1,487**
- missing `store_location` values: **5,204**
- smallest transaction: **-1405.32**
- largest transaction: **2170.4**
- `customers` contained **3,150 rows**
- `products` contained **362 rows**

These checks gave the team a more accurate foundation than relying on unverified
summaries.

## Skills

- basic SQL querying
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `DISTINCT`, `COUNT`
- missing-value analysis with `IS NULL`
- data verification
- presentation support and summary writing

## Tools

- GitHub
- Supabase
- Google Slides / PDF export
- Google Chat
- VS Code
- ChatGPT

## Files and Evidence

- [individual/week1_sales_exploration.sql](individual/week1_sales_exploration.sql)
- [individual/week1_individual_practice.sql](individual/week1_individual_practice.sql)
- [individual/images/](individual/images/)
- [team/urbanstyle_week1_presentation.pdf](team/urbanstyle_week1_presentation.pdf)

## Portfolio Value

Week 1 shows the start of my SQL workflow: querying real tables, validating
results carefully, and turning raw outputs into something useful for
collaborative project work.
