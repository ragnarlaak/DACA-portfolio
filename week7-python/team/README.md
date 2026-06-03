# Week 7 Team Project - Python/pandas RFM Analysis

This folder contains the Week 7 team RFM analysis for UrbanStyle course data.

## Files

- `week7_rfm_complete.ipynb` - Team notebook for loading UrbanStyle sales and customer data, cleaning the joined data, calculating RFM metrics, assigning customer segments and exporting segment data.
- `rfm_segments.csv` - Customer-level RFM segment export used as the authoritative committed output for the public portfolio.
- `N7_2_1_P_GT_Python_Pandas_v2.9.docx` - Project workbook/instructions used for the Week 7 team assignment.

## Business Problem

UrbanStyle needed to understand which customers were high value, which customers were still developing and which customers were at risk of becoming inactive.

## Analysis Setup

- RFM reference date: 2025-02-28.
- Input source: Supabase `sales` and `customers` tables in the team notebook.
- Public export: `rfm_segments.csv`, one row per analysed customer.
- Sensitive contact fields such as email and phone are not included in the public export.

## Segment Logic

The notebook calculates:

- recency: days since the customer's most recent purchase;
- frequency: number of sales rows for the customer;
- monetary value: total `total_price` for the customer;
- R, F and M scores using ranked quintile-style scoring;
- total RFM score and segment assignment.

Segment mapping:

- `RFM_Score >= 13`: VIP Champions
- `RFM_Score >= 10`: Loyal
- `RFM_Score >= 8`: Potential
- `RFM_Score >= 5`: At Risk
- otherwise: Lost

## Authoritative Public Findings

| Segment | Customers | Revenue share | Recommendation |
| --- | ---: | ---: | --- |
| VIP Champions | 455 | 42.82% | Protect with loyalty and early-access offers. |
| Loyal | 678 | 29.72% | Grow basket size and cross-sell. |
| Potential | 758 | 19.49% | Encourage repeat purchases. |
| At Risk | 533 | 7.24% | Use timely win-back campaigns. |
| Lost | 116 | 0.73% | Test low-cost reactivation. |

Full verification package:

- `../../portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_verification.md`
- `../../portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_segment_summary.csv`
- `../../portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_revenue_by_segment.png`
- `../../portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_customers_by_segment.png`

## Environment Notes

The notebook expects `SUPABASE_URL` and `SUPABASE_KEY` or `SUPABASE_ANON_KEY` in a local `.env` file. Do not commit real credentials.
