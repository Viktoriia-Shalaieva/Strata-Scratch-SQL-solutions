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
