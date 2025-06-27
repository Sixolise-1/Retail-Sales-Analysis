-- CREATING THE A TABLE TO IMPORT THE DATA INTO

DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
INSERT INTO retail_sales (transactions_id, sale_date, sale_time, customer_id, gender, age, category, quantity, price_per_unit, cogs, total_sale)
SELECT 
    [transactions_id], 
    [sale_date], 
    [sale_time], 
    [customer_id], 
    [gender], 
    [age], 
    [category], 
    [quantity], 
    [price_per_unit], 
    [cogs], 
    [total_sale]
FROM [dbo].[SQL - Retail Sales Analysis_utf];