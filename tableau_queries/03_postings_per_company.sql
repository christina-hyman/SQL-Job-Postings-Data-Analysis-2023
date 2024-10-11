-- How many jobs were posted for each company for each profession?

SELECT
    c.name as company,
    j.profession as profession,
    COUNT(j.job_id) as number_of_job_postings
FROM job_postings_fact as j
JOIN company_dim AS c USING (company_id)
GROUP BY name, profession
ORDER BY number_of_job_postings DESC;