# 2_ KPIs BUSINESS :

# TOTAL SALES :
SELECT ROUND (SUM(Sales),2) AS Total_sales
FROM superstore;

# TOTAL PROFIT :
SELECT ROUND(SUM(Profit),2) AS Total_profit
FROM superstore;

# MARGIN % :
SELECT ROUND (SUM(Profit)/SUM(Sales)*100,2) AS Margin_pct
From superstore;

# TOTAL ORDERS :
SELECT COUNT (DISTINCT `Order ID`) AS Total_orders
From superstore;

# TOTAL CUSTOMERS :
SELECT COUNT(DISTINCT `Customer ID`) AS Total_customers
from superstore;
