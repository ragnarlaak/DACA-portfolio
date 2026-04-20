# Week 3 - SQL Joins and Retail Inventory Analysis

## Overview

This week focused on using **SQL joins** to connect sales, customer, product, and inventory data in the UrbanStyle dataset.

The goal was to understand how different tables relate to each other and use those relationships to answer practical retail questions, including:
- which products have never been sold
- which products and categories sell the most
- which customers are active or inactive
- which inventory items may need reordering

I worked with read-only analysis queries and did not modify the original tables.

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

## Structure

- `individual/` contains my own Week 3 practice queries and the lecture/reference SQL file
- `team/` contains shared Week 3 SQL work, written answers, and evidence screenshots

### [individual/week3_individual_practice.sql](individual/week3_individual_practice.sql)
Contains my individual Week 3 practice queries, including:
- customer and sales joins
- product and sales joins
- unsold product checks
- customer activity checks
- top categories and customer summaries

### [individual/week3_lecture_queries.sql](individual/week3_lecture_queries.sql)
Contains Week 3 lecture/reference queries used during the joins lesson.

### [team/week3_roll_c_tooted_inventuur.sql](team/week3_roll_c_tooted_inventuur.sql)
Contains the Week 3 team SQL work for products and inventory analysis.

### [team/week3_roll_c_tooted_inventuur_answers.md](team/week3_roll_c_tooted_inventuur_answers.md)
Contains the written summary of the team findings from the Week 3 task.

### [team/Operatsioonide analüüsiosakond — JOIN-analüüs.pptx](<team/Operatsioonide analüüsiosakond — JOIN-analüüs.pptx>)
Contains the Week 3 team presentation for the join analysis task.

---

## Main Tasks Completed

### Customer and Sales Joins
I practiced joining customer and sales data to see which customers had made purchases and which had never bought anything.

### Product Sales Analysis
I explored which products and categories generated the most sales and which products had never been sold.

### Inventory Review
I used joins between products and inventory to identify low-stock items, reorder needs, and products that might tie up stock value.

### Multi-Table Analysis
I combined customer, sales, and product data in single queries to better understand purchasing patterns across cities and categories.

---

## Team Summary

Main findings from the team inventory analysis:

- **12 products** had never been sold
- strongest categories by total sales included footwear and clothing categories
- several products had very low, zero, or even negative stock levels
- no unsold products were found with positive stock on hand

### Interpretation
The Week 3 work showed how joins can be used to move from isolated tables to real business questions.

The most important insights were:
1. some products may need review because they have not sold at all
2. stronger categories should be supported with better stock availability
3. inventory levels need closer monitoring when stock is low or negative

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

## Individual Work

The individual folder includes both my own practice work and the lecture/reference file used for Week 3 joins.

---

## Key Takeaways

- `INNER JOIN` is useful when only matching rows should appear
- `LEFT JOIN` helps find missing relationships such as customers with no purchases or products with no sales
- aggregate functions become more powerful when combined with joins
- multi-table joins make retail analysis much more realistic and useful

---

## Reflection

Week 3 felt like a step forward from basic SQL and cleaning work because the queries started to answer more realistic business questions.

The biggest lesson was that joins are what make separate tables meaningful together. Once customer, product, sales, and inventory data are connected correctly, the analysis becomes much more practical.
