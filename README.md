# Data-Mart-Analysis-using-SQL
## Table of Contents
- [Project Overview](project-overview)
- [Data Sources](data-sources)
- [Tools](tools)
- [Problem Analyzed](problem-analyzed)
- [Results/Findings](results/findings)
- [Recommendations](recommendations)

## Project Overview
Data Mart is a large scale online and retail shopping platform started in 2020. The aim of this project is to analyze the sales performance of the data to obtain deeper understanding of the overall performance.

## Data Sources
data_mart_schema: The schema for this analysis is "data_mart_schema" , containing details about the sales and transactions made in 2018- 2020.

## Tools
Ms Sql
## Procedure
- The schema used is weekly_sales_table.
- Data Cleaning and transforming
   - Add new column with week number
   - Add new column for Month number and year.
   - Age band column is added like for 1 'Young Adults',2 'Middle Aged',3 or 4 'Retirees'.
   - Mapping the first letter of segment to new column as couple or families.
- Handling of Null values
- Data Exploration Analysis
## Problem Analyzed 
- Which week numbers are missing from the dataset?
- How many total transactions were there for each year in the dataset?
- What are the total sales for each region for each month?
- What is the total count of transactions for each platform?
- What is the percentage of sales for Retail vs Shopify for each month?
- What is the percentage of sales by demographic for each year in the dataset?
- Which age_band and demographic values contribute the most to Retail sales?

## Results/Findings
The analysis results are summarized as follows:

- 28 weeks are missing values.
- The total transaction is higher for the year 2020.
- Total sales is highest in Africa with 32%.
- The count of transaction is almost similar for Retail and Shopify platform.
- The retail and shopify percentage is higher during the march month.
- Retirees from Oceania region has high amount of sales.
  ## Recommendations
  - Invest in promotions and activities to increase the sales in USA.
  - The promotions should be scheduled during August and September month as sales is low.
  - Mrketing should focus on Young Adults as their shopping rate is lower.
