-- What are the most in-demand skills for each profession?

WITH total_count_cte AS (
    SELECT
        COUNT(job_id) AS total_count
    FROM job_postings_fact
)


SELECT
    j.profession as profession,
    COUNT(j.job_id) AS skill_count,
    s.skills AS skill,
    s.type as skill_type,
    ROUND(((COUNT(j.job_id) * 1.0 / cte.total_count) * 100),4) AS percentage_of_total_jobs
FROM job_postings_fact AS j
JOIN skills_job_dim AS sj USING (job_id)
JOIN skills_dim AS s USING (skill_id)
JOIN total_count_cte AS cte ON 1=1
GROUP BY profession, s.skills, skill_type, cte.total_count
ORDER BY skill_count DESC;