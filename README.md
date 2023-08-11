# SQL_HR_PROJECT

Data Used
Data - HR Data with over 22000 rows from the year 2000 to 2020.
Data Cleaning & Analysis - MySQL Workbench
Data Visualization - Excel

QUESTIONS
1. What is the gender breakdown of employees in the company?
2. What is the race/ethnicity breakdown of employees in the company?
3. What is the age distribution of employees in the company?
4. How many employees work at headquarters versus remote locations?
5. What is the average length of employment for employees who have been terminated?
6. How does the gender distribution vary across departments and job titles?
7. Which department has the highest turnover rate?
8. What is the distribution of employees across locations by city and state?
9. How has the company's employee count changed over time based on hire and term dates?
10. Has the workforce changed over time in terms of diversity?
11.  Employee termination count over years?
12. Top 5 job titles with highest termination rate?
13. Top 10 job titles with highest hiring rate?

Summary of Findings
1.	The gender distribution is skewed toward males, there are 821 more male than female and 8,430 more male than Non-Conforming gender in the company.
2.	The largest racial group in the company is White with a count of 4,987 individuals. The Native Hawaiian or Other Pacific Islander has the lowest representation in the company (952).
3.	 Among the five age groups created, the "25-34" age group is the most prevalent age group.The "55-64" age group has the least representation.
4.	The number of staff that work at the headquarters of the company are almost three times the number of staff that work remotely.
5.	The average length of employment for terminated employees is around 7 years.
6.	Engineering department has the highest male, female and non-conforming representation while the auditing department has the least representation of male, female and non-conforming.The auditing department has an equal count of female and  male employees.
7.	Auditing department has the highest turnover rate (16%), followed by the legal department(13%). Marketing and Business Development departments have the lowest turnover rate (8.96% and 9.31% respectively).
8.	The largest number of employees come from the state of Ohio with (17252 staff). Followed by Pennsylvania and Illinois.
9.	Employee count ranges from a low of 967 in 2020 to a high of 1094 in 2009.There is a net increase in almost all years, except in 2000 when there was a net decrease of 26 employees. This suggests that the organisation has generally been growing its workforce over the years.
10.	 The percentages of female and male employees have remained relatively stable, with neither gender dominating the workforce significantly. The percentage of non-conforming employees is relatively low and has remained consistent over the years.
11.	There is no clear pattern of increasing or decreasing terminations over time, there are periods when terminations seem to increase for a few consecutive years (e.g., 2003-2005 and 2015-2020)
12.	Data Analyst recorded the highest termination rate among the top 5 job titles with highest termination rate in the company followed be research assistant II and I
13.	Research Assistant II has the highest hiring rate followed by Business Analyst and HUman Resource Analyst.

Limitations
1. Some records had negative ages and these were excluded during querying(967 records). Ages used were 18 years and above.
2. Some termdates were far into the future and were not included in the analysis(1599 records). The only term dates used were those less than or equal to the current date.

