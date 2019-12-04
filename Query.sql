-- DA_#1

SELECT e.emp_no AS "Employee_Number",
e.last_name AS "Last_Name",
e.first_name AS "First_Name",  
e.gender AS "Gender", 
s.salary AS "Salary"
FROM public."Employees" AS e
INNER JOIN public."Salaries" AS s ON
e.emp_no=s.emp_no;


--DA #2

SELECT emp_no, first_name, last_name--, EXTRACT (YEAR FROM hire_date) AS YEAR
FROM public."Employees"
WHERE EXTRACT (YEAR FROM hire_date) = 1986

--DA #3
SELECT d.dept_no AS "Department_Number",
d.dept_name AS "Department_Name",
e.emp_no AS "Manager_Employee_Number",
e.last_name AS "Last_Name",
e.first_name AS "First_Name",
de.from_date AS "Start_Date",
de.to_date AS "End_Date"
FROM public."Employees" AS e
	--JOIN public."Titles" AS ts
    --ON (e.emp_no = de.emp_no)
	JOIN public."Dept_Manager" AS de
    ON (e.emp_no = de.emp_no)
    JOIN public."Departments" AS d
      ON (d.dept_no = de.dept_no)

  
  -- DA #4 

SELECT e.emp_no AS "Employee_Number",
e.last_name AS "Last_Name",
e.first_name AS "First_Name",
d.dept_name AS "Deptartment_Name"
FROM public."Employees" AS e
	JOIN public."Dept_Emp" AS de
    ON (e.emp_no = de.emp_no)	
      JOIN public."Departments" AS d
      ON (d.dept_no = de.dept_no)


 --DA #5
SELECT FIRST_NAME, LAST_NAME--, LEFT(LAST_NAME,1) AS LM
FROM public."Employees"
WHERE first_name = 'Hercules'
	AND LEFT(LAST_NAME,1) = 'B'
	
	
 --DA#6
 
SELECT e.emp_no AS "Employee_Number",
e.last_name AS "Last_Name",
e.first_name AS "First_Name",
d.dept_name AS "Department_Name"
FROM public."Employees" AS e
JOIN public."Dept_Emp" as de
ON (e.emp_no = de.emp_no)	
JOIN public."Departments" AS d
ON (d.dept_no = de.dept_no)
	WHERE d.dept_name = 'Sales'

 --DA#7

	
SELECT e.emp_no AS "Employee_Number",
e.last_name AS "Last_Name",
e.first_name AS "First_Name",
d.dept_name AS "Department_Name"
FROM public."Employees" AS e
JOIN public."Dept_Emp" as de
ON (e.emp_no = de.emp_no)	
JOIN public."Departments" AS d
ON (d.dept_no = de.dept_no)
	WHERE d.dept_name IN ('Sales', 'Development')



--DA#8
SELECT last_name AS "Last_Name", COUNT(*) AS "Last_Name_Count"
	FROM public."Employees"
	GROUP BY Last_Name
	ORDER BY Count(*) DESC
	

--Bonus
--Create a bar chart of average salary by title

SELECT ts.title, round(AVG(s.Salary),2)
FROM public."Salaries" AS s
JOIN public."Titles" as ts
ON (s.emp_no = ts.emp_no)
group by ts.title





	
	

	
