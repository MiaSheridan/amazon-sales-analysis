# Amazon Sales Analytics Project

## Overview
This project analyzes Amazon sales data to uncover insights on revenue, product performance, and fulfillment patterns. The dataset has been cleaned to remove most missing or invalid values.

**Dataset:** `sales_clean_sample.csv` (subset of original data)  
**Tools:** PostgreSQL (Postico), SQL, Power BI  

---

## Analysis & Visualizations

### 1️⃣ Total Revenue per Category
- **Goal:** Identify which product categories generate the most revenue.  
- **Visualization:** Bar chart in Power BI  
- **Insight:**   

### 2️⃣ Average Sale Amount by Size/Style
- **Goal:** Compare average order value across sizes or individual SKUs.  
- **Visualization:** Clustered column chart in Power BI  
- **Insight:** 

### 3️⃣ Order Volume by Status and Fulfillment Method
- **Goal:** Analyze distribution of order statuses and fulfillment channels.  
- **Visualization:** Stacked column chart in Power BI  
- **Insight:** 

### 4️⃣ Revenue Over Time
- **Goal:** Track monthly revenue trends.  
- **Visualization:** Line chart in Power BI  
- **Insight:** 

---

## Data Cleaning Notes
- `NULL` courier statuses were replaced with `'UNKNOWN'`.  
- Canceled orders with `NULL` amount were set to 0. Some canceled orders still show non-zero amounts.  

---

## How to Use
1. Open the `sales_clean_sample.csv` in Power BI or Excel.  
2. Run the SQL queries in the `sql` folder to reproduce the analyses.  
3. Explore the charts or add additional insights as needed.  

---

## Next Steps / Optional Enhancements
- Investigate patterns in SKUs and sizes with missing amounts.  
- Extend analysis to revenue per state or B2B vs B2C comparisons.  
- Use the full dataset for more detailed visuals (limited sample used here for GitHub upload restrictions).  

---

