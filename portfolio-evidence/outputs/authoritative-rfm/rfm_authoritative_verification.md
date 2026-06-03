# Authoritative RFM Verification

Execution date: 2026-06-03

## Source Used

- Source notebook inspected: `week7-python/team/week7_rfm_complete.ipynb`
- Source export analysed: `week7-python/team/rfm_segments.csv`
- Teammate source comparison: `katlintootmaa-cmd/daca-portfolio/week-07-Python-Pandas/team` documents the same team notebook, role split, and reference date.

## Execution Status

The committed Week 7 team export was successfully reproduced into this summary with pandas. Direct notebook execution against Supabase was attempted with local credentials and then with elevated network permission, but both runs failed at the Supabase fetch step with DNS/connectivity errors (`getaddrinfo failed`). No credentials were printed or committed.

Evidence status: `VERIFIED / REPRODUCED FROM COMMITTED WEEK 7 TEAM EXPORT`; live Supabase rerun is `BLOCKED` by network/DNS access in this environment.

## Input Source

The authoritative quantitative input is `week7-python/team/rfm_segments.csv`, the exported Week 7 team RFM customer-segment table. It contains one customer-level row per analysed customer and excludes unnecessary contact details such as email and phone.

## Reference Date

The Week 7 notebook and teammate README document the RFM reference date as `2025-02-28`. The notebook filters sales rows after this date out of the RFM input.

## Cleaning and Filtering Logic

The inspected notebook logic loads `sales` and `customers` from Supabase, joins on `customer_id`, converts sales dates and amounts, removes duplicate rows, removes rows with missing `customer_id`, `sale_date`, or `total_price`, removes invalid dates, removes non-positive monetary rows, and filters the RFM input to sales on or before `2025-02-28`.

## RFM Scoring and Segment Mapping

The inspected notebook computes:

- `recency_days`: days between `2025-02-28` and each customer's most recent purchase.
- `frequency`: count of sales rows per customer.
- `monetary_value`: sum of `total_price` per customer.
- `R_score`, `F_score`, `M_score`: quintile-style scores using ranked values.
- `RFM_Score`: sum of the three scores.

Segment mapping inspected in the notebook:

- `RFM_Score >= 13`: VIP Champions
- `RFM_Score >= 10`: Loyal
- `RFM_Score >= 8`: Potential
- `RFM_Score >= 5`: At Risk
- otherwise: Lost

## Authoritative Segment Summary

Total customers analysed: 2,540  
Total monetary value analysed: EUR 2,676,850.54

| Segment | Customers | Customer share | Total revenue | Revenue share | Avg monetary/customer | Avg recency days | Avg frequency |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| VIP Champions | 455 | 17.91% | EUR 1,146,295.15 | 42.82% | EUR 2,519.33 | 48.66 | 7.68 |
| Loyal | 678 | 26.69% | EUR 795,523.58 | 29.72% | EUR 1,173.34 | 145.21 | 3.84 |
| Potential | 758 | 29.84% | EUR 521,614.40 | 19.49% | EUR 688.15 | 207.33 | 2.49 |
| At Risk | 533 | 20.98% | EUR 193,876.62 | 7.24% | EUR 363.75 | 310.35 | 1.59 |
| Lost | 116 | 4.57% | EUR 19,540.79 | 0.73% | EUR 168.46 | 516.10 | 1.01 |

## Key Findings

- Highest-value segment: VIP Champions with EUR 1,146,295.15 and 42.82% of revenue.
- Largest segment: Potential with 758 customers and 29.84% of customers.
- Meaningful opportunity groups: Potential has 758 customers for repeat-purchase development; At Risk has 533 customers and 7.24% of revenue for win-back action.
- Lost contains 116 customers and 0.73% of revenue, suggesting lower-cost reactivation testing rather than primary focus.

## Website Match Check

The current public RFM headline figures matched the authoritative Week 7 export exactly:

- 2,540 customers analysed: match.
- 42.82% revenue share from VIP Champions: match.
- 758 Potential customers: match.
- 533 At Risk customers: match.

Week 8 sample/fallback pipeline outputs were inspected separately and must not be used as the authoritative Week 7 business result.
