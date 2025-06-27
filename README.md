# 🛍️ Retail Sales Analysis — SQL Project

This SQL project demonstrates how to clean, explore, and analyze real-world retail sales data using **SQL Server**. The project uses structured SQL queries to deliver insights that can support business decisions, such as identifying top customers, understanding category performance, and analyzing purchasing behavior over time.

---

## 📂 Project Structure

| File                            | Description                                       |
|---------------------------------|---------------------------------------------------|
| `SQLQuery1_importing.sql`           | Script to create and populate the `retail_sales` table |
| `Project1_Data_Analysis.sql`       | Data cleaning, exploration, and analysis queries  |
| `SQL - Retail Sales Analysis_utf.csv` | Raw data file imported into SQL Server |

---

## 💡 Tools & Technologies

- **SQL Server (local instance)**
- **SQL Server Management Studio (SSMS)** — used for importing CSV data
- **Visual Studio Code (VSCode)** — used for query development
- **SQL Server Extension for VSCode** — used to run SQL queries from the editor

---

## 🗃️ Dataset Overview

The dataset represents over 2,000 retail transactions and includes the following fields:

- `transactions_id` – Unique ID for each transaction  
- `sale_date` – Date of sale  
- `sale_time` – Time of sale  
- `customer_id` – Unique customer identifier  
- `gender` – Gender of customer  
- `age` – Age of customer  
- `category` – Product category  
- `quantity` – Units purchased  
- `price_per_unit` – Price per unit  
- `cogs` – Cost of goods sold  
- `total_sale` – Final transaction amount  

---

## 🧹 Data Cleaning Steps

- Checked for and removed rows with `NULL` values in any field.
- Verified dataset size before and after cleaning.

```sql
SELECT COUNT(*) FROM retail_sales;
DELETE FROM retail_sales
WHERE transactions_id IS NULL OR sale_date IS NULL OR ...;
```
## Key Business Questions Answered
**1. How many unique customers are in the dataset?**
```sql
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
```
**2. What are the available product categories?**
```sql
SELECT DISTINCT category FROM retail_sales;
```
**3. What were the total sales and order counts by category?**
```sql
SELECT category, SUM(total_sale) AS net_sale, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;
```
**4. What is the average age of customers purchasing Beauty products?**
```sql
SELECT ROUND(AVG(age), 2) AS average_age
FROM retail_sales
WHERE category = 'Beauty';
```
**5. Which transactions had sales greater than R1000?**
```sql
SELECT * FROM retail_sales
WHERE total_sale > 1000;
```
**6. What is the total number of transactions by gender and category?**
```sql
SELECT category, gender, COUNT(*) AS total_trans
FROM retail_sales
GROUP BY category, gender;
```
**7. What is the best-performing month (by avg sales) in each year?**
```sql
WITH ranked_sales AS (
    SELECT 
        FORMAT(sale_date, 'yyyy') AS year,
        FORMAT(sale_date, 'MM') AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (PARTITION BY FORMAT(sale_date, 'yyyy') ORDER BY AVG(total_sale) DESC) AS rank
    FROM retail_sales
    GROUP BY FORMAT(sale_date, 'yyyy'), FORMAT(sale_date, 'MM')
)
SELECT year, month, avg_sale
FROM ranked_sales
WHERE rank = 1;
```
**8. Who are the top 5 customers by total sales?**
```sql
SELECT TOP 5 customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC;
```
**9. How many unique customers purchased from each category?**
```sql
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;
```
**10. How are orders distributed across daily shifts (Morning, Afternoon, Evening)?**
```sql
WITH hourly_sales AS (
    SELECT *,
        CASE
            WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
            WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
)
SELECT shift, COUNT(*) AS total_orders
FROM hourly_sales
GROUP BY shift;
```
## 📈 Sample Insights
- The Clothing category had the highest number of orders.
- Evening shift had the most transactions.
- Customer ID 3 was the top spender.
- The best-performing months in 2022 and 2023 are July and February respectfully.
- Beauty customers have an average age of around 40 years.

## 💡What I learned
- Writing advanced SQL queries using RANK(), DATEPART(), and CASE statements
- Efficiently importing data using SSMS and cleaning it using SQL
- Performing meaningful business analysis without using any visualization tools
- Using both VSCode and SSMS together to manage and analyze SQL data

## How to Run the Project
- Clone or download the repo
- Open the .sql files in VSCode or SSMS
- Run `SQLQuery1_importing.sql` to create and populate the retail_sales table
- Run `Project1_Data_Analysis.sql` to explore the dataset and generate insights

## 👤 Author
**Sixolise Ntontela**
- **📚 BSc Computer Science (UWC) graduate, pursuing PGDip in Data Analytics and Business Intelligence(UWC)**
- **📍 South Africa**
- **📧 sixolisentontela@gmail.com**









