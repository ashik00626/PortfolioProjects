# Bike Sales Analysis Dashboard

An interactive **Microsoft Excel** project that analyzes 1,000 customer demographic records to identify the primary drivers behind bicycle purchasing decisions.

---

## 📊 Project Structure
* **`Working_Sheet`:** Data cleaning, duplicate removal, and creation of custom `Age Brackets`.
* **`Pivot_Table`:** Data aggregation across income, age, region, and distance metrics.
* **`Dashboard`:** Interactive visual presentation layer with dynamic filtering.

---

## 📈 Key Insights
* **Income:** Bike buyers have a higher average income ($55k+ for females, $60k+ for males) than non-buyers.
* **Age:** **Middle-aged** individuals (31–54) represent the largest customer volume and highest conversion rates.
* **Commute Distance:** Purchasing intent drops sharply as commute distance increases; buyers are heavily concentrated in the **0–1 mile** radius.

---

##  Dashboard Features
* **Interactive Slicers:** Dynamic filtering by *Marital Status*, *Education*, *Occupation*, and *Region*.
* **Cross-Filtering:** Real-time visual updates across all pivot charts upon selecting a filter.

---


# COVID-19 Data Exploration Project

An exploratory data analysis (EDA) project using **SQL** to analyze global COVID-19 datasets. This project transforms raw pandemic metrics into structured insights, focusing on infection rates, mortality probabilities, and global vaccination rollouts.

---

## 📊 Project Overview
The objective of this project is to query and analyze historical pandemic data across different dimensions (countries, continents, and global aggregates) to understand the progression and impact of COVID-19.

The analysis breaks down into three core phases:
1. **Infection & Mortality Impact:** Calculating the probability of dying if infected and tracking the percentage of the population infected over time.
2. **Regional Breakdown:** Identifying the countries and continents with the highest infection rates and death counts relative to their populations.
3. **Vaccination Progression:** Tracking cumulative, rolling vaccination numbers against country populations to evaluate global coverage.

---

## 🛠️ Advanced SQL Techniques Demonstrated

* **Data Joins & Aggregations:** Combining tables (`covid_deaths` and `covid_vaccinations`) using multiple primary keys (`location`, `date`) and performing deep analytical aggregations (`SUM`, `MAX`, `GROUP BY`).
* **Window Functions:** Utilizing `SUM(...) OVER (PARTITION BY...)` to compute running totals of daily new vaccinations dynamically across geographical locations.
* **CTEs (Common Table Expressions):** Implementing `WITH` clauses to build temporary named result sets for multi-step calculations on newly aggregated rolling numbers.
* **Temporary Tables:** Designing and populating local `TEMP TABLE` schemas to isolate, optimize, and compute percentage metrics smoothly.
* **Database Views:** Setting up structured database views (`CREATE VIEW`) to save complex query logic for future business intelligence visualization tools.

---


# Nashville Housing Data Cleaning Project

A dedicated data cleaning project using **SQL** to transform raw Nashville housing market records into a structured, clean, and analysis-ready dataset.

---

## 📊 Project Overview
The primary focus of this project is database normalization and preprocessing. It addresses structural anomalies, missing values, unparsed text strings, and duplicate records to ensure absolute data integrity.

---

## 🛠️ Data Cleaning Steps & SQL Techniques

* **Handling Missing Data:** Resolved null values in `PropertyAddress` by executing a self-join on matching `ParcelID` attributes, using the `COALESCE` function to populate blank entries.
* **String Parsing & Text Splitting:** Deconstructed unified string fields (`PropertyAddress` and `OwnerAddress`) into clean, independent attributes (`Address`, `City`, `State`) using the `SPLIT_PART` function.
* **Duplicate Elimination:** Implemented a Common Table Expression (CTE) alongside the `ROW_NUMBER()` window function partitioned across primary keys to cleanly target and delete duplicate records.
* **Schema Optimization:** Altered table structures to drop redundant or obsolete raw source columns (`OwnerAddress`, `TaxDistrict`, `PropertyAddress`), reducing the table's memory footprint.

---
