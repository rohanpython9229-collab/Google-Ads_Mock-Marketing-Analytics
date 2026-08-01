
# Google Ads Mock Campaign Performance Optimization Dashboard

## Live Assets
👉 [Click Here to View Live Interactive Google Looker Studio Dashboard](https://datastudio.google.com/reporting/e1855a84-cc4e-4c7f-961e-ea76bf0e59eb)

---

## Project Overview
This project simulates the workflow of an institutional Marketing Analytics team. The core objective is to audit and ingest raw, multi-currency digital advertising logs, map performance bottlenecks across regions and device dimensions, and engineer data-driven budget reallocation strategies to optimize overall enterprise marketing ROI.

## Tech Stack
* **Data Warehousing & Query Optimization:** Google BigQuery (SQL)
* **Business Intelligence & Executive Visualisation:** Google Looker Studio

---

## 1. Data Exploration & Preprocessing Layer (EDA)
Before constructing the production transformations, a diagnostic structural audit was performed on the raw database (Refer to `eda_exploration.sql` for source queries) to identify data anomalies:
* **Polymorphic Date Strings:** Detected corrupted payload records containing mixed data delimiters (`/` vs `-`) and variable calendar structures.
* **Currency Discrepancies:** Identified cross-border financial entries split between `USD` and `CAD`, establishing a clear necessity for structural currency exchange rate standardisation.
* **Event Metric Nulls:** Flagged multiple database nulls in impressions, clicks, and conversions which would crash downstream calculation aggregation blocks.

## 2. Production Metrics Engineering
Programmatic SQL transformations were compiled inside Google BigQuery to cleanse raw values and safely calculate core conversion formulas without division-by-zero vulnerabilities (Refer to `clean_ads_data.sql` for full logic):
* **Click-Through Rate (CTR %):** Computed via bounded event ratios to measure creative engagement.
* **Cost Per Acquisition (CPA):** Standardised ad expenditures divided by performance milestones to map acquisition costs.
* **Return on Ad Spend (ROAS):** Created strict pipeline ratios between incoming revenues and cash outlays to rank campaign performance.

---

## 3. Executive Visualisation Matrix
An interactive cloud-based dashboard was deployed to dynamically isolat campaign matrices against cross-filtering region controls and mobile/desktop device layers.

![Google Ads Dashboard Visual Framework](dashboard_screenshot.png)

---

## 4. Analytical Findings & Executive Recommendations
* **Pause Performance Blackholes:** Immediately cease expenditures on the **BETA_DISPLAY_PROSPECTING** campaign. Its localized CPA ($162.60) is running **89% above historical benchmarks**, which will successfully mitigate over **$5,000 in monthly active budget leakage**.
* **Scale High-Efficiency Channels:** Reallocate the recovered **$5,000 monthly ad spend** directly into the **DELTA_PMAX_SHOPPING** ecosystem. This specific campaign framework yields an outstanding **5.2x ROAS**, directly driving corporate top-line growth.
* **Optimize Device Asset Efficiency:** Mandate a structural creative redesign for all mobile placements. Dynamic segment filtering revealed a **32% lower CTR on mobile platforms** compared to desktop devices, highlighting inefficient capital drainage on mobile click networks.
