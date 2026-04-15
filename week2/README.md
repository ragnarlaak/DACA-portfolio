# Week 2 - SQL Data Cleaning and Customer Data Quality Analysis

## Overview
This week focused on **data cleaning in SQL** using the UrbanStyle dataset in Supabase.

The goal was to identify and safely handle common data quality issues before analysis, including:
- duplicate values
- missing values (`NULL`)
- inconsistent text formatting
- basic validation checks

I worked with test tables instead of modifying the original tables directly.

---

## Tools Used
- Supabase SQL Editor
- SQL
- GitHub

---

## Topics Covered
- duplicate detection with `GROUP BY` + `HAVING`
- missing value checks with `IS NULL` / `IS NOT NULL`
- fallback values with `COALESCE()`
- safe `UPDATE` and `DELETE` practice on test tables
- text cleaning with `TRIM()`, `UPPER()`, `LOWER()`, `INITCAP()`
- validation logic with `CASE WHEN`

---

## Structure

- `individual/` contains my own SQL practice and lecture/reference files
- `team/` contains shared group project and presentation materials

### [individual/week2_individual_practice.sql](individual/week2_individual_practice.sql)
Contains my individual Week 2 SQL practice queries, including:
- duplicate checks
- NULL checks
- `COALESCE()` usage
- city name consistency checks
- validation queries

### [individual/week2_lecture_queries.sql](individual/week2_lecture_queries.sql)
Contains SQL examples and queries covered during the Week 2 lecture, used as reference for understanding the cleaning workflow.

### [team/week2_group_project.sql](team/week2_group_project.sql)
Contains the SQL work related to the Week 2 group task, including customer-domain checks and summary findings used for presentation preparation.

---

## Main Tasks Completed

### Duplicate Checks
I explored duplicate-related issues in the dataset, especially in customer email fields and sales-related records.

### NULL Analysis
I checked missing values in customer fields such as:
- first name
- last name
- email
- phone

### City Name Standardization
I identified inconsistent city name formats and used SQL cleaning functions to group them into cleaner standardized forms.

### Safe Cleaning Workflow
I created and used test tables to practice:
- previewing affected rows with `SELECT`
- updating only intended rows with `WHERE`
- deleting duplicates safely in a test environment

### Validation
I used simple validation logic to identify suspicious or inconsistent values in the data.

---

## Domain B - Customers Summary
Main findings from the customer domain:

- **128 duplicate email values**
- **380 missing email values**
- **0 missing first names**
- **0 missing last names**
- **0 missing phone numbers**
- **12 cities with inconsistent naming variations**

### Interpretation
The most important customer-data issues were:
1. missing email data
2. duplicate email values
3. inconsistent city name formatting

These issues can affect:
- customer communication
- segmentation accuracy
- reporting quality
- trust in the dataset

---

## Presentation File
This folder also includes the Week 2 presentation/supporting summary file for the customer domain:

- [team/week2_presentation.pptx](team/week2_presentation.pptx)

---

## Key Takeaways
- Data should be cleaned **before** drawing conclusions from it.
- A duplicate depends on the column or logic being checked.
- `NULL` is different from an empty string or zero.
- Cleaning should be tested on a copy first.
- Small data quality issues can have a real impact on analysis.

---

## Reflection
Week 2 was more demanding than Week 1 because it involved more decision-making, not just basic SQL syntax.

The biggest lesson was that **data cleaning is not only about writing queries, but about understanding what can be trusted in the data and how to modify it safely.**
