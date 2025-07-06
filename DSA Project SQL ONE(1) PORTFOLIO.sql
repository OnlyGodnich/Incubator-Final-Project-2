--Kultra Mega Stores Inventory--

Select * from [KMS Sql Case Study]

--Case Scenario 1

--This Analysis is aimed to get specific insight as directed or demanded by the instructor, i used various sql syntax to derive different request which will aid the management better understand their data and what they are searching for--

--Number One(1)--

-- Which Product category had the highest sales?--

--All Tablles--

Select * from [KMS Sql Case Study]

Select  Product_Category from [KMS Sql Case Study]
group by Product_Category

Select Product_Category, Sum(Sales) as Total_Sales
from [KMS Sql Case Study]
Group by [Product_Category]
order by Total_Sales Asc
OFFSET 2 ROWS FETCH NEXT 3 ROWS ONLY



--There are only three product category, and Technology has the highest Sale--

--Number Two(2)--

--What are the Top 3 and Bottom 3 regions in terms of sales?--

--Top 3--
Select Region,
sum(sales) as Total_sales
from [KMS Sql Case Study]
group by Region
order by Total_sales asc
OFFSET 5 ROWS FETCH NEXT 6 ROWS ONLY

--Bottom 3--

Select Region,
sum(sales) as Total_sales
from [KMS Sql Case Study]
group by Region
order by Total_sales desc

OFFSET 5 ROWS FETCH NEXT 6 ROWS ONLY

--Number Three(3)--

--What were the total sales of appliances in ontario?--

Select Product_Category,
sum(Sales) As Total_Sales_Appliances_ontario
from [KMS Sql Case Study]
where Province = 'Ontario'
Group by Product_Category 

--Number Four(4)

--Advise the management KMS on what to do to increase the revenue from the bottom 10 customers--

select *from [KMS Sql Case Study]

Select  Customer_Name, Sum(Sales) as Total_Sales
from [KMS Sql Case Study]
Group by  Customer_Name
order by Total_Sales desc
OFFSET 785 ROWS FETCH NEXT 786 ROWS ONLY 

--The Managment has to investigate the type of goods been demanded by this set of people, why and the customer Region, with such statistics a better inference can be drawn--

--Number Five(5)

--KMS incurred the most shipping cost using which shipping method?

Select Ship_Mode, sum(Shipping_cost) as Total_Shipping_Cost
from [KMS Sql Case Study]
Group by Ship_Mode
Order by Total_Shipping_Cost asc
OFFSET 2 ROWS FETCH NEXT 3 ROWS ONLY 

--CASE SCENARIO 2--

--Number Six(6)--

-- Who are the most valuable customers, and what product or service do they typically purchase?

Select Customer_Name,Product_sub_Category,sum(Sales) as Total_Sales
from [KMS Sql Case Study]
Group by Customer_Name,Product_sub_Category
order by Total_Sales asc
OFFSET 785 ROWS FETCH NEXT 786 ROWS ONLY 

--Number Seven(7)

-- Which Small Business Customer has the highest sales?--
select * from	[KMS Sql Case Study]
Select Customer_Name, sum(Sales) as Total_Sales
from [KMS Sql Case Study]
where Customer_Segment ='Small Business'
group by Customer_Name
order by Total_Sales asc
OFFSET 192 ROWS FETCH NEXT 193 ROWS ONLY 

--Number Eight(8)

--Which Corporate Customer Placed the most number of orders in 2009-2012?--

Select Customer_Name, count(distinct[order ID]) as order_count
from [KMS Sql Case Study]
where Customer_Segement='Corporate'
and YEAR('%Y',[Order Date]) Between '2009' and '2012'
Group by Customer_Name
order by order_count

--Number Nine(9)

--Which Consumer customer was the most profitable one?--

Select Customer_Name, sum(profit) as Total_Profit
from [KMS Sql Case Study]
where Customer_Segment='Consumer'
Group by Customer_Name
order by Total_Profit asc
OFFSET 196 ROWS FETCH NEXT 197 ROWS ONLY 

--Number Ten(10)--

--Which Customer returned items, and what segment do they belong to?--

Select Customer_Name,Customer_Segment, sum(Profit) as Total_Profit
from [KMS Sql Case Study]
where Profit<0
Group by Customer_Name,Customer_Segment
order by Total_Profit





