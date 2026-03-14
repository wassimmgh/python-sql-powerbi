#6_ GEO ANALYSIS :

# REGIONS (SALES + PROFIT + MARGIN) :
SELECT Region,
       ROUND(SUM(Sales),2) AS sales,
       ROUND(SUM(Profit),2) AS profit,
       ROUND(SUM(Profit)/NULLIF (SUM(Sales),0)*100,2) AS margin_pct,
from superstore
group by Region
order by sales desc;

# TOP 15 CITYs BY PROFIT (WITH STATE) :
SELECT State,
       City,
       ROUND(SUM(Profit),2) AS profit,
       ROUND(SUM(Sales),2) as sales
from superstore
GROUP BY State, City
Order by profit desc
limit 15;

# "RISK LIST" : CITIES WITH HIGH SALES BUT NEGATIVE PROFIT :
SELECT State, 
       City,
       ROUND(SUM(Sales),2) AS sales,
       ROUND(SUM(Profit),2) AS profit
from superstore
group by State, City
Having SUM(Profit) < 0
ORDER BY sales DESC
limit 15;
