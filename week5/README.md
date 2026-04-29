# Week 5 - Power BI Visualization Design

## Overview

Week 5 focused on Power BI dashboard design and business storytelling using the
UrbanStyle retail data. My completed individual group-work contribution was
**Role A — CEO Dashboard / Kristi vaade**.

The dashboard was built to answer the stakeholder question: **"Kas me
kasvame?"** The final Power BI file, screenshot, and CEO notes were prepared
for team use and shared through the group Drive for the combined Role D /
Investor synthesis.

## Role A — CEO Dashboard

My responsibility was to create a focused CEO view for Kristi. The dashboard
summarizes company growth using order volume, total revenue, year-over-year
growth, and monthly revenue movement.

This was my completed individual part of the group work. The combined investor
view remains a separate team deliverable built from all roles.

## Dashboard Output

The CEO dashboard includes:

- **Tellimused kokku:** ~10K
- **Kogukäive:** ~2.91M
- **Käibe kasv 2024 vs 2023:** 19.08%
- main chart: monthly revenue trend using `YearMonth` on the X-axis and
  revenue on the Y-axis
- Estonian labels for stakeholder readability
- UrbanStyle teal color theme: `#009B8D`

The exported screenshot is stored as dashboard evidence:

- [team/images/urbanstyle_revenue_dashboard.png][team-dashboard-overview]

## DAX Measures

The dashboard measures were built around simple executive KPIs:

```DAX
Tellimused kokku = COUNTROWS(sales)
```

```DAX
Kogukäive = SUM(sales[total_price])
```

```DAX
Kogukäive 2023 =
CALCULATE(
    [Kogukäive],
    FILTER(ALL(sales), YEAR(sales[sale_date]) = 2023)
)
```

```DAX
Kogukäive 2024 =
CALCULATE(
    [Kogukäive],
    FILTER(ALL(sales), YEAR(sales[sale_date]) = 2024)
)
```

```DAX
Käibe kasv 2024 vs 2023 =
DIVIDE(
    [Kogukäive 2024] - [Kogukäive 2023],
    [Kogukäive 2023]
)
```

The final dashboard displayed the growth measure as a percentage so the CEO
question could be answered directly.

## SQL Logic Behind the Visual

The Power BI visual is based on the same monthly aggregation logic used in SQL
analysis work: group sales by month, count orders, and sum revenue.

```SQL
SELECT
    TO_CHAR(sale_date, 'YYYY-MM') AS year_month,
    COUNT(*) AS tellimused_kokku,
    SUM(total_price) AS kogukaive
FROM sales
GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
ORDER BY year_month;
```

For the year-over-year comparison, the interpretation uses comparable full-year
periods:

```SQL
SELECT
    EXTRACT(YEAR FROM sale_date) AS aasta,
    SUM(total_price) AS kogukaive
FROM sales
WHERE sale_date >= DATE '2023-01-01'
  AND sale_date < DATE '2025-01-01'
GROUP BY EXTRACT(YEAR FROM sale_date)
ORDER BY aasta;
```

## Business Interpretation

UrbanStyle had around **10K orders** and **2.91M kogukäive** in the dashboard
scope. Based on comparable full-year periods, 2024 revenue was **19.08% higher**
than 2023.

This means the CEO question **"Kas me kasvame?"** can be answered positively.
Monthly revenue still fluctuates, so growth is not smooth every month, but the
yearly comparison shows positive growth.

## Data Quality / Period Selection Note

Some 2025-2026 records appeared incomplete or very low-count compared with the
full-year 2023 and 2024 data. Because of that, they were not used for the main
growth interpretation.

The main growth conclusion is based on comparing 2024 with 2023, which are the
more complete and comparable periods in this dashboard.

## Design Decisions

- kept the CEO view focused on growth instead of product or marketing detail
- removed irrelevant marketing/product visuals from this page
- used KPI cards for the main executive numbers
- used a monthly line chart to show whether growth was consistent or uneven
- used Estonian labels to match the stakeholder context
- used UrbanStyle teal `#009B8D` for the main visual identity

## Collaboration / Team Integration

After completing the Role A dashboard, I exported the screenshot and uploaded
the required files to the shared Drive for team integration. The output was
shared for **Role D / Investor synthesis**, where the different role-based views
can be combined into the final investor-facing story.

## AI Usage

I used AI support to help structure the portfolio documentation, clarify the
business interpretation, and keep the README concise and recruiter-friendly. The
dashboard design choices, KPI selection, Power BI work, screenshot export, and
team file sharing were completed as my Week 5 group-work contribution.

## Files

- [team/week5_powerbi_urbanstyle_dashboard_revenue.pbix][team-powerbi-dashboard]
- [team/images/urbanstyle_revenue_dashboard.png][team-dashboard-overview]
- [team/ceo_view_notes.txt][team-ceo-notes]
- [individual/week5_powerbi_urbanstyle_dashboard.pbix][powerbi-dashboard]
- [individual/images/week5_01_powerbi_dashboard_overview.png][dashboard-overview]
- [team/](team/)
- [team/images/](team/images/)
- [individual/](individual/)
- [individual/images/](individual/images/)

[powerbi-dashboard]: individual/week5_powerbi_urbanstyle_dashboard.pbix
[team-powerbi-dashboard]: team/week5_powerbi_urbanstyle_dashboard_revenue.pbix
[team-ceo-notes]: team/ceo_view_notes.txt
[dashboard-overview]: individual/images/week5_01_powerbi_dashboard_overview.png
[team-dashboard-overview]: team/images/urbanstyle_revenue_dashboard.png
