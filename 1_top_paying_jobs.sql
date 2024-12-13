-- Question 1 - What are the top paying jobs for my rold - Data Analyst
select  p.job_id,
                c.name as company,
                p.salary_year_Avg salary
                
        from job_postings_fact p join company_dim c on p.company_id = c.company_id
        where job_title_short = 'Data Analyst' 
          and job_location = 'Anywhere'
          and salary_year_Avg is not null
        order by salary_year_Avg desc
        limit 10



