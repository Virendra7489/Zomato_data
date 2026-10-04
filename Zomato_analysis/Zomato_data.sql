create database zomato;
use zomato;
##Count how many restaurants are in the dataset.

select count(*) from `zomato-data-`;

#Count how many restaurants accept online orders (online_order = Yes).
select count(*) from `zomato-data-`
where `online_order` = 'yes';


#Count how many restaurants that accept table booking.

select count(*) from `zomato-data-`
where `book_table` = 'yes';

#Find the average approx. cost for two people, across all restaurants.
select avg(`approx_cost(for two people)`) from `zomato-data-`;

#Find the name of the restaurant with the highest approx. cost for two.
select name from  `zomato-data-`
where `approx_cost(for two people)` = (select max(`approx_cost(for two people)`) from `zomato-data-` );

#The 'rate' column stores text like "4.1/5" (and one messy "3.8 /5"). Extract just the numeric rating (e.g. 4.1) into a new column.
select name ,rate*1 as rate from `zomato-data-`;

#Using the cleaned numeric rating, find the name of the highest-rated restaurant. 
select name ,rate*1 as rate from `zomato-data-`
where rate = (select max(rate) from `zomato-data-`);

#Count how many restaurants fall into each listed_in(type): Dining, Cafes, Buffet, other.
select count(*),`listed_in(type)` from  `zomato-data-`
group by `listed_in(type)`;

#Find the average numeric rating for each restaurant type.

select avg(rate),`listed_in(type)` from  `zomato-data-`
group by `listed_in(type)`;

#Count restaurants with more than 500 votes AND a rating above 4.0.
select name ,rate*1 as rating ,votes from `zomato-data-`
where votes >500 and rate > 4.0/5;


#Classify each restaurant as "Budget" (cost < 400), "Mid-range" (400–700), or "Premium" (>700), using a formula.

select name ,
case 
when (`approx_cost(for two people)` < 400) then "Budget" 
when  (`approx_cost(for two people)` > 400) and (`approx_cost(for two people)` < 700) then "Mid-range" 
when  (`approx_cost(for two people)` > 700)  then "Premium"
else "none"
end as classify_as_budget
from  `zomato-data-`;

#Find the name of the Cafe with the most votes.
select name , votes from `zomato-data-` 
where votes = (select max(votes) from `zomato-data-`);