/* What are the most common skills for the top 100 highest-paying salaries (on average)
   Data Scientist roles that are located remotely or in New York? */

WITH top_100_highest_paying AS(
    SELECT
        job_id as job_id,
        ROUND(salary_year_avg,0) as salary_avg,
    FROM job_postings_fact
    WHERE
        profession = 'Data Scientist'
        AND job_country = 'United States'
        AND (job_location = 'Anywhere' OR job_location LIKE '%NY%')
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_avg DESC
    LIMIT 100
)

SELECT
    COUNT(cte.job_id) as number_of_job_postings,
    s.skills as skill,
    s.type as skill_type
FROM top_100_highest_paying as cte
JOIN skills_job_dim USING (job_id)
JOIN skills_dim as s USING (skill_id)
GROUP BY skill, skill_type
ORDER BY number_of_job_postings DESC
LIMIT 5;

/*  

The top five most common skills are:
    1. Python       with 77 out of 100 jobs requiring that skill.
    2. SQL          with 55 out of 100 jobs requiring that skill.
    3. R            with 35 out of 100 jobs requiring that skill.
    4. Spark        with 22 out of 100 jobs requiring that skill.
    5. Tableau      with 16 out of 100 jobs requiring that skill.

*/