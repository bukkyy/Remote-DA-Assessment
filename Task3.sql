  ----Find the Average Finance Amount for each **Scenario (Actual Scenario, Budget Scenario, Forecast Scenario)**
  --for each **Account Type (Assets, Balances, Liabilities, Flow, Expenditures, Revenue)** in **2011.**

SELECT -- this is the beginning of the outerquery selecting columns from the inner query 
  DISTINCT AccountType,
  ROUND(AVG(Actualscenario),2) ActualScenario, -- this is the code used to calculate average. First, the sum was claculated in the inner query, then the sum of average was calculated in the outer query
  ROUND(AVG(ActualBudget),2) BudgetScenario,
  ROUND(AVG(ActualForecast),2) ForecastScenario
FROM (
  SELECT -- this is the beginning of the inner query which was written before the outer query
    ff.financekey,
    ff.scenariokey,
    ff.accountkey,
    ff.Amount,
    da.accountkey,
    da.accounttype,
    ds.scenariokey,
    ds.scenarioname,
    SUM(CASE ---- this case statement was used to create columns and grouping scenarios while suming the total amount
        WHEN ff.scenariokey = 1 THEN ff.amount
      ELSE
      0
    END
      ) AS ActualScenario, 
    SUM(CASE
        WHEN ff.scenariokey = 2 THEN ff.amount
      ELSE
      0
    END
      ) AS ActualBudget,
    SUM(CASE
        WHEN ff.scenariokey = 3 THEN ff.amount
      ELSE
      0
    END
      )AS ActualForecast
  FROM
    `boxwood-complex-306619.Remote_assessment.FactFinance` ff
  JOIN
    `boxwood-complex-306619.Remote_assessment.DimAccounts`da -- three tables had to be joined for me to get my results
  ON
    ff.accountkey = da.accountkey
  JOIN
    `boxwood-complex-306619.Remote_assessment.DimScenario` ds
  ON
    ds.ScenarioKey = ff.ScenarioKey
  WHERE
    ff.date BETWEEN '2011-01-01'
    AND '2011-12-31' --this is the condition used to show us records in 2011
  GROUP BY
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8 
    ) -- the end of the inner query
GROUP BY 
  1 -- the group by function was used since I was calculating the average

  -- Findings -- Actual Forecast has no record for Account type. Even in the raw data. And Actual budget doesn't have some Account type situation.