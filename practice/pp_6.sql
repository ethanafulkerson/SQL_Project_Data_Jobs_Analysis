-- make tables jan-mar 2023 jobs


CREATE TABLE january_jobs AS
    select *
    from job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
;


CREATE TABLE february_jobs AS
    select *
    from job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2
;


CREATE TABLE march_jobs AS
    select *
    from job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3
;

select job_posted_date
from march_jobs;