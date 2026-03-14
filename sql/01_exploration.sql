# 1_ EXPLORATION :

# TOTAL ROWS NUMBER IN THE TABLE :
SELECT COUNT(*) AS total_rows
FROM superstore;

# SELLS PERIOD
SELECT MIN (`Order Date`) AS first_order,
       MAX (`Order Date`) AS last_order
FROM superstore;

# Check NULL VALUES
SELECT COUNT (*) - COUNT(`Customer ID`) AS null_customers
FROM superstore;
