-- what is the total number of PRODUCTS sold on the internet
SELECT SUM(OrderQuantity) TotalItemsSold,
       COUNT(DISTINCT ProductKey) UniqueItemsSold
FROM FactInternetSales


-- what products made the most profit on THE INTERNET
SELECT EnglishProductName Product, SalesAmount - TotalProductCost Profit
FROM FactInternetSales A
INNER JOIN DimProduct B
ON A.ProductKey = B.ProductKey


-- what products made the most profit ON THE INTERNET
SELECT EnglishProductName Product, SUM(SalesAmount - TotalProductCost) AS TotalProfit
FROM FactInternetSales A
INNER JOIN DimProduct B
ON A.ProductKey = B.ProductKey
GROUP BY EnglishProductName, A.ProductKey
ORDER BY TotalProfit DESC



--WHAT MONTH HAS THE MOST PROFITS ORDERED ONLINE AND THE AVERAGE PROFIT
SELECT DATENAME(MONTH, OrderDate) Month, SUM(OrderQuantity) OrderCount,
       AVG(SalesAmount - TotalProductCost) Profit
FROM FactInternetSales
GROUP BY DATENAME(MONTH, OrderDate)
ORDER BY OrderCount DESC

-- what is the total number of unique items sold on the internet
SELECT *FROM FactInternetSales


-- WHO ARE THE MOST FREQUENT ONLINE CUSTOMERS
SELECT TOP 15 FirstName + ' ' + LastName AS Customer, COUNT(*) AS OrderFrequency
FROM FactInternetSales A
INNER JOIN DimCustomer B
ON A.CustomerKey = B.CustomerKey
GROUP BY FirstName + ' ' + LastName
ORDER BY OrderFrequency DESC


SELECT TOP 15 FirstName + ' ' + LastName AS Customer, SUM(SalesAmount) TotalExpensesMade
FROM FactInternetSales A
INNER JOIN DimCustomer B
ON A.CustomerKey = B.CustomerKey
GROUP BY FirstName + ' ' + LastName
ORDER BY TotalExpensesMade DESC

-- WHICH DAYS OF THE WEEK DID THE TOP 100 MOST FREQUENT CUSTOMERS MAKE ONLINE ORDERS MOST
SELECT DATENAME(Dw, OrderDate) Day, COUNT(*) Orders
FROM FactInternetSales
GROUP BY DATENAME(Dw, OrderDate)
ORDER BY Orders DESC

SELECT TOP 100 FirstName + ' ' + LastName AS Customer, COUNT(*) AS OrderFrequency
FROM FactInternetSales A
INNER JOIN DimCustomer B
ON A.CustomerKey = B.CustomerKey
GROUP BY FirstName + ' ' + LastName
ORDER BY OrderFrequency DESC

-- WHICH DAYS OF THE WEEK DID THE TOP 100 MOST FREQUENT CUSTOMERS MAKE ONLINE ORDERS MOST
SELECT DATENAME(DW, OrderDate) Day, COUNT(*) Orders
FROM FactInternetSales
WHERE CustomerKey IN (
  SELECT TOP 100 A.CustomerKey
  FROM FactInternetSales A
  INNER JOIN DimCustomer B
  ON A.CustomerKey = B.CustomerKey
  GROUP BY A.CustomerKey
)
GROUP BY DATENAME(DW, OrderDate)
ORDER BY Orders DESC