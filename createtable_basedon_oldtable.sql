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