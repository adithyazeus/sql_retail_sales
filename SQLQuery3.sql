SELECT 
    COUNT(*) 
FROM retail_sales

-- Data Cleaning-- 
DELETE FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

-- Data Exploration-- 
--How many sales we have?
SELECT COUNT(*) as total_sale FROM retail_sales
--How many unique customers we have ?
SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales

-- Data Analysis & Business Key Problems & Answers--
--Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05'

--Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT*FROM retail_sales
WHERE 
    category = 'Clothing'
    AND 
    sale_date = '2022-11-05'
    AND
    quantiy >= 4

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY category

--Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE category = 'Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * FROM retail_sales
WHERE total_sale > 1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT 
    category,
    gender,
    COUNT(*) as total_transaction
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY category

---- Q.7 Write a SQL query to calculate the average sale for each month.
SELECT
	sale_date,
	total_sale,
	avg(total_sale) over(partition by sale_date) as Avg_sale 
from retail_sales

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT top 5
	customer_id,
	sum(total_sale) as Total_sale
from retail_sales
group by customer_id
order by Total_sale desc

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT
	category,
	count(distinct customer_id) as unique_customer
from retail_sales
group by category
