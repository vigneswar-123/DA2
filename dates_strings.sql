# String and Date functions
select upper('hello');#HELLO
select lower('HellO');#hello
select length('hello');#5
select char_length('hello');#5
select concat('hello','-','world');#hello-world
select concat_ws('-','A','B','C');#A-B-C
select substring('HELLO',2,3);#ELL
select left('hello',2);#he
select right('hello',2);#lo
select trim(' hello ');#hello
select ltrim(' hello');#hello
select rtrim('hello ');#hello
select replace('hello','l','x');#hexxo
select reverse('hello');#olleh
select instr('hello','e');#2
select locate('e','hello');#2
select position('e' in 'hello');#2
select lpad('123',5,'0');#00123
select rpad('123',5,'0');#12300

select space(5);#     
select ascii('A');#65
select char(65 using utf8);#A
select find_in_set('b','a,b,c');#2
select format(12345.678,2);#12,345.68
select repeat('hi',3);#hihihi

#date functions
select curdate();#2026-06-12
select current_date();#2026-06-12
select now();#2026-06-12 17:27:54
select current_timestamp();#2026-06-12 17:28:32
select curtime();#17:29:02
select sysdate();#2026-06-12 17:29:23

#extract parts of date
select year('2026-06-12');#2026
select month('2026-06-12');#6
select day('2026-06-12');#12
select hour(now());#17
select minute(now());#32
select second(now());#52
select monthname('2026-06-12');#June
select dayname('2026-06-12');#Friday
select dayofmonth('2026-06-12');#12
select dayofyear('2026-06-12');#163
select quarter('2026-06-12');#2
select week('2026-06-12');#23

#date arithmetic
select date_add(curdate(),interval 5 day);#2026-06-17
select date_sub(curdate(),interval 5 day);#2026-06-07
select adddate(curdate(),10);#2026-06-22
select subdate(curdate(),10);#2026-06-02
select datediff('2026-06-12','2026-06-01');#11
select timestampdiff(year,'2005-07-31',curdate());#20

#date formating
select date_format(now(),'%d-%m-%y');#12-06-26
select str_to_date('12-06-26','%d-%m-%y');#2026-06-12

#last day / special dates
select last_day(curdate());#2026-06-30
select makedate(2026,100);#2026-04-10
select maketime(10,20,30);#10:20:30
select extract(year from now());#2026




#********************************
USE VERRI;
create table employee(ID INT PRIMARY KEY,JOIN_DATE DATE,FNAME TEXT,LNAME TEXT,DOD DATE);
INSERT INTO EMPLOYEE VALUES(1,'2026-06-13','VIGNESH','VERRIBOINA','2005-07-31');
INSERT INTO EMPLOYEE VALUES(2,'2026-06-12','VICKY','DON','2003-07-31'),
(3,'2026-05-13','UDAY','KIRAN','2002-07-31'),
(4,'2026-04-13','SANTHOSH','GOLLA','2005-09-13'),
(5,'2026-06-03','NANDHA','KISHOR','2006-09-23'),
(6,'2026-06-23','JOHN','JONES','1998-07-31'),
(7,'2026-06-17','RAHMAN','SHA','2000-07-31'),
(8,'2026-07-31','HARI','KUMAR','2007-07-31');
SELECT * FROM EMPLOYEE; 

set sql_safe_updates=0;


#age from dob of emp
select timestampdiff(year,DOD,curdate()) as age from empLOYEE;
ALTER TABLE employee ADD column age int;
update employee set age=timestampdiff(year,dod,curdate());
select * from employee;

#employees joined this month
select * from employee 
where 
month(join_date)=month(curdate())
and year(join_date)=year(curdate());


use verri;
create table orders(order_id int ,order_date date,oredered_product text,region text);
alter table orders add primary key(order_id);
alter table orders modify order_id int auto_increment;
alter table orders auto_increment=101;
desc orders;
insert into orders(order_date,oredered_product,region) values('2026-05-15','laptop','west');
select * from orders;

#last 30 days records
select * from orders 
where order_date>=curdate() - interval 30 day;

#full name
select concat(fname,' ',lname)as full_name
from employee;

#first 3 letters
select left(fname,3)
from employee;

#remove spaces
select trim(fname)
from employee;

