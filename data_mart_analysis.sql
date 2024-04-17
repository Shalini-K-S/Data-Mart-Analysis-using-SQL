use case_1;
select * from weekly_sales limit 10;
 -- Data cleaning--

create table clean_weekly_sales as select week_date,week(week_date) as 'week_number',
month(week_date) as 'calendar_month',year(week_date) as 'calendar_year',region,platform,case
when segment='null' then 'Unknown'else segment end as segment,case when right(segment,1)='1'then 'Young Adults' when right(segment,1)='2' then 'Middle Aged' when
right(segment,1) in ('3','4') then	'Retirees' else 'unknown'
end as age_band,case when left(segment,1)='C' then 'Couples' when left(segment,1)='F' then 'Families' else 'unknown'
end as demographic ,customer_type,transactions,sales,round(sales/transactions,2)  as 'avg_transaction' from weekly_sales;

select * from clean_weekly_sales limit 10;
  -- Data Exploration--
## 1.Which week numbers are missing from the dataset?
create table week_num(x int auto_increment primary key);
insert into week_num values (),(),(),(),(),(),(),(),(),();
insert into week_num values (),(),(),(),(),(),(),(),(),();
insert into week_num values (),(),(),(),(),(),(),(),(),();
insert into week_num values (),(),(),(),(),(),(),(),(),();
insert into week_num values (),(),(),(),(),(),(),(),(),();
insert into week_num values (),();
select * from week_num;
select x from week_num where x not in (select week_number from clean_weekly_sales);

## 2.How many total transactions were there for each year in the dataset?
select calendar_year,sum(transactions) as 'Total transaction' from clean_weekly_sales
group by calendar_year;

## 3.What are the total sales for each region for each month?
select calendar_month,region,sum(sales) as 'total sales'from clean_weekly_sales 
group by region,calendar_month order by calendar_month,region;

## 4.What is the total count of transactions for each platform ?
select platform,count(transactions) as 'total count of transaction' from clean_weekly_sales
group by platform;

## 5.What is the percentage of sales for Retail vs Shopify for each month?
with monthly_platform_sales as(select calendar_month,calendar_year,platform,sum(sales) as monthly_sales from clean_weekly_sales
group by calendar_month,calendar_year,platform) 
select calendar_month,calendar_year,
round(100*max(case when platform='Retail' then  monthly_sales else null end)/sum(monthly_sales),2) as 'retail_%',
round(100*max(case when platform='Shopify' then monthly_sales else null end)/sum(monthly_sales),2) as 'Shopify_%'
from  monthly_platform_sales group by calendar_month,calendar_year order by  calendar_month,calendar_year;

## 6.What is the percentage of sales by demographic for each year in the dataset?
select calendar_year,region,round(100*sum(sales)/sum(sum(sales)) over (partition by region),2) as '%sales_region'
from clean_weekly_sales group by calendar_year,region order by calendar_year,region ; 

## 7.Which age_band and demographic values contribute the most to Retail sales?
select age_band,region,sum(sales) as'total_sales' from clean_weekly_sales where platform='Retail'
group by age_band,region order by total_sales desc;


 