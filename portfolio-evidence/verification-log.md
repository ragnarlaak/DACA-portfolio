# Verification Log

Verification date: 2026-06-02

## Files Inspected

- `README.md`
- `week2-sql-data-cleaning/README.md`
- `week2-sql-data-cleaning/individual/week2_individual_practice.sql`
- `week2-sql-data-cleaning/team/week2_group_project.sql`
- `week5-power-bi/README.md`
- `week5-power-bi/team/ceo_view_notes.txt`
- `week5-power-bi/team/images/urbanstyle_revenue_dashboard.png`
- `week6-data-storytelling/README.md`
- `week6-data-storytelling/individual/week6_tartu_dashboard_storytelling.png`
- `week7-python/README.md`
- `week7-python/requirements.txt`
- `week7-python/team/README.md`
- `week7-python/team/week7_rfm_complete.ipynb`
- `week7-python/team/rfm_segments.csv`
- `week8-python-api-pipeline/README.md`
- `week8-python-api-pipeline/team/README.md`
- `week8-python-api-pipeline/team/config.yaml`
- `week8-python-api-pipeline/team/pipeline.py`
- `week8-python-api-pipeline/team/transform.py`
- `week8-python-api-pipeline/team/data_fetcher.py`
- `week8-python-api-pipeline/team/tests/test_transform.py`
- `ragnarlaak.github.io/index.html`
- `ragnarlaak.github.io/styles.css`
- `ragnarlaak.github.io/README.md`

## Commands Used

```powershell
rg --files -g "*.md" -g "*.sql" -g "*.ipynb" -g "*.py" -g "*.csv" -g "*.png" -g "*.txt" -g "*.yml" -g "*.yaml" -g "*.env*" -g "requirements.txt"
Get-Content week2-sql-data-cleaning\README.md
Get-Content week5-power-bi\README.md
Get-Content week6-data-storytelling\README.md
Get-Content week7-python\README.md
Get-Content week7-python\team\README.md
Get-Content week7-python\team\rfm_segments.csv -TotalCount 10
Select-String -Path week7-python\team\week7_rfm_complete.ipynb -Pattern "segment|recency|monetary|reference|analysis|rfm_segments|Supabase"
py --version
py -m pip install matplotlib
py -m pip install -r week8-python-api-pipeline\team\requirements.txt
py -m pytest week8-python-api-pipeline\team\tests
py week8-python-api-pipeline\team\pipeline.py --date 2025-02-28
Headless Edge screenshots of local ragnarlaak.github.io/index.html
```

Additional Python scripts were run through `py -` to summarize
`week7-python/team/rfm_segments.csv`, generate evidence outputs under
`portfolio-evidence/outputs/`, and summarize the Week 8 pipeline sample-data
run.

## Packages Installed

- `matplotlib` was installed with `py -m pip install matplotlib` to generate
  website-ready PNG evidence charts.
- Week 8 requirements were installed with
  `py -m pip install -r week8-python-api-pipeline\team\requirements.txt`.
  Most packages were already present; `pytest`, `pluggy`, and `iniconfig` were
  installed during this run.
- The first install attempt inside the sandbox returned no package versions.
  The command was rerun with network approval and completed successfully.

## Errors / Blockers

- `python` was not available on PATH. The Windows launcher `py` was available
  and used instead.
- Full Week 7 notebook execution was not rerun against Supabase. The public RFM
  claims were reproduced from the committed customer-level export
  `week7-python/team/rfm_segments.csv`; no credentials were printed or exposed.
- SQL data quality and Power BI KPI calculations were not rerun locally because
  the repository does not include a local raw database/source table export for
  those exact calculations. Their public numbers are supported by project
  READMEs, SQL scripts, notes, and screenshots.
- `py -m pytest week8-python-api-pipeline\team\tests` passed 4 tests after
  installing the declared requirements. Pytest emitted a cache warning because
  it could not create a cache path under the repository.
- `py week8-python-api-pipeline\team\pipeline.py --date 2025-02-28` ran
  successfully and exported 24 HTML report files. Supabase credentials were not
  available in the Week 8 environment and local CSV fallback files were not
  present, so the pipeline used configured built-in sample data. This supports
  workflow automation claims but not public UrbanStyle business KPI claims.
- Matplotlib initially attempted to write a cache under `C:\Users\ragna`.
  A later chart command used a local `MPLCONFIGDIR`; the temporary local cache
  folder was removed after generation.
- Power BI Desktop / `PBIDesktop.exe` was not discoverable from the shell, so
  copied `.pbix` files could not be opened or improved in this environment.
- Browser Use Node REPL tooling was not exposed in this session. Visual review
  was completed with headless Microsoft Edge screenshots instead.

## Safe Fixes Made

- Created `portfolio-evidence/outputs/`.
- Generated RFM summary and chart outputs from the existing RFM CSV.
- Generated a SQL data-quality visual from documented Week 2 findings.
- Created safe Power BI edit copies under `portfolio-evidence/powerbi-edits/`.
- Ran Week 8 tests and pipeline without exposing credentials.
- No credentials were printed, edited, or committed.
- No weekly source project files were modified.

## Claim Classification

| Claim | Classification | Evidence |
| --- | --- | --- |
| 128 duplicate emails | DOCUMENTED EVIDENCE, NOT REPRODUCED | `week2-sql-data-cleaning/README.md`; SQL duplicate-email queries in `week2-sql-data-cleaning/team/week2_group_project.sql` |
| 380 missing emails | DOCUMENTED EVIDENCE, NOT REPRODUCED | `week2-sql-data-cleaning/README.md`; comment and NULL email query in `week2-sql-data-cleaning/team/week2_group_project.sql` |
| 12 city naming variations | DOCUMENTED EVIDENCE, NOT REPRODUCED | `week2-sql-data-cleaning/README.md`; city standardization queries in Week 2 SQL files |
| Approximately 10K orders | DOCUMENTED EVIDENCE, NOT REPRODUCED | `week5-power-bi/README.md`; `week5-power-bi/team/images/urbanstyle_revenue_dashboard.png` |
| Approximately EUR 2.91M revenue | DOCUMENTED EVIDENCE, NOT REPRODUCED | `week5-power-bi/README.md`; `week5-power-bi/team/images/urbanstyle_revenue_dashboard.png` |
| 19.08% revenue growth in 2024 vs 2023 | DOCUMENTED EVIDENCE, NOT REPRODUCED | `week5-power-bi/README.md`; `week5-power-bi/team/ceo_view_notes.txt`; Power BI screenshot |
| Tartu growth of approximately 13% | DOCUMENTED EVIDENCE, NOT REPRODUCED | `week6-data-storytelling/README.md`; Tartu Power BI screenshot |
| UrbanStyle overall growth of approximately 19% | DOCUMENTED EVIDENCE, NOT REPRODUCED | `week5-power-bi/README.md`; `week6-data-storytelling/README.md` |
| RFM reference date 2025-02-28 | VERIFIED / REPRODUCED | Derived from `last_purchase_date + recency_days` in `week7-python/team/rfm_segments.csv` |
| RFM customers analysed: 2,540 | VERIFIED / REPRODUCED | `portfolio-evidence/outputs/rfm_segment_summary.csv` |
| RFM total monetary value: EUR 2,676,850.54 | VERIFIED / REPRODUCED | `portfolio-evidence/outputs/rfm_key_findings.txt` |
| VIP Champions: 455 customers, EUR 1,146,295.15, 42.82% revenue share | VERIFIED / REPRODUCED | `portfolio-evidence/outputs/rfm_segment_summary.csv` |
| Potential segment: 758 customers, 29.84% customer share | VERIFIED / REPRODUCED | `portfolio-evidence/outputs/rfm_segment_summary.csv` |
| At Risk segment: 533 customers, 20.98% customer share, 7.24% revenue share, avg recency 310.35 days | VERIFIED / REPRODUCED | `portfolio-evidence/outputs/rfm_segment_summary.csv` |
| Lost segment: 116 customers, 4.57% customer share, 0.73% revenue share, avg recency 516.10 days | VERIFIED / REPRODUCED | `portfolio-evidence/outputs/rfm_segment_summary.csv` |
| Week 8 tests passed | VERIFIED / REPRODUCED | `py -m pytest week8-python-api-pipeline\team\tests`; 4 tests passed |
| Week 8 pipeline exported 24 HTML reports | VERIFIED / REPRODUCED | `py week8-python-api-pipeline\team\pipeline.py --date 2025-02-28`; `week8-python-api-pipeline/team/output/` |
| Week 8 pipeline processed live UrbanStyle/Supabase data | BLOCKED | Supabase credentials unavailable in Week 8 environment; CSV fallback files absent |
| Week 8 sample run used built-in sample data | VERIFIED / REPRODUCED | Pipeline output and `portfolio-evidence/outputs/pipeline_summary.md` |
| Week 8 sample run processed 21 sample sales rows and 13 clean rows after date filter | VERIFIED / REPRODUCED | `portfolio-evidence/outputs/pipeline_output_summary.csv` |
| Power BI portfolio edit copies created | VERIFIED / REPRODUCED | `portfolio-evidence/powerbi-edits/` |
| Power BI portfolio edit copies improved in Power BI Desktop | BLOCKED | `PBIDesktop.exe` not discoverable from shell |

## Generated Outputs

- `portfolio-evidence/outputs/rfm_segment_summary.csv`
- `portfolio-evidence/outputs/rfm_key_findings.txt`
- `portfolio-evidence/outputs/rfm_revenue_by_segment.png`
- `portfolio-evidence/outputs/rfm_customers_by_segment.png`
- `portfolio-evidence/outputs/sql_data_quality_findings.csv`
- `portfolio-evidence/outputs/sql_data_quality_findings.png`
- `portfolio-evidence/outputs/pipeline_summary.md`
- `portfolio-evidence/outputs/pipeline_output_summary.csv`
- `portfolio-evidence/outputs/pipeline_sample_segment_summary.csv`
- `portfolio-evidence/outputs/pipeline_workflow_visual.png`

## Power BI Original and Copy Paths

| Original file | Portfolio edit copy | Status |
| --- | --- | --- |
| `week5-power-bi/team/week5_powerbi_urbanstyle_dashboard_revenue.pbix` | `portfolio-evidence/powerbi-edits/week5_ceo_dashboard_portfolio_edit.pbix` | Copied, not edited |
| `week6-data-storytelling/individual/week6_tartu_dashboard_role_b.pbix` | `portfolio-evidence/powerbi-edits/week6_tartu_dashboard_portfolio_edit.pbix` | Copied, not edited |

## Manual Power BI Improvement Checklist

If opening the copied `.pbix` files in Power BI Desktop later, improve only the
copied files:

### Week 5 CEO Sales Performance Dashboard

Source screenshot currently used on the website:
`week5-power-bi/team/images/urbanstyle_revenue_dashboard.png`

Copied report to edit later:
`portfolio-evidence/powerbi-edits/week5_ceo_dashboard_portfolio_edit.pbix`

Recommended visual refinements:

- Enlarge KPI cards for `Tellimused kokku` / total orders, `Kogukäive` / total
  revenue, and `Käibe kasv 2024 vs 2023` / 2024 vs 2023 revenue growth.
- Enable readable data labels on the monthly revenue trend chart if they do not
  overcrowd the view; otherwise show labels only for key peak/low months.
- Remove redundant axis titles or visual clutter where the chart title already
  explains the measure and period.
- Improve the main title to communicate the finding directly, for example:
  `UrbanStyle revenue grew 19.08% in 2024 vs 2023`.
- Add one concise insight text box: `UrbanStyle grew overall, with ~10K orders
  and ~€2.91M revenue in the dashboard scope.`
- Add one concise recommendation text box: `Review slower-growing locations by
  product mix, average order value and customer segments.`
- Export this page later as
  `portfolio-evidence/outputs/powerbi_sales_performance_dashboard.png` and use
  it to replace `ragnarlaak.github.io/assets/powerbi-dashboard.png`.

### Week 6 Tartu Growth Storytelling Dashboard

Source screenshot available:
`week6-data-storytelling/individual/week6_tartu_dashboard_storytelling.png`

Copied report to edit later:
`portfolio-evidence/powerbi-edits/week6_tartu_dashboard_portfolio_edit.pbix`

Recommended visual refinements:

- Enlarge KPI cards for Tartu orders, Tartu revenue, and Tartu 2024 vs 2023
  growth.
- Keep the monthly revenue trend as the main chart and enable data labels only
  for the highlighted month or relevant peak to preserve readability.
- Remove redundant axis titles and reduce visual clutter around reference lines
  or annotations if they compete with the main finding.
- Improve the main title to communicate the finding directly, for example:
  `Tartu grew 13%, but lagged UrbanStyle's overall ~19% growth`.
- Add one concise insight text box: `Tartu is growing, but more slowly than the
  company overall.`
- Add one concise recommendation text box: `Compare Tartu product mix, average
  order value and customer segments with stronger locations/channels.`
- Export this page later as
  `portfolio-evidence/outputs/powerbi_tartu_growth_drilldown.png`. Use it as a
  replacement or supporting visual if it is clearer than the Week 5 screenshot.

Important: keep existing measures, filters, data model, relationships, date
logic and business definitions unchanged.

## Website Visual Review

The local `ragnarlaak.github.io/index.html` site was reviewed using headless
Microsoft Edge screenshots at desktop and mobile widths. A mobile text-clipping
issue was found in the first pass and fixed with stricter mobile wrapping,
layout shrink rules, and a mobile content-width cap.

Review screenshots were saved locally under:

- `C:\Users\ragna\AppData\Local\Temp\ragnar-portfolio-review\desktop.png`
- `C:\Users\ragna\AppData\Local\Temp\ragnar-portfolio-review\mobile-final.png`
- `C:\Users\ragna\AppData\Local\Temp\ragnar-portfolio-review\mobile-header-final.png`

These screenshots were used for review only and were not committed.
