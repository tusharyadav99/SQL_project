ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

-- altering column type
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE text;


SELECT * FROM job_applied;

DROP TABLE IF EXISTS job_applied;