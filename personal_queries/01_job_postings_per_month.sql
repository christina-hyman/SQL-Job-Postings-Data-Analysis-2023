-- Which months have the highest amount of job postings?

SELECT 
    TO_CHAR(job_posted_date, 'Month') AS month,
    COUNT(job_id) as number_of_job_postings
FROM job_postings_fact
GROUP BY month
ORDER BY number_of_job_postings DESC;

/*

month              number_of_job_postings
January            92266
August             75067
October            66601
February           64560
November           64404
March              64158
July               63855
April              62915
September          62433
June               61500
December           57692
May                52235

*/