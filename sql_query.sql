--Sql Retail Analysis
CREATE DATABASE retailsales_analysis;

--Create table
CREATE TABLE retail_sales
     (
    		transactions_id INT PRIMARY KEY,
    		sale_date DATE,	
   			sale_time TIME,
    		customer_id INT,	
    		gender VARCHAR(15),
    		age INT,
    		category VARCHAR(15),
    		quantity INT,
    		price_per_unit FLOAT,	
    		cogs FLOAT,
    		total_sale FLOAT
      );

SELECT * FROM retail_sales
LIMIT 10

--DATA CLEANING
--count
SELECT 
    COUNT(*)
FROM retail_sales

--Null value check
SELECT  * FROM retail_sales
WHERE 
   transactions_id IS NULL
   OR
   sale_date IS NULL 
   OR
   sale_time IS NULL
   OR
   customer_id IS NULL
   OR
   gender IS NULL
   OR
   category IS NULL
   OR
   quantity IS NULL
   OR
   price_per_unit IS NULL
   OR
   cogs IS NULL
   OR
   total_sale IS NULL;
   
-- Deletin rows
DELETE FROM retail_sales
WHERE 
   transactions_id IS NULL
   OR
   sale_date IS NULL 
   OR
   sale_time IS NULL
   OR
   customer_id IS NULL
   OR
   gender IS NULL
   OR
   category IS NULL
   OR
   quantity IS NULL
   OR
   price_per_unit IS NULL
   OR
   cogs IS NULL
   OR
   total_sale IS NULL;
   
--DATA EXPLORATION
--how many sales we have
SELECT COUNT(*) as  total_sale FROM retail_sales

--how many customers we have
SELECT COUNT(customer_id) as  total_sale FROM retail_sales
--how many unique customers we have
SELECT COUNT(DISTINCT customer_id) as  total_sale FROM retail_sales
--how many unique category we have
SELECT COUNT(DISTINCT category ) as  total_sale FROM retail_sales
--uniquecategory
SELECT DISTINCT category FROM retail_sales

--DATA ANALYSIS
--Write a SQL query to retrieve all columns for sales made on '2022-12-12:
SELECT *
FROM retail_sales
WHERE sale_date = '2022-12-12' ;

--Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Dec-2022
SELECT *
FROM retail_sales
WHERE 
    category = 'Clothing'
	AND
	TO_CHAR(Sale_date, 'yyyy-dd') =  '2022-12'
	AND
    quantity >= 4; 

--Write a SQL query to calculate the total sales (total_sale) for each category
SELECT
	category,
	SUM(total_sale) as total_sales,
	COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1

--Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
SELECT 
	ROUND(AVG(age),2) as avg_age
FROM retail_sales
WHERE category = 'Beauty'

--Write a SQL query to find all transactions where the total_sale is greater than 1000.:
SELECT 
	total_sale
FROM retail_sales
WHERE total_sale  >= 1000

--Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
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
--Write a SQL query to find the top 5 customers based on the highest total sales
SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

--Write a SQL query to find the number of unique customers who purchased items from each category
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category