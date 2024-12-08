select * from job_postings_fact
limit 100


-- CONVERTING DATA TYPES
select '2024-11-12':: DATE,
        234:: INTEGER,
        'true':: BOOLEAN,
        '3.14':: REAL;


--DATE FUNCTIONS
    select job_title_short as title,
            job_location as location,
            job_posted_date as date_time,
            job_posted_date:: DATE as date,
            job_posted_date at time zone 'UTC' at time zone 'EST' as date_timezone,
            extract(month from job_posted_date) as months,
            extract(year from job_posted_date) as years,
            extract(day from job_posted_date) as days

    from job_postings_fact      
    Limit 1000 


    select 
           extract(month from job_posted_date) as months,
           COUNT(job_id) jobs_posted_cnt
    from job_postings_fact
    where job_title_short = 'Data Analyst'
    group by months     
    order by jobs_posted_cnt desc
    Limit 1000 


-- Creating a new table from existing data
CREATE TABLE january_jobs AS
SELECT * 
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS
SELECT * 
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS
SELECT * 
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


select * from february_jobs
fetch first 100 rows only;

-- case statement
select count(job_id) as number_of_jobs,
       --job_title_short,
       --job_location,
       case when job_location = 'Anywhere' then 'Remote'
            when job_location = 'New York, NY' then 'Local'
       else 'Onsite'
       end as job_loc  
FROM job_postings_fact 
where job_title_short = 'Data Analyst'
group by job_loc
order by job_loc;


-- CTE
with top_5_skills
as (
        select count(job_id) as jobs_per_skill,
            skill_id
        FROM skills_job_dim
        group by skill_id
        order by jobs_per_skill desc
        limit 5
    )    

select t.skill_id skills, jobs_per_skill type 
from top_5_skills t join skills_dim s on t.skill_id = s.skill_id
order by jobs_per_skill desc




-- CTE with case and join
with remote_jobs
as (
        select count(p.job_id) as number_of_jobs,
             j.skill_id,
             
            case when job_location = 'Anywhere' then 'Remote'
                    when job_location = 'New York, NY' then 'Local'
            else 'Onsite'
            end as job_loc  
        FROM job_postings_fact p join skills_job_dim j on p.job_id = j.job_id
        where job_title_short = 'Data Analyst'
        group by job_loc, j.skill_id
    )    


select r.skill_id, skills, type, number_of_jobs from remote_jobs r join skills_dim s on r.skill_id = s.skill_id 
where job_loc = 'Remote' 
order by number_of_jobs desc
limit 5


select j.job_id, s.skill_id, d.skills, d.type, salary_year_Avg 
from january_jobs j left join skills_job_dim s on j.job_id = s.job_id
                    left join skills_dim d on d.skill_id = s.skill_id
where salary_year_Avg > 70000                  
                    
union all

select j.job_id, s.skill_id, d.skills, d.type, salary_year_Avg 
from february_jobs j left join skills_job_dim s on j.job_id = s.job_id
                    left join skills_dim d on d.skill_id = s.skill_id
where salary_year_Avg > 70000                       

union all

select j.job_id, s.skill_id, d.skills, d.type, salary_year_Avg 
from march_jobs j left join skills_job_dim s on j.job_id = s.job_id
                    left join skills_dim d on d.skill_id = s.skill_id
where salary_year_Avg > 70000   

