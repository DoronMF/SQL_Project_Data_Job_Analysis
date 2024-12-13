-- Question 4 - What are the top skills based on salary for my role - Data Analyst

select  d.skills, 
        d.type, 
        round(avg(salary_year_Avg),0) as salary_yearly
        --avg(salary_hour_Avg) as salary_hourly
from job_postings_fact p join skills_job_dim s on p.job_id = s.job_id
                         join skills_dim d on d.skill_id = s.skill_id
where  job_title_short = 'Data Analyst' 
  and salary_year_Avg is not null

group by  d.skills, 
          d.type
order by salary_yearly desc    
limit 25

/*
INSIGHTS FROM CHATGPT

Trends in High-Paying Skills:
Dominance of Libraries and Tools:

Many of the high-paying skills fall under the category of libraries, such as MXNet, Dplyr, Kafka, Keras, Pytorch, Hugging Face, TensorFlow, and Airflow. These tools are pivotal for data manipulation, machine learning, and data pipeline orchestration, indicating that advanced technical proficiency is rewarded.
Programming Languages:

Programming languages like Solidity, Golang, Perl, and Scala feature prominently. Solidity stands out, likely due to its niche in blockchain development, which is a high-demand and specialized area.
Cloud and DevOps Tools:

Tools like VMware, Terraform, Puppet, and Ansible reflect the importance of infrastructure automation, cloud management, and deployment in modern data roles.
Database Expertise:

High-paying database-related skills such as Couchbase and Cassandra suggest that expertise in NoSQL and distributed database systems is valued, especially as data ecosystems grow in complexity.
Other Notable Tools:

Tools like Twilio (for communication), GitLab, Bitbucket (version control), and Notion (collaboration and knowledge management) are also well-compensated, reflecting their utility in modern workflows.
General Observation:

The highest-paying skill, SVN (Subversion), likely reflects its usage in legacy systems or specific industries where it's still highly valuable.

*/