# 🛒 Retail Sales Data Analysis (SQL Project)

## 📌 Project Overview

This project focuses on analyzing retail sales data using SQL. It covers the complete workflow from database creation and data cleaning to exploratory analysis and solving business problems using SQL queries.

The goal is to extract meaningful insights such as customer behavior, sales trends, and category performance.

---

## 🗂️ Database & Table Structure

### Database

* `SQLProject`

### Table

* `retail_sales`

### Columns

* `transactions_id` (Primary Key)
* `sale_date`
* `sale_time`
* `customer_id`
* `gender`
* `age`
* `category`
* `quantity`
* `price_per_unit`
* `cogs`
* `total_sale`

---

## ⚙️ Steps Performed

### 1. Database Setup

* Created database and table
* Defined appropriate data types

### 2. Data Cleaning

* Checked for NULL values across all columns
* Ensured data consistency before analysis

### 3. Data Exploration

* Total number of sales
* Total and unique customers
* Available product categories

---

## 📊 Business Problems & SQL Analysis

### 🔹 Q1: Sales on Specific Date

Retrieve all transactions made on a specific date.

### 🔹 Q2: Category-Based Filtering

Filter transactions for:

* Category: *Clothing*
* Quantity ≥ 4
* Month: November 2022

### 🔹 Q3: Total Sales by Category

* Aggregated total sales (`SUM`)
* Count of total orders per category

### 🔹 Q4: Average Customer Age (Beauty Category)

* Calculated average age of customers purchasing beauty products

### 🔹 Q5: High-Value Transactions

* Identified transactions where total sales > 1000

### 🔹 Q6: Transactions by Gender & Category

* Counted number of transactions grouped by gender and category

### 🔹 Q7: Best Selling Month (Per Year)

* Calculated average monthly sales
* Used **window function (RANK)** to identify best-performing month

### 🔹 Q8: Top 5 Customers

* Ranked customers based on highest total purchase value

### 🔹 Q9: Unique Customers per Category

* Counted distinct customers in each category

### 🔹 Q10: Sales by Time Shift

* Categorized orders into:

  * Morning (< 12)
  * Afternoon (12–17)
  * Evening (> 17)
* Counted number of orders per shift

---

## 🧠 Key Learnings

* Practical use of **SQL aggregation functions** (SUM, AVG, COUNT)
* Use of **GROUP BY** for segmentation
* Application of **window functions (RANK)**
* Data cleaning using NULL checks
* Real-world business problem solving using SQL

---

## ▶️ How to Run This Project

1. Create the database:

   ```sql
   CREATE DATABASE SQLProject;
   ```

2. Use the database:

   ```sql
   USE SQLProject;
   ```

3. Create the table and import CSV data

4. Run the SQL queries provided in the script

---

## 📁 Files Included

* `retail_sales.csv` → Dataset
* `project.sql` → All SQL scripts (setup + analysis)

---

## 🚀 Conclusion

This project demonstrates how SQL can be used to transform raw retail data into actionable business insights. It highlights core data analysis skills required in real-world data analytics roles.

---
