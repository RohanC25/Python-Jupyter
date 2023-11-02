
-- Q1. Find the average number of medals won by each country
select country, avg(total_medal) from olympic_datas  group by country;     # use avg function and group by

-- Q2. Display the countries and the number of gold medals they have won in decreasing order
select country, sum(gold_medal) from  olympic_datas group by country order by (sum(gold_medal)) desc;  # use group by and order by sum of gold_medal

-- Q3. Display the list of people and the medals they have won in descending order, grouped by their country
select o.name, c.country, sum(o.total_medal) as Total_medals from olympix_data o
JOIN (select country, sum(total_medal) as Total_medals from olympix_data
group by country) c
ON o.country = c.country
group by o.name, c.country, c.Total_medals order by (sum(o.total_medal)) desc ;

-- Q4. Display the list of people with the medals they have won according to their their age
select name, age, sum(total_medal) from olympic_datas  group by name order by age;  # use group by name order by age in ascending
select name, age, sum(total_medal) from olympic_datas  group by name order by age desc;  # use group by name order by age in descending

-- Q5. Which country has won the most number of medals
select  country, sum(total_medal) from olympic_datas group by country order by (sum(total_medal)) desc limit 1;   # use of  max to get country won most number of medals
                                                     
