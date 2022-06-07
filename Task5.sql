  -- Write a query to find the age of customers. Bucket them

SELECT
  MaritalStatus,
  Gender,
  COUNT(CASE  -- the case statement was used to count each age group while grouping them in separate columns, and naming the column as the age group
      WHEN age < 35 THEN 1
  END
    ) AS Age_less_Than_35, --although in the question, it is requested to name the column as age<35, however, naming conventions in sql will not permit that
  COUNT(CASE
      WHEN age BETWEEN 35 AND 50 THEN 1
  END
    ) Age_Between_35_50,  
  COUNT(CASE
      WHEN age > 50 THEN 1
  END
    ) Age_Greater_Than_50
FROM (
  SELECT
    MaritalStatus,
    Gender,
    DATE_DIFF('2020-03-21',BirthDate, YEAR) AS age -- this line of codde was used to extract the age from the date of birth
  FROM
    boxwood-complex-306619.Remote_assessment.DimCustomer )
GROUP BY
  1,
  2 -- I had to group by Maritalstatus and gender since we are counting based on that
ORDER BY
  MaritalStatus,
  Gender