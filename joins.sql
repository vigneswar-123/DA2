#inner join
select table2.roll_no,table1.firstname from table2
inner join table1
on table2.id=table1.id;

#left join
select table2.roll_no,table1.firstname from table2
left join table1
on table1.id=table2.id;

#right join
select table2.roll_no,table1.firstname from table2
right join table1
on table1.id=table2.id;

#left outer join
select table2.roll_no,table1.firstname from table2
left outer join table1
on table1.id=table2.id;

#right outer join
select table2.roll_no,table1.firstname from table2
right outer join table1
on table1.id=table2.id;

#full outer join
select table2.roll_no,table1.firstname from table2
left outer join table1
on table1.id=table2.id
union
select table2.roll_no,table1.firstname from table2
right outer join table1
on table1.id=table2.id;

use verri;
show tables;




