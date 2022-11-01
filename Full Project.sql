
--lab01
----------------------------------------------------drop the tables------------------------------------------------------------------------------

drop table Bill;
drop table feedbacks;
drop table Appoints_for;
drop table Services;
drop table customers;
drop table employee;



----------------------------------------------------creating tables----------------------------------------------------------------------------

create table Services(
    s_id number(11) NOT NULL,
    s_prize number(11),
    s_details varchar(255),
    s_name varchar(40),
    primary key (s_id)
);
--alter table Services add constraint Service_pk primary key(s_id);

create table customers(
    c_id number(11) NOT NULL,
    c_address varchar(30),
    c_email varchar(25),
    c_phone number(11) default NULL,
    c_name varchar(25),
    primary key (c_id)
);
--alter table customers add constraint customers_pk primary key(c_id);

create table Appoints_for(
    appoint_no number(11) NOT NULL,
    s_id number(11) NOT NULL,
    c_id number(11) NOT NULL,
    app_date varchar(20) default sysdate,
    primary key (appoint_no),
    foreign key (s_id) references Services on delete cascade,
    foreign key (c_id) references customers on delete cascade
);
--alter table Appoints_for add constraint Appoint_for_pk primary key(appoint_no);
--alter table Appoints_for add constraint Appoint_for_fk1 foreign key(s_id) references Services;
--alter table Appoints_for add constraint Appoint_for_fk2 foreign key(c_id) references customers;


create table feedbacks(
    f_no number(11) NOT NULL,
    f_date varchar(20) default sysdate,
    f_details varchar(255),
    c_id number(11) NOT NULL,
    primary key (f_no),
    FOREIGN KEY(c_id) REFERENCES customers(c_id) on delete cascade
);
--alter table feedbacks add constraint feedbacks_pk primary key(f_no);
--alter table feedbacks add constraint feedbacks_fk foreign key(c_id) references customer;

create table employee(
e_id number(11) NOT NULL,
e_phone number(11),
e_email varchar(30),
e_name varchar(25),
e_salary varchar(30) check(e_salary<30000),
e_address varchar(30),
joining_date varchar(30),
primary key (e_id)
);
--alter table employee add constraint employee_pk primary key(e_id);

create table Bill(
    b_no number(11) NOT NULL,
    b_amount number(20),
    b_date varchar(20) default sysdate,
    appoint_no number(11) NOT NULL,
    e_id number(11) NOT NULL,
    primary key (b_no),
    foreign key (appoint_no) references customers on delete set null,
    foreign key (e_id) references employee on delete cascade
    --foreign key (e_id) references employee on update cascade
    --foreign key (e_id) references employee on delete no action --not supported
    --foreign key (appoint_no) references employee on delete cascade on update cascade --together use of on update cascade and on delete cascade
     --in oracle 10g on update cascade or on update set null is not supported
);

--lab 03:
--alter table Bill add CONSTRAINT pk_key PRIMARY KEY (b_no);
--alter table Bill add constraint FK_key1 foreign key (appoint_no) references Appoints_for;
--alter table Bill add constraint FK_key2 foreign key (e_id) references employee;
--describe the tables
------------------------------------------------describe the tables-------------------------------------------------------------------------
describe Bill;
describe feedbacks;
describe Appoints_for;
describe Services;
describe customers;
describe employee;
---------------------------------------------------------triggers----------------------------------------------------------------
--create trigger to show old value and new value
create or replace trigger service_price_diff before insert or update on Services
for each row
begin
dbms_output.put_line('new price ' || :new.s_prize);
dbms_output.put_line('old price ' || :old.s_prize);
end;
/
-- trigger to avoid unpredictable input into employee
create or replace trigger check_salary before insert or update on employee
for each ROW
declare 
min_sal number :=5000;
max_sal number := 30000;
begin
if :new.e_salary>max_sal or :new.e_salary<5000 then
RAISE_APPLICATION_ERROR(-2000, 'new salary is too small or large');
end if;
end;
/
------------------------------------------------------inserting values in tabkes------------------------------------------------------
set serveroutput on;
begin
--inserting values for Services table
insert into Services (s_id,s_prize,s_details,s_name)values (1,5000,'rubbing,pressing,stroking and 
manipulating foot muscels inspecifiec manner; we provide traditional therapeutic technique',
'foot_massage');
insert into Services (s_id,s_prize,s_details,s_name)values (2,3000,'hot stone pedicures,gel pedicures
mini pedicures, regular pedicures', 'pedicures');
insert into services (s_id,s_prize,s_details,s_name)values (3,3050,'basic,gel,french and de',
'manicure');ep powder
insert into services (s_id,s_prize,s_details,s_name)values (4,3050,'your muscels will release any tension they might have built.',
'back treatment');
insert into services (s_id,s_prize,s_details,s_name)values (5,5000,'this treatment will help you to remove your 
body hair or your facial hair','waxing');
insert into services (s_id,s_prize,s_details,s_name)values (6,5000,'treatment on face such as messages, cleansing,
exfoliating and moisturising', 'facial');
insert into services (s_id,s_prize,s_details,s_name)values (7,4000,'help you to get your stress out','anti strees treatment');
insert into services (s_id,s_prize,s_details,s_name)values (8,4000,'this treatment is for whom who want to target their acne','led facial');
insert into services (s_id,s_prize,s_details,s_name)values (9,2000,'the face is cleansed and exfoliated before a wand delivers a high-pressure
 stream of oxygen to the skins surface','oxygen facial');
 insert into services (s_id,s_prize,s_details,s_name)values (10,4050,'decreases the signs of aging','anty aging treatment');

 commit;
 dbms_output.put_line('value insereted into services table');
 end;
 /
 select * from services;

 --inserting values into the customers table.
 set serveroutput on;
 begin
 insert into customers (c_id,c_address,c_name,c_phone,c_email) values(1,'Dhaka','Neha',01734562712,'neha@stud.kuet.ac.bd');
 insert into customers (c_id,c_address,c_name,c_phone,c_email) values(2,'Dhaka','Joty',01734000198,'joty@stud.kuet.ac.bd');
 insert into customers (c_id, c_address,c_name,c_phone,c_email) values(3,'Rajshahi','Avi',01318755423,'avi@stud.kuet.ac.bd');
 insert into customers (c_id, c_address,c_name,c_phone,c_email) values(4,'Rajshahi','Aroni', 01735672727,'aroni@stud.kuet.ac.bd');
 insert into customers (c_id, c_address,c_name,c_phone,c_email) values(5,'Rangpur','Promi',01318755234,'promi@stud.kuet.ac.bd');
 insert into customers (c_id, c_address,c_name,c_phone,c_email) values(6,'Dinajpur','Barsha',01318755567,'barsha@stud.kuet.ac.bd');
 insert into customers (c_id, c_address,c_name,c_phone,c_email) values(7,'Dhaka','Neha',01734562712,'neha@stud.kuet.ac.bd');
 insert into customers (c_id, c_address,c_name,c_phone,c_email) values(8,'Dinajpur','Mifra',01734562220,'mifra@stud.kuet.ac.bd');
 insert into customers (c_id, c_address,c_name) values(9,'Saidpur','Sabbir');
 insert into customers (c_id, c_address,c_name,c_phone,c_email) values(10,'Dhaka','Nafia',01734562234,'nafia@stud.kuet.ac.bd');
 insert into customers (c_id, c_address,c_name,c_phone,c_email) values(11,'Dhaka','Tuna',01734000191,'tuna@stud.kuet.ac.bd');
 insert into customers (c_id, c_address,c_name,c_phone,c_email) values(12,'Dhaka','Neha',01734562712,'neha@stud.kuet.ac.bd');
 insert into customers (c_id, c_address,c_name,c_phone,c_email) values(13,'Rajshahi','Avi',01318755423,'avi@stud.kuet.ac.bd');
 insert into customers (c_id, c_address,c_name,c_phone,c_email) values(14,'Rangpur','Promi',01318755234,'promi@stud.kuet.ac.bd');
 insert into customers (c_id, c_address,c_name,c_phone,c_email) values(15,'Dhaka','joty',01318755423,'joty@stud.kuet.ac.bd');

 commit;
 dbms_output.put_line('value insereted into customers table');
 end;
 /
select * from customers;

 --inserting values into the employee table
 set serveroutput on;
 begin

 insert into employee(e_id,e_name,e_phone, e_address,e_email,e_salary,joining_date) values(001,'Amena',01922731657,'Kumilla','Amena@gmail.com',
 10000,'3-july-2020');
 insert into employee(e_id,e_name,e_phone,e_address,e_email,e_salary,joining_date) values(002,'Sayma Sultana Nuha',0184567890,'Dhaka',
 'sayma@gmail.com', 6000,'20-january-2020');
 insert into employee(e_id,e_name,e_phone, e_address,e_email,e_salary,joining_date) values(003,'Kirti Shanon', 01773897214,'Dhaka',
 'kirti123@gmail.com', 6000,'20-january-2020');
 insert into employee(e_id,e_name,e_phone, e_address,e_email,e_salary,joining_date) values(004,'Khadija Akter', 01773897256,'Nilphamari',
 'Khadija@gmail.com', 6000,'20-january-2020');
 insert into employee(e_id,e_name,e_phone, e_address,e_email,e_salary,joining_date) values(005,'Amena', 01704278445,'Nilphamari',
 'amena222@gmail.com', 16000,'23-january-2019');
 insert into employee(e_id,e_name,e_phone, e_address,e_email,e_salary,joining_date) values(006,'Mehjabin', 01704278554,'Dhaka',
 'mehjabi@gmail.com', 15000,'23-january-2019');
insert into employee(e_id,e_name,e_phone, e_address,e_email,e_salary,joining_date) values(007,'Mahbuba', 01704278000,'Rajshahi','Mahbuba@gmail.com', 15000,'23-january-2019');
insert into employee(e_id,e_name,e_phone, e_address,e_email,e_salary,joining_date) values(008,'Nazri', 01704278111,'Rangpur',
'nazri@gmail.com', 15000,'2-December-2019');
--insert into employee(e_id,e_name,e_phone, e_address,e_email,e_salary,joining_date) values(009,'Marzia', 01704270011,'Rangpur',
--'marzia@gmail.com', 4000,'2-December-2019');

--insert into employee(e_id,e_name,e_phone, e_address,e_email,e_salary,joining_date) values(009,'Nazrul', 01704278331,'Rangpur',
--'nazrul@gmail.com', 32000,'2-December-2019');--this row will not be inserted, because it violates the check constraint

commit;
dbms_output.put_line('value insereted into employee table');
end;
/
select * from employee;

--inserting values into the Bill table  
--
set serveroutput on;
begin
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(1,5000,'4-May-2019',1,004);
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(2,5000,'4-May-2019',2,004);
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(3,4000,'3-July-2020',4,003);
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(4,3050,'14-January-2022',5,004);
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(5,4000,'3-July-2020',3,004);
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(6,3050,'10-March-2022',7,004);
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(7,3000,'20-May-2022',6,003);
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(8,4000,'4-July-2020',9,004);
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(9,4000,'3-July-2020',8,004);
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(10,5000,'14-January-2022',10,004);
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(11,2000,'4-May-2019',11,003);
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(12,10000,'14-January-2022',12,004);
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(13,2000,'4-May-2019',13,003);
commit;
dbms_output.put_line('value insereted into bill table');
end;
/
select * from bill;
--inserting values for the table Appoints_for
set serveroutput on;
begin
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(1,1,1,'4-May-2019');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(2,6,3,'4-May-2019');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(3,7,4,'3-July-2020');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(4,8,6,'4-July-2020');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(5,4,15,'14-January-2022');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(6,2,1,'4-May-2019');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(7,3,3,'10-March-2022');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(8,7,4,'3-July-2020');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(9,8,6,'4-July-2020');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(10,5,15,'14-January-2022');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(11,9,8,'4-May-2019');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(12,10,3,'4-September-2019');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(13,7,4,'3-July-2020');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(14,8,6,'4-July-2020');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(15,4,15,'14-January-2022');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(16,5,1,'4-May-2019');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(17,6,3,'4-May-2019');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(18,7,4,'20-May-2022');

commit;
dbms_output.put_line('value insereted into appoint_for table');
end;
/
select * from Appoints_for;
--inserting values into the feedbacks table

set serveroutput on;
begin
insert into feedbacks(f_no,c_id,f_date,f_details) values (1,1,'5-May-2019','owesome services');
insert into feedbacks(f_no,c_id,f_date,f_details) values (2,3,'5-May-2019','there behaviors were awesome');
insert into feedbacks(f_no,c_id,f_date,f_details) values (3,3,'5-May-2019','one of the best services I have ever had');
insert into feedbacks(f_no,c_id,f_date,f_details) values (4,4,'21-May-2022','they were awesome,also they gave me discount');
insert into feedbacks(f_no,c_id,f_date,f_details) values (5,6,'6-July-2020','best services ever');
insert into feedbacks(f_no,c_id,f_date,f_details) values (6,15,'20-January-2022','they took best care for my hair');
insert into feedbacks(f_no,c_id,f_date,f_details) values (7,3,'10-March-2022','anybody can take their services');
insert into feedbacks(f_no,c_id,f_date,f_details) values (8,8,'5-May-2019','best quality services within budget');
commit;
dbms_output.put_line('value insereted into feedbacks table');
end;
/
select * from feedbacks;
-----------------------------------------------view all data from selected table--------------------------------------------------------------

select * from Services;
select * from customers;
select *from employee;
select *from Appoints_for;
select * from Bill;
select * from feedbacks;
--------------------------------------------------query---------------------------------------------------------------------------------------

--view specifiec data/attribute from the table

select s_id,s_prize from Services;
select s_id  as Service_id from Services; 
--s_id will be rename temporarily as Service_id

--lab 02
/*modifications(modification will generate by
alter, update, delete commands.
this commands are DDL. Thus they changes in tables and the change are permanent) in the tables and table columns such as 
1.rename table 
2.rename  columns
3.change columns data type
4.change columns position
5.add columns
6.add constants
7.delete columns*/

--change table name
alter table Services rename to Service_name;
 --rename Services to Service_name
alter table Service_name rename to Services; 
--rename Service_name to Services

--change table columns name
alter table Services rename column s_id to service_id; 
--rename s_id to service_id
alter table Services rename column service_id to s_id;
alter table Appoints_for rename column appoint_no to appoint_id;
alter table Appoints_for rename column appoint_id to appoint_no;

--modify columns
alter table Services modify s_prize number(30);
--change columns data type
--alter table Services modify s_prize varchar(255);
--this modification will not complete because s_prize is not empty. we can change the data type only when the column is empty
alter table Services modify(s_id number(20), s_prize number(25),s_name varchar(50));
--multiple columns modifications also permited

--add column
alter table Services add s_category varchar(255);
--single column added
alter table Services add (s_given_time varchar(255), special_service varchar(255));
--multiple columns added    


--drop column
alter table Services drop column s_category;
--single column remove
alter table Services drop (s_given_time, special_service);
--multiple columns dropped
--delete  row for apecifiec conditon
delete from Bill where appoint_no =1;
--update value for apecifiec conditon
update Bill set b_amount = 6000 where b_no=1;
update Bill set b_amount = 5000 where b_no=1;

--lab 03
--on delete cascade , on delete set null, check constraint described previously in ddl

--select clause operations are given below:
select * from employee where e_salary = 15000;
select e_id, e_name from employee where e_salary = 15000;
select e_id, e_name from employee where e_salary = 15000 or e_salary=10000;
select e_id, e_name from employee where e_salary in(10000,15000);
--or an in works same as above 
select e_id, e_name from employee where e_salary BETWEEN 10000 AND 15000;
select e_id, e_name from employee where e_salary>10000 and e_address='Dhaka';
--order by:
select * from employee ORDER BY e_salary;
select e_salary from employee order by e_salary desc;
select sum(e_salary) from employee;
select DISTINCT(e_salary) from employee;
select (e_salary/1000) from employee;
select DISTINCT(e_salary/1000) from employee;
select DISTINCT(e_salary/1000) from employee where e_address='Dhaka';
select e_salary from employee where e_salary not BETWEEN 6000 AND 10000;
select e_salary from employee where e_salary BETWEEN 6000 AND 10000;
select e_salary from employee where e_salary>=6000 and e_salary<=10000;
select e_address, e_salary from employee where e_address like '%hak%';
select e_address, e_salary from employee where e_address like 'hak%';
select e_address, e_salary from employee where e_address like '_hak_';
select e_address, e_salary from employee where e_address like '_h_k_';
select e_address, e_salary from employee where e_address like 'R%_';
select e_address, e_salary from employee where e_address like 'R%r';
insert into Bill(b_no,b_amount,b_date,appoint_no,e_id) values(1,5000,'4-May-2019',1,004);
select b_amount, e_id from Bill ORDER BY b_amount, e_id;
select b_amount, e_id from Bill ORDER BY b_amount, e_id desc;
select b_amount, e_id from Bill ORDER BY b_amount desc, e_id;
delete from feedbacks where f_no=8;
-------------------------------------------------------------------------------------group by,order by------------------------------------------------
--group by, having , aggregate function;
--eki namer alada sohorer kojon ace
select e_name, count(e_address) from employee group by e_name;
select e_address, count(e_name) from employee group by e_address having count(e_name)>2;
select e_address, count(e_name) from employee group by e_address having count(e_name)>1 order by count(e_name), desc;
select  count(c_email) from customers;
select  count(all c_email) from customers;
select  count(*) from customers;
select  count(1) from customers;
 select avg(b_amount) from Bill;
 select avg(nvl(b_amount,0)) from Bill;
 select count(b_amount) from Bill;
 --count without null
 select count(nvl(b_amount,0)) from Bill;
 --count with null. 
 select max(b_amount) from Bill;
 select min(b_amount) from Bill;
select s_id, count(c_id) from Appoints_for group by s_id having count(c_id) >3;

------------------------------------------------------------------------sub query------------------------------------------------------------

--lab 05(sub query)
--find employee who's salry is more than the avg salry earned by all employee
select e_id,e_salary from employee where e_salary>(select avg(e_salary) from employee);
--find the customers who  pay 3000;
select c_id from Appoints_for where appoint_no in (select appoint_no from Bill where b_amount=3000);
--find the employee who dont have join at 20-January-2022'
select e_id, e_name from employee e where joining_date not in(select joining_date from employee where joining_date='20-January-2020');
--find the id of the customer who have paid 5000;

--join-------------------------

select Appoints_for.c_id from Bill,Appoints_for where Bill.appoint_no= Appoints_for.appoint_no and Bill.b_amount=5000;
--find the customer phone no who have paid 5000;
select customers.c_phone from customers where customers.c_id 
in(select Appoints_for.c_id from Bill,Appoints_for where Bill.appoint_no= Appoints_for.appoint_no and Bill.b_amount=5000);
--find the customer phone no who have paid 5000 with aliasing;
select c.c_phone from customers c where c.c_id 
in(select a.c_id from Bill b,Appoints_for a where b.appoint_no= a.appoint_no and b.b_amount=5000);
--same effect by join following above
select c.c_phone from customers c where c.c_id 
in(select a.c_id from Bill b join Appoints_for a on b.appoint_no= a.appoint_no and b.b_amount=5000);
--
select a.c_id from Bill b join Appoints_for a using(appoint_no);
----natural join
select a.c_id from Bill b natural join Appoints_for a;

-----------------------------------------------------pl/sql-------------------------------------------------------------------------------------
--find employee salary where employee id is 4
set serveroutput on;
declare 
salary employee.e_salary%type;
BEGIN
select e_salary into salary from employee where e_id=4;
dbms_output.put_line('employee salary whoes id is 4 is '||salary);
end;
/

--find employee name and id where salary is 16000

set serveroutput on;
declare 
name employee.e_name%type;
id employee.e_id%type;
salary employee.e_salary%type;
BEGIN
select e_id, e_name into id,name from employee where e_salary=16000;
dbms_output.put_line('employee_id: '||id||' and employee_name: '||name);
end;
/
---------------------------------------------function--------------------------------------------------------------------------------
--function to find the total no of employee  whose salary is 6000;

create or REPLACE function find_employee_no
return number IS
count_employee number(11) := 0;
BEGIN
   select count(*) into count_employee from employee where e_salary=6000;
   return count_employee;
END;
/
--calling function to find the total no of employee whose salary is 6000;
set serveroutput on;
declare
count_no number(11);
BEGIN
   count_no := find_employee_no();
   dbms_output.put_line('total no of employee whose salary is 6000 is '||count_no);
END;
/

--function to find the avg no of bill where bill amount is>4000
create or replace function avg_bill
return number IS
avg_bill_count number(11):= 0;
BEGIN
    select avg(b_amount) into avg_bill_count from bill where b_amount>4000;
    return avg_bill_count;
end;
/
--calling function
set serveroutput on;
declare
a_b number(11,2);
BEGIN
a_b :=avg_bill();

dbms_output.put_line('avg bill '||a_b);
end;
/
------------------------------------------loop-------------------------------------------------------------------------------------------

--increase the salary of the employee 10% whoes salary is less than 6000, also find their name and id
set serveroutput on;
BEGIN
   for e in(select * from employee) LOOP
    if e.e_salary < 10000 then
    e.e_salary := e.e_salary+ (e.e_salary*.10);
    dbms_output.put_line('id '|| e.e_id||'name '|| e.e_name||'salary '|| e.e_salary);
    end if;
    end loop;
END;
/

--Showing every bill with bill id and appoint_no including their disCountCharge using PL/SQL
--discount 10% for bill 2000-3000
--discount 20% for bill 3000-4000
--discount 30% for bill 4000-5000

set serveroutput on;
begin
for b in(select * from bill) loop
if b.b_amount <= 2000 and b.b_amount>3000 then
b.b_amount:= b.b_amount - (b.b_amount*.10);
dbms_output.put_line('discount_bill '||b.b_amount||' id is '||b.b_no||' and app_id is '||b.appoint_no);
elsif b.b_amount <= 3000 and b.b_amount>4000 then
b.b_amount:= b.b_amount - (b.b_amount*.20);
dbms_output.put_line('discount_bill '||b.b_amount||' id is '||b.b_no||' and app_id is '||b.appoint_no);
elsif b.b_amount <= 4000 and b.b_amount>5000 then
b.b_amount:= b.b_amount - (b.b_amount*.30);
dbms_output.put_line('discount_bill '||b.b_amount||' id is '||b.b_no||' and app_id is '||b.appoint_no);

ELSE
    b.b_amount:= b.b_amount - (b.b_amount*.30);
dbms_output.put_line('discount_bill '||b.b_amount||' id is '||b.b_no||' and app_id is '||b.appoint_no);
end if;

end loop;
end;
/

--Write an anonymous block to find the id's of the employee whoes salary is less than a predefined value
set serveroutput on;
declare
predefined_value number := 16000;
emp_id employee.e_id%type;
begin
for b in(select * from employee) loop
if b.e_salary<predefined_value then
dbms_output.put_line('id of employee with salary of predefined_value is '||b.e_id);
end if;
end loop;
end;
/

--Write an anonymous block to find the id's of the employee whoes salary is greater than a predefined value
set serveroutput on;
declare
predefined_value number := 6000;
emp_id employee.e_id%type;
begin
for b in(select * from employee) loop
if b.e_salary>predefined_value then
dbms_output.put_line('id of employee with salary of predefined_value is '||b.e_id);

end if;
end loop;

end;
/
---------------------------------------------------------------conditional statements----------------------------------------------

--Showing maximum bill including their disCountCharge using PL/SQL
--discount 10% for bill 2000-3000
--discount 20% for bill 3000-4000
--discount 30% for bill 4000-5000

set serveroutput on;
declare
discount_bill number(6,2);
normal_bill bill.b_amount%type;
begin
select max(b_amount) into normal_bill from bill;
if normal_bill <= 2000 and normal_bill>3000 then
discount_bill:= normal_bill - (normal_bill*.10);
elsif normal_bill <= 3000 and normal_bill>4000 then
discount_bill:= normal_bill - (normal_bill*.20);
elsif normal_bill <=4000 and normal_bill<5000 then
discount_bill:= normal_bill - (normal_bill*.30);
elsif normal_bill = 5000 then
discount_bill:= normal_bill - (normal_bill*.40);
ELSE
discount_bill:= normal_bill - (normal_bill*.40);
end if;

dbms_output.put_line('discount_bill is : '||discount_bill);
end;
/



--Write an anonymous block to find the id of the employee whoes salary is equal to the predefined value 16000

set serveroutput on;
declare
predefined_value number := 16000;
emp_id employee.e_id%type;
begin
select e_id into emp_id from employee where e_salary = predefined_value;
dbms_output.put_line('id of employee having salary of predefined_value is '||emp_id);
end;
/






--summation of two user input data 
set serveroutput on;
declare
val1 number;
val2 number;
v3 number;
begin
val1 := 5;
val2 := 7;
v3 := val1 + val2;
dbms_output.put_line('sum is '||v3);
end;
/
-- other way to declare above section
set serveroutput on;
declare
val1 number := &v1forsum;
val2 number := &v2forsum;
v3 number;
begin

v3 := val1 * val2;
dbms_output.put_line('mulplication is '||v3);  
end;
/

-------------------------------------------------procedure in pl/sql-----------------------------------------------------

--Insertion into APPOINTMENT table using PROCEDURE

create or replace procedure customersInsert(cus_id customers.c_id%type, cus_address customers.c_address%type, cus_name customers.c_name%type,
 cus_phone customers.c_phone%type,
cus_email customers.c_email%type) is 
begin
insert into customers (c_id,c_address,c_name,c_phone,c_email) values (cus_id,cus_address, cus_name, cus_phone,cus_email);
commit;
end customersInsert;
/

----Calling the PROCEDURE for Inserting into customers table
set serveroutput on;
begin
customersInsert(16,'Dhaka','katrina kaif',01734562456,'kaif@stud.kuet.ac.bd');
end;
/
select * from customers;
--Update into Bill table using PROCEDURE

create or replace procedure bill_upd(bill_no Bill.b_no%type, bill_amount Bill.b_amount%type) is
begin
update Bill set b_amount = bill_amount where b_no=bill_no;
commit;
end bill_upd;
/
--Calling the PROCEDURE for Updating into bill table
begin
bill_upd(13,7000);
end;
/
select * from bill;


--Deleting from PATIENT table using PROCEDURE
create or replace procedure del_customer(del_id customers.c_id%type) is
begin
delete from customers where c_id = del_id;
end del_customer;
/
--Calling the PROCEDURE for Delating from customers
set serveroutput on;
begin
del_customer(16);
end;
/
select * from customers;

-----------------------------------------------------------transaction management------------------------------------------------------------------------------------------------
SELECT * FROM employee;
DELETE FROM employee;
SELECT * FROM employee;
ROLLBACK;
SELECT * FROM employee;
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(19,8,6,'4-July-2020');
SAVEPOINT INSERT19;
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(20,4,15,'14-January-2022');
SAVEPOINT INSERT20;
ROLLBACK to INSERT19;
select * from Appoints_for;
 
select sysdate from dual;
select CURRENT_DATE from dual;
select systimestamp from dual;
select sysdate, add_months(sysdate,2) as add_months_result from dual;
select sysdate, add_months(sysdate,-2) as add_months_result from dual;
select add_months(app_date,2) as add_months_result from appoints_for where appoint_no =18;

alter table services drop primary key;

select max(s_prize) from Services;