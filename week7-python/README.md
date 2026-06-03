# Week 7 - Python/pandas and RFM Customer Segmentation

This week focused on customer-level RFM segmentation with UrbanStyle course data using Python and pandas. The RFM work was completed as a team project using the UrbanStyle retail business-simulation dataset.

## Business Question

Which customer groups should UrbanStyle prioritise for loyalty, repeat-purchase and win-back actions?

## Tools

Python / pandas

## Evidence Status

VERIFIED / REPRODUCED FROM COMMITTED WEEK 7 TEAM EXPORT.

## Business Answer

VIP Champions are a smaller customer group but generated the largest share of monetary value. Potential customers are the largest segment by customer count, and At Risk customers are the clearest retention/win-back priority.

Direct notebook execution against Supabase was attempted during the portfolio audit, but the environment could not resolve/connect to the Supabase host. The committed Week 7 team export was successfully summarized with pandas and is treated as the authoritative public evidence package.

## Dataset and Reference Date

- Dataset: UrbanStyle retail business-simulation course data completed during the Data Analyst Career Accelerator.
- Source notebook: `team/week7_rfm_complete.ipynb`.
- Source export: `team/rfm_segments.csv`.
- RFM reference date: 2025-02-28.
- Total customers analysed: 2,540.

## My Contribution

This was a team project. My contribution in the team project focused on calculating Recency, Frequency and Monetary values, assigning RFM segments and checking whether the segmentation logic supported the business objective.

## Verified Segment Findings

| Segment | Customers | Monetary-value share | Business meaning |
| --- | ---: | ---: | --- |
| VIP Champions | 455 | 42.82% | Highest-value customer group to protect with loyalty and early-access offers. |
| Loyal | 678 | 29.72% | Active repeat customers with cross-sell and basket-growth potential. |
| Potential | 758 | 19.49% | Largest group by customer count; good target for repeat-purchase nudges. |
| At Risk | 533 | 7.24% | Customers needing win-back action before they become inactive. |
| Lost | 116 | 0.73% | Low-current-value group for lower-cost reactivation testing. |

![RFM revenue contribution by customer segment](../portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_revenue_by_segment.png)

## Business Actions

- Protect VIP Champions with loyalty offers, early access and personalised benefits.
- Move Potential customers toward repeat purchasing with targeted follow-up campaigns.
- Contact At Risk customers with retention or win-back offers before they move further into inactivity.
- Treat Lost customers as a lower-cost reactivation test group rather than the main revenue priority.

## Evidence Outputs

- [Authoritative RFM verification](../portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_verification.md)
- [Authoritative segment summary CSV](../portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_segment_summary.csv)
- [Revenue by segment chart](../portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_revenue_by_segment.png)
- [Customers by segment chart](../portfolio-evidence/outputs/authoritative-rfm/rfm_authoritative_customers_by_segment.png)
- [Team RFM export](team/rfm_segments.csv)
- [Team notebook](team/week7_rfm_complete.ipynb)

## Folder Structure

- `individual/` - Individual Week 7 setup and learning workspace.
- `team/` - Team RFM notebook, workbook and exported segment file.
- `requirements.txt` - Python dependencies used for Week 7 work.

## Setup Notes

Use Windows-compatible commands from this folder:

```powershell
py -m venv .venv
.\.venv\Scripts\Activate.ps1
py -m pip install --upgrade pip
py -m pip install -r requirements.txt
```

If local environment variables are needed, copy `.env.example` to `.env` and add your values there. Do not commit the real `.env` file.
