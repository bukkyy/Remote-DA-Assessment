  -- Find the lowest revenue-generating product for each month in 2012. Include the Sales Territory Country as well

SELECT
  DISTINCT Month, -- this is the beginning of the outerquery selecting columns from the inner query
  SalesTerritoryCountry,
  ProductName,
  SalesAmount
FROM (
  SELECT -- this is the beginning of the inner query which was written before the outer query
    FORMAT_DATE("%B",fr.OrderDate) Month, -- this was used to extract the month from the date and give it the month name
    fr.salesterritorykey,
    fr.productkey,
    fr.SalesAmount,
    t.salesterritorykey,
    t.salesterritorycountry,
    p.productkey,
    p.productname,
    MIN(Salesamount) OVER(PARTITION BY OrderDate) Newamount -- this is the function used to select the lowest revenue for each product
  FROM
    `boxwood-complex-306619.Remote_assessment.FactResellerSales` fr
  JOIN
    `boxwood-complex-306619.Remote_assessment.DimSalesTerritory` t -- three tables had to be joined for me to get my results
  ON
    fr.salesterritorykey = t.SalesTerritoryKey
  JOIN
    `boxwood-complex-306619.Remote_assessment.DimProduct` p
  ON
    p.productkey = fr.productkey
  WHERE
    orderdate BETWEEN '2012-01-01'
    AND '2012-12-31' -- this is the condition used to show us records in 2012
  ORDER BY
    orderdate ASC,
    salesamount DESC 
    ) -- the end of the inner query
WHERE
  Salesamount = newamount
ORDER BY
  Month
 
  --Findings --Australia doesnt have any low revenue-generating product for the year 2012. Also, the most popular low amount is 5.1865