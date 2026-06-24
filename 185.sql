with cte as (
    select d.name as Department, 
    e.name as Employee, 
    e.salary As Salary ,
    dense_rank() over(partition by d.name order by e.salary desc ) as ranks
from Employee as e
left join Department as d
on d.id = e.departmentId 
) select Department,Employee,Salary from cte 
where ranks <= 3;
