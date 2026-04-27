create database SQLProject;
use SQLProject;
create table retail_sales(
transactions_id int primary key,	
sale_date date ,
sale_time time,
customer_id int,
gender varchar(10),
age int,
category varchar(20),
quantiy int,
price_per_unit float,
cogs float,	
total_sale float
);
alter table retail_sales
rename column quantiy to quantity;
select * from retail_sales
limit 10;

-- Count Totanumbers of rows
select count(*) from retail_sales;
-- Data Cleaning
select * from retail_sales
where transactions_id is null
or sale_date is null
or sale_time is null
or customer_id is null
or gender is null
or age is null
or category is null
or quantity is null
or price_per_unit is null
or cogs is null
or total_sale is null;

-- Data Exploration
-- Total sales:how may sales we have 
select count(*) as total_sales from retail_sales;
-- Total Customers,How may customers we have
select count(customer_id) as totalcustomers from retail_sales;  
select count(distinct customer_id) as uniquecustomers from retail_sales;
select distinct category from retail_sales;

-- Data analysis and bussiness key problem
-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

 use SQLProject;
 show tables;
 select * from retail_sales;
 -- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05 
select * from retail_sales
where sale_date ='22-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and
-- the quantity sold is more than eual to 4 in the month of Nov-2022 
select * from retail_sales
where category='Clothing' and quantity>=4 and sale_date between '2022-11-01' and '2022-11-30';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category,sum(total_sale) as sumofsales,count(*) as total_orders
from retail_sales
group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age) as customeravgage
from retail_sales
where category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select transactions_id from retail_sales
where total_sale>1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select distinct gender,category,count(transactions_id) as totalnooftransac
from retail_sales
group by gender,category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.
 use SQLProject;
 select * from(
select avg(total_sale) as avgsales,
month(sale_date) as month,
year(sale_date) as years,
rank() over(partition by year(sale_date) order by avg(total_sale) desc) as bestsellingrank
from retail_sales 
group by month(sale_date),year(sale_date)) as t
where bestsellingrank=1;
-- order by year(sale_date),avg(total_sale) desc;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select * from retail_sales;
select distinct customer_id,
sum(total_sale) as totalsales
from retail_sales
group by customer_id
order by sum(total_sale) desc
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select category,count(distinct customer_id) as purchitembyuniquecustomers
from retail_sales
group by category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, 
-- Afternoon Between 12 & 17, Evening >17)
with cte_hourly_shifts as(
select *,
case when hour(sale_time)<12 then 'Morning'
     when hour(sale_time) between 12 and 17 then 'Afternoon'
     else 'Evening'
end as shifts 
from retail_sales
)
select shifts, count(transactions_id) as nooforders
from cte_hourly_shifts
group by shifts;

-- End Of Project-- 














