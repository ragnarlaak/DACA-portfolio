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
py -m pytest week8-python-api-pipeline\team\tests
```

Additional Python scripts were run through `py -` to summarize
`week7-python/team/rfm_segments.csv` and generate the evidence outputs under
`portfolio-evidence/outputs/`.

## Packages Installed

- `matplotlib` was installed with `py -m pip install matplotlib` to generate
  website-ready PNG evidence charts.
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
- `py -m pytest week8-python-api-pipeline\team\tests` was blocked because
  `pytest` is not installed. The Week 8 pipeline was inspected but not selected
  as a flagship website case study.
- Matplotlib initially attempted to write a cache under `C:\Users\ragna`.
  A later chart command used a local `MPLCONFIGDIR`; the temporary local cache
  folder was removed after generation.

## Safe Fixes Made

- Created `portfolio-evidence/outputs/`.
- Generated RFM summary and chart outputs from the existing RFM CSV.
- Generated a SQL data-quality visual from documented Week 2 findings.
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
| Week 8 tests passed | BLOCKED | `pytest` not installed; tests were not run |

## Generated Outputs

- `portfolio-evidence/outputs/rfm_segment_summary.csv`
- `portfolio-evidence/outputs/rfm_key_findings.txt`
- `portfolio-evidence/outputs/rfm_revenue_by_segment.png`
- `portfolio-evidence/outputs/rfm_customers_by_segment.png`
- `portfolio-evidence/outputs/sql_data_quality_findings.csv`
- `portfolio-evidence/outputs/sql_data_quality_findings.png`
