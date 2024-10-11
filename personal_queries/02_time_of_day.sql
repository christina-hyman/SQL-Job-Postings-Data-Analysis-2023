-- How do the number of job postings vary throughout the day? (Focusing on the EST Zone in the United States)

WITH datetime_cte AS(
    SELECT
        job_id,
        job_posted_date,
        job_posted_date::date as date,
        (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York')::timestamptz::TIME AS time
    FROM job_postings_fact
    WHERE job_country = 'United States'
)

SELECT
    COUNT(j.job_id) as number_of_job_postings,
    CASE
        WHEN cte.time >= '00:00' AND cte.time < '03:00' THEN '1_midnight'
        WHEN cte.time >= '03:00' AND cte.time < '06:00' THEN '2_midnight/early-morning'
        WHEN cte.time >= '06:00' AND cte.time < '09:00' THEN '3_early-morning'
        WHEN cte.time >= '09:00' AND cte.time < '12:00' THEN '4_morning'
        WHEN cte.time >= '12:00' AND cte.time < '15:00' THEN '5_afternoon'
        WHEN cte.time >= '15:00' AND cte.time < '18:00' THEN '6_evening'
        WHEN cte.time >= '18:00' AND cte.time < '21:00' THEN '7_night'
        ELSE '8_late-night'
    END as time_of_day
FROM job_postings_fact as j
JOIN datetime_cte as cte USING (job_id)
WHERE job_location LIKE '%, ME%'
    OR job_location LIKE '%, MD%'
    OR job_location LIKE '%, MA%'
    OR job_location LIKE '%, NH%'
    OR job_location LIKE '%, NJ%'
    OR job_location LIKE '%, NY%'
    OR job_location LIKE '%, CT%'
    OR job_location LIKE '%, DE%'
    OR job_location LIKE '%, GA%'
    OR job_location LIKE '%, NC%'
    OR job_location LIKE '%, VT%'
    OR job_location LIKE '%, VA%'
    OR job_location LIKE '%, WV%'
    OR job_location LIKE '%, OH%'
    OR job_location LIKE '%, PA%'
    OR job_location LIKE '%, RI%'
    OR job_location LIKE '%, SC%'
    OR job_location LIKE '%, MI%'
    OR job_location LIKE '%, TN%'
    OR job_location LIKE '%, FL%'
    OR job_location LIKE '%, IN%'
    OR job_location LIKE '%, KY%'
GROUP BY time_of_day
ORDER BY time_of_day ASC;

/*

number_of_job_postings          time_of_day
5530                            midnight
13542                           midnight/early-morning
13198                           early-morning
13004                           morning
14607                           afternoon
11273                           evening
12960                           night
4257                            late-night


Job postings are heavily concentrated during traditional U.S. business hours, 
but there is still considerable activity in the early morning and evening periods.
The night and late-night hours have the lowest job postings at 4,257 and 5,530, respectively, 
likely due to fewer recruiters working during these hours and reliance on automated systems.

*/