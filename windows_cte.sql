use verri;
create table emp
(
empid int,
empname varchar(20),
department varchar(20),
salary int
);
insert into emp values
(1,"Ravi","HR",40000),
(2,"Priya","HR",50000),
(3,"John","IT",60000),
(4,"David","IT",70000),
(5,"Ram","IT",70000),
(6,"Anu","Sales",45000);
insert into emp values(7,"An","Sales",45000);
insert into emp values(8,"And","Sales",35000);
select * from emp;

#Row Number()
select empname,salary,
Row_number() over(order by salary desc) as rownum
from emp;

#rank()
select empname,
salary,
rank() over(order by salary desc)as rankno
from emp;

#dense_rank()
select empname,
salary,
dense_rank() over(order by salary desc) as denserank
from emp;

#lag()
select empname,
salary,
lag(salary) over(order by salary)as PreviousSalary
from emp;

#lead()
select empname,
salary,
lead(salary) over(order by salary) as NextSalary
from emp;

#Running Total(sum()+over())
select empid,
salary,
sum(salary) over(order by empid) as RunningTotal
from emp;

#CTE
with HighSalary as
(
select * from emp
where salary>50000
)
select * from HighSalary;

#CTE+DENSERANK()
with secrank as
(
select *,
dense_rank() over(order by salary desc) as dr
from emp
)
select *
from secrank
where dr=2;

#top3 salary
with topranks as
(
select *,
dense_rank() over(order by salary desc) as dr
from emp
)
select *
from secrank
where dr<=2;

#avg() as example of wf
select empname,
salary,
avg(salary) over(partition by department)as avg_sal
from emp;

#max()
select empname,salary,max(salary) over(partition by department)as max_sal
from emp;

#min()
select empname,salary,min(salary) over(partition by department)as min_sal
from emp;

#first_value()
select empname,salary,first_value(salary)
over(order by salary desc) as highest_salary
from emp;

#last_value()
select empname,salary,last_value(salary)
over(order by salary desc)as lowest_salary
from emp;

#correct use of last_value
#Start = First row of window
#End   = Last row of window

select empname,salary,last_value(salary)
over(
order by salary desc
rows between unbounded preceding
and unbounded following ) as lowest_salary
from emp;

#ntile()
select empname,salary,
ntile(3) over(order by salary) as quartile
from emp;

#single cte
with sal as
(
select * from emp where salary>50000
)
select * from sal;

#multiple ctes
with cte1 as
(
select * from emp
),
cte2 as
(
select * from cte1
where salary>50000
)
select * from cte2;



WITH numbers AS
(
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT *
FROM numbers;

#1. Create a New Table With Structure + Data
create table emp_backup as select * from emp;
select * from emp_backup;

#2. Create a New Table With Structure Only (No Data)
create table emp_str as select * from emp where 1=0;
desc emp_str;
select * from emp_str;

#3.Copy Exact Structure (Including Primary Key, Constraints, Indexes)(doesnot copy data)
create table emp_copy like emp;
desc emp_copy;
select * from emp_copy;


