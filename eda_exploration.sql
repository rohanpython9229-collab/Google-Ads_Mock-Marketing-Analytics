-- PHASE 1: EXPLORATORY DATA ANALYSIS (EDA) & PREPROCESSING AUDIT
-- Objective: Investigate raw data anomalies before running pipelines.

SELECT 
    COUNT(*) as total_rows,
    COUNTIF(clicks IS NULL) AS missing_clicks,
    COUNTIF(impressions IS NULL) AS missing_impressions,
    COUNTIF(conversions IS NULL) AS missing_conversions,
    COUNTIF(currency = 'CAD') AS cad_records,
    COUNTIF(currency = 'USD') AS usd_records
FROM `marketing_data.raw_ads_data`;
