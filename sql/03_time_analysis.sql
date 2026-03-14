# 3_ TIME ANALYSIS :

# SALES BY YEAR :
SELECT YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year,
       ROUND(SUM(Sales),2) AS Total_sales
from superstore 
group by Year
order by year;


# YoY TOTAL SALES AND GROWTH
SELECT year,
       total_sales,
       ROUND ((total_sales - LAG(total_sales) OVER (order by year)) 
       / NULLIF(LAG(total_sales) over (ORDER BY year), 0) *100, 2) AS YoY_growth_pct
from (
      SELECT YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS year,
             SUM(Sales) AS total_sales
  From superstore
  GROUP BY year
  ) t
ORDER BY year;


# MoM TOTAL SALES AND GROWTH 
SELECT month,
       total_sales,
       ROUND(
             total_sales - LAG (total_sales) OVER(ORDER BY month))
             / NULLIF(LAG(total_sales) OVER (ORDER BY month), 0) * 100, 2) 
       AS YoY_growth_pct
FROM ( SELECT 
              MONTH(STR_TO_DATE(`Order Date`, '%m%d%Y')) AS month,
              SUM(Sales) AS total_sales
  From superstore
  group by month ) t
order by month;
