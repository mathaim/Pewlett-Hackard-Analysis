-------- MOD 7 CHALLENGE -----------
-------- Madelyn Mathai -------------

-- 1. Making retirement_titles.csv --
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON(e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, e.birth_date DESC;

-- 2. Making unique_titles.csv --
DROP TABLE unique_titles

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles 
ORDER BY emp_no, to_date DESC;


SELECT * FROM unique_titles
--First, retrieve the number of titles from the Unique Titles table.
--Then, create a Retiring Titles table to hold the required information.
--Group the table by title, then sort the count column in descending order.

-- 3. Count retirees by title --
SELECT COUNT (emp_no), title
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY COUNT DESC;



-- 4. Mentorship Eligibility --
SELECT DISTINCT ON (emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
ON(e.emp_no = de.emp_no)
LEFT JOIN titles as t
ON(de.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
