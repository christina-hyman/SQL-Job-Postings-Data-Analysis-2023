-- What are the top ten in demand skills for data scientists (remote or New York roles)?

SELECT
    COUNT(j.job_id) AS skill_count,
    s.skills AS skill,
    ROUND(AVG(j.salary_year_avg),0) as average_salary_avg,
    s.type as skill_type
FROM job_postings_fact AS j
JOIN skills_job_dim AS sj USING (job_id)
JOIN skills_dim AS s USING (skill_id)
WHERE 
    profession = 'Data Scientist'
    AND j.job_location IN ('New York, NY')
    AND salary_year_avg IS NOT NULL
GROUP BY s.skills, skill_type
ORDER BY skill_count DESC, average_salary_avg DESC
LIMIT 10;

/*

The most in-demand skills for Data Scientist roles in remote or New York 
locations are dominated by programming languages (Python, SQL, R) and machine learning 
libraries (pandas, PyTorch, TensorFlow). Cloud skills like AWS and big data tools such 
as Spark are also highly valued, offering some of the highest salaries. Tools like Tableau 
and Excel are important but less in demand.

*/