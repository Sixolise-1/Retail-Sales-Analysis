CREATE DATABASE sql_project1;

-- Data Cleaning
SELECT * FROM retail_sales;
SELECT COUNT(*) FROM retail_sales;

SELECT * FROM retail_sales
WHERE transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_date IS NULL
    OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;

DELETE FROM retail_sales
WHERE transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_date IS NULL
    OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;

SELECT COUNT(*) FROM retail_sales;

-- Data Exploration
-- How many unique customers?
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- Number of the categories
SELECT DISTINCT category FROM retail_sales;

-- Data Analysis and Business Problems

-- Retrieve all the data for sales made on "2022-11-05"
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

--retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT  * FROM retail_sales
WHERE 
    category = 'Clothing'
    AND 
    FORMAT(sale_date, 'yyyy-MM') = '2022-11'
    AND
    quantity >= 4;

-- calculate the total sales (total_sale) for each category
SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY category;

-- find the average age of customers who purchased items from the 'Beauty' category
SELECT
    ROUND(AVG(age), 2) as 'average_age'
FROM retail_sales
WHERE category = 'Beauty';

-- find all transactions where the total_sale is greater than 1000
SELECT * FROM retail_sales
WHERE total_sale > 1000;

-- find the total number of transactions made by each gender in each category
SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY 1

-- calculate the average sale for each month. Find out best selling month in each year
SELECT 
    year,
    month,
    avg_sale
FROM 
(    
SELECT 
    FORMAT(sale_date, 'yyyy') as 'year',
    FORMAT(sale_date, 'MM') as 'month',
    AVG(total_sale) as 'avg_sale',
    RANK() OVER(
        PARTITION BY FORMAT(sale_date, 'yyyy') ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 
    FORMAT(sale_date, 'yyyy'), 
    FORMAT(sale_date, 'MM')
) as t1
WHERE rank = 1

-- find the top 5 customers based on the highest total sales
SELECT  TOP 5 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY 2 DESC

-- find the number of unique customers who purchased items from each category
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category
;
-- create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
WITH hourly_sale AS (
    SELECT *,
        CASE
            WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
            WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) AS total_orders    
FROM hourly_sale
GROUP BY shift;
-- End of Mini-Project


