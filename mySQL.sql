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


