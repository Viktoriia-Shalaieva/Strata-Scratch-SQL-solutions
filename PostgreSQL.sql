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
