-- casting as Date or any other data type with "::"
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE  AS date_time
FROM 
    job_postings_fact
LIMIT 50;

-- Changing Time Zone with by first specifying the current time zone and 
-- Then replacing with the preferred time zone by using "AT TIME ZONE __".
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM 
    job_postings_fact
LIMIT 50;

-- EXTRACTING year, month, date, or time from a column with "EXTRACT".
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS Date_Month,
    EXTRACT(YEAR FROM job_posted_date) AS Date_Year
    
FROM 
    job_postings_fact
LIMIT 50;

-- How job posting are trending month to month
SELECT
    count(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count DESC;

/* Write a query to find the average salary both yearly and hourly for 
for job postings that were posted after June 1, 2023 Group the results by 
Job schedule type: */

SELECT
    job_schedule_type,
    AVG(salary_year_avg) AS Yearly_Average,
    AVG(salary_hour_avg) AS Hourly_Average
    
FROM
    job_postings_fact
WHERE
    job_posted_date > '2023-06-01'
GROUP BY
    job_schedule_type
ORDER BY
    Yearly_Average DESC,
    Hourly_Average DESC;

/*  Create 3 tables:
    -> Jan 2023 jobs
    -> Feb 2023 jobs
    -> Mar 2023 jobs
    Foreshadowing: This will be used in another practice problem below.
    Hints:
        Use CREATE TABLE table_name AS syntax to create your table
        Look at a way to filter out only specific months (EXTRACT)*/

-- For January
CREATE TABLE January_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- For February
CREATE TABLE February_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- For March
CREATE TABLE March_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date
FROM March_jobs;