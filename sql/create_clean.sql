DROP VIEW IF EXISTS sales_clean;

CREATE TABLE sales (
    order_id TEXT,
    order_date DATE,
    status TEXT,
    fulfilment TEXT,
    sales_channel TEXT,
    ship_service_level TEXT,
    style TEXT,
    SKU TEXT,
    category TEXT,
    size TEXT,
    ASIN TEXT,
    courier_status TEXT,
    quantity INT,
    currency TEXT,
    amount NUMERIC(10,2),
    ship_city TEXT,
    ship_state TEXT,
    ship_postal_code TEXT,
    ship_country TEXT,
    b2b BOOLEAN
        
);

-- Checking total rows
SELECT COUNT(*) FROM sales; -- 128975 rows

-- Checking first rows
SELECT * FROM sales LIMIT 25;


-- Ignore 33 rows that have NULL values represent 0.03% of the dataset 
-- Create a clean view with no missing shipping info

CREATE TABLE sales_clean AS
SELECT *
FROM sales
WHERE ship_state IS NOT NULL
  AND ship_postal_code IS NOT NULL
  AND ship_country IS NOT NULL;
  

-- Checking for more NULL values 
SELECT *
FROM sales
WHERE order_date IS NULL
   OR status IS NULL
   OR fulfilment IS NULL
   OR sales_channel IS NULL
   OR ship_service_level IS NULL
   OR style IS NULL
   OR SKU IS NULL
   OR category IS NULL
   OR size IS NULL
   OR ASIN IS NULL
   OR courier_status IS NULL
   OR quantity IS NULL
   OR currency IS NULL
   OR amount IS NULL
   OR ship_city IS NULL
   OR ship_state IS NULL
   OR ship_postal_code IS NULL
   OR ship_country IS NULL
   OR b2b IS NULL;
   
-- Counting the number of NULL's per column 
SELECT
    COUNT(*) FILTER (WHERE order_id IS NULL) AS order_id_nulls,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS order_date_nulls,
    COUNT(*) FILTER (WHERE status IS NULL) AS status_nulls,
    COUNT(*) FILTER (WHERE fulfilment IS NULL) AS fulfilment_nulls,
    COUNT(*) FILTER (WHERE sales_channel IS NULL) AS sales_channel_nulls,
    COUNT(*) FILTER (WHERE ship_service_level IS NULL) AS ship_service_level_nulls,
    COUNT(*) FILTER (WHERE style IS NULL) AS style_nulls,
    COUNT(*) FILTER (WHERE SKU IS NULL) AS SKU_nulls,
    COUNT(*) FILTER (WHERE category IS NULL) AS category_nulls,
    COUNT(*) FILTER (WHERE size IS NULL) AS size_nulls,
    COUNT(*) FILTER (WHERE ASIN IS NULL) AS ASIN_nulls,
    COUNT(*) FILTER (WHERE courier_status IS NULL) AS courier_status_nulls,
    COUNT(*) FILTER (WHERE quantity IS NULL) AS quantity_nulls,
    COUNT(*) FILTER (WHERE currency IS NULL) AS currency_nulls,
    COUNT(*) FILTER (WHERE amount IS NULL) AS amount_nulls,
    COUNT(*) FILTER (WHERE ship_city IS NULL) AS ship_city_nulls,
    COUNT(*) FILTER (WHERE ship_state IS NULL) AS ship_state_nulls,
    COUNT(*) FILTER (WHERE ship_postal_code IS NULL) AS ship_postal_code_nulls,
    COUNT(*) FILTER (WHERE ship_country IS NULL) AS ship_country_nulls,
    COUNT(*) FILTER (WHERE b2b IS NULL) AS b2b_nulls
FROM sales_clean;

-- Replace NULL values in courrier status to Unknown 
SELECT courier_status, sales_channel, COUNT(*)
FROM sales
WHERE courier_status IS NULL
GROUP BY courier_status, sales_channel;

UPDATE sales_clean
SET courier_status = 'UNKNOWN'
WHERE courier_status IS NULL;

-- Checking if 7793 NULL inputs in amount and currency is due to the fact that the shipment has been cancelled or smt (status)

SELECT status, COUNT(*)
FROM sales_clean
WHERE amount IS NULL
GROUP BY status;

-- 7564 rows are due to the fact that the orders have been cancelled so no revenu so 0$ and 208 rows from Shipped show a NULL value

UPDATE sales_clean
SET amount = 0
WHERE amount IS NULL AND status = 'Cancelled';

UPDATE sales_clean
SET currency = 'UNKNOWN'
WHERE currency IS NULL;

SELECT order_id, status, amount, currency
FROM sales_clean
WHERE status = 'Cancelled'
ORDER BY order_id
LIMIT 25;
