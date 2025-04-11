CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name varchar(255),
    cover_letter_sent BOOLEAN,
    cover_letter_filename varchar(255),
    status varchar(50)
);INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_filename,
    status
  );

