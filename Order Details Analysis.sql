

CREATE TABLE df_orders (
	[order_id] int primary key
	, [order_date] date
	, [ship_mode] varchar(20)
	, [segment] varchar(20)
	, [country] varchar(20)
	, [city] varchar(20)
	, [state] varchar(20)
	, [postal_code] varchar(20)
	, [region] varchar(20)
	, [category] varchar(20)
	, [sub_category] varchar(20)
	, [product_id] varchar(50)
	, [quantity] int
	, [discount] decimal(7,2)
	, [sale_price] decimal(7,2)
	, [profit] decimal(7,2))

--view all the data in the table
SELECT * FROM df_orders;


--find top 10 highest revenue generating products
SELECT TOP 10 product_id, SUM(sale_price) as sales
FROM df_orders
GROUP BY product_id
ORDER BY sales desc;


--find top 5 highest selling products in each region
WITH cte as (
SELECT region, product_id, SUM(sale_price) as sales
FROM df_orders
GROUP BY region, product_id)
SELECT * FROM (
SELECT *
	,row_number() OVER (PARTITION BY region ORDER BY sales DESC) AS rn
FROM cte) A
WHERE rn<=5;


--find month over month growth comparison for 2022 and 2023 sales eg: jan 2022 vs jan 2023
WITH cte as(
SELECT year(order_date) AS order_year, month(order_date) AS order_month, 
sum(sale_price) AS sales 
FROM df_orders
GROUP BY year(order_date), month(order_date)
)
SELECT order_month
, SUM(case when order_year=2022 then sales else 0 end) as sales_2022
, SUM(case when order_year=2023 then sales else 0 end) as sales_2023
FROM cte
GROUP BY order_month
ORDER BY order_month;


--for each category which month had highest sales
WITH cte as(
SELECT FORMAT(order_date,'yyyyMM') as order_year_month, category, SUM(sale_price) as total_sales
FROM df_orders
GROUP BY category, FORMAT(order_date,'yyyyMM')
-- ORDER BY category, MONTH(order_date)
)
SELECT order_year_month,category, total_sales FROM(
SELECT *, ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sales desc) AS rn
FROM cte
) A
WHERE rn=1;


--which sub category had highest growth by profit in 2023 compared to 2022
with cte as (
select sub_category,year(order_date) as order_year,
sum(sale_price) as sales
from df_orders
group by sub_category,year(order_date)
	)
, cte2 as (
select sub_category
, sum(case when order_year=2022 then sales else 0 end) as sales_2022
, sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte 
group by sub_category
)
select top 1 *
,(sales_2023-sales_2022)*100/sales_2022 as growth_percentage
from  cte2
order by (sales_2023-sales_2022)*100/sales_2022 desc