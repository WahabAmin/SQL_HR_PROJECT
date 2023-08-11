-- DATA CLEANING
SELECT birthdate, termdate, hire_date
FROM hr;

SET sql_safe_updates = 0;

--  Convert birthdate to sql date format
UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

--  Convert birthdate to date data type
ALTER TABLE  hr
MODIFY COLUMN  birthdate DATE;
SELECT * FROM hr;

--  Convert hire_date to sql date format
UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;


-- Convert termdate to sql date format
UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

--  Convert termdate to date data type
ALTER TABLE  hr
MODIFY COLUMN termdate DATE;

-- Employees age distribution
SELECT count(*) FROM hr WHERE age;

-- The age column has negative or less han zero ages, so lets have alook at them
SELECT COUNT(*)
FROM hr
WHERE age LIKE '%-%';
-- 967 ages are negative

-- Lets drop the negative columns
DELETE FROM hr
WHERE age LIKE '%-%';

-- COLUMN CREATION
-- create age column
ALTER TABLE hr
ADD COLUMN age int;

UPDATE hr
SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());