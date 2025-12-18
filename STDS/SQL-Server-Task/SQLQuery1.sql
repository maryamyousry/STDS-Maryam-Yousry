SELECT COUNT(DISTINCT EmployeeNationalIDAlternateKey) EmployeeCount
FROM DimEmployee

SELECT FirstName+' '+LastName, COUNT(FirstName+' '+LastName)
FROM DimCustomer
GROUP BY FirstName+' '+LastName
HAVING COUNT(FirstName+' '+LastName) > 1

SELECT CustomerKey, COUNT(CustomerKey)
FROM DimCustomer
GROUP BY CustomerKey
HAVING COUNT(CustomerKey) > 1

SELECT COUNT(EmailAddress) AS CustomerCount
FROM DimCustomer


SELECT YEAR(BirthDate) BirthYear, DATEDIFF(YEAR,BirthDate,GETDATE()) CurrentAge, COUNT(*) Amount
FROM DimCustomer
GROUP BY YEAR(BirthDate), DATEDIFF(YEAR,BirthDate,GETDATE())
ORDER BY Amount DESC

SELECT MAX(DATEDIFF(YEAR,BirthDate,GETDATE())), MIN(DATEDIFF(YEAR,BirthDate,GETDATE()))
FROM DimCustomer

SELECT
  CASE WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) > 80 THEN 'Senior'
       WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) > 60 THEN 'Elderly'
       ELSE 'Adult'
  END AgeGroup
FROM DimCustomer

SELECT BirthDate, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
     , CASE WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) > 80 THEN 'Senior'
            WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) > 60 THEN 'Elderly'
            ELSE 'Adult'
       END AS AgeGroup
FROM DimCustomer


SELECT AgeGroup, COUNT (*) Amount 
FROM 
(SELECT BirthDate, DATEDIFF(YEAR,BirthDate,GETDATE()) Age,CASE WHEN DATEDIFF (YEAR, BirthDate, GETDATE()) > 80
THEN 'Senior'WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) > 60 
THEN 'Elderly'ELSE 'Adult'END AgeGroup FROM DimCustomer) DimAgeGroup GROUP BY AgeGroup ORDER BY COUNT (*) DESC



  SELECT A.GeographyKey, COUNT(*) AS CustomerCount
  FROM DimCustomer A
  INNER JOIN DimGeography B
  ON A.GeographyKey = B.GeographyKey
  GROUP BY A.GeographyKey

  SELECT EnglishCountryRegionName, COUNT(*) AS CustomerCount
  FROM DimCustomer A
  INNER JOIN DimGeography B
  ON A.GeographyKey = B.GeographyKey
  GROUP BY EnglishCountryRegionName

SELECT TOP 10 EnglishCountryRegionName, StateProvinceName, COUNT(*) AS CustomerCount
FROM DimCustomer A
INNER JOIN DimGeography B
ON A.GeographyKey = B.GeographyKey
GROUP BY EnglishCountryRegionName, StateProvinceName
ORDER BY CustomerCount DESC

SELECT *
FROM DimCustomer

SELECT *
 FROM DimGeography

  SELECT EnglishProductSubcategoryName, AVG(Weight), AVG(ListPrice), AVG(DealerPrice)
  FROM DimProduct A
  INNER JOIN DimProductSubcategory B
  ON A.ProductSubcategoryKey = B.ProductSubcategoryKey
  GROUP BY EnglishProductSubcategoryName

 SELECT EnglishProductSubcategoryName, AVG(Weight) AS AvgWeight,
 AVG(ListPrice) AS AvgListPrice, AVG(DealerPrice) AS AvgDealerPrice
  FROM DimProduct A
  INNER JOIN DimProductSubcategory B
  ON A.ProductSubcategoryKey = B.ProductSubcategoryKey
  WHERE Weight IS NOT NULL
  GROUP BY EnglishProductSubcategoryName

  SELECT EnglishProductSubcategoryName, COUNT(*) AS ItemsCount, AVG(Weight) AS AvgWeight,
AVG(ListPrice) AS AvgListPrice,
AVG(DealerPrice) AS AvgDealerPrice
FROM DimProduct A
 INNER JOIN DimProductSubcategory B
ON A.ProductSubcategoryKey = B.ProductSubcategoryKey
WHERE Weight IS NOT NULL
GROUP BY EnglishProductSubcategoryName


  SELECT EnglishProductCategoryName, COUNT(*) ItemsCount, AVG(Weight) AvgWeight,
         AVG(ListPrice) AvgListPrice,
        AVG(DealerPrice) AvgDealerPrice
  FROM DimProduct A
  INNER JOIN DimProductSubcategory B
  ON A.ProductSubcategoryKey = B.ProductSubcategoryKey
  INNER JOIN DimProductCategory C
  ON B.ProductCategoryKey = C.ProductCategoryKey
  --WHERE Weight IS NOT NULL
  GROUP BY EnglishProductCategoryName