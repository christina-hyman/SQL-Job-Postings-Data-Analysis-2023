-- Which companies had the most job postings for Data Scientist roles? 

SELECT 
    c.name as company,
    COUNT(j.job_id) as number_of_job_postings
FROM job_postings_fact as j
JOIN company_dim as c
USING (company_id)
WHERE profession = 'Data Scientist'
GROUP BY c.name
ORDER BY number_of_job_postings DESC
LIMIT 10;

/*

The top ten companies are: Booz Allen Hamilton, Emprego, Walmart, 
Guidehouse, Harnham, SynergisticIT, Upwork, Deloitte, Leidos, and Dice.

company                 number_of_job_postings
Booz Allen Hamilton             1876
Emprego                         1387
Walmart                         1330
Guidehouse                      1247
Harnham                         1185
SynergisticIT                   1031
Upwork                          857
Deloitte                        705
Leidos                          648
Dice                            579

*/