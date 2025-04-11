INSERT INTO job_applied
            (job_id,
            application_sent_date,
            custom_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_filename,
            status)
VALUES      (1,
            '2024-02-01',
            TRUE,
            'resume_01.pdf',
            TRUE,
            'cover_letter_01.pdf',
            'submitted'),
            (2,
            '2024-02-02',
            FALSE,
            'resume_02.pdf',
            FALSE,
            'cover_letter_02.pdf',
            'submitted'),
            (
                03,
                '2024-02-03',
                TRUE,
                'resume_03.pdf',
                FALSE,
                NULL,
                'submitted'
            );

