
-- ======================================
-- CREATING DATABASE AND COPYING CSV DATA
-- ======================================

CREATE TABLE sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender TEXT,
    age INT,
    category TEXT,
    quantity INT,
    price_per_unit NUMERIC(12,2),
    cogs NUMERIC(12,2),
    total_sale NUMERIC(12,2)
)

copy sales
from '/Users/avi/Desktop/Portfolios/retail_new/sales.csv'
delimiter ','
CSV HEADER;

select * from sales


-- =========================
-- CLEANING & FORMATING DATA
-- =========================

-- checking and deleting NULLs
SELECT * FROM sales
WHERE NOT (sales IS NOT NULL); -- only NULL values in age & quantity columns

delete from sales 
where not (sales IS NOT NULL)

-- confirming no more NULLs
SELECT * FROM sales WHERE NOT (sales IS NOT NULL);

--renaming column
ALTER TABLE sales
RENAME COLUMN total_sale TO revenue;

-- adding profit column
ALTER TABLE sales
ADD COLUMN profit NUMERIC(10,2);

UPDATE sales
SET profit = revenue - cogs;