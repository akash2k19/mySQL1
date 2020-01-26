use test;

create database test1;

drop table employee;
use test1;
create table pet(name varchar(1000), age integer);
select * from department;
insert into pet values ("aakaash",19);
create table employee(emp_id integer,dep_id integer, name varchar(1000));
desc employee;
insert into employee values (3,2,"ash");
create table department(dept_id integer,name varchar(1000));
insert into department values (1,"innovation");
insert into department values (2,"architect");
select * from employee a join department b on a.dep_id =b.dept_id;
select a.emp_id,a.dep_id,b.name from employee a join department b on a.dep_id =b.dept_id;
insert into department values (3,'management');
select * from department where dept_id not in (select distinct dept_id from employee);
select * from employee a left join department b on a.dep_id =b.dept_id;
create table person (id integer NOT NULL auto_increment, first_name varchar(1000), last_name varchar(1000),primary key(id));
alter table person add age integer not null ;
select * from marks;
create table marks (name varchar(1000),mark integer);
insert into marks values ("a",70);
insert into marks values ("b",81);
insert into marks values ("c",61);
insert into marks values ("d",91);
insert into marks values ("e",51);

select name, sum(mark) from marks group by name;
drop table  register;
create table marks_new (student_name varchar(1000),score integer);
insert into marks_new values ("a",80);
select * from marks union select * from marks_new;
insert into marks_new values ("ab",94);
select * from marks union all select *from marks_new;
show tables ;
create table persons (
    id int not null,
    last_name varchar(1000) not null,
    first_name varchar(1000),
    age int,
    check ( age>=18 )
);
update marks set mark =100 where name = "a" and mark = 70;
delete from marks where name = "a" and mark=100;

create  table register(user_id integer primary key );
insert into register values (10);
create table product (
    product_name varchar(1000),
    product_id integer primary key,
    user_id integer,
    index (user_id),
    foreign key(user_id) references register(user_id));

insert into product values ("milk",1,10);
select * from product;
drop table staffs;


create table staffs
(staff_id integer auto_increment primary key ,
first_name varchar(1000),
last_name varchar(1000),
email varchar(1000),
phone integer,
active boolean,
store_id integer,
manager_id integer,
salary integer
);

insert into staffs (first_name, last_name, email, phone, active, store_id, manager_id,salary) VALUES (
                          'aakaash',
                           't',
                            'aakaash@gmail.com',
                            111111,
                            true,
                            3,
                            5,
                             200000

                                                                                               );

select *from staffs;

select a.first_name,a.last_name,
       b.first_name,b.last_name
from test1.staffs a
inner join test1.staffs b
on a.manager_id = b.manager_id;


select product_name from product
where id in (select product_id
    from order item
    where quantity >100);

select dept_id from department d where exists(
    select 1 from employee e where 'salary' > 100
    and   e.dep_id = d.dept_id
                                           );

select
round(avg(average_salary),0)
from (select avg('salary') average_salary
    from employee
    group by dep_id)department_salary;

select
manager_id,first_name,last_name
from staffs
where
manager_id =all (select
    min(salary)
    from staffs
    group by store_id)
order by  first_name,last_name;