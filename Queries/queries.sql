****MODULE 7 CHALLENGE QUERIES***
for retirement_titles output 

--Joining the Employees and Titles Tables
SELECT e.emp_no,
 e.first_name,
 e.last_name
t.title,
 t.from_date,
 t.to_date
--INTO retirement_titles.csv
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

--for unique_titles Table

SELECT 
DISTINCT ON (ri.emp_no)
ri.emp_no,
ri.first_name,
ri.last_name,
ri.title
INTO unique_titles
FROM retirement_titles AS ri
WHERE (ri.to_date BETWEEN '9999-01-01' AND '9999-01-01') 
 ORDER BY
 ri.emp_no ASC,
 ri.to_date DESC;


--Getting the employee count by title
 SELECT 
ut.title,
COUNT (ut.title)
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY (ut.title)
ORDER BY
ut.count DESC;


--Creating the mentorship eligibility tabkle 
SELECT
DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility 
FROM employees AS e
INNER JOIN dept_emp AS de
ON(e.emp_no=de.emp_no)
INNER JOIN titles as t
ON (t.emp_no=e.emp_no)
WHERE (de.to_date BETWEEN '9999-01-01' AND '9999-01-01' )
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;


--Total title count Query to determine the number of employees

SELECT 
title,
COUNT (titles)
from titles
Group by (titles.title)
order by 
titles.count DESC;

-- Total title count of eligible mentors query 
SELECT 
title, 
count(title)
from mentorship_eligibility 
group by (mentorship_eligibility.title)
order by 
mentorship_eligibility.count DESC;


-- Total count of 
