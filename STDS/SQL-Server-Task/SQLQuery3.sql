select * from FactResellerSales

-- WHAT PERCENT OF RETAIL SALES WERE MADE ON DAYS WHEN THEY SOLD ABOVE THE NORMAL DAILY AVERAGE SALES
SELECT DATENAME(DW, OrderDate) Day, SalesAmount, AVG(SalesAmount) OVER (PARTITION BY DATENAME(DW, OrderDate)) from FactResellerSales

SELECT Day,
       COUNT(CASE WHEN SalesAmount > AverageDailySales THEN 1 END) AS AboveAverage,
       COUNT(CASE WHEN SalesAmount <= AverageDailySales THEN 1 END) AS BelowAverage
FROM
  (SELECT DATENAME(DW, OrderDate) Day, SalesAmount,
          AVG(SalesAmount) OVER (PARTITION BY DATENAME(DW, OrderDate)) AS AverageDailySales
   FROM FactResellerSales) AS DailySalesComparison
GROUP BY Day)




WITH AverageCheck As (
  SELECT Day,
  COUNT(CASE WHEN SalesAmount > AverageDailySales THEN 1 END) AS AboveAverage,
  COUNT(CASE WHEN SalesAmount <= AverageDailySales THEN 1 END) AS BelowAverage
  FROM
    (SELECT DATENAME(DW, OrderDate) Day, SalesAmount,
            AVG(SalesAmount) OVER (PARTITION BY DATENAME(DW, OrderDate)) AverageDailySales
     FROM FactResellerSales) AS DailySalesComparison
  GROUP BY Day)
SELECT Day, AboveAverage * 100 / (AboveAverage + BelowAverage)  PercentAbove
FROM AverageCheck)


WITH AverageCheck AS(
  SELECT Day,
         COUNT(CASE WHEN SalesAmount > AverageDailySales THEN 1 END) AS AboveAverage,
         COUNT(CASE WHEN SalesAmount <= AverageDailySales THEN 1 END) AS BelowAverage
  FROM
  (
    SELECT DATENAME(DW, OrderDate) Day, SalesAmount,
           AVG(SalesAmount) OVER (PARTITION BY DATENAME(DW, OrderDate)) AS AverageDailySales
    FROM FactResellerSales) AS DailySalesComparison
  GROUP BY Day
)

SELECT Day, ROUND(CAST(AboveAverage AS float)*100/(AboveAverage+BelowAverage), 2) AS PercentAbove
FROM AverageCheck


SELECT TOP 20 ResellerName, AVG(SalesAmount - TotalProductCost) AS Loss
FROM FactResellerSales A
INNER JOIN DimReseller B
ON A.ResellerKey = B.ResellerKey
WHERE DATENAME(DW, OrderDate) IN ('Friday', 'Saturday', 'Sunday')
GROUP BY A.ResellerKey, B.ResellerName
 HAVING AVG(SalesAmount - TotalProductCost) < 0
ORDER BY Loss

 -- WHAT IS THE TOTAL AMOUNT SOLD
 SELECT ProductKey, SalesAmount
 FROM FactInternetSales
 UNION ALL
 SELECT ProductKey, SalesAmount
 FROM FactInternetSales


 

