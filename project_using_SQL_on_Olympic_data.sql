
-- Q1. Find the average number of medals won by each country
SELECT Country, AVG(total_medal) AS Average_Medals_by_country -- select calculate averaage
FROM olympix_data  -- from table name
GROUP BY Country;

-- Q2. Display the countries and the number of gold medals they have won in decreasing order
select country, sum(gold_medal) as Total_gold from olympix_data -- Select country sum gold medals
group by country order by (Total_gold) desc;  -- group by country and then order descending

-- Q3. Display the list of people with the medals they have won in descending order, grouped by their country
select o.name, c.country, sum(o.total_medal) as Total_medals from olympix_data o  -- select name and country and gave nae as 'o'
JOIN (select country, sum(total_medal) as Total_medals from olympix_data  -- select country & total medal as gave name 'c'
group by country) c            -- group by country
ON o.country = c.country  -- Made Join
group by o.name, c.country, c.Total_medals order by (sum(o.total_medal)) desc ; -- group and order by in descending

-- Q4. Display the list of people with the medals they have won according to their age
select o.name, c.age, sum(total_medal) as Total_medals from olympix_data o  -- Select name, age and sum total medal
JOIN (select age, sum(total_medal) as Total_medals  -- to join Select age, total medals 
from olympix_data group by age) c    -- group by age 
ON o.age = c.age -- Join
group by o.name, c.age, c.Total_medals order by age desc ;

-- Q5. Which country has won the most number of medals
select country, sum(total_medal) as Total_medals    -- select country and sum total medals 
from olympix_data group by country order by Total_medals desc limit 1;  -- group ad order then descending with limit
                                                     
