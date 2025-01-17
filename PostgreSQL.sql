/*
Salaries Differences
Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. Output just the absolute difference in salaries.

Tables: db_employee, db_dept

db_employee
id:int
first_name: varchar
last_name: varchar
salary: int
department_id: int

db_dept
id: int
department: varchar
*/

SELECT ABS(
    (SELECT MAX(salary)
        FROM db_employee e
        JOIN db_dept d ON e.department_id = d.id
        WHERE d.department = 'marketing') -
 
    (SELECT MAX(salary)
        FROM db_employee e
        JOIN db_dept d ON e.department_id = d.id
        WHERE d.department = 'engineering')
) AS diff_salary
;

/*
Finding Updated Records 
We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. 
Find the current salary of each employee assuming that salaries increase each year. Output their id, first name, last name, department ID, and current salary. Order your list by employee ID in ascending order.

Table: ms_employee_salary

id: int
first_name: varchar
last_name: varchar
salary: int
department_id: int
*/

SELECT id,	first_name,	last_name,	department_id, MAX(salary) as MAX
FROM ms_employee_salary
GROUP BY id, first_name,	last_name,	department_id
ORDER BY id;

/*
Bikes Last Used
Find the last time each bike was in use. Output both the bike number and the date-timestamp of the bike's last use (i.e., the date-time the bike was returned). Order the results by bikes that were most recently used.

Table: dc_bikeshare_q1_2012

duration: varchar
duration_seconds: int
start_time: datetime
start_station: varchar
start_terminal: int
end_time: datetime
end_station: varchar
end_terminal: int
bike_number: varchar
rider_type: varchar
id: int
*/

SELECT 
    bike_number
    , MAX(end_time) AS last_use
FROM dc_bikeshare_q1_2012
GROUP BY bike_number
ORDER BY last_used DESC
;

/*
Reviews of Hotel Arena
Find the number of rows for each review score earned by 'Hotel Arena'. Output the hotel name (which should be 'Hotel Arena'), review score along with the corresponding number of rows with that score for the specified hotel.

Table: hotel_reviews

hotel_address: varchar
additional_number_of_scoring: int
review_date:datetime
average_score:float
hotel_name:varchar
reviewer_nationality:varchar
negative_review:varchar
review_total_negative_word_counts:int
total_number_of_reviews:int
positive_review:varchar
review_total_positive_word_counts:int
total_number_of_reviews_reviewer_has_given:int
reviewer_score:float
tags:varchar
days_since_review:varchar
lat:float
lng:float
*/
SELECT hotel_name
    , reviewer_score
    , COUNT(*)
FROM hotel_reviews
WHERE hotel_name = 'Hotel Arena'
GROUP BY 1, 2
;

/*
Count the number of movies that Abigail Breslin nominated for oscar
Count the number of movies that Abigail Breslin was nominated for an oscar.

Table: oscar_nominees
year: int
category:varchar
nominee:varchar
movie:varchar
winner:bool
id:int
*/

SELECT COUNT(*) AS nmb_movies
FROM oscar_nominees
WHERE nominee = 'Abigail Breslin'
;

/*
Find all posts which were reacted to with a heart
Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

Tables: facebook_reactions, facebook_posts

facebook_reactions
poster:int
friend:int
reaction:varchar
date_day:int
post_id:int

facebook_posts
post_id:int
poster:int
post_text:varchar
post_keywords:varchar
post_date:datetime
*/

SELECT DISTINCT fp.*
FROM facebook_posts fp
JOIN facebook_reactions fr
    ON fp.post_id = fr.post_id
    AND fr.reaction = 'heart'
;

/*
Popularity of Hack
Meta/Facebook has developed a new programing language called Hack.To measure the popularity of Hack they ran a survey with their employees. The survey included data on previous programing familiarity as well as the number of years of experience, age, gender and most importantly satisfaction with Hack. Due to an error location data was not collected, but your supervisor demands a report showing average popularity of Hack by office location. Luckily the user IDs of employees completing the surveys were stored.
Based on the above, find the average popularity of the Hack per office location.
Output the location along with the average popularity.

Tables: facebook_employees, facebook_hack_survey

facebook_employees
id:int
location:varchar
age:int
gender:varchar
is_senior:bool

facebook_hack_survey
employee_id:int
age:int
gender:varchar
popularity:int
*/
SELECT 
    fe.location	
    , AVG(fhs.popularity) AS avg_popularity
FROM facebook_employees fe
JOIN facebook_hack_survey fhs
ON fe.id = fhs.employee_id
GROUP BY fe.location
;
