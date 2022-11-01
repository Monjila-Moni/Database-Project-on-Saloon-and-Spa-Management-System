
--lab01
--drop the tables

drop table Bill;
drop table feedbacks;
drop table Appoints_for;
drop table Services;
drop table customers;
drop table employee;



--creating tables

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
    app_date varchar(20),
    primary key (appoint_no),
    foreign key (s_id) references Services,
    foreign key (c_id) references customers
);
--alter table Appoints_for add constraint Appoint_for_pk primary key(appoint_no);
--alter table Appoints_for add constraint Appoint_for_fk1 foreign key(s_id) references Services;
--alter table Appoints_for add constraint Appoint_for_fk2 foreign key(c_id) references customers;


create table feedbacks(
    f_no number(11) NOT NULL,
    f_date varchar(20),
    f_details varchar(255),
    c_id number(11) NOT NULL,
    primary key (f_no),
    FOREIGN KEY(c_id) REFERENCES customers
);
--alter table feedbacks add constraint feedbacks_pk primary key(f_no);
--alter table feedbacks add constraint feedbacks_fk foreign key(c_id) references customer;

create table employee(
e_id number(11) NOT NULL,
e_phone number(11),
e_email varchar(30),
e_name varchar(25),
e_salary varchar(30),
e_address varchar(30),
joining_date varchar(30),
primary key (e_id)
);
--alter table employee add constraint employee_pk primary key(e_id);

create table Bill(
    b_no number(11) NOT NULL,
    b_amount number(20),
    b_date varchar(20),
    appoint_no number(11) NOT NULL,
    e_id number(11) NOT NULL,
    primary key (b_no),
    foreign key (appoint_no) references customers,
    foreign key (e_id) references employee
);

--lab 03:
--alter table Bill add CONSTRAINT pk_key PRIMARY KEY (b_no);
--alter table Bill add constraint FK_key1 foreign key (appoint_no) references Appoints_for;
--alter table Bill add constraint FK_key2 foreign key (e_id) references employee;
--describe the tables

describe Bill;
describe feedbacks;
describe Appoints_for;
describe Services;
describe customers;
describe employee;

