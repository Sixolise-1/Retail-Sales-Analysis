# 🛍️ Retail Sales Analysis — SQL Project

This SQL project demonstrates how to clean, explore, and analyze real-world retail sales data using **SQL Server**. The project uses structured SQL queries to deliver insights that can support business decisions, such as identifying top customers, understanding category performance, and analyzing purchasing behavior over time.

---

## 📂 Project Structure

| File                            | Description                                       |
|---------------------------------|---------------------------------------------------|
| `01_create_table.sql`           | Script to create and populate the `retail_sales` table |
| `02_analysis_queries.sql`       | Data cleaning, exploration, and analysis queries  |
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
