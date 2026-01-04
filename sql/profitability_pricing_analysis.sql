-- Average sale amount per size or style
SELECT 
    size, 
    SKU, 
    ROUND(AVG(amount), 2) AS avg_amount
FROM sales_clean
WHERE amount IS NOT NULL
GROUP BY size, SKU
ORDER BY avg_amount DESC;

/*
SELECT size, style, AVG(amount) AS avg_amount
FROM sales_clean
GROUP BY size, style
ORDER BY avg_amount DESC;

later with more time investigate on avg amount being null for size S style J0100 
*/

-- cannot do detection price diff for same SKU since no Amazon_MRP in original dataset ;( 

