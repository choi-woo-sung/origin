 -- join 08
 
 SELECT regions.region_id , regions.region_name, country_name
 FROM countries, regions
WHERE regions.region_id = countries.region_id
    AND regions.region_name = 'Europe';
    
  
 -- join 09
  SELECT regions.region_id , regions.region_name, country_name,city
 FROM countries, regions, locations
WHERE regions.region_id = countries.region_id
    AND countries.country_id = locations.country_id
    AND regions.region_name = 'Europe';
 -- join 10
  SELECT regions.region_id , regions.region_name, country_name,city, department_name
 FROM countries, regions, locations, departments
WHERE regions.region_id = countries.region_id
    AND countries.country_id = locations.country_id
    AND locations.location_id = departments.location_id
    AND regions.region_name = 'Europe';
    
 --join 11
   SELECT regions.region_id , regions.region_name, country_name,city, department_name , first_name||last_name name
 FROM countries, regions, locations, departments, employees
WHERE regions.region_id = countries.region_id
    AND countries.country_id = locations.country_id
    AND locations.location_id = departments.location_id
    and departments.department_id = employees.department_id
    AND regions.region_name = 'Europe';
 --join 12
 SELECT employee_id , first_name||last_name name , jobs.job_id, jobs.JOB_TITLE
 FROM employees,jobs
 WHERE jobs.job_id = employees.job_id;
 --join 13
 SELECT e.manager_ID  mgr_id, 
 m.first_name||m.last_name ,
 e.employee_id ,e.first_name||e.last_name name,
 jobs.JOB_ID,
 jobs.JOB_TITLE
 FROM employees e ,jobs, employees m
 WHERE e.job_id =jobs.job_id
    AND e.manager_id =m.employee_id;
 

 
 