# Week 3 - SQL JOINs and Retail Inventory Analysis

## Problem

Week 3 focused on SQL JOINs, but the analysis work was blocked by a broken
database state. The `sales` table, schema setup, and imported data were
inconsistent, and mixed date formats in the raw CSV caused import and validation
problems.

## Approach

- rebuilt the database schema from the provided SQL setup file
- created a `sales_raw` staging table for the raw sales import
- converted mixed `sale_date` formats before inserting into the final `sales` table
- removed duplicate rows from `sales`
- standardized customer city values
- practiced `INNER JOIN`, `LEFT JOIN`, `LEFT JOIN + IS NULL`, and 3-table joins
- applied joins to customer activity, product sales, category performance, and
  inventory analysis
- completed my team role focused on products and inventory

## Result

First, I restored the environment to a reliable working state:

- `sales` row count after duplicate cleanup: **10118**
- distinct `customers.city` values after normalization: **12**

Then I used JOIN-based analysis to produce team results:

- unsold products found: **12**
- strongest sales categories included footwear, men's clothing, and women's clothing
- inventory review revealed low stock, zero stock, and negative stock cases
- no unsold products were found with positive stock on hand

This week combined technical repair work with business-focused SQL analysis,
which made it one of the strongest portfolio pieces so far.

## Skills

- SQL JOINs
- `INNER JOIN`, `LEFT JOIN`, `LEFT JOIN + IS NULL`
- multi-table analysis
- schema troubleshooting
- import cleanup and validation
- inventory analysis
- teamwork and technical support

## Tools

- Supabase SQL Editor
- SQL
- GitHub

## Files and Evidence

- [individual/week3_individual_practice.sql](individual/week3_individual_practice.sql)
- [individual/week3_lecture_queries.sql](individual/week3_lecture_queries.sql)
- [team/week3_roll_c_tooted_inventuur.sql][team-role-c-sql]
- [team/week3_roll_c_tooted_inventuur_answers.md][team-role-c-answers]
- [team/images/query_1_unsold_products.png][query-1-unsold-products]
- [team/images/query_2_unsold_products_count.png][query-2-unsold-count]
- [team/images/query_3_top_selling_products.png][query-3-top-products]
- [team/images/query_4_category_analysis.png][query-4-category-analysis]
- [team/images/query_5_inventory_reorder_page_1.png][query-5-reorder-page-1]
- [team/images/query_5_inventory_reorder_page_2.png][query-5-reorder-page-2]
- [team/images/query_5_inventory_reorder_page_3.png][query-5-reorder-page-3]

## Portfolio Value

Week 3 shows more than JOIN syntax. It demonstrates that I can diagnose broken
data workflows, rebuild a usable analysis environment, complete my assigned SQL
work, and still contribute to team coordination and practical support.

[team-role-c-sql]: team/week3_roll_c_tooted_inventuur.sql
[team-role-c-answers]: team/week3_roll_c_tooted_inventuur_answers.md
[query-1-unsold-products]: team/images/query_1_unsold_products.png
[query-2-unsold-count]: team/images/query_2_unsold_products_count.png
[query-3-top-products]: team/images/query_3_top_selling_products.png
[query-4-category-analysis]: team/images/query_4_category_analysis.png
[query-5-reorder-page-1]: team/images/query_5_inventory_reorder_page_1.png
[query-5-reorder-page-2]: team/images/query_5_inventory_reorder_page_2.png
[query-5-reorder-page-3]: team/images/query_5_inventory_reorder_page_3.png
