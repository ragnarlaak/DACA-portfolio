# Week 1 – SQL Basics and Data Exploration

## Focus

Week 1 focused on exploring UrbanStyle's database with SQL, understanding the structure of the `sales`, `customers`, and `products` tables, and contributing to the group presentation based on our findings.

## My contribution

- Worked on **Roll A – Müügitehingud** (`sales`: summad, kuupäevad)
- Queried the `sales` table using SQL in Supabase
- Verified key findings such as row counts, duplicates, missing values, and transaction extremes
- Helped correct inaccurate AI-generated group notes by replacing them with verified SQL-based results
- Created the final PDF version of the group presentation
- Helped coordinate the final structure of the shared group output

## Tools used

- GitHub
- Supabase
- Google Slides / PDF export
- Google Chat
- VS Code
- ChatGPT


## Key findings

### Sales table
- `sales` table contained **15,234 rows**
- Found **5,116 duplicates**
- `customer_id` was missing in **1,487** rows
- `store_location` was missing in **5,204** rows
- Smallest transaction: **-1405.32**
- Largest transaction: **2170.4**

### General structure
- `customers` table contained **3,150 rows**
- `products` table contained **362 rows**
- Sales channels included `online` and `pood`
- Store locations included Tallinn, Tartu, and Pärnu

## What I learned

- Basic SQL syntax: `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `DISTINCT`, `COUNT`
- How to detect missing values with `IS NULL`
- How to distinguish between similar columns like `channel` and `store_location`
- How important it is to verify findings directly from the database instead of trusting rough summaries
- How to turn SQL findings into a presentation-friendly group summary

## Reflection

Week 1 was more demanding than Week 0 because the setup, workbook, SQL practice, group work, and presentation all happened at once. I learned not only the basics of SQL, but also how important it is to verify outputs carefully and keep group results grounded in actual queries. I also contributed beyond my assigned SQL role by assembling the final presentation PDF and helping move the team output into the required format.

## Evidence

### SQL exploration file
See: `week1_sales_exploration.sql`

### SQL results screenshot
Shows verified results from Supabase.  
File: `week1_results_screenshot.png`

### Final team presentation PDF
I created the final cleaned presentation PDF for the group.  
File: `urbanstyle_week1_presentation.pdf`