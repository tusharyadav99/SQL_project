/* 
Label new column as follows:
-> 'Anywhere' jobs as 'Remote'
-> 'New York, NY' jobs as 'Local'
-> Otherwise 'Onsite' */

SELECT
    COUNT(job_id) AS no_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category

/* Practice Problem:
Question: I want to categorize the salaries from each job posting.
To see if it fits in my desired salary range.
* Put salary into different buckets
* Define what's a high, standard, or low salary with our conditions
* Why? it is easy to determine  whch job postings are worth looking at based on salary
    ** Bucketing is common practice in data analysis when viewing categories
* I only want to look at data analyst roles
* Order from highest to lowest 
 */    

SELECT
    COUNT(job_id) AS no_of_jobs,
    CASE 
        WHEN salary_year_avg >= 200000 THEN 'high'
        WHEN salary_year_avg BETWEEN 100000 AND 199999 THEN 'standard'
        ELSE  'low'
    END AS salary_bucket

FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    salary_bucket;

-- Alternate
SELECT
    COUNT(job_id) AS no_of_jobs,
    CASE 
        WHEN salary_year_avg >= 200000 THEN 'high'
        WHEN salary_year_avg < 200000 AND salary_year_avg >= 100000 THEN 'standard'
        ELSE 'low'
    END AS salary_bucket
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    salary_bucket;




