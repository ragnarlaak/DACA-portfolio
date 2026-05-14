# Week 2 - SQL Data Cleaning and Customer Data Quality Analysis

## Problem

Before using customer data for analysis, I needed to identify quality issues in
the UrbanStyle course dataset that could affect segmentation, reporting, and
confidence in later analysis: duplicates, missing values, inconsistent text
formatting, and validation problems.

## Approach

- used SQL in Supabase to inspect customer-related data quality
- identified duplicate values with `GROUP BY` and `HAVING`
- reviewed missing values with `IS NULL` and `IS NOT NULL`
- practiced fallback handling with `COALESCE()`
- explored text standardization with `TRIM()`, `UPPER()`, `LOWER()`, and `INITCAP()`
- used test tables for safe `UPDATE` and `DELETE` practice instead of editing
  original tables directly
- added simple validation logic with `CASE WHEN`

## Result

The customer-domain review produced clear quality findings:

- duplicate email values: **128**
- missing email values: **380**
- missing first names: **0**
- missing last names: **0**
- missing phone numbers: **0**
- city naming variations identified: **12**

The biggest issues were missing email data, duplicate emails, and inconsistent
city formatting. Identifying these issues supported cleaner customer grouping,
more reliable segmentation, and clearer reporting assumptions.

## Skills

- SQL data cleaning
- duplicate detection
- `NULL` analysis
- safe update/delete workflow
- text standardization
- validation logic

## Tools

- Supabase SQL Editor
- SQL
- GitHub

## Files and Evidence

- [individual/week2_individual_practice.sql](individual/week2_individual_practice.sql)
- [individual/week2_lecture_queries.sql](individual/week2_lecture_queries.sql)
- [team/week2_group_project.sql](team/week2_group_project.sql)
- [team/week2_presentation.pptx](team/week2_presentation.pptx)

## Portfolio Value

Week 2 shows a shift from basic querying to data-quality analysis. The work
connects duplicate checks, missing-value review, and text standardization to
more reliable segmentation and reporting.
