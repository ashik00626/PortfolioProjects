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

## Dashboard Preview

<img width="1273" height="779" alt="Screenshot 2026-05-31 220515" src="https://github.com/user-attachments/assets/e0b49bae-f1ce-4d21-acc0-a3545ced664a" />

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

## 🛠️ Steps and SQL Techniques 

* **Data Joins & Aggregations:** Combining tables (`covid_deaths` and `covid_vaccinations`) using multiple primary keys (`location`, `date`) and performing deep analytical aggregations (`SUM`, `MAX`, `GROUP BY`).
* **Window Functions:** Utilizing `SUM(...) OVER (PARTITION BY...)` to compute running totals of daily new vaccinations dynamically across geographical locations.
* **CTEs (Common Table Expressions):** Implementing `WITH` clauses to build temporary named result sets for multi-step calculations on newly aggregated rolling numbers.
* **Temporary Tables:** Designing and populating local `TEMP TABLE` schemas to isolate, optimize, and compute percentage metrics smoothly.
* **Database Views:** Setting up structured database views (`CREATE VIEW`) to save complex query logic for future business intelligence visualization tools.

## Qurty_output
<img width="824" height="702" alt="Screenshot 2026-06-01 181559" src="https://github.com/user-attachments/assets/11d8eff8-926b-400e-b884-f4e4617c8a90" />

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

## Query_output_after_cleaning
<img width="1535" height="703" alt="Screenshot 2026-06-01 185444" src="https://github.com/user-attachments/assets/3d8287ed-85db-4b47-9c6b-d6d74391d151" />
<img width="1534" height="698" alt="Screenshot 2026-06-01 185537" src="https://github.com/user-attachments/assets/5052aa7b-cd60-4a60-b53d-2e8427d7ebf4" />

---


# Web Scraping Pipeline: Largest US Companies by Revenue

A robust, end-to-end data acquisition project built with **Python** to extract, transform, and structure corporate financial intelligence from a live web source. This pipeline programmatically extracts data from Wikipedia's listing of the largest United States corporations by revenue, processes the unstructured HTML markup, and delivers a clean, analyst-ready dataset.

---

## 📊 Project Overview & Purpose
In data analytics, automated web scraping serves as a primary driver for alternative data collection. This project demonstrates a production-grade approach to harvesting tabular web data, handling HTTP request vulnerabilities, parsing complex Document Object Model (DOM) layouts, and standardizing data structures into a clean relational format for downstream analysis.

The data architecture transitions through three distinct layers:
1. **Extraction (Ingestion):** Pulling live web source documents using optimized headers.
2. **Transformation (Processing):** Crawling the structural DOM elements, cleansing structural noise, stripping whitespaces, and mapping arrays.
3. **Storage (Serialization):** Packaging records into a vector data frame and serializing it into an optimized CSV format.

---

## 🛠️ Tech Stack & Architecture Deep-Dive

* **`requests` (Data Ingestion):** Facilitates communication with remote web servers. Configured with a defined `User-Agent` inside the HTTP request headers to simulate authentic browser interactions and prevent defensive bot-blocking mechanisms.
* **`BeautifulSoup` (HTML DOM Parsing):** Utilizes an explicit `html.parser` engine to tokenize the source document. It target-scans specific multi-column table components, recursively maps column headers (`<th>`), and navigates index rows (`<tr>`) and descriptive text blocks (`<td>`).
* **`pandas` (Data Analysis & Engineering):** Translates multi-dimensional arrays into a rigid tabular `DataFrame` configuration. Handles data serialization by structuring column headers, handling default matrix alignments, and exporting structured inputs via index-free writes (`index=False`).

---

## 📂 Extracted Dataset Schema

The script extracts the top 100 corporate financial powerhouses in the United States, organizing them into the following schema:

| Column Field | Capture Type | Data Cleaning Treatment Implemented |
| :--- | :--- | :--- |
| **Rank** | Numeric / ID | String-stripped, normalized integer sequencing |
| **Name** | Text String | Cleansed of escape characters, unicode spaces, and footnotes |
| **Industry** | Text Category | Structural text categorization |
| **Revenue (USD Millions)** | Numeric | Text parsed, stripped of symbols, prepared for numeric conversion |
| **Revenue Growth** | Percentage | Cleansed string conversion representing annual growth rates |
| **Employees** | Numeric Count | Strip-cleansed numerical volume metrics |
| **Headquarters** | Text Location | Location string parsing (City, State splitting ready) |

## Data_preview_after_scraping
<img width="1156" height="498" alt="Screenshot 2026-06-01 191027" src="https://github.com/user-attachments/assets/b357ffc7-e416-4903-bf21-ae8b27026220" />

---
