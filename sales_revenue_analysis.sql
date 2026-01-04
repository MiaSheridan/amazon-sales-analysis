-- Total revenue per product category

SELECT category, SUM(amount) AS total_revenue
FROM sales_clean
GROUP BY category
ORDER BY total_revenue DESC;

-- Top selling SKUs by quantity
SELECT SKU, SUM(quantity) AS total_quantity
FROM sales_clean
GROUP BY SKU
ORDER BY total_quantity DESC
LIMIT 20;

-- Average order value per state
SELECT 
    UPPER(ship_state) AS state_normalized, 
    ROUND(AVG(amount), 2) AS avg_order_value
FROM sales_clean
GROUP BY UPPER(ship_state)
ORDER BY avg_order_value DESC;


-- Revenue over time

SELECT DATE_TRUNC('month', order_date) AS month, SUM(amount) AS monthly_revenue
FROM sales_clean
GROUP BY month
ORDER BY month;