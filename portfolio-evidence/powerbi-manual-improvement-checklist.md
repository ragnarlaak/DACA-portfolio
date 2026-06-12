# Power BI Manual Improvement Checklist

Original `.pbix` files were not modified during this audit. Use copied files only if making manual edits later.

## Current Flagship Screenshot

- Website asset: `ragnarlaak.github.io/assets/tartu-dashboard.png`
- Source evidence: `week6-data-storytelling/individual/week6_tartu_dashboard_storytelling.png`
- Source Power BI file: `week6-data-storytelling/individual/week6_tartu_dashboard_role_b.pbix`
- Evidence status: DOCUMENTED EVIDENCE, NOT REPRODUCED

## Week 5 CEO Dashboard Improvements

Source file:

- `week5-power-bi/team/week5_powerbi_urbanstyle_dashboard_revenue.pbix`

Recommended manual improvements in Power BI Desktop:

- Enlarge KPI cards for total orders, total revenue and 2024 versus 2023 growth.
- Improve layout hierarchy so KPI cards are prominent and the monthly trend is clearly secondary.
- Reduce blank space around the top KPI area.
- Turn on useful data labels only for key months or peak/low points if full labels are crowded.
- Remove redundant axis titles where the chart title already explains the measure.
- Strengthen the main title so it states the finding, for example: `UrbanStyle revenue grew 19.08% in 2024 vs 2023`.
- Add one concise finding callout: `UrbanStyle grew overall, with ~10K orders and ~EUR 2.91M revenue in the dashboard scope.`
- Add one concise recommendation callout: `Review slower-growing locations by product mix, average order value and customer segments.`
- Export a sharper high-resolution screenshot for website use and LinkedIn Featured.

Recommended export path:

- `portfolio-evidence/outputs/powerbi_sales_performance_dashboard.png`

## Week 6 Tartu Storytelling Dashboard Improvements

Source file:

- `week6-data-storytelling/individual/week6_tartu_dashboard_role_b.pbix`

Recommended manual improvements in Power BI Desktop:

- Enlarge KPI cards for Tartu orders, Tartu revenue and Tartu 2024 versus 2023 growth.
- Keep the monthly revenue trend as the main chart.
- Use a clear reference line or annotation for the comparison to overall UrbanStyle growth.
- Reduce visual clutter around annotations and axis labels.
- Strengthen the main title so it states the finding, for example: `Tartu grew ~13%, but lagged UrbanStyle's ~19% overall growth`.
- Add one concise finding callout: `Tartu is growing, but more slowly than the company overall.`
- Add one concise recommendation callout: `Compare Tartu product mix, average order value and customer segments with stronger locations or channels.`
- Export a high-resolution screenshot as a secondary supporting visual.

Recommended export path:

- `portfolio-evidence/outputs/powerbi_tartu_growth_storytelling.png`

## Safety Rules

- Do not modify original `.pbix` files unless deliberately saving a new version.
- Keep measures, relationships, filters and business definitions unchanged unless a calculation error is found and documented.
- Do not replace real Power BI evidence with generic decorative charts.
