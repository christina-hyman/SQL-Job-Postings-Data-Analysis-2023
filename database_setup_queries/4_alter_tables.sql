-- The word 'Senior' from the `job_title_short` column was removed to create a new column `professions` that include {'Business Analyst', 'Cloud Engineer', 'Data Analyst', 'Data Engineer', 'Data Scientist', 'Machine Learning Engineer', 'Software Engineer'}
-- The presence of the word 'Senior' from the `job_title_short` column was used to create a new column `experience` to distinguish Senior Roles.

ALTER TABLE job_postings_fact
ADD COLUMN profession VARCHAR(25),
ADD COLUMN experience VARCHAR(10);

UPDATE job_postings_fact
SET profession =
    CASE
        WHEN POSITION('Senior ' IN job_title_short) > 0 
        THEN SUBSTRING(job_title_short FROM POSITION('Senior ' IN job_title_short) + 7)
        ELSE job_title_short
    END;


UPDATE job_postings_fact
SET experience =
    CASE
        WHEN job_title_short LIKE '%Senior%' THEN 'Senior'
        ELSE 'Non-Senior'
    END;

