# Remote-DA-Assessment
Findings Of my Results

Overview

This is a detailed summary and findings documentation for the Assessment for a Data Analyst position at remote. There are Three parts to this documentation. The first Part is a summary of the Data quality issues I experienced while answering the questions. 
The second part covers the SQL findings of the question while the third part covers the summary and findings of the Tableau Visualization. This documentation covers every task that was assigned from task 1 to task 8. 
At the end of the summary, helpful links will be provided, especially the link to the Tableau Visualization. For this link, it’s important to also note that tasks 6, 7 and 8 are in 3 separate types. Once the link is clicked on and takes you to the dashboard, you will see the tabs beside each other at the top right.

Caveats

It was requested in the assessment to create a view and put all task 1 to task 5 in one .SQL file. It is important to note that Google cloud BigQuery allows individuals to create views but doesn’t allow views or even SQL codes to be downloaded into a .SQL file. For this reason, I have had to download a text editor file that lets me copy my SQL code into the app and allows me to save it as a .SQL
	It is also important to note that I have explained some line of codes in my query and what kind of functions are being performed. I believe this aspect is very important especially if the codes will be reused by other individuals. It makes the thought process easier.


Part 1: Data Quality Summary

Before going deep in this summary, I’ll like to highlight that all data quality issues were fixed as I was working with the data. For every task, I was able to clean the data whilst getting results. This means that every code that answers every questions also contains codes used to clean up the data. 
While working with the data provided, I had noticed some data quality issues and below are the following aspects that affects the data quality

•**Accuracy**: This is a very important aspect of data quality. For whatever data described, it needs to be accurate. Generally, the inaccuracy of the data sets is quite high. Down to missing rows, missing columns and a lot of Irrelevant columns

•**Relevancy**: I noticed a lot of columns and rows that were irrelevant in the dataset. It is important to exclude irrelevant data to increase optimization when running queries. And, to save cost especially with cloud storage.

•**Completeness**: Not all columns were complete. A lot of columns had to many Null values for example, middle name column under DimCustomer table. In fact, there are some columns that have null values all through like the StandardCost column under the DimProduct table. This could also be an example of Irrelevant data as stated above

•**Consistency**: Every data should have the date format as expected and can be cross reference-able with the same results. A very good example is the custommembers column on the Dimaccounts table. All rows are null except for row 97 which has “[Account].[Accounts].[Account Level 04].&[50]/[Account].[Accounts].[Account Level 02].&[97]”.






Part 2: SQL Questions SUMMARY AND FINDINGS

Task1

Find the highest transaction of each month in 2012 for the product Sport-100 Helmet, Red
-	 As seen in the query results, it is a common pattern that All the highest transactions were made at the end of the month between the 28th and the 31st. With the month being chronologically arranged, the result shows that June, July, August has the lowest transaction. 


Task2

Find the lowest revenue-generating product for each month in 2012. Include the Sales Territory Country as well.
-	 The result shows that there are only two products that have the lowest revenue generated, which are AWC Logo Cap and Patch Kit/8 Patches. Although Australia was included in the raw data, but this result shows that Australia didn’t record any low revenue compared to the United States, United Kingdom, France and Canada. The result also shows that each country and product is grouped to each month


Task3

Find the Average Finance Amount for each Scenario (Actual Scenario, Budget Scenario, Forecast Scenario) for each Account Type (Assets, Balances, Liabilities, Flow, Expenditures, Revenue) in 2011.
-	 In this result, for actual Scenario, there is an amount for every account type, while the Forecast scenario has no amount/expense on any account type. Although, Budget Scenario has only Expenditure and Revenue amount


Task4

Find all the products and their Total Sales Amount by Month of order which does have sales in 2012.
-	The total count of rows in this result comes down to 1,064. This is because every month has different unique products that has sales in 2012. January alone has 93 distinct products that made sales in 2012.


Task5

Write a query to find the age of customers. Bucket them under
Age Group:
•	Less than 35
•	Between 35 and 50
•	Greater than 50
Segregate the Number of Customers in each age group on Marital Status and Gender.
-	 In this result, the count of each age group has been grouped under both their gender and marital status. More findings on this query will be explained in the visualization aspect.




	

Part 2: Data Visualization & Analysis

Task6
Based on your results for question #2 above, create a visualization to highlight the sales territories with the lowest sales performances. Are there any territories with consistent low sales performance over time?
-	 In the map visual, the red colour signifies which country is consistently low, while the green colour shows which country is doing better.
Both the United Kingdom and France appears to be the territories/Countries with the lowest sales performance. With France having a total of 15.56 while the United Kingdom has the lowest sales of a total of 11.75

Task7

Create a visualization based on your results for question #3 above, so that the user can switch between scenarios and account types. Please explain what insight we can gain from these results.
-	 Based on the visualization, Actual Scenario happens to have the highest amount for every account type and Forecast Scenario has no amount record. Although for Actual Scenario, Account type balance has the lowest amount and compared to the other account types, there is a huge difference.
Budget Scenario on the other hand, has only two account types (Expenditure and Revenue). There is also a vast difference in the total amount between the two account types.


Task8

Create a visualization based on your results for question #5 above. Please explain what insight we can gain from these results.
-	 The visual in this dashboard shows that the lowest count of age group that we have are individuals older than 50. 
  This Visual also shows that there are more married women (2,425) and married men (2,712) that are younger 35. And there is a vast difference compared to single women (1,535) and single men (1,382) in this age group
 The most shocking part of this visual for me is the fact that there are more Single men (2,571) and Single women (2,711) between the age of 35 and age 50. Although the difference in count between single men, single women and Married men, married women in this age group is not much.


Helpful Links

•	https://public.tableau.com/app/profile/bukky3649/viz/DataVisualizationAnalysis/Task6?publish=yes




