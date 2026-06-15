select * from emp;
create table emp_log(logid int auto_increment primary key,
message text);

desc emp;

# insert trigger after

delimiter \\
create trigger trg_af_in
after insert
on emp
for each row
begin
insert into emp_log(message)
values(concat('employee Added : ',new.empname));
end \\
delimiter ;

insert into emp values(9,'ravi kumar','IT',50000);
show index from emp;


select * from emp_log;

#update trigger after

delimiter \\
create trigger trg_aft_up
after update
on emp
for each row
begin
insert into emp_log(message) values(concat(old.empname,' salary changed from',old.salary,' to ',new.salary));
end\\
delimiter ;

update emp set salary=80000 where empid=1;

select *from emp_log;

#delete trigger after

delimiter \\
create trigger tr_af_de
after delete
on emp
for each row
begin
insert into emp_log(message)
values(concat('Deleted employee: ',old.empname));
end\\
delimiter ;

delete from emp where empid=9;
select * from emp_log;

#before trigger

delimiter \\
create trigger be_tr_prevneg
before insert
on emp
for each row
begin
if new.salary<0 then
set new.salary=0;
end if;
end\\
delimiter ;

insert into emp values(9,'ravi kumar','IT',-50000);
select * from emp;

/*
Q: Can we use AFTER INSERT instead of BEFORE INSERT to prevent negative salary?

A: We can conceptually correct the value after insertion, but the preferred approach is BEFORE INSERT because:

Invalid data never enters the table.
It is more efficient.
MySQL may restrict updating the same table inside an AFTER trigger.
Data integrity is maintained before storage.

So for validation and correction, BEFORE triggers are preferred, while AFTER triggers are mainly used for logging, auditing, and inserting into other tables.
*/

CREATE TABLE Backlogs (
    StudentID INT,
    StudentName VARCHAR(50),
    Subject VARCHAR(50)
);

CREATE TABLE NoBacklogs (
    StudentID INT,
    StudentName VARCHAR(50),
    Subject VARCHAR(50),
    ClearedDate DATETIME
);
alter table backlogs add column Status text;

DELIMITER $$

CREATE TRIGGER trg_backlog_status
AFTER UPDATE
ON Backlogs
FOR EACH ROW
BEGIN

    IF OLD.Status <> 'CLEARED'
       AND NEW.Status = 'CLEARED' THEN

        INSERT INTO NoBacklogs
        (
            StudentID,
            StudentName,
            Subject,
            ClearedDate
        )
        VALUES
        (
            NEW.StudentID,
            NEW.StudentName,
            NEW.Subject,
            NOW()
        );

    END IF;
END$$

set sql_safe_updates=0;
DELIMITER ;
insert into backlogs values(101,'vignesh','sql','not cleared');
select * from backlogs;
update backlogs set status='cleared' where studentid=101;
select * from nobacklogs;