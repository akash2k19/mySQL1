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

show tables ;

create table user(
    user_id integer auto_increment primary key ,
first_name varchar(1000) not null ,
last_name varchar(1000) not null ,
dob date,
email varchar(1000) not null ,
user_name varchar(1000) not null ,
password varchar(1000) not null ,
city varchar(100) not null ,
state varchar(100),
zipcode varchar(100),
status varchar(100) not null
);

create table products(
    product_id integer auto_increment primary key ,
    name varchar(1000) not null ,
    vendor varchar(1000) not null ,
    quantity integer not null ,
    cost integer not null ,
    currency varchar(3) not null

                     );

create  table  purchases(
    user_id integer not null ,
    product_id integer not null ,
    order_date datetime not null ,
    delivery_date datetime,
    primary key (user_id,product_id,order_date),
    foreign key (user_id)
    references user(user_id),
    foreign key (product_id)
    references products(product_id)

);

drop table purchases;

insert into user(first_name, last_name, dob, email, user_name, password, city, state, zipcode, status)
values ('aakaash','t','1999-05-25','aakaash@gmail.com','aakaash','aakaaash'
,'chennai','tailnadu','1111','inprogress');

insert into user(first_name, last_name, dob, email, user_name, password, city, state, zipcode, status)
values ('akash','t','1999-05-25','akash@gmail.com','akash','akash'
,'chennai','tailnadu','2222','approved');

insert into user(first_name, last_name, dob, email, user_name, password, city, state, zipcode, status)
values ('ash','t','1999-05-25','ash@gmail.com','ash','ash'
,'chennai','tailnadu','1111','inprogress');

select * from user;

insert into products(name, vendor, quantity, cost, currency)
values (
'apple','chennai organic farming',10,50,'INR'
                            );


insert into products(name, vendor, quantity, cost, currency)
values (
'orange','flipkart',10,50,'INR'
                            );


insert into products(name, vendor, quantity, cost, currency)
values (
'grape','Amazon',10,50,'INR'
                            );

select * from products;

insert into purchases values (
                              1,1,'1999-06-25 11:11:11',null
                             );

insert into purchases values (
                              2,2,'1999-06-25 11:11:11',null
                             );

delete from purchases where user_id=3 and product_id=3;

insert into purchases values (
                              3,3,'1999-06-25 11:11:11','1999-06-26 11:11:11'
                             );

select * from purchases;

create table users(
    user_id integer auto_increment primary key ,
    fname varchar(1000) not null ,
    lname varchar(1000) not null ,
    email varchar(100) not null ,
    username varchar(100) not null ,
    password varchar(100) not null ,
    city varchar(100) not null ,
    state varchar(100) ,
    zipcode varchar(100) ,
    status varchar(100) not null
);

create table pet(
    pet_id integer auto_increment primary key ,
    name varchar(1000) not null ,
    age integer not null ,
    dob date ,
    species varchar(1000) not null ,
    breed varchar(1000) not null ,
    size varchar(10000) not null ,
    height integer,
    weight integer not null
);

drop table adoption;

create table adoption(
    user_id integer,
    pet_id integer,
    application_start_dt date,
    stage varchar(1000),
    adoption_fee integer,
    expected_adop_dt  date


);

insert into test1.pet(name, age, dob, species, breed, size, height, weight) VALUES
('pink',10,'2017-6-6','dog','pomarian','small',2,6);

insert into test1.pet(name, age, dob, species, breed, size, height, weight) VALUES
('black',3,'2017-7-6','dog','pomarian','small',3,5);

insert into test1.pet(name, age, dob, species, breed, size, height, weight) VALUES
('white',7,'2017-6-8','dog','pomarian','large',6,9);



insert into test1.adoption (user_id, pet_id, application_start_dt, stage, adoption_fee, expected_adop_dt) VALUES
(1,1,'2019-11-11 11:11:11','applied',50,'2019-11-21 11:11:11');

insert into adoption (user_id, pet_id, application_start_dt, stage, adoption_fee, expected_adop_dt) VALUES
(2,2,'2019-11-11 11:11:11','completed',50,'2019-11-21 11:11:11');

insert into test1.adoption (user_id, pet_id, application_start_dt, stage, adoption_fee, expected_adop_dt) VALUES
(3,3,'2019-11-11 11:11:11','inprogress',50,'2019-11-21 11:11:11');

select * from adoption;


create table employees(
    first_name varchar(100),
    last_name varchar(100),
    office_code varchar(100),
    salary int,
    city varchar(100),
    state varchar(100),
    zip varchar(7)
);

insert into employees(first_name, last_name, office_code, salary, city, state, zip) VALUES
('panda','white','CHN',2000,'chennai','tamilnadu','ZNO');


insert into employees(first_name, last_name, office_code, salary, city, state, zip) VALUES
('panda2','white2','BGN',3000,'bangalore','karnataka','ZNO');



create  table offices(
    office_code varchar(100) primary key ,
    name varchar(200)
);


insert into offices(office_code, name) VALUES
('CHN','chennai');



select *
from employees where office_code in (select office_code from offices);

select *
from employees where office_code not in (select office_code from offices);


create table product(
    productname varchar(100) primary key ,
    productline varchar(100) not null ,
    buyprice int not null
);

insert into product(productname,productline,buyprice)
 values ('baby shirt','baby',100);

insert into product(productname,productline,buyprice)
 values ('baby pant','baby',150);

insert into product(productname,productline,buyprice)
 values ('adult shirt','adult',100);

insert into product(productname,productline,buyprice)
 values ('adult pant','adult',150);

select distinct productline from test1.product;

select * from test1.product;

select productline , avg(buyprice) from test1.product group by productline;

select productname,buyprice from test1.product p1 where buyprice > (
    select  avg(buyprice) from test1.product p2 where p2.productline=p1.productline
    group by productline
    );




create table  temp_employee(
    name varchar(100),
    allowance decimal(10,2),
    salary int
);

insert into temp_employee(name, allowance, salary) VALUES ('aakaash',10,1000);

insert into temp_employee(name, allowance, salary) VALUES ('aakaash2',22.31,2000);

insert into temp_employee(name, allowance, salary) VALUES ('aakaash3',11.31,3000.10);


drop table temp_employee;

create table temp_employee(
    name varchar(100),
    start_time timestamp,
    end_time timestamp
);
select * from test1.temp_employee;


create table temp_employee(
    name varchar(100),
salary int,
department varchar(1000)
);

insert into test1.temp_employee(name, start_time, end_time) VALUES ('aakaash','2019-12-12 9:00:00', '2019-12-12 18:00:00');


insert into test1.temp_employee(name, start_time, end_time) VALUES ('aakaash2','2019-12-12 10:00:00', '2019-12-12 17:00:00');

insert into test1.temp_employee(name, start_time, end_time) VALUES ('aakaash3','2019-12-12 10:00:00', '2019-12-14 17:00:00');

insert into test1.temp_employee(name, start_time, end_time) VALUES ('aakaash4','2019-11-12 10:00:00', '2019-12-24 17:00:00');



select hour(timediff(start_time,end_time)) from test1.temp_employee;

select name,end_time,hour(timediff(start_time,end_time)) as 'hours_worked' from test1.temp_employee;

select name,end_time,timestampdiff(hour,start_time,end_time) as 'hours_worked'
from test1.temp_employee;

select name,start_time,end_time,timestampdiff(day ,start_time,end_time) as 'day_worked'
from test1.temp_employee;

select hour(timediff(start_time,end_time)) from test1.temp_employee;

select name,start_time,end_time,timestampdiff(year ,start_time,end_time) as 'year_worked'
from test1.temp_employee;

drop table test1.temp_employee;

create table temp_employee(
    name varchar(100),
    salary int,
    city varchar(100)
);

set global local_infile = 1;

show variables like "local_infile";

load data local infile '/Users/aakaash/Downloads/salary.csv'
into table test1.temp_employee
fields terminated by ','
enclosed by ' " '
lines terminated by '/n';

drop table test1.temp_employee;

create table temp_employee(
    id integer primary key ,
    name varchar(100),
    salary integer,
    city varchar(100)
);

insert into test1.temp_employee(id, name, salary, city) VALUES (1,'aakaash',1000,'chennai');



create table permanent_employee(
    id integer primary key ,
    name varchar(100),
    salary integer,
    city varchar(100)
);

insert into test1.permanent_employee(id, name, salary, city) VALUES (1,'akash',2000,'chennai');

insert into test1.permanent_employee(id, name, salary, city) VALUES (2,'ash',3000,'bangalore');


create view test1.all_employee as
    select * from test1.temp_employee
union
select * from test1.permanent_employee;

select * from all_employee;

create view test1.all_employee_2 as
    select city, max(salary)as max_salary
from temp_employee, permanent_employee
group by city;

drop view all_employee_2;