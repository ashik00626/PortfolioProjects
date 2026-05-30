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

##  How to Use
1. Open `Bike_Sales_Analysis.xlsx` in Microsoft Excel.
2. Navigate to the **`Dashboard`** tab.
3. Use the left-hand slicer panels to instantly filter and analyze different customer segments.



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

## 🚀 How to Run the Script
1. Ensure you have access to a SQL database containing populated schemas for `covid_deaths` and `covid_vaccinations`.
2. Import the script `COVID19_PROJECT.sql` into your query editor.
3. Execute the script sequentially to generate target outputs, temporary data frameworks, and ready-to-visualize tables.
