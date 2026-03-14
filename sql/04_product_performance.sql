# 4_ PRODUCT PERFORMANCE 

# CATEGORIES : SALES + PROFIT + MARGIN :
SELECT CATEGORY,
       ROUND(SUM(SALES),2) AS sales,
       ROUND(SUM(PROFIT),2) AS ptofit,
       ROUND(SUM(PROFIT)/NULLIF(SUM(SALES),0),*100,2) AS margin_pct
from superstore
group by category
order by sales desc;

# UNPROFITABLE SUBCATEGORIES (TOP LOSSES) :
SELECT  Category, 
        `Sub-Category`,
        ROUND (SUM(sales),2) AS sales,
        ROUND (SUM(profit),2) AS profit,
from superstore 
group by Category,`Sub-Category`
having SUM(Profit) < 0
order by profit ASC
limit 15;

# TOP 20 PRODUCTS :
SELECT `Product Name`,
        ROUND (SUM(Sales), 2) AS sales,
        ROUND (SUM(Profit),2) AS profit
from superstore
group by `Product Name`
order by sales desc 
limit 20;


