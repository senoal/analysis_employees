-- check data
select * from datasource.regions r 

-- trial
select to_date('2021/01/02', 'YYYY/MM/DD')

SELECT to_char(timestamp '1993-09-13 10:41:35', 'Day') AS "Day";




-- view work duration
select
	*,
	date_part('year', end_date) - 
	date_part ('year', start_date) as working_duration
from datasource.job_history jh




-- view inner join
select 
	*
from datasource.employees e 
inner join datasource.jobs j 
	on e.job_id = j.job_id ;
	
select
	e.employee_id,
	e.salary,
	j.job_title 
from datasource.employees e
inner join datasource.jobs j
	on e.job_id = j.job_id;




-- view left Join
select
	*
from datasource.employees e
left join datasource.jobs j
	on e.job_id = j.job_id
left join datasource.employees manager
	on e.manager_id = manager.employee_id
limit 5;




-- view data job by employee id
select
--	j.job_title 
	*
from datasource.employees e
left join datasource.jobs j
	on e.job_id = j.job_id
--	where j.job_id = 100
where e.employee_id in (104,105,106,107)

select
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_id,
	d.department_name 
from datasource.employees e
left join datasource.departments d 
	on e.department_id = d.department_id 
where e.employee_id in (104,105,106,107)




-- view data by job id selected
select
	e.job_id,
	e.first_name,
	e.last_name,
	j.job_title,
	e.salary 
from datasource.employees e
left join datasource.jobs j 
	on e.job_id = j.job_id 
where not (j.job_id in ('AD_PRES', 'AD_VP',
'FI_MGR','AC_MGR', 'SA_MAN', 'PU_MAN','ST_MAN','MK_MAN'))
order by 5 desc 
limit 5




-- view total employees of departement by ascending
select
	d.department_name,
	count(e.employee_id) total_karyawan
from datasource.employees e
left join datasource.departments d 
	on e.department_id = d.department_id 
group by 1
order by 2 asc 




-- view average's salary of country by country name
select
	distinct c.country_name,
	avg(e.salary) as salary 
from datasource.employees e
left join datasource.departments d2 
	on e.department_id = d2.department_id 
left join datasource.locations l 
	on d2.location_id = l.location_id 
left join datasource.countries c 
	on l.country_id = c.country_id 
group by 1




-- view average of age
select
	distinct j2.job_title,
	date_part ('year', now()) - 
	date_part('year', e.hire_date) as usia
from datasource.employees e 
left join datasource.job_history jh 
	on e.employee_id = jh.employee_id 
left join datasource.jobs j2 
	on jh.job_id = j2.job_id 
group by 1,2




