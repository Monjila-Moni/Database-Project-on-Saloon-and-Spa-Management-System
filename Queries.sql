--view all data from selected table

select * from Services;
select * from customers;
select *from employee;
select *from Appoints_for;
select * from Bill;
select * from feedbacks;

--view specifiec data/attribute from the table

select s_id,s_prize from Services;
select s_id  as Service_id from Services; --s_id will be rename temporarily as Service_id

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
alter table Services rename to Service_name; --rename Services to Service_name
alter table Service_name rename to Services; --rename Service_name to Services
alter table customers rename to cust;
alter table cust rename to customers;

--change table columns name
alter table Services rename column s_id to service_id; --rename s_id to service_id
alter table Services rename column service_id to s_id;
alter table Appoints_for rename column appoint_no to appoint_id;
alter table Appoints_for rename column appoint_id to appoint_no; 













