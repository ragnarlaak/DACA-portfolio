# Ragnar Laak - Data Analytics Portfolio

SQL, Power BI, Python, data cleaning, and retail data analysis projects built
during the **Data Analyst Career Accelerator (DACA)** program.

**Started:** 23.03.2026

## Profile

This portfolio presents junior data analyst project work across SQL,
Python/Jupyter, Power BI, data quality checks, relational analysis, dashboard
reporting, and customer segmentation. The projects use UrbanStyle course data
to show how I prepare reliable datasets, summarize business findings, and
document analysis clearly for review.

## Featured Projects

### 1. Retail Data Quality Analysis

- Focus: customer data quality review and cleaning practice in SQL
- Skills: `GROUP BY`, `HAVING`, `COALESCE()`, `CASE WHEN`, text
  standardization, safe update/delete workflow
- Result: identified **128 duplicate emails**, **380 missing emails**, and
  **12 city naming variations** to support cleaner segmentation, grouping, and
  reporting
- Project: [Week 2](week2-sql-data-cleaning/README.md)

### 2. SQL JOINs and Inventory Analysis

- Focus: relational analysis across `sales`, `customers`, `products`, and
  `inventory` to support product and stock review
- Skills: `INNER JOIN`, `LEFT JOIN`, `LEFT JOIN + IS NULL`, multi-table
  analysis, database setup checks
- Result: helped restore a usable database setup, validated the cleaned
  environment, and identified **12 unsold products** for inventory follow-up
- Project: [Week 3](week3-sql-joins/README.md)

### 3. SQL Aggregation for Business Reporting

- Focus: turning transaction data into business summaries for sales, customer,
  category, and marketing-channel review
- Skills: aggregation, `GROUP BY`, `HAVING`, CTEs, window functions, business
  reporting
- Result: summarized monthly sales, city performance, customer segments,
  category performance, and marketing-channel effectiveness to support clearer
  business interpretation
- Project: [Week 4](week4-sql-aggregation/README.md)

### 4. Power BI Retail Dashboard

- Focus: building a first business-facing dashboard from UrbanStyle course
  retail data
- Skills: Power BI, DAX measures, ODBC connection, PostgreSQL/Supabase,
  dashboard layout, business reporting
- Result: created a Power BI dashboard to summarize ~10K orders, ~2.91M total
  revenue, and **19.08%** growth in 2024 versus 2023, supported by a
  `YearMonth` revenue trend and documented Supabase/ODBC troubleshooting
- Project: [Week 5][week5]

### 5. Power BI Data Storytelling - Tartu Store View

- Focus: turning a Power BI dashboard into a stakeholder-specific data story
- Skills: Power BI, KPI cards, reference lines, annotations, stakeholder summary,
  audience-focused dashboard design, presentation synthesis, scope management
- Result: prepared a Tartu-focused dashboard showing that Tartu grew **13%** in
  2024 versus 2023, while trailing UrbanStyle's **19%** overall growth; this
  supported a recommendation to compare Tartu product mix, average order, and
  customer segments against Tallinn and Online
- Project: [Week 6](week6-data-storytelling/README.md)

### 6. Week 7 - Python Pandas and RFM Customer Segmentation

- Focus: customer-level RFM analysis for UrbanStyle course data using Python
  and Pandas
- Skills: VS Code, Jupyter Notebook, pandas, Plotly, Supabase Python client,
  data cleaning, customer segmentation, business recommendations
- Result: prepared a Python/Jupyter workflow, loaded UrbanStyle course sales
  and customer data from Supabase into pandas, and organized a team notebook for
  RFM customer segmentation to identify high-value, loyal, potential, at-risk,
  and lost customer groups
- Project: [Week 7][week7]

## What This Portfolio Shows

- practical SQL analysis in Supabase/PostgreSQL
- data quality checks that support reliable reporting
- SQL cleaning and validation for duplicate, missing, and inconsistent values
- business-focused analysis of retail data
- Power BI dashboards that summarize trends and support business interpretation
- Python/Pandas customer segmentation for retention and campaign-targeting
  analysis
- operational troubleshooting through database setup, import cleanup, and
  validation
- audience-focused data storytelling
- readable project documentation with evidence
- individual contribution inside group work
- consistent presentation of assigned analysis in weekly group work
- increasing responsibility for intro/context and group-level summary delivery
  in later weeks

## Core Skills

- **SQL:** `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, `COUNT`, `SUM`, `AVG`,
  `CASE WHEN`
- **Data cleaning:** duplicate checks, `NULL` analysis, `COALESCE()`, text
  standardization, validation logic
- **Relational analysis:** `INNER JOIN`, `LEFT JOIN`, multi-table joins,
  missing-match analysis
- **Reporting:** Power BI dashboards, data storytelling, annotations,
  summary tables, screenshot evidence, presentation support, written findings
- **Python:** Jupyter Notebook, Pandas, RFM analysis, customer segmentation,
  Plotly visualization, Supabase Python client
- **Tools:** Git, GitHub, VS Code, Jupyter, Supabase, Power BI

## Portfolio Map

### Week 0 - Portfolio Setup and Team Collaboration

- Built the initial collaboration and documentation structure
- [Open Week 0](week0-portfolio-setup/README.md)

### Week 1 - SQL Basics and Sales Data Exploration

- Checked row counts, duplicates, missing values, and transaction extremes to
  understand whether the data was ready for analysis
- [Open Week 1](week1-sql-basics/README.md)

### Week 2 - SQL Data Cleaning and Customer Quality Analysis

- Identified duplicate, missing, and inconsistent customer values to support
  cleaner and more reliable analysis
- [Open Week 2](week2-sql-data-cleaning/README.md)

### Week 3 - SQL JOINs and Inventory Analysis

- Rebuilt the working database state and used JOINs to support product,
  customer, and inventory analysis
- [Open Week 3](week3-sql-joins/README.md)

### Week 4 - SQL Aggregation and Marketing Analysis

- Prepared aggregation summaries, image evidence, and marketing-channel analysis
  for team reporting
- [Open Week 4](week4-sql-aggregation/README.md)

### Week 5 - Power BI Dashboard

- Created individual and team UrbanStyle Power BI dashboard files with
  screenshot evidence, presentation materials, and revenue growth insight
- [Open Week 5][week5]

### Week 6 - Data Storytelling and Tartu Store View

- Prepared a stakeholder-specific Tartu dashboard with KPI cards, annotations, a
  reference line, and summary message
- Reframed the expected story from "Tartu is declining" to "Tartu is growing
  slower than the company" based on filtered Power BI data
- Main finding: Tartu grew **13%** in 2024 vs 2023, while UrbanStyle overall
  grew **19%**
- Helped assemble the final group presentation and combined view from completed
  Tallinn, Tartu, and Online dashboard evidence
- [Open Week 6](week6-data-storytelling/README.md)

### Week 7 - Python Pandas and RFM Customer Segmentation

- Set up a VS Code + Jupyter Python workflow
- Loaded UrbanStyle course sales/customer data from Supabase into pandas
- Prepared an RFM customer segmentation workflow
- Organized the team notebook for loading, cleaning, RFM analysis,
  visualization, and business recommendations
- [Open Week 7][week7]

### Week 8 - TBD

- Scaffold ready for upcoming individual and team materials
- [Open Week 8][week8]

### Week 9 - TBD

- Scaffold ready for upcoming individual and team materials
- [Open Week 9][week9]

### Week 10 - TBD

- Scaffold ready for upcoming individual and team materials
- [Open Week 10][week10]

## Course Context

This portfolio is being developed as part of the
[Data Analyst Career Accelerator by Ettevotluskeskus][daca-course],
an intensive practical mentorship program focused on SQL,
PostgreSQL/Supabase, Power BI, Python, data storytelling,
teamwork, and GitHub portfolio development.

The program includes mentor-guided sessions and practical UrbanStyle business
simulation work. Publicly listed program experts include Silver Toompalu,
Jelena Laudver, and Renee Kooli.

## Working Style

- I document both the SQL and the reasoning behind the result
- I keep screenshots and outputs linked to the actual query work
- I separate individual work from team deliverables so contribution is visible
- I keep public notebooks and exports focused on analysis, avoiding unnecessary
  customer contact details

## Contact

- **GitHub:** [ragnarlaak](https://github.com/ragnarlaak)
- **Email:** ragnarlaak@gmail.com

[daca-course]: https://www.ettevotluskeskus.ee/daca25en-data-analyst-career-accelerator
[week5]: week5-power-bi/README.md
[week6]: week6-data-storytelling/README.md
[week7]: ./week7-python
[week8]: week8-tbd/README.md
[week9]: week9-tbd/README.md
[week10]: week10-tbd/README.md
