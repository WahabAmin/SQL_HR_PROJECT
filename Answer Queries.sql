CREATE DATABASE projects;
USE projects;

SELECT *
FROM hr;

describe hr;


-- EXPLORATORY DATA ANALYSIS
-- Youngest, average and oldest age
SELECT 
	min(age) AS youngest,
    round(avg(age),0) average,
    max(age) AS oldest
FROM hr;

 -- Check Termdates in the future
SELECT COUNT(*), termdate 
FROM hr
WHERE termdate > CURDATE()
GROUP BY termdate;

 -- Employee with empty Termdates 
SELECT COUNT(*)
FROM hr
WHERE termdate = '';
 

-- Top 10 jobtitle count
SELECT COUNT(*) AS count, jobtitle 
FROM hr
GROUP BY jobtitle
ORDER BY  COUNT(*)  DESC
LIMIT 10;
 
-- Top 10 departments with highest employees
SELECT COUNT(*) AS count_of_employees, department 
FROM hr
GROUP BY department
ORDER BY  COUNT(*)  DESC
LIMIT 10;

-- LETS ANSWER THESE 11 QUESTIONS

-- 1. What is the gender breakdown of employees in the company?
SELECT COUNT(*) AS employees_count, gender
FROM hr
WHERE termdate = '' OR termdate >= CURDATE()
GROUP BY gender
ORDER BY COUNT(*) DESC;


-- 2. What is the race/ethnicity breakdown of employees in the company?
SELECT COUNT(*) AS employees_count, race
FROM hr
WHERE  termdate >= CURDATE() OR termdate = ''
GROUP BY race
ORDER BY  COUNT(*) DESC;


-- 3. What is the age distribution of employees in the company?
SELECT 
  CASE 
    WHEN age >= 18 AND age <= 24 THEN '18-24'
    WHEN age >= 25 AND age <= 34 THEN '25-34'
    WHEN age >= 35 AND age <= 44 THEN '35-44'
    WHEN age >= 45 AND age <= 54 THEN '45-54'
    WHEN age >= 55 AND age <= 64 THEN '55-64'
    ELSE '65+' 
  END AS age_group,
  COUNT(*) AS count
FROM hr
WHERE  termdate >= CURDATE() OR termdate = ''
GROUP BY age_group
ORDER BY age_group;


-- 4. How many employees work at headquarters versus remote locations?
SELECT COUNT(*) AS Count, location
FROM hr
WHERE termdate = '' OR  termdate >= CURDATE
GROUP BY location;

-- 5. What is the average length of employment for employees who have been terminated?
SELECT ROUND(AVG(DATEDIFF(termdate, hire_date))/365,0) AS avg_length_of_employment
FROM hr
WHERE termdate <> '' AND termdate <= CURDATE();

-- 6. How does the gender distribution vary across departments and job titles?
SELECT COUNT(*) AS Count, gender, department
FROM hr
WHERE termdate = '' OR termdate >= CURDATE()
GROUP BY gender, department
ORDER BY department DESC;

-- 7. Which department has the highest turnover rate?
SELECT department, 
total_count, 
termination_count, 
termination_count/total_count AS termination_rate
FROM ( SELECT department, 
COUNT(*) AS total_count,
SUM(CASE WHEN termdate <> '' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS termination_count
FROM hr
GROUP BY department) AS subquery
ORDER BY termination_rate DESC;

-- 8. What is the distribution of employees across locations by city and state?
SELECT COUNT(*) AS count, location_state
FROM hr
GROUP BY location_state
ORDER BY  COUNT(*) DESC;


-- 9. How has the company's employee count changed over time based on hire and term dates?
SELECT year, hires, termination, 
hires - termination AS net_change,
round((hires - termination)/hires*100,2) AS net_change_percent
FROM(SELECT YEAR(hire_date) AS year,
COUNT(*) AS hires,
SUM(CASE WHEN termdate <> '' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS termination
FROM hr
GROUP BY year) AS aubquery
ORDER BY year;

-- 10. Has workforce changed over time in terms of diversity?
SELECT  YEAR(hire_date)  AS hire_year, COUNT(*)  AS total_employees,
      ROUND( SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) / COUNT(*)  * 100,2) AS female_percentage,
       ROUND(SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) / COUNT(*) * 100,2) AS male_percentage,
       ROUND(SUM(CASE WHEN gender = 'Non-Conforming' THEN 1 ELSE 0 END) / COUNT(*)  * 100,2) AS non_conforming_percentage
FROM hr
GROUP BY hire_year
ORDER BY hire_year;

-- 11 employee termination count over years?
 SELECT YEAR(termdate) AS termination_year, COUNT(*) AS total_employment_terminated
 FROM hr
 WHERE termdate <> '' AND termdate < CURDATE()
 GROUP BY termination_year
 ORDER BY total_employment_terminated;
 
 -- 12. Top 5 job titles with highest termination rate?
 SELECT Jobtitle, COUNT(*) AS total_terminated,
  COUNT(*) / (SELECT COUNT(*) FROM hr WHERE termdate != '' AND termdate <= CURDATE()) * 100 AS termination_rate
FROM hr
WHERE termdate != '' AND termdate <= CURDATE()
GROUP BY Jobtitle
ORDER BY termination_rate DESC
LIMIT 5;

  -- 13. Top 10 job titles with highest hirirng rate?
 SELECT Jobtitle, COUNT(*) AS total_hiring,
  COUNT(*) / (SELECT COUNT(*) FROM hr WHERE termdate = '' OR termdate >= CURDATE()) * 100 AS termination_rate
FROM hr
WHERE termdate = '' OR termdate >= CURDATE()
GROUP BY Jobtitle
ORDER BY total_hiring DESC
LIMIT 10;

