-- How many job postings were posted each month for each profession?

SELECT 
    TO_CHAR(job_posted_date, 'Month') AS month,
    COUNT(job_id) as number_of_job_postings,
    profession as profession,
    EXTRACT(MONTH FROM job_posted_date) AS month_number
FROM job_postings_fact
GROUP BY month_number, month, profession
ORDER BY profession;
