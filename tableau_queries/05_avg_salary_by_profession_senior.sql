-- What is the average salary for each profession and senior profession?

SELECT
    job_title_short as profession,
    ROUND(AVG(salary_year_avg),0) as average_salary_avg
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
GROUP BY job_title_short
ORDER BY profession