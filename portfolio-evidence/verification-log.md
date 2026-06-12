# Verification Log

Verification date: 2026-06-03

## Files Inspected

- `README.md`
- `week2-sql-data-cleaning/README.md`
- `week2-sql-data-cleaning/team/week2_group_project.sql`
- `week5-power-bi/README.md`
- `week5-power-bi/team/ceo_view_notes.txt`
- `week5-power-bi/team/images/urbanstyle_revenue_dashboard.png`
- `week6-data-storytelling/README.md`
- `week6-data-storytelling/individual/week6_tartu_dashboard_role_b.pbix`
- `week6-data-storytelling/individual/week6_tartu_dashboard_storytelling.png`
- `week6-data-storytelling/team/week6_tartu_dashboard_role_b.pbix`
- `week6-data-storytelling/team/week6_tartu_dashboard_storytelling.png`
- `week7-python/README.md`
- `week7-python/team/README.md`
- `week7-python/team/week7_rfm_complete.ipynb`
- `week7-python/team/rfm_segments.csv`
- `week8-python-api-pipeline/team/README.md`
- `week8-python-api-pipeline/team/config.yaml`
- `week8-python-api-pipeline/team/pipeline.py`
- `week8-python-api-pipeline/team/transform.py`
- `week8-python-api-pipeline/team/data_fetcher.py`
- `week8-python-api-pipeline/team/tests/test_transform.py`
- `C:\Users\ragna\GitHub\ragnarlaak.github.io\index.html`
- `C:\Users\ragna\GitHub\ragnarlaak.github.io\styles.css`
- `C:\Users\ragna\GitHub\ragnarlaak.github.io\assets\tartu-dashboard.png`
- `C:\Users\ragna\GitHub\ragnarlaak.github.io\assets\rfm_revenue_by_segment.png`
- Local website preview screenshots captured with headless Microsoft Edge.

## Commands Used

```powershell
rg --files
Get-Content -Raw README.md
Get-Content -Raw week7-python\team\README.md
Get-Content -TotalCount 5 week7-python\team\rfm_segments.csv
Select-String -Path week7-python\team\week7_rfm_complete.ipynb -Pattern "2025-02-28|VIP Champions|Potential|At Risk|Lost|qcut|segment"
py --version
py -m pytest week8-python-api-pipeline\team\tests
py week8-python-api-pipeline\team\pipeline.py --date 2025-02-28
jupyter nbconvert --to notebook --execute week7-python\team\week7_rfm_complete.ipynb --output week7_rfm_complete.executed.ipynb --output-dir portfolio-evidence\outputs\authoritative-rfm
"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --headless --disable-gpu --hide-scrollbars --window-size=1440,1100 --screenshot=...
"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --headless --disable-gpu --hide-scrollbars --window-size=390,7600 --screenshot=...
```

Additional Python snippets were run with `py -` to summarize `week7-python/team/rfm_segments.csv` and generate the authoritative RFM CSV/PNG/markdown outputs.

## Dependencies

- `py` uses Python 3.12.10.
- `pandas`, `matplotlib`, `plotly`, `pytest` and `yaml` were available.
- No dependency installation was required during this pass.

## RFM Authority Resolution

Source of truth selected: Week 7 team RFM analysis, using the committed team export `week7-python/team/rfm_segments.csv` and the inspected notebook logic in `week7-python/team/week7_rfm_complete.ipynb`.

The notebook documents:

- Supabase `sales` and `customers` input.
- RFM reference date `2025-02-28`.
- Cleaning for duplicate rows, missing required RFM fields, invalid dates and non-positive sales.
- RFM scoring with ranked quintile-style `R_score`, `F_score`, `M_score`.
- Segment mapping by total `RFM_Score`.

Direct notebook execution was attempted twice. Both attempts failed at the Supabase fetch step with DNS/connectivity error `getaddrinfo failed`, including after network approval. No credentials were printed. Therefore the source notebook rerun is `BLOCKED`, but the committed Week 7 customer-level export was reproducibly summarized locally.

Generated authoritative RFM outputs:

- `portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_segment_summary.csv`
- `portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_verification.md`
- `portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_revenue_by_segment.png`
- `portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_customers_by_segment.png`

## Week 8 Pipeline Check

`py -m pytest week8-python-api-pipeline\team\tests` passed 4/4 tests.

`py week8-python-api-pipeline\team\pipeline.py --date 2025-02-28` completed and exported 24 HTML report files under `week8-python-api-pipeline/team/output/`. The run did not use live Supabase data. It used built-in sample/fallback data because Week 8 Supabase credentials were not available and local CSV fallback files were absent. The sample run processed 21 sample sales rows and retained 13 rows after the date filter.

Public wording must keep Week 8 as workflow evidence, not live UrbanStyle KPI evidence.

## Power BI Evidence Check

Power BI Desktop automation was not attempted. Original `.pbix` files were not modified.

The Power BI claims remain classified as `DOCUMENTED EVIDENCE, NOT REPRODUCED` because the exact source tables were not available locally for independent KPI recalculation. Evidence comes from READMEs, DAX notes and screenshots:

- Approximately 10K orders.
- Approximately EUR 2.91M revenue.
- 19.08% revenue growth in 2024 versus 2023.
- Approximately 13% Tartu growth, below overall company growth.

Manual dashboard improvement guidance is recorded in `portfolio-evidence/powerbi-manual-improvement-checklist.md`.

## SQL Evidence Check

The SQL data-quality claims remain classified as `DOCUMENTED EVIDENCE, NOT REPRODUCED` because no local database/source-table dump was available for rerunning the queries. Evidence comes from Week 2 README and SQL files.

Supported public values:

- 128 duplicate email records.
- 380 missing email values.
- 12 city naming variations.

## Claim Classification

| Public claim | Classification | Evidence |
| --- | --- | --- |
| 2,540 RFM customers analysed | VERIFIED / REPRODUCED | `rfm_authoritative_segment_summary.csv` |
| VIP Champions revenue share 42.82% | VERIFIED / REPRODUCED | `rfm_authoritative_segment_summary.csv` |
| 758 Potential customers | VERIFIED / REPRODUCED | `rfm_authoritative_segment_summary.csv` |
| 533 At Risk customers | VERIFIED / REPRODUCED | `rfm_authoritative_segment_summary.csv` |
| Week 7 reference date 2025-02-28 | VERIFIED / REPRODUCED | Notebook inspection and RFM export consistency |
| Week 8 tests passed 4/4 | VERIFIED / REPRODUCED | Pytest run |
| Week 8 exported HTML reports | VERIFIED / REPRODUCED | Pipeline run output |
| Week 8 live Supabase KPI evidence | BLOCKED | Credentials/CSV fallback unavailable; sample fallback used |
| ~10K Power BI orders | DOCUMENTED EVIDENCE, NOT REPRODUCED | Week 5 README and screenshot |
| ~EUR 2.91M Power BI revenue | DOCUMENTED EVIDENCE, NOT REPRODUCED | Week 5 README and screenshot |
| 19.08% 2024 vs 2023 revenue growth | DOCUMENTED EVIDENCE, NOT REPRODUCED | Week 5 README, notes and screenshot |
| ~2K Tartu orders | DOCUMENTED EVIDENCE, NOT REPRODUCED | Week 6 README and Tartu dashboard screenshot |
| ~EUR 522K Tartu revenue | DOCUMENTED EVIDENCE, NOT REPRODUCED | Week 6 README and Tartu dashboard screenshot |
| ~13% Tartu growth | DOCUMENTED EVIDENCE, NOT REPRODUCED | Week 6 README and screenshot |
| 128 duplicate email records | DOCUMENTED EVIDENCE, NOT REPRODUCED | Week 2 README and SQL file |
| 380 missing email values | DOCUMENTED EVIDENCE, NOT REPRODUCED | Week 2 README and SQL file |
| 12 city naming variations | DOCUMENTED EVIDENCE, NOT REPRODUCED | Week 2 README and SQL file |
| Course completed/certificate received | NEEDS REVISION | No certificate/completion evidence found; avoid certificate/completed claims |

## Blockers and Limits

- Direct Supabase rerun for Week 7 failed because the environment could not resolve/connect to the Supabase host.
- SQL and Power BI were not independently recalculated because raw local database exports were not present.
- No certificate evidence was found, so public wording should not claim certificate receipt.
- The public course period is March 2026 to June 2026; on 2026-06-03, completion should not be assumed without explicit evidence.
- Direct live-site inspection at `https://ragnarlaak.github.io/` was blocked by local network/proxy connection errors. Local preview of `ragnarlaak.github.io/index.html` was inspected instead.
- Browser-use Node tooling was not exposed in this session, so visual review used headless Microsoft Edge screenshots.

## Security / Hygiene Notes

- A local `week7-python/.env` file exists and must remain untracked.
- No `.env` contents, Supabase keys or customer contact details were printed or committed.
- Generated Week 8 output files are local run artifacts and should remain untracked/ignored unless deliberately curated later.
