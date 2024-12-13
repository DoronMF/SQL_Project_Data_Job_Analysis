-- Question 5 - What are the most optimal skills to learn - high demand and high paying

--Highest Demand
With highest_demand_skills
as    ( select  d.skill_id,
                d.skills, 
                d.type, 
                count(p.job_id) as num_postings 
        from job_postings_fact p join skills_job_dim s on p.job_id = s.job_id
                                join skills_dim d on d.skill_id = s.skill_id
         where job_title_short = 'Data Analyst'
          and salary_year_Avg is not null
          and job_work_from_home = True
        group by  d.skill_id,
                  d.skills, 
                  d.type
        order by num_postings desc    
           
       ),
     highest_paid_skills    
 as    
       (select  d.skill_id,
                d.skills, 
                d.type, 
                round(avg(salary_year_Avg),0) as salary_yearly
        
        from job_postings_fact p join skills_job_dim s on p.job_id = s.job_id
                                  join skills_dim d on d.skill_id = s.skill_id
        where job_title_short = 'Data Analyst'
          and salary_year_Avg is not null
          and job_work_from_home = True
        group by  d.skill_id,
                  d.skills, 
                  d.type
        order by salary_yearly desc     
       )

 select d.skill_id,
        d.skills,
        d.type,
        num_postings,
        salary_yearly as avg_salary
 from highest_demand_skills d join  highest_paid_skills p 
                                         on d.skill_id = p.skill_id
where num_postings > 10                                         
 order by  avg_salary desc, num_postings desc    
 limit 25                                           


--Quicker more efficient way without CTE

 select d.skills,
        d.type,
        count(p.job_id) as num_postings,
        round(avg(salary_year_Avg),0) as salary_yearly
 from job_postings_fact p join skills_job_dim s on p.job_id = s.job_id
                                  join skills_dim d on d.skill_id = s.skill_id
 where job_title_short = 'Data Analyst'
    and salary_year_Avg is not null
    and job_work_from_home = True
 group by  d.skills, 
           d.type
 having count(p.job_id) > 10          
 order by salary_yearly desc, num_postings desc    
 limit 25      
