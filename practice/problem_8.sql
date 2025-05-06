/*
FIND job postings from the first quarter that have a salary greater than 70K
- combine job posting tables from the first quarter of 2023 (jan-mar)
- gets job postings with an average yearly salary > 70K
*/

/*
SELECT
    job_id,
    company_id,
    job_title,
    salary_year_avg
FROM
    january_jobs
WHERE
    salary_year_avg > 70000
UNION
SELECT
    job_id,
    company_id,
    job_title,
    salary_year_avg
FROM
    february_jobs
WHERE
    salary_year_avg > 70000
UNION
SELECT
    job_id,
    company_id,
    job_title,
    salary_year_avg
FROM
    march_jobs
WHERE
    salary_year_avg > 70000
;

*/

-- did the long way, could have turned into a subquery


SELECT
    q1.job_id,
    q1.company_id,
    q1.job_title,
    q1.salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION
    SELECT *
    FROM february_jobs
    UNION
    SELECT *
    FROM march_jobs
    ) AS q1
WHERE
    q1.salary_year_avg > 70000
ORDER BY
    q1.salary_year_avg DESC
;

--could also MAYBE remove table name before entities