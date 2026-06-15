select * from emp;
create index idx on emp(empid);
show index from emp;
drop index idx on emp;
desc emp;

#prtimary key index(automatically creates index)
alter table emp add primary key(empid);



#unique index
#no duplicate values
create unique index idx_name on emp(empname);

#composite index
create index idx_dept_sal on emp(department,salary);

alter table emp drop primary key;
 create index idx_empid on emp(empid);
 
explain
SELECT *
FROM Emp
WHERE Department='IT'
AND Salary>70000;

select*from emp order by salary desc 
limit 5;

drop index idx_dept_sal on emp;


/*
13. Clustered vs Non-Clustered
Interview Answer

Clustered Index

Actual data stored in index order.
Usually Primary Key.
Only one per table.

Non-Clustered Index

Separate structure with pointers.
Multiple allowed.

MySQL InnoDB:

PRIMARY KEY = Clustered Index
CREATE INDEX = Non-Clustered Index
Most Asked Index Interview Questions
Q1

What is an index?

Answer: A database object used to speed up data retrieval.

Q2

Does a Primary Key create an index?

Answer: Yes.

Q3

When should indexes be avoided?

Answer:

Small tables
Frequently updated columns
Low-cardinality columns (Gender, Yes/No)
Q4

How do you check index usage?

EXPLAIN SELECT ...
Q5

What is a Composite Index?

CREATE INDEX idx_dept_salary
ON Employees(Department, Salary);
Q6

Why are indexes not always good?

Answer: They improve reads but slow down inserts, updates, and deletes.
8/