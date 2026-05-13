# Ragnar Laak - Data Analytics Portfolio

SQL, Power BI, data cleaning, and retail data analysis projects built during the
**Data Analyst Career Accelerator (DACA)** program.

**Started:** 23.03.2026

## Profile

I am building a junior data analyst portfolio focused on practical SQL work,
data quality checks, relational analysis, Power BI reporting, and clear
documentation of results. This repository is structured to show both my
technical work and the way I contribute inside team-based projects.

## Featured Projects

### 1. Retail Data Quality Analysis

- Focus: customer data cleaning and validation in SQL
- Skills: `GROUP BY`, `HAVING`, `COALESCE()`, `CASE WHEN`, text
  standardization, safe update/delete workflow
- Result: identified **128 duplicate emails**, **380 missing emails**, and
  **12 city naming variations**
- Project: [Week 2](week2-sql-data-cleaning/README.md)

### 2. SQL JOINs and Inventory Analysis

- Focus: relational analysis across `sales`, `customers`, `products`, and
  `inventory`
- Skills: `INNER JOIN`, `LEFT JOIN`, `LEFT JOIN + IS NULL`, multi-table
  analysis, troubleshooting
- Result: restored a broken database setup, validated the cleaned environment,
  and found **12 unsold products**
- Project: [Week 3](week3-sql-joins/README.md)

### 3. SQL Aggregation for Business Reporting

- Focus: turning transaction data into management-level summaries
- Skills: aggregation, `GROUP BY`, `HAVING`, CTEs, window functions, business
  reporting
- Result: analyzed monthly sales, city performance, customer segments, category
  performance, and marketing-channel effectiveness
- Project: [Week 4](week4-sql-aggregation/README.md)

### 4. Power BI Retail Dashboard

- Focus: building a first business-facing dashboard from UrbanStyle retail data
- Skills: Power BI, DAX measures, ODBC connection, PostgreSQL/Supabase,
  dashboard layout, executive reporting
- Result: built a CEO-focused Power BI dashboard with KPI cards for
  ~10K orders, ~2.91M kogukäive, and **19.08%** growth in 2024
  versus 2023, supported by a `YearMonth` revenue trend and documented
  Supabase/ODBC troubleshooting
- Project: [Week 5][week5]

### 5. Power BI Data Storytelling - Tartu Store View

- Focus: turning a Power BI dashboard into a stakeholder-specific data story
- Skills: Power BI, KPI cards, reference lines, annotations, executive summary,
  audience-focused dashboard design, presentation synthesis, scope management
- Result: built a Tartu-focused dashboard showing that Tartu grew **13%** in
  2024 versus 2023, but underperformed UrbanStyle's **19%** overall growth;
  recommended comparing Tartu product mix, average order, and customer segments
  against Tallinn and Online, and helped assemble the final group presentation
  around completed Tallinn, Tartu, and Online evidence
- Project: [Week 6](week6-data-storytelling/README.md)

### 6. Python Pandas RFM Customer Segmentation

- Focus: customer-level RFM analysis for UrbanStyle using Python and Pandas
- Skills: Jupyter Notebook, Pandas, data cleaning, Supabase data loading,
  customer segmentation, Plotly visualization, business recommendations
- Result: created a complete team notebook that segments customers into groups
  such as VIP Champions, Loyal Customers, At Risk, and Lost, with
  recommendations for retention and targeted marketing
- Project: [Week 7][week7]

## What This Portfolio Shows

- practical SQL analysis in Supabase/PostgreSQL
- data cleaning and validation workflows
- business-focused analysis of retail data
- Python/Pandas customer segmentation and notebook-based analysis
- Power BI dashboard development
- stakeholder-focused data storytelling
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
  Plotly visualization
- **Tools:** Git, GitHub, VS Code, Supabase, Power BI

## Portfolio Map

### Week 0 - Portfolio Setup and Team Collaboration

- Built the initial collaboration and documentation structure
- [Open Week 0](week0-portfolio-setup/README.md)

### Week 1 - SQL Basics and Sales Data Exploration

- Verified row counts, duplicates, missing values, and transaction extremes
- [Open Week 1](week1-sql-basics/README.md)

### Week 2 - SQL Data Cleaning and Customer Quality Analysis

- Documented customer-data quality issues and safe cleaning practice
- [Open Week 2](week2-sql-data-cleaning/README.md)

### Week 3 - SQL JOINs and Inventory Analysis

- Rebuilt the working database state and completed JOIN-based analysis
- [Open Week 3](week3-sql-joins/README.md)

### Week 4 - SQL Aggregation and Marketing Analysis

- Added individual aggregation work, image evidence, and team channel analysis
- [Open Week 4](week4-sql-aggregation/README.md)

### Week 5 - Power BI Dashboard

- Added individual and team UrbanStyle Power BI dashboard files with screenshot
  evidence, final presentation materials, and CEO-facing revenue insight
- [Open Week 5][week5]

### Week 6 - Data Storytelling and Tartu Store View

- Built a stakeholder-specific Tartu dashboard with KPI cards, annotations, a
  reference line, and executive summary
- Reframed the expected story from "Tartu is declining" to "Tartu is growing
  slower than the company" based on filtered Power BI data
- Main finding: Tartu grew **13%** in 2024 vs 2023, while UrbanStyle overall
  grew **19%**
- Helped assemble the final group presentation and combined view from completed
  Tallinn, Tartu, and Online dashboard evidence
- [Open Week 6](week6-data-storytelling/README.md)

### Week 7 - Python

- Added the Week 7 team Python/Pandas RFM analysis notebook and project
  workbook for UrbanStyle customer segmentation
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
PostgreSQL/Supabase, Power BI, Python, AI tools, data storytelling,
teamwork, and GitHub portfolio development.

The program includes mentor-guided sessions and practical UrbanStyle business
simulation work. Publicly listed program experts include Silver Toompalu,
Jelena Laudver, and Renee Kooli.

## Working Style

- I document both the SQL and the reasoning behind the result
- I keep screenshots and outputs linked to the actual query work
- I separate individual work from team deliverables so contribution is visible

## Contact

- **GitHub:** [ragnarlaak](https://github.com/ragnarlaak)
- **Email:** ragnarlaak@gmail.com

[daca-course]: https://www.ettevotluskeskus.ee/daca25en-data-analyst-career-accelerator
[week5]: week5-power-bi/README.md
[week6]: week6-data-storytelling/README.md
[week7]: week7-python/README.md
[week8]: week8-tbd/README.md
[week9]: week9-tbd/README.md
[week10]: week10-tbd/README.md
