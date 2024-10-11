/* How many job postings were posted in each country? 
   Show the top 10 countries with the most job postings. */

SELECT
    COUNT(job_id) as number_of_job_postings,
    job_country
FROM job_postings_fact
GROUP BY job_country 
ORDER BY number_of_job_postings DESC
LIMIT 10;

/* The top 10 countries with the most job postings are:

    1.  United States       206943 job postings
    2.  India               51197  job postings
    3.  United Kingdom      40439  job postings
    4.  France              40028  job postings
    5.  Germany             27782  job postings
    6.  Spain               25123  job postings
    7.  Singapore           23702  job postings
    8.  Sudan               21519  job postings
    9.  Netherlands         20673  job postings
    10. Italy               17073  job postings

Australia, South America, and Antartica did not make the list.
*/