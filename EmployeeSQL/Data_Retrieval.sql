SQLS :

--1.List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT E.EMP_NO ,E.LAST_NAME ,E.FIRST_NAME ,E.GENDER ,S.SALARY FROM
EMPLOYEES E INNER JOIN SALARIES S ON E.EMP_NO=S.EMP_NO order by  E.EMP_NO;

--2.List employees who were hired in 1986.
SELECT * FROM EMPLOYEES WHERE substr(hire_date,1,4)='1986';

--3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT DISTINCT D.DEPT_NO,D.DEPT_NAME,DM.EMP_NO AS MANAGER_EMP_NO,E.LAST_NAME,E.FIRST_NAME,
T.FROM_DATE AS EMPLOYMENT_START_DT , T.TO_DATE AS EMPLOYMENT_END_DT
FROM DEPARTMENTS D INNER JOIN DEPT_MANAGER DM ON D.DEPT_NO = DM.DEPT_NO
INNER JOIN TITLES T ON DM.EMP_NO=T.EMP_NO
INNER JOIN EMPLOYEES E ON DM.EMP_NO = E.EMP_NO
WHERE UPPER(T.TITLE)='MANAGER'
order by D.DEPT_NO;


--4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT DISTINCT DE.EMP_NO,E.LAST_NAME,E.FIRST_NAME,D.DEPT_NAME 
FROM DEPT_EMP DE INNER JOIN DEPARTMENTS D
ON DE.DEPT_NO = D.DEPT_NO INNER JOIN EMPLOYEES E
ON DE.EMP_NO = E.EMP_NO
order by DE.EMP_NO;


--5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM EMPLOYEES WHERE FIRST_NAME='Hercules' AND LAST_NAME LIKE 'B%'
order by emp_no;

--6.List all employees in the Sales department, including their employee number,
-- last name, first name, and department name
SELECT E.EMP_NO,E.LAST_NAME,E.FIRST_NAME,D.DEPT_NAME FROM EMPLOYEES E INNER JOIN DEPT_EMP DE 
ON E.EMP_NO = DE.EMP_NO INNER JOIN DEPARTMENTS D
ON DE.DEPT_NO = D.DEPT_NO
WHERE UPPER(D.DEPT_NAME) ='SALES'
order by E.EMP_NO;

--7 .List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT E.EMP_NO,E.LAST_NAME,E.FIRST_NAME,D.DEPT_NAME FROM EMPLOYEES E
INNER JOIN DEPT_EMP DE ON E.EMP_NO = DE.EMP_NO
INNER JOIN DEPARTMENTS D ON DE.DEPT_NO = D.DEPT_NO
WHERE UPPER(D.DEPT_NAME) IN('SALES','DEVELOPMENT')
order by E.EMP_NO;

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
 SELECT LAST_NAME,COUNT(*)AS LAST_NAME_FREQ FROM EMPLOYEES
GROUP BY LAST_NAME ORDER BY LAST_NAME_FREQ DESC;







