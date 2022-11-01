insert into Services (s_id,s_prize,s_details,s_name)values (1,5000,'rubbing,pressing,stroking and 
manipulating foot muscels inspecifiec manner; we provide traditional therapeutic technique',
'foot_massage');
insert into Services (s_id,s_prize,s_details,s_name)values (2,3000,'hot stone pedicures,gel pedicures
mini pedicures, regular pedicures', 'pedicures');
insert into services (s_id,s_prize,s_details,s_name)values (3,3050,'basic,gel,french and deep powder',
'manicure');
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

 --inserting values into the customers table.
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

 --inserting values into the employee table

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

--inserting values into the Bill table

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


--inserting values for the table Appoints_for

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
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(19,8,6,'4-July-2020');
insert into Appoints_for(appoint_no,s_id,c_id,app_date) values(20,4,15,'14-January-2022');

--inserting values into the feedbacks table


insert into feedbacks(f_no,c_id,f_date,f_details) values (1,1,'5-May-2019','owesome services');
insert into feedbacks(f_no,c_id,f_date,f_details) values (2,3,'5-May-2019','there behaviors were awesome');
insert into feedbacks(f_no,c_id,f_date,f_details) values (3,3,'5-May-2019','one of the best services I have ever had');
insert into feedbacks(f_no,c_id,f_date,f_details) values (4,4,'21-May-2022','they were awesome,also they gave me discount');
insert into feedbacks(f_no,c_id,f_date,f_details) values (5,6,'6-July-2020','best services ever');
insert into feedbacks(f_no,c_id,f_date,f_details) values (6,15,'20-January-2022','they took best care for my hair');
insert into feedbacks(f_no,c_id,f_date,f_details) values (7,3,'10-March-2022','anybody can take their services');
insert into feedbacks(f_no,c_id,f_date,f_details) values (8,8,'5-May-2019','best quality services within budget');

commit;