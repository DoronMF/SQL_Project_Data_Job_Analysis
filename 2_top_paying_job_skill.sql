--Question 2 - What are the skills required for these top-paying rolls
with top_paying_jobs
as    ( select  p.job_id,
                c.name as company,
                p.salary_year_Avg salary
                
        from job_postings_fact p join company_dim c on p.company_id = c.company_id
        where job_title_short = 'Data Analyst' 
          and job_location = 'Anywhere'
          and salary_year_Avg is not null
        order by salary_year_Avg desc
        limit 10
       )

select t.*,
       s.skill_id, d.skills, d.type 
from top_paying_jobs t join skills_job_dim s on t.job_id = s.job_id
                       join skills_dim d on d.skill_id = s.skill_id



-- INSIGHTS FROM CHATGPT
/*
The data includes job postings for Data Analyst roles in 2023, with columns for job IDs, companies, salaries, skills, and skill types. Let's analyze the "skills" column to provide insights into the most common and in-demand skills:

Identify the most frequently listed skills.
Group them by skill type (e.g., programming, cloud).
Visualize the trends for better insights.
I'll process this and display the results. ​​

Insights from Data Analyst Job Postings (2023)
Most Common Skills:
SQL - 8 listings
Python - 7 listings
Tableau - 6 listings
R - 4 listings
Snowflake - 3 listings
Pandas - 3 listings
Excel - 3 listings
Azure - 2 listings
Bitbucket - 2 listings
Go - 2 listings


Skills by Type:
Programming - 22 mentions (e.g., SQL, Python, R)
Analyst Tools - 13 mentions (e.g., Tableau, Excel)
Cloud Technologies - 10 mentions (e.g., Azure, Snowflake)
Other - 9 mentions (miscellaneous or less common skills)
Libraries - 8 mentions (e.g., Pandas)
Async Tools - 4 mentions


Key Observations:
Programming skills (like SQL and Python) dominate the requirements.
Visualization tools like Tableau are essential.
Cloud platforms (Azure, Snowflake) are becoming increasingly critical.
Libraries like Pandas emphasize the need for data manipulation capabilities.
Would you like deeper analysis or visualizations of this data?



[
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 5,
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 74,
    "skills": "azure",
    "type": "cloud"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 75,
    "skills": "databricks",
    "type": "cloud"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 76,
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 93,
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 95,
    "skills": "pyspark",
    "type": "libraries"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 102,
    "skills": "jupyter",
    "type": "libraries"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 181,
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 182,
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 183,
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "salary": "255829.5",
    "skill_id": 196,
    "skills": "powerpoint",
    "type": "analyst_tools"
  },
  {
    "job_id": 99305,
    "company": "Pinterest Job Advertisements",
    "salary": "232423.0",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 99305,
    "company": "Pinterest Job Advertisements",
    "salary": "232423.0",
    "skill_id": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 99305,
    "company": "Pinterest Job Advertisements",
    "salary": "232423.0",
    "skill_id": 5,
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 99305,
    "company": "Pinterest Job Advertisements",
    "salary": "232423.0",
    "skill_id": 97,
    "skills": "hadoop",
    "type": "libraries"
  },
  {
    "job_id": 99305,
    "company": "Pinterest Job Advertisements",
    "salary": "232423.0",
    "skill_id": 182,
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 1021647,
    "company": "Uclahealthcareers",
    "salary": "217000.0",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 1021647,
    "company": "Uclahealthcareers",
    "salary": "217000.0",
    "skill_id": 23,
    "skills": "crystal",
    "type": "programming"
  },
  {
    "job_id": 1021647,
    "company": "Uclahealthcareers",
    "salary": "217000.0",
    "skill_id": 79,
    "skills": "oracle",
    "type": "cloud"
  },
  {
    "job_id": 1021647,
    "company": "Uclahealthcareers",
    "salary": "217000.0",
    "skill_id": 182,
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 1021647,
    "company": "Uclahealthcareers",
    "salary": "217000.0",
    "skill_id": 215,
    "skills": "flow",
    "type": "other"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "salary": "205000.0",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "salary": "205000.0",
    "skill_id": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "salary": "205000.0",
    "skill_id": 8,
    "skills": "go",
    "type": "programming"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "salary": "205000.0",
    "skill_id": 80,
    "skills": "snowflake",
    "type": "cloud"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "salary": "205000.0",
    "skill_id": 93,
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "salary": "205000.0",
    "skill_id": 94,
    "skills": "numpy",
    "type": "libraries"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "salary": "205000.0",
    "skill_id": 181,
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "salary": "205000.0",
    "skill_id": 182,
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "salary": "205000.0",
    "skill_id": 220,
    "skills": "gitlab",
    "type": "other"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 74,
    "skills": "azure",
    "type": "cloud"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 76,
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 79,
    "skills": "oracle",
    "type": "cloud"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 80,
    "skills": "snowflake",
    "type": "cloud"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 182,
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 183,
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 189,
    "skills": "sap",
    "type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 211,
    "skills": "jenkins",
    "type": "other"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 218,
    "skills": "bitbucket",
    "type": "other"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 219,
    "skills": "atlassian",
    "type": "other"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 233,
    "skills": "jira",
    "type": "async"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "salary": "189309.0",
    "skill_id": 234,
    "skills": "confluence",
    "type": "async"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "salary": "189000.0",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "salary": "189000.0",
    "skill_id": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "salary": "189000.0",
    "skill_id": 5,
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "salary": "189000.0",
    "skill_id": 210,
    "skills": "git",
    "type": "other"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "salary": "189000.0",
    "skill_id": 218,
    "skills": "bitbucket",
    "type": "other"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "salary": "189000.0",
    "skill_id": 219,
    "skills": "atlassian",
    "type": "other"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "salary": "189000.0",
    "skill_id": 233,
    "skills": "jira",
    "type": "async"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "salary": "189000.0",
    "skill_id": 234,
    "skills": "confluence",
    "type": "async"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "salary": "186000.0",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "salary": "186000.0",
    "skill_id": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "salary": "186000.0",
    "skill_id": 8,
    "skills": "go",
    "type": "programming"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "salary": "186000.0",
    "skill_id": 80,
    "skills": "snowflake",
    "type": "cloud"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "salary": "186000.0",
    "skill_id": 93,
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "salary": "186000.0",
    "skill_id": 94,
    "skills": "numpy",
    "type": "libraries"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "salary": "186000.0",
    "skill_id": 181,
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "salary": "186000.0",
    "skill_id": 182,
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "salary": "186000.0",
    "skill_id": 220,
    "skills": "gitlab",
    "type": "other"
  },
  {
    "job_id": 387860,
    "company": "Get It Recruit - Information Technology",
    "salary": "184000.0",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 387860,
    "company": "Get It Recruit - Information Technology",
    "salary": "184000.0",
    "skill_id": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 387860,
    "company": "Get It Recruit - Information Technology",
    "salary": "184000.0",
    "skill_id": 5,
    "skills": "r",
    "type": "programming"
  }
]

*/