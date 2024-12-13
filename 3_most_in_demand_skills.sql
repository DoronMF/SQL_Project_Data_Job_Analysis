-- Question 3 - Most in-demand skills for Data Analysts
select  d.skills, 
        d.type, 
        count(p.job_id) as num_postings 
from job_postings_fact p join skills_job_dim s on p.job_id = s.job_id
                         join skills_dim d on d.skill_id = s.skill_id
where  job_title_short = 'Data Analyst' 
group by  d.skills, 
          d.type
order by num_postings desc    
limit 10       