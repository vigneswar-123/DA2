
#CASE
   # WHEN condition1 THEN result1
   # WHEN condition2 THEN result2
   # ELSE result
#END


select * from emp;
select empname,salary,
case
when salary>=70000 then 'high'
when salary>= 50000 then 'medium'
when salary>=41000 then 'low_medium'
else 'low'
end as salary_category
from emp;

set sql_safe_updates=0;
UPDATE Emp
SET Salary =
CASE
    WHEN Department='IT' THEN Salary + 5000
    WHEN Department='HR' THEN Salary + 3000
    ELSE Salary + 2000
END;

#Why Use Cursor?

#Used when each row needs separate logic.

#Examples:
#Generate custom messages
#Calculate row-wise values
#Transfer data row by row
#Call procedures for each record


#Cursor Life Cycle
#1. DECLARE Cursor
#2. OPEN Cursor
#3. FETCH Data
#4. Process Data
#5. CLOSE Cursor
#6. DEALLOCATE Cursor









