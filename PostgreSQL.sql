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

