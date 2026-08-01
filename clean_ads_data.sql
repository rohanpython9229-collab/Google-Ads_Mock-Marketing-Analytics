-- PHASE 2: PRODUCTION DATA CLEANING & METRICS ENGINEERING
CREATE OR REPLACE TABLE `marketing_data.clean_ads_data` AS
SELECT
    campaign_id,
    UPPER(campaign_name) AS campaign_name,
    LOWER(region) AS region,
    LOWER(device_type) AS device_type,
    
    CASE 
        WHEN date_string LIKE '%/%' THEN PARSE_DATE('%d/%m/%Y', date_string)
        WHEN date_string LIKE '%, %' THEN PARSE_DATE('%B %d, %Y', date_string)
        ELSE PARSE_DATE('%Y-%m-%d', date_string)
    END AS campaign_date,

    COALESCE(impressions, 0) AS impressions,
    COALESCE(clicks, 0) AS clicks,
    COALESCE(conversions, 0) AS conversions,

    CASE WHEN currency = 'CAD' THEN ROUND(spend * 0.74, 2) ELSE ROUND(spend, 2) END AS spend_usd,
    CASE WHEN currency = 'CAD' THEN ROUND(revenue * 0.74, 2) ELSE ROUND(revenue, 2) END AS revenue_usd,

    ROUND(SAFE_DIVIDE(COALESCE(clicks, 0), COALESCE(impressions, 0)) * 100, 2) AS ctr_percentage,
    ROUND(SAFE_DIVIDE(CASE WHEN currency = 'CAD' THEN spend * 0.74 ELSE spend END, COALESCE(conversions, 0)), 2) AS cpa_usd,
    ROUND(SAFE_DIVIDE(CASE WHEN currency = 'CAD' THEN revenue * 0.74 ELSE revenue END, CASE WHEN currency = 'CAD' THEN spend * 0.74 ELSE spend END), 2) AS roas
FROM 
    `marketing_data.raw_ads_data`
WHERE 
    campaign_id IS NOT NULL;
