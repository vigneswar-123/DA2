select * from weather_forecast_data;

select date_format("2026-10-09",'%Y-%d-%m');
select quarter('2026-10-20');

SELECT LAST_DAY('2026-10-20');
SELECT YEAR('2026-10-20');
SELECT MONTH('2026-10-20');
SELECT DAY('2026-10-20');
SELECT DAYNAME('2026-10-20');
SELECT MONTHNAME('2026-10-20');

SELECT CURDATE();
SELECT sysdate();
select now();

select datediff(curdate(),'2026-06-10');
select date_add('2026-06-10',interval 1 YEAR);
select date_add('2026-06-10',interval 1 MONTH);
select date_add('2026-06-10',interval 1 DAY);

select date_sub('2026-06-10',interval 1 YEAR);
select date_sub('2026-06-10',interval 1 MONTH);
select date_sub('2026-06-10',interval 1 DAY);

select date_add('2026-06-10',interval 1 quarter);


select abs(datediff(curdate(),'2026-06-24'));
select*from emp;
select count(*) from emp where empname regexp '^r';

select count(*) from emp where empname regexp '^[rp]';
select*from emp where empid regexp '^[0-9]';
select count(*) from emp where empname regexp '^[p-r]';

select * from emp;


