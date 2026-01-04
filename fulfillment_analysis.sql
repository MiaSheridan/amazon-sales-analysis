-- Count of orders per fulfillment method

SELECT fulfilment, COUNT(*) AS num_orders
FROM sales_clean
GROUP BY fulfilment
ORDER BY num_orders DESC;

-- % of orders missing courier_status
SELECT 
    status,
    COUNT(*) FILTER (WHERE courier_status = 'UNKNOWN') AS missing_courier_count,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) FILTER (WHERE courier_status = 'UNKNOWN') * 100.0 / COUNT(*),
        1
    ) AS pct_missing
FROM sales_clean
GROUP BY status
ORDER BY pct_missing DESC;

-- % of unknown courier status by fulfillment method
SELECT
    status,
    fulfilment,
    COUNT(*) AS total_orders,
    COUNT(*) FILTER (WHERE courier_status = 'UNKNOWN') AS missing_courier_count,
    ROUND(
        COUNT(*) FILTER (WHERE courier_status = 'UNKNOWN') * 100.0 / COUNT(*),
        1
    ) AS pct_missing
FROM sales_clean
GROUP BY status, fulfilment
ORDER BY pct_missing DESC;