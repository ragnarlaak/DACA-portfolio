# Week 5 - Power BI Dashboard

## Problem

Week 5 marks the move from SQL-only analysis into Power BI reporting. The goal
is to turn the UrbanStyle retail data work into a first dashboard artifact that
can be opened, reviewed, and later supported with screenshot evidence.

## Approach

- saved the first Power BI dashboard file in the `individual/` folder
- kept screenshot evidence in `individual/images/`
- kept a separate `team/` folder ready for later group dashboard or presentation work
- documented the new file structure for the Power BI phase of the portfolio

## Result

The Week 5 section now contains the first individual Power BI dashboard:

- UrbanStyle dashboard Power BI file
- image folder for exported dashboard screenshots
- team folder for future shared Power BI work

The first dashboard page shows:

- **~10K** total orders
- **~2.91M** total revenue
- revenue trend by year
- revenue comparison by product category
- website visits by traffic source using a `COUNTROWS`-based DAX measure

## Skills

- Power BI dashboard building
- retail data reporting
- visual analysis
- portfolio documentation
- file organization

## Files

- [individual/week5_powerbi_urbanstyle_dashboard.pbix](individual/week5_powerbi_urbanstyle_dashboard.pbix)
- [individual/images/](individual/images/)
- [individual/](individual/)
- [team/](team/)
- [team/images/](team/images/)

## Image Evidence

- [week5_01_powerbi_dashboard_overview.png](individual/images/week5_01_powerbi_dashboard_overview.png)

## Connection Troubleshooting

During the Power BI setup, the built-in PostgreSQL connector produced
SSL/certificate validation errors when connecting directly to Supabase and
through the Supabase session pooler.

To resolve this, I:

- identified that the issue was related to Power BI's PostgreSQL connector and
  Supabase SSL validation
- installed the 64-bit PostgreSQL ODBC driver (`psqlODBC`)
- created a 64-bit System DSN for the Supabase session pooler
- configured the connection with:
  - session pooler host
  - PostgreSQL database name
  - Supabase pooler username
  - SSL mode set to `require`
- verified the connection through ODBC before importing the data into Power BI

This allowed the Supabase PostgreSQL database to be connected successfully to
Power BI and used for dashboard development.

## Key Learning

A major part of BI work is not only building visuals, but also handling data
connectivity, drivers, authentication, and reliable source connections before
analysis can begin.

## Team Image Evidence

Add team screenshots here once Week 5 group work is complete.

## Going Forward

For Power BI weeks, the main portfolio pattern should be:

- keep `.pbix` files in the matching `individual/` or `team/` folder
- export report-page screenshots into the matching `images/` folder
- use the README to explain the dashboard goal, main visuals, key findings, and business value
- keep SQL files only when a week includes SQL prep, validation, or data extraction work
