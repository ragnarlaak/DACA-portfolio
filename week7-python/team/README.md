# Week 7 Team Project - Python Pandas RFM Analysis

This folder contains the Week 7 group project materials for the Python Pandas
module, focused on customer segmentation using UrbanStyle course data.

## Files

- `week7_rfm_complete.ipynb` - team notebook for loading UrbanStyle course
  customer and sales data, cleaning the joined dataset, calculating RFM metrics,
  creating customer segments, visualizing results, and exporting segment data.
- `N7_2_1_P_GT_Python_Pandas_v2.9.docx` - project workbook/instructions used
  for the Week 7 team assignment.

## Project Focus

- Load sales and customer tables from Supabase.
- Clean duplicates, missing values, invalid dates, and non-positive sales.
- Build customer-level RFM metrics: recency, frequency, and monetary value.
- Segment customers into groups such as VIP Champions, Loyal Customers, At Risk,
  and Lost to support retention and customer-value analysis.
- Create interactive Plotly charts for segment distribution, RFM comparison, and
  top VIP customers.
- Summarize business recommendations for Marko based on customer segment value
  and retention risk.

## Business Problem and Solution

**Problem:** UrbanStyle needed to know which customers were high value, which
customers were still developing, and which customers were at risk of leaving.

**Solution:** The team notebook calculated RFM metrics and created customer
segments that can be used for different actions:

- VIP Champions: protect with loyalty and early-access offers
- Loyal Customers: grow basket size with cross-sell offers
- Potential Customers: encourage a second or next purchase
- At Risk / Lost: use win-back messaging and measure reactivation

## Notes

The notebook expects `SUPABASE_URL` and `SUPABASE_KEY` in the local
`week7-python/.env` file. Generated team exports such as `rfm_segments.csv`
should stay in this team folder.

Public notebook outputs and exports avoid unnecessary customer contact fields
such as email addresses and phone numbers.
