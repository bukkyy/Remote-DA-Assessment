  -- Find the highest transaction of each month in 2012 for the product Sport-100 Helmet, Red

SELECT -- this is the outer query selecting from the inner query
  Month,
  SalesAmount,
  OrderDate
FROM ( -- This is the beginning of my subquery(innerquery)
  SELECT
    FORMAT_DATE("%B",OrderDate) Month,-- this was used to extract the month from the date and give it the month name
    SalesAmount,
    DATE(OrderDate) OrderDate,
    RANK() OVER(PARTITION BY orderdate ORDER BY SalesAmount DESC, orderdate ASC) rank -- this was used to get the highest transaction without using max function
  FROM
    `boxwood-complex-306619.Remote_assessment.FactResellerSales`
  WHERE
    ProductKey IN (212,
      213,
      214) -- this was used to get product Sport-100 Helmet,Red. Turns out 3 different codes were assigned to this product
    AND orderdate BETWEEN '2012-01-01'
    AND '2012-12-31' -- this is the condition used to show us records in 2012
    
  ORDER BY
    orderdate ASC, --this was used to order month in a chronological order
    salesamount DESC 
    ) -- the end of the inner query
WHERE
 
 rank =1 -- this is implied in the outer query to give us the highest transaction. The highes transaction in each month is 1

  --Findings- All the highest transactions were made at the end of the month between the 28th and the 31st.

