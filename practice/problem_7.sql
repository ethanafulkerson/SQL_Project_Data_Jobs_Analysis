/* find the count of the number of remote job postings per skill
- display the top 5 skills by their demand in remote jobs
- include skill ID, name, and count of postings requiring the skill 
(CTE that includes the number of job postings per skill) 
first joins job postings fact and skills job dim for a count, then brings in skills dim
all inner joins*/

/*
WITH remote_skill_count AS (
    SELECT 
        COUNT(sjd.skill_id) AS remote_count
    FROM
        skills_job_dim AS sjd
        INNER JOIN job_postings_fact AS jpf ON sjd.job_id = jpf.job_id
    WHERE jpf.job_location = 'Anywhere'
    )
    SELECT
        sd.skill_id,
        sd.skills,
        remote_count
    FROM
        skills_dim AS sd,
        skills_job_dim
        INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
        INNER JOIN remote_skill_count AS rsc ON sd.skill_id = rsc.skill_id
;
*/

-- thought i had it for a second, this has mutated into something different as i try to find the right tweak

WITH remote_job_skills AS (
    SELECT
        sjd.skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS sjd
        INNER JOIN job_postings_fact AS jpf ON sjd.job_id = jpf.job_id
    WHERE
        jpf.job_work_from_home = True
    GROUP BY
        skill_id
    )
    SELECT
        sd.skill_id,
        skills AS skill_name,
        skill_count
    FROM
        remote_job_skills AS rjf
        INNER JOIN skills_dim AS sd ON sd.skill_id = rjf.skill_id
    ORDER BY
        skill_count DESC
    LIMIT 5
;


-- forgot to group by skill id in the child query
-- was correct to join cte to skills dim table
/*  remember the cte needs to be referencing its child in the from section, everything else joined later