#5_ CUSTOMER ANALYTICS :

# TOP 20 CLIENTS (SALES + PROFIT) :
  SELECT `Customer ID`,
         `Customer Name`,
          ROUND (SUM(Sales),2) AS sales,
          ROUND (SUM(Profit), 2) AS profit,
          COUNT (DISTINCT `Order ID`) AS orders
  from superstore
  group by `Customer ID`, `Customer Name`
  order by sales DESC
  limit 20;  

# SHARE OF CUMULATIVE SALES
WITH c AS ( select `Customer ID`, 
                    SUM(Sales) AS sales
  from superstore
  group by `Customer ID`
          ),
r AS ( SELECT `Customer ID`,
               sales,
               SUM(sales) OVER () AS total_sales,
               SUM(sales) OVER (ORDER BY sales DESC) AS cum_sales
  from c )
SELECT ROUND(100 * SUM(CASE WHEN cum_sales <= 0.8*total_sales then 1 else 0 end) / count (*), 2 )
             AS pct_customers_for_80pct_sales
from r;

# PERFORMANCE BY SEGMENT
SELECT Segment, 
       ROUND(SUM(Sales),2) as sales,
       ROUND(SUM(Profit),2) as profit,
       ROUND(SUM(Profit)/NULLIF(SUM(Sales),0*100,2) as margin_pct
  from superstore
  group by Segment
  order by sales DESC;
