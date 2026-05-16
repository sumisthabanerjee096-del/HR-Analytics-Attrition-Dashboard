CREATE DATABASE HR_Project;
USE HR_Project;

CREATE TABLE HR_data(
Age int,
Attrition varchar(10),
Department varchar(50),
JobRole varchar(50),
MonthlyIncome int,
Gender varchar(10),
YearsAtCompany int
);
select * from HR_Data limit 10;
#Total Employees
SELECT count(*) as Total_Employees
FROM HR_data;

#Attrition Count
SELECT COUNT(*) AS attrition_count
FROM HR_data
WHERE attrition = "Yes";

#Attrition Rate 
SELECT ROUND(SUM(attrition = "Yes") * 100.0 / COUNT(*),2) AS attrition_rate
FROM HR_data;

#Attrition by Department 
SELECT department ,Count(*) AS total 
FROM HR_data
WHERE attrition = "Yes"
GROUP BY department;

# Attrition by salary group
SELECT 
    CASE 
        WHEN monthly_income < 3000 THEN 'Low'
        WHEN monthly_income BETWEEN 3000 AND 7000 THEN 'Medium'
        ELSE 'High'
    END AS salary_group,
    COUNT(*) AS total
FROM HR_data
WHERE attrition = 'Yes'
GROUP BY salary_group;

# Attrition by job role
SELECT job_role, COUNT(*) AS total
FROM HR_data
WHERE attrition = 'Yes'
GROUP BY job_role
ORDER BY total DESC;

# Experience Analysis
SELECT years_at_company, COUNT(*) AS total
FROM HR_data
WHERE attrition = 'Yes'
GROUP BY  years_at_company
ORDER BY years_at_company;

# Gender Analysis
SELECT gender, COUNT(*) AS total
FROM HR_data
WHERE attrition = 'Yes'
GROUP BY gender;
