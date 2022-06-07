  --Find all the products and their Total Sales Amount by Month of order which does have sales in 2012.

SELECT
  dp.ProductKey,
  ROUND(SUM(fr.salesamount),2) SalesAmount,-- this line of code was used to calculate the total sales amount while rounding up to 2 decimal places to make the reults cleaner
  FORMAT_DATE("%B",fr.OrderDate) Month, -- this was used to extract the month from the date and give it the month name
FROM
  boxwood-complex-306619.Remote_assessment.DimProduct dp
JOIN
  boxwood-complex-306619.Remote_assessment.FactResellerSales fr --two tables had to be joined for me to get my results
ON
  dp.productkey = fr.productkey
WHERE
  orderdate BETWEEN '2012-01-01'
  AND '2012-12-31' --this is the condition used to show us records in 2012
GROUP BY
  Productkey,
  Orderdate
ORDER BY
  orderdate

  -- Findings --  In the final results, every products that sold in 2012 are broken down by month. For example, 93 distinct products sold in January