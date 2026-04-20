# Week 3 - SQL JOINs and Retail Inventory Analysis

## Overview

This week focused on SQL JOINs in the UrbanStyle database. The main goal was to learn how to connect data across tables and use those relationships to answer practical business questions.

The main JOIN patterns covered were:
- `INNER JOIN` for matching rows only
- `LEFT JOIN` for keeping all rows from the left table
- `LEFT JOIN + IS NULL` for finding missing matches
- 3-table JOINs for combining customers, sales, and products into one result

---

## Major Technical Issue Resolved

A large part of this week was spent fixing the database state so it matched the expected Week 3 setup.

### Problem

The `sales` table and overall schema state had become inconsistent. There were mismatches between:
- imported table versions
- expected raw participant data
- the schema used by the workbook
- mixed date formats in the sales CSV

This caused confusion around duplicate removal, table structure, and import failures.

### What I Did

To solve this, I:
1. Rebuilt the database schema from the provided SQL schema file
2. Created a staging table called `sales_raw` for importing the raw sales CSV
3. Used the staging table because `sale_date` contained mixed date formats
4. Inserted data from `sales_raw` into the final `sales` table with correct date conversion
5. Removed duplicate rows from `sales`
6. Standardized city names in `customers`

### Final Validation

After fixing the setup, the final Week 3 pre-cleaning checks were:
- `sales` row count after duplicate cleanup: **10118**
- distinct `customers.city` values after normalization: **12**

This confirmed that the database was finally in the correct state for the Week 3 JOIN work.

---

## Tools Used

- Supabase SQL Editor
- SQL
- GitHub

---

## Topics Covered

- `INNER JOIN` for matching rows across tables
- `LEFT JOIN` for keeping unmatched rows visible
- join-based filtering with `IS NULL`
- grouping and aggregation after joins
- multi-table joins across `sales`, `customers`, `products`, and `inventory`
- inventory review with `CASE WHEN`

---

## Repository Structure

- `individual/` contains my own Week 3 practice queries and the lecture/reference SQL file
- `team/` contains shared Week 3 SQL work, written answers, screenshots, and the presentation material

### [individual/week3_individual_practice.sql](individual/week3_individual_practice.sql)

Contains my individual Week 3 practice queries, including:
- customer and sales joins
- product and sales joins
- unsold product checks
- customer activity checks
- top categories and customer summaries

### [individual/week3_lecture_queries.sql](individual/week3_lecture_queries.sql)

Contains Week 3 lecture and reference queries used during the JOIN lesson.

### [team/week3_roll_c_tooted_inventuur.sql](team/week3_roll_c_tooted_inventuur.sql)

Contains the Week 3 team SQL work for products and inventory analysis.

### [team/week3_roll_c_tooted_inventuur_answers.md](team/week3_roll_c_tooted_inventuur_answers.md)

Contains the written summary of the team findings from the Week 3 task.

---

## My Week 3 SQL Work

My technical work this week included:
- rebuilding the schema correctly
- fixing the sales import pipeline
- working with `INNER JOIN`
- using `LEFT JOIN + IS NULL` to find missing matches
- joining 3 tables together with `sales`, `customers`, and `products`
- using JOIN results in both workbook and group work

### Customer and Sales JOINs

I practiced joining customer and sales data to see which customers had made purchases and which had never bought anything.

### Product Sales Analysis

I explored which products and categories generated the most sales and which products had never been sold.

### Inventory Review

I used joins between products and inventory to identify low-stock items, reorder needs, and products that might tie up stock value.

### Multi-Table Analysis

I combined customer, sales, and product data in single queries to better understand purchasing patterns across cities and categories.

---

## Group Work Contribution - Roll C

My assigned group-work part focused on **products and inventory**.

### Queries and Analysis Completed

I worked on:
- products that were never sold
- total count of unsold products
- top-selling products
- category-level analysis
- inventory and reorder-point analysis
- short business recommendations based on findings

### Main Findings

- Found **12 unsold products**
- Strongest categories by overall sales included footwear, men's clothing, and women's clothing
- Inventory analysis showed several products with low stock, zero stock, and even negative stock values
- No unsold products were found with positive stock on hand

### Business Interpretation

The results suggested that:
- unsold products should be reviewed for discounting or removal
- strong-selling categories should be prioritized in stock management
- low and negative stock levels indicate that inventory control needs better monitoring

---

## Team Contribution

This week I also contributed beyond my own SQL tasks.

### Subgroup Coordination

At the start of subgroup work, I:
- led the initial subgroup conversation
- made sure everyone knew their assignments
- clarified in advance who would present which part
- helped reduce confusion around task ownership

### Documentation and GitHub Support

I also shared tips and tricks with teammates about:
- documenting work in GitHub
- structuring weekly content
- making project outputs more presentable and useful later

### Helping Teammates

The following day, I helped a teammate troubleshoot a VS Code and Supabase tooling issue by:
- suggesting a practical workaround
- pointing them toward useful extensions and setup options
- using screenshots and examples to explain it more clearly

---

## Team Evidence

- [query_1_unsold_products.png](team/images/query_1_unsold_products.png)
- [query_2_unsold_products_count.png](team/images/query_2_unsold_products_count.png)
- [query_3_top_selling_products.png](team/images/query_3_top_selling_products.png)
- [query_4_category_analysis.png](team/images/query_4_category_analysis.png)
- [query_5_inventory_reorder_page_1.png](team/images/query_5_inventory_reorder_page_1.png)
- [query_5_inventory_reorder_page_2.png](team/images/query_5_inventory_reorder_page_2.png)
- [query_5_inventory_reorder_page_3.png](team/images/query_5_inventory_reorder_page_3.png)

---

## Key Concepts Reinforced

By the end of the week, the most important SQL ideas were:

- `INNER JOIN` returns only matching rows
- `LEFT JOIN` keeps all rows from the left table plus matching rows from the right
- `LEFT JOIN + IS NULL` helps find missing relationships
- 3-table joins make it possible to combine separate business domains into one useful result

---

## Reflection

Week 3 was technically messy, but strong overall.

The biggest takeaway was that even when the environment was broken, I was able to:
- diagnose the problem
- rebuild the setup
- finish my SQL work
- support teammates
- contribute to subgroup coordination

So this week was not just about learning JOINs. It also showed progress in:
- technical problem solving
- communication
- teamwork
- documentation habits
- staying useful under pressure

---

## Conclusion

Week 3 was one of the more technically frustrating weeks so far, but it ended as a strong week because I:
- restored the correct database state
- completed my Roll C analysis
- supported my group practically
- helped teammates
- created solid material to document in GitHub

This week strengthened both my SQL foundation and my value in collaborative technical work.
