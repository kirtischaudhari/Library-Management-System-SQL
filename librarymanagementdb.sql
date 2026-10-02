drop database if exists Library_Management_System;

create database Library_Management_System;

use Library_Management_System;

drop table if exists fines;
drop table if exists loans;
drop table if exists book_authors;
drop table if exists books;
drop table if exists members;
drop table if exists authors;
drop table if exists categories;


create table categories (
    category_id int primary key,
    category_name varchar(50) not null unique
);
select * from categories;

create table authors (
    author_id int primary key,
    author_name varchar(100) not null,
    country varchar(50)
);
select * from authors;

create table members (
    member_id int primary key,
    member_name varchar(100) not null,
    email varchar(100) unique,
    phone varchar(15),
    membership_date date,
    membership_type varchar(30),
    member_status varchar(20),
    check (member_status in ('Active', 'Inactive'))
);
select * from members;

create table books (
    book_id int primary key,
    title varchar(150) not null,
    isbn varchar(20) unique,
    category_id int,
    publication_year int,
    total_copies int,
    available_copies int,
    foreign key (category_id) references categories(category_id),
    check(total_copies >= 0),
    check(available_copies >= 0),
    check(available_copies <= total_copies)
);
select * from books;

create table book_authors (
    book_id int,
    author_id int,
    primary key (book_id, author_id),
    foreign key (book_id) references books(book_id),
    foreign key (author_id) references authors(author_id)
);
select * from book_authors;

create table loans (
    loan_id int primary key,
    member_id int,
    book_id int,
    issue_date date,
    due_date date,
    return_date date,
    loan_status varchar(10),
    foreign key (member_id) references members(member_id),
    foreign key (book_id) references books(book_id),
	check (loan_status in ('Issued', 'Returned')),
    check (due_date >= issue_date),
    check (return_date is null or return_date >= issue_date)
);
select * from loans;

create table fines (
    fine_id int primary key,
    loan_id int unique,
    fine_amount decimal(10,2),
    payment_status varchar(10),
    payment_date date,
    foreign key (loan_id) references loans(loan_id),
    check(fine_amount >= 0),
    check (payment_status in ('Paid', 'Pending'))
);
select * from fines;

insert into categories values
(1, 'Fiction'),
(2, 'Science'),
(3, 'Technology'),
(4, 'History'),
(5, 'Biography'),
(6, 'Mystery'),
(7, 'Fantasy'),
(8, 'Romance'),
(9, 'Self Help'),
(10, 'Business'),
(11, 'Horror'),
(12, 'Thriller'),
(13, 'Adventure'),
(14, 'Philosophy'),
(15, 'Psychology'),
(16, 'Education'),
(17, 'Travel'),
(18, 'Cooking'),
(19, 'Health'),
(20, 'Sports'),
(21, 'Art'),
(22, 'Poetry'),
(23, 'Drama'),
(24, 'Religion'),
(25, 'Politics'),
(26, 'Economics'),
(27, 'Finance'),
(28, 'Programming'),
(29, 'Engineering'),
(30, 'Mathematics'),
(31, 'Physics'),
(32, 'Chemistry'),
(33, 'Biology'),
(34, 'Geography'),
(35, 'Children'),
(36, 'Comics'),
(37, 'Literature'),
(38, 'Music'),
(39, 'Environment'),
(40, 'Reference');

insert into authors values
(1, 'Arjun Mehta', 'India'),
(2, 'Riya Sharma', 'India'),
(3, 'Daniel Smith', 'USA'),
(4, 'Emily Johnson', 'UK'),
(5, 'Michael Brown', 'USA'),
(6, 'Sophia Wilson', 'Canada'),
(7, 'James Anderson', 'UK'),
(8, 'Olivia Thomas', 'Australia'),
(9, 'William Taylor', 'USA'),
(10, 'Emma Martin', 'UK'),
(11, 'Noah Garcia', 'Spain'),
(12, 'Ava Martinez', 'Mexico'),
(13, 'Liam Robinson', 'USA'),
(14, 'Isabella Clark', 'Canada'),
(15, 'Ethan Lewis', 'UK'),
(16, 'Mia Walker', 'Australia'),
(17, 'Lucas Hall', 'USA'),
(18, 'Amelia Allen', 'India'),
(19, 'Benjamin Young', 'USA'),
(20, 'Charlotte King', 'UK'),
(21, 'Alexander Wright', 'USA'),
(22, 'Grace Harris', 'UK'),
(23, 'Henry Scott', 'Canada'),
(24, 'Ella Green', 'Australia'),
(25, 'Samuel Adams', 'USA'),
(26, 'Chloe Baker', 'UK'),
(27, 'Jack Nelson', 'USA'),
(28, 'Lily Carter', 'India'),
(29, 'Mason Mitchell', 'Canada'),
(30, 'Sofia Perez', 'Mexico'),
(31, 'Logan Roberts', 'USA'),
(32, 'Ella Turner', 'UK'),
(33, 'Owen Phillips', 'Australia'),
(34, 'Nora Campbell', 'Canada'),
(35, 'Leo Parker', 'USA'),
(36, 'Aria Evans', 'India'),
(37, 'Mateo Edwards', 'Spain'),
(38, 'Zoe Collins', 'UK'),
(39, 'Sebastian Stewart', 'USA'),
(40, 'Layla Sanchez', 'Mexico');

insert into members values
(1,'Aarav Patel','aarav.patel@gmail.com','9876500001','2024-01-10','Premium','Active'),
(2,'Diya Shah','diya.shah@gmail.com','9876500002','2024-01-15','Regular','Active'),
(3,'Rohan Mehta','rohan.mehta@gmail.com','9876500003','2024-02-01','Premium','Active'),
(4,'Anaya Desai','anaya.desai@gmail.com','9876500004','2024-02-10','Regular','Active'),
(5,'Vivaan Joshi','vivaan.joshi@gmail.com','9876500005','2024-02-15','Regular','Active'),
(6,'Isha Patel','isha.patel@gmail.com','9876500006','2024-03-01','Premium','Active'),
(7,'Aditya Shah','aditya.shah@gmail.com','9876500007','2024-03-12','Regular','Active'),
(8,'Myra Mehta','myra.mehta@gmail.com','9876500008','2024-03-20','Premium','Active'),
(9,'Arnav Desai','arnav.desai@gmail.com','9876500009','2024-04-01','Regular','Active'),
(10,'Sara Joshi','sara.joshi@gmail.com','9876500010','2024-04-10','Regular','Active'),
(11,'Kabir Patel','kabir.patel@gmail.com','9876500011','2024-04-20','Premium','Active'),
(12,'Aanya Shah','aanya.shah@gmail.com','9876500012','2024-05-01','Regular','Active'),
(13,'Reyansh Mehta','reyansh.mehta@gmail.com','9876500013','2024-05-10','Premium','Active'),
(14,'Kiara Desai','kiara.desai@gmail.com','9876500014','2024-05-20','Regular','Active'),
(15,'Atharv Joshi','atharv.joshi@gmail.com','9876500015','2024-06-01','Regular','Active'),
(16,'Navya Patel','navya.patel@gmail.com','9876500016','2024-06-10','Premium','Active'),
(17,'Dhruv Shah','dhruv.shah@gmail.com','9876500017','2024-06-20','Regular','Active'),
(18,'Avni Mehta','avni.mehta@gmail.com','9876500018','2024-07-01','Premium','Active'),
(19,'Yash Desai','yash.desai@gmail.com','9876500019','2024-07-10','Regular','Active'),
(20,'Tara Joshi','tara.joshi@gmail.com','9876500020','2024-07-20','Regular','Active'),
(21,'Kiaan Patel','kiaan.patel@gmail.com','9876500021','2024-08-01','Premium','Active'),
(22,'Shanaya Shah','shanaya.shah@gmail.com','9876500022','2024-08-10','Regular','Active'),
(23,'Krish Mehta','krish.mehta@gmail.com','9876500023','2024-08-20','Premium','Active'),
(24,'Anvi Desai','anvi.desai@gmail.com','9876500024','2024-09-01','Regular','Active'),
(25,'Rudra Joshi','rudra.joshi@gmail.com','9876500025','2024-09-10','Regular','Active'),
(26,'Aditi Patel','aditi.patel@gmail.com','9876500026','2024-09-20','Premium','Active'),
(27,'Veer Shah','veer.shah@gmail.com','9876500027','2024-10-01','Regular','Active'),
(28,'Riya Mehta','riya.mehta@gmail.com','9876500028','2024-10-10','Premium','Active'),
(29,'Ayan Desai','ayan.desai@gmail.com','9876500029','2024-10-20','Regular','Active'),
(30,'Meera Joshi','meera.joshi@gmail.com','9876500030','2024-11-01','Regular','Active'),
(31,'Dev Patel','dev.patel@gmail.com','9876500031','2024-11-10','Premium','Active'),
(32,'Saanvi Shah','saanvi.shah@gmail.com','9876500032','2024-11-20','Regular','Active'),
(33,'Arjun Mehta','arjun.mehta@gmail.com','9876500033','2024-12-01','Premium','Active'),
(34,'Nisha Desai','nisha.desai@gmail.com','9876500034','2024-12-10','Regular','Active'),
(35,'Vihaan Joshi','vihaan.joshi@gmail.com','9876500035','2024-12-20','Regular','Active'),
(36,'Pari Patel','pari.patel@gmail.com','9876500036','2025-01-01','Premium','Active'),
(37,'Aryan Shah','aryan.shah@gmail.com','9876500037','2025-01-10','Regular','Active'),
(38,'Anika Mehta','anika.mehta@gmail.com','9876500038','2025-01-20','Premium','Active'),
(39,'Darsh Desai','darsh.desai@gmail.com','9876500039','2025-02-01','Regular','Active'),
(40,'Mahi Joshi','mahi.joshi@gmail.com','9876500040','2025-02-10','Regular','Active'),
(41,'Samar Patel','samar.patel@gmail.com','9876500041','2025-02-20','Premium','Active'),
(42,'Ira Shah','ira.shah@gmail.com','9876500042','2025-03-01','Regular','Active'),
(43,'Atharv Mehta','atharv.mehta@gmail.com','9876500043','2025-03-10','Premium','Active'),
(44,'Vanya Desai','vanya.desai@gmail.com','9876500044','2025-03-20','Regular','Active'),
(45,'Manav Joshi','manav.joshi@gmail.com','9876500045','2025-04-01','Regular','Active'),
(46,'Rhea Patel','rhea.patel@gmail.com','9876500046','2025-04-10','Premium','Active'),
(47,'Aarush Shah','aarush.shah@gmail.com','9876500047','2025-04-20','Regular','Active'),
(48,'Zoya Mehta','zoya.mehta@gmail.com','9876500048','2025-05-01','Premium','Active'),
(49,'Kartik Desai','kartik.desai@gmail.com','9876500049','2025-05-10','Regular','Active'),
(50,'Aarohi Joshi','aarohi.joshi@gmail.com','9876500050','2025-05-20','Regular','Active'),
(51,'Ritvik Patel','ritvik.patel@gmail.com','9876500051','2025-06-01','Premium','Active'),
(52,'Sia Shah','sia.shah@gmail.com','9876500052','2025-06-10','Regular','Active'),
(53,'Harsh Mehta','harsh.mehta@gmail.com','9876500053','2025-06-20','Premium','Active'),
(54,'Ishita Desai','ishita.desai@gmail.com','9876500054','2025-07-01','Regular','Active'),
(55,'Laksh Joshi','laksh.joshi@gmail.com','9876500055','2025-07-10','Regular','Active'),
(56,'Aadhya Patel','aadhya.patel@gmail.com','9876500056','2025-07-20','Premium','Active'),
(57,'Raghav Shah','raghav.shah@gmail.com','9876500057','2025-08-01','Regular','Active'),
(58,'Tanishka Mehta','tanishka.mehta@gmail.com','9876500058','2025-08-10','Premium','Active'),
(59,'Neil Desai','neil.desai@gmail.com','9876500059','2025-08-20','Regular','Active'),
(60,'Kavya Joshi','kavya.joshi@gmail.com','9876500060','2025-09-01','Regular','Active'),
(61,'Om Patel','om.patel@gmail.com','9876500061','2025-09-10','Premium','Active'),
(62,'Ishaan Shah','ishaan.shah@gmail.com','9876500062','2025-09-20','Regular','Active'),
(63,'Shreya Mehta','shreya.mehta@gmail.com','9876500063','2025-10-01','Premium','Active'),
(64,'Aarav Desai','aarav.desai@gmail.com','9876500064','2025-10-10','Regular','Active'),
(65,'Pihu Joshi','pihu.joshi@gmail.com','9876500065','2025-10-20','Regular','Active'),
(66,'Manan Patel','manan.patel@gmail.com','9876500066','2025-11-01','Premium','Active'),
(67,'Tanvi Shah','tanvi.shah@gmail.com','9876500067','2025-11-10','Regular','Active'),
(68,'Yuvan Mehta','yuvan.mehta@gmail.com','9876500068','2025-11-20','Premium','Active'),
(69,'Ishani Desai','ishani.desai@gmail.com','9876500069','2025-12-01','Regular','Active'),
(70,'Ronit Joshi','ronit.joshi@gmail.com','9876500070','2025-12-10','Regular','Active'),
(71,'Avi Patel','avi.patel@gmail.com','9876500071','2025-12-20','Premium','Active'),
(72,'Mira Shah','mira.shah@gmail.com','9876500072','2026-01-01','Regular','Active'),
(73,'Vivaan Mehta','vivaan.mehta@gmail.com','9876500073','2026-01-10','Premium','Active'),
(74,'Aaradhya Desai','aaradhya.desai@gmail.com','9876500074','2026-01-20','Regular','Active'),
(75,'Kush Joshi','kush.joshi@gmail.com','9876500075','2026-02-01','Regular','Active'),
(76,'Riddhi Patel','riddhi.patel@gmail.com','9876500076','2026-02-10','Premium','Active'),
(77,'Shaurya Shah','shaurya.shah@gmail.com','9876500077','2026-02-20','Regular','Active'),
(78,'Aarvi Mehta','aarvi.mehta@gmail.com','9876500078','2026-03-01','Premium','Active'),
(79,'Yashvi Desai','yashvi.desai@gmail.com','9876500079','2026-03-10','Regular','Active'),
(80,'Kiaan Joshi','kiaan.joshi@gmail.com','9876500080','2026-03-20','Regular','Active'),
(81,'Reyansh Patel','reyansh.patel@gmail.com','9876500081','2026-04-01','Premium','Active'),
(82,'Navya Shah','navya.shah@gmail.com','9876500082','2026-04-10','Regular','Active'),
(83,'Aayush Mehta','aayush.mehta@gmail.com','9876500083','2026-04-20','Premium','Active'),
(84,'Ira Desai','ira.desai@gmail.com','9876500084','2026-05-01','Regular','Active'),
(85,'Devansh Joshi','devansh.joshi@gmail.com','9876500085','2026-05-10','Regular','Active'),
(86,'Kiara Patel','kiara.patel@gmail.com','9876500086','2026-05-20','Premium','Active'),
(87,'Dhruv Shah','dhruv.shah2@gmail.com','9876500087','2026-06-01','Regular','Active'),
(88,'Aanya Mehta','aanya.mehta@gmail.com','9876500088','2026-06-10','Premium','Active'),
(89,'Arnav Desai','arnav.desai2@gmail.com','9876500089','2026-06-20','Regular','Active'),
(90,'Myra Joshi','myra.joshi@gmail.com','9876500090','2026-07-01','Regular','Active'),
(91,'Kabir Patel','kabir.patel2@gmail.com','9876500091','2026-07-05','Premium','Active'),
(92,'Anaya Shah','anaya.shah2@gmail.com','9876500092','2026-07-10','Regular','Active'),
(93,'Rudra Mehta','rudra.mehta@gmail.com','9876500093','2026-07-15','Premium','Active'),
(94,'Avni Desai','avni.desai2@gmail.com','9876500094','2026-07-20','Regular','Active'),
(95,'Aditya Joshi','aditya.joshi@gmail.com','9876500095','2026-07-25','Regular','Active'),
(96,'Diya Patel','diya.patel@gmail.com','9876500096','2026-08-01','Premium','Active'),
(97,'Rohan Shah','rohan.shah@gmail.com','9876500097','2026-08-03','Regular','Active'),
(98,'Meera Mehta','meera.mehta@gmail.com','9876500098','2026-08-05','Premium','Active'),
(99,'Veer Desai','veer.desai@gmail.com','9876500099','2026-08-07','Regular','Active'),
(100,'Saanvi Joshi','saanvi.joshi@gmail.com','9876500100','2026-08-10','Regular','Active');

INSERT INTO books VALUES
(1,'The Silent River','ISBN0001',1,2018,5,3),
(2,'Beyond the Stars','ISBN0002',2,2020,4,2),
(3,'Modern Physics','ISBN0003',31,2019,6,4),
(4,'Database Fundamentals','ISBN0004',28,2021,5,2),
(5,'World War Chronicles','ISBN0005',4,2017,4,3),
(6,'My Journey','ISBN0006',5,2022,3,2),
(7,'The Hidden Door','ISBN0007',6,2019,5,1),
(8,'Love in Paris','ISBN0008',8,2020,4,2),
(9,'Think Better','ISBN0009',9,2021,5,4),
(10,'Business Basics','ISBN0010',10,2018,6,3),
(11,'The Last Garden','ISBN0011',11,2019,5,3),
(12,'Magic Kingdom','ISBN0012',7,2021,4,2),
(13,'Quantum World','ISBN0013',31,2022,6,5),
(14,'SQL Made Easy','ISBN0014',28,2020,5,2),
(15,'Ancient Civilizations','ISBN0015',4,2016,4,2),
(16,'Life of a Leader','ISBN0016',5,2019,3,2),
(17,'Mystery at Midnight','ISBN0017',6,2022,5,3),
(18,'Summer Romance','ISBN0018',8,2021,4,1),
(19,'Power of Habits','ISBN0019',9,2020,5,3),
(20,'Startup Success','ISBN0020',10,2022,6,4),
(21,'A New Beginning','ISBN0021',1,2017,5,2),
(22,'Dragon Valley','ISBN0022',7,2019,4,2),
(23,'The Science Lab','ISBN0023',2,2018,6,4),
(24,'Python Programming','ISBN0024',28,2022,5,3),
(25,'History of India','ISBN0025',4,2015,4,2),
(26,'Famous Lives','ISBN0026',5,2018,3,1),
(27,'The Missing Key','ISBN0027',6,2020,5,2),
(28,'Forever Together','ISBN0028',8,2022,4,3),
(29,'Positive Thinking','ISBN0029',9,2019,5,4),
(30,'Financial Freedom','ISBN0030',27,2021,6,4),
(31,'The Old House','ISBN0031',11,2016,5,3),
(32,'Realm of Magic','ISBN0032',7,2018,4,1),
(33,'Exploring Biology','ISBN0033',33,2020,6,5),
(34,'Web Development','ISBN0034',3,2021,5,2),
(35,'European History','ISBN0035',4,2017,4,3),
(36,'Great Leaders','ISBN0036',5,2020,3,2),
(37,'The Secret Case','ISBN0037',6,2021,5,3),
(38,'A Perfect Story','ISBN0038',8,2019,4,2),
(39,'Mindset Mastery','ISBN0039',9,2022,5,3),
(40,'The Business World','ISBN0040',10,2018,6,3),
(41,'Lost in Time','ISBN0041',1,2020,5,2),
(42,'The Enchanted Forest','ISBN0042',7,2021,4,2),
(43,'Astronomy Today','ISBN0043',31,2019,6,4),
(44,'Cloud Computing','ISBN0044',3,2022,5,3),
(45,'Ancient Rome','ISBN0045',4,2016,4,2),
(46,'An Inspiring Life','ISBN0046',5,2018,3,1),
(47,'Case of the Stranger','ISBN0047',6,2020,5,2),
(48,'A Love Story','ISBN0048',8,2021,4,3),
(49,'Daily Motivation','ISBN0049',9,2020,5,4),
(50,'Marketing Essentials','ISBN0050',10,2022,6,4),
(51,'The Forgotten Path','ISBN0051',11,2018,5,3),
(52,'Kingdom of Dreams','ISBN0052',7,2019,4,2),
(53,'Chemistry Explained','ISBN0053',32,2021,6,3),
(54,'Computer Networks','ISBN0054',3,2020,5,2),
(55,'The Medieval World','ISBN0055',4,2017,4,2),
(56,'A Life Well Lived','ISBN0056',5,2021,3,2),
(57,'The Dark Room','ISBN0057',11,2019,5,1),
(58,'Letters of Love','ISBN0058',8,2020,4,2),
(59,'Building Confidence','ISBN0059',9,2022,5,3),
(60,'Entrepreneurship 101','ISBN0060',10,2019,6,4),
(61,'The Great Escape','ISBN0061',13,2021,5,2),
(62,'Legends of the North','ISBN0062',7,2020,4,3),
(63,'Physics for Beginners','ISBN0063',31,2018,6,4),
(64,'Artificial Intelligence','ISBN0064',28,2022,5,2),
(65,'American History','ISBN0065',4,2016,4,3),
(66,'Leaders of Tomorrow','ISBN0066',5,2020,3,2),
(67,'The Final Clue','ISBN0067',6,2021,5,3),
(68,'Love and Destiny','ISBN0068',8,2019,4,2),
(69,'The 7 Habits','ISBN0069',9,2020,5,3),
(70,'Investment Basics','ISBN0070',27,2021,6,4),
(71,'Whispers in the Wind','ISBN0071',1,2019,5,2),
(72,'The Wizard School','ISBN0072',7,2022,4,1),
(73,'Human Biology','ISBN0073',33,2020,6,5),
(74,'Data Analytics','ISBN0074',3,2021,5,3),
(75,'History Through Time','ISBN0075',4,2018,4,2),
(76,'My Story','ISBN0076',5,2019,3,2),
(77,'Murder on Monday','ISBN0077',6,2022,5,2),
(78,'The First Date','ISBN0078',8,2020,4,3),
(79,'Focus and Success','ISBN0079',9,2021,5,4),
(80,'Leadership Skills','ISBN0080',10,2018,6,3),
(81,'The Lost City','ISBN0081',13,2017,5,2),
(82,'The Magic Stone','ISBN0082',7,2019,4,2),
(83,'Introduction to Science','ISBN0083',2,2021,6,4),
(84,'Machine Learning','ISBN0084',28,2022,5,2),
(85,'Indian Heritage','ISBN0085',4,2018,4,3),
(86,'The Great Achiever','ISBN0086',5,2020,3,1),
(87,'The Secret Witness','ISBN0087',6,2021,5,2),
(88,'A Chance Encounter','ISBN0088',8,2019,4,2),
(89,'Emotional Intelligence','ISBN0089',15,2022,5,3),
(90,'Managing Money','ISBN0090',27,2020,6,4),
(91,'The Final Journey','ISBN0091',11,2018,5,3),
(92,'The Crystal Kingdom','ISBN0092',7,2020,4,2),
(93,'Discovering Space','ISBN0093',31,2019,6,5),
(94,'MySQL Mastery','ISBN0094',28,2022,5,3),
(95,'The World at War','ISBN0095',4,2017,4,2),
(96,'Stories of Success','ISBN0096',5,2021,3,2),
(97,'The Locked Room','ISBN0097',6,2020,5,1),
(98,'Together Forever','ISBN0098',8,2022,4,3),
(99,'The Power Within','ISBN0099',9,2019,5,3),
(100,'Business Strategy','ISBN0100',10,2021,6,4);

insert into book_authors values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,21),
(22,22),
(23,23),
(24,24),
(25,25),
(26,26),
(27,27),
(28,28),
(29,29),
(30,30),
(31,31),
(32,32),
(33,33),
(34,34),
(35,35),
(36,36),
(37,37),
(38,38),
(39,39),
(40,40),
(41,1),
(42,2),
(43,3),
(44,4),
(45,5),
(46,6),
(47,7),
(48,8),
(49,9),
(50,10),
(51,11),
(52,12),
(53,13),
(54,14),
(55,15),
(56,16),
(57,17),
(58,18),
(59,19),
(60,20),
(61,21),
(62,22),
(63,23),
(64,24),
(65,25),
(66,26),
(67,27),
(68,28),
(69,29),
(70,30),
(71,31),
(72,32),
(73,33),
(74,34),
(75,35),
(76,36),
(77,37),
(78,38),
(79,39),
(80,40),
(81,1),
(82,2),
(83,3),
(84,4),
(85,5),
(86,6),
(87,7),
(88,8),
(89,9),
(90,10),
(91,11),
(92,12),
(93,13),
(94,14),
(95,15),
(96,16),
(97,17),
(98,18),
(99,19),
(100,20);

insert into loans values
(1,1,1,'2026-01-01','2026-01-15','2026-01-12','Returned'),
(2,2,2,'2026-01-02','2026-01-16','2026-01-18','Returned'),
(3,3,3,'2026-01-03','2026-01-17','2026-01-16','Returned'),
(4,4,4,'2026-01-04','2026-01-18',NULL,'Issued'),
(5,5,5,'2026-01-05','2026-01-19','2026-01-19','Returned'),
(6,6,6,'2026-01-06','2026-01-20','2026-01-25','Returned'),
(7,7,7,'2026-01-07','2026-01-21','2026-01-20','Returned'),
(8,8,8,'2026-01-08','2026-01-22',NULL,'Issued'),
(9,9,9,'2026-01-09','2026-01-23','2026-01-22','Returned'),
(10,10,10,'2026-01-10','2026-01-24','2026-01-24','Returned'),
(11,11,11,'2026-01-11','2026-01-25','2026-01-27','Returned'),
(12,12,12,'2026-01-12','2026-01-26','2026-01-25','Returned'),
(13,13,13,'2026-01-13','2026-01-27',NULL,'Issued'),
(14,14,14,'2026-01-14','2026-01-28','2026-01-28','Returned'),
(15,15,15,'2026-01-15','2026-01-29','2026-02-02','Returned'),
(16,16,16,'2026-01-16','2026-01-30','2026-01-29','Returned'),
(17,17,17,'2026-01-17','2026-01-31',NULL,'Issued'),
(18,18,18,'2026-01-18','2026-02-01','2026-02-01','Returned'),
(19,19,19,'2026-01-19','2026-02-02','2026-02-04','Returned'),
(20,20,20,'2026-01-20','2026-02-03','2026-02-03','Returned'),
(21,21,21,'2026-02-01','2026-02-15','2026-02-14','Returned'),
(22,22,22,'2026-02-02','2026-02-16',NULL,'Issued'),
(23,23,23,'2026-02-03','2026-02-17','2026-02-20','Returned'),
(24,24,24,'2026-02-04','2026-02-18','2026-02-17','Returned'),
(25,25,25,'2026-02-05','2026-02-19','2026-02-19','Returned'),
(26,26,26,'2026-02-06','2026-02-20',NULL,'Issued'),
(27,27,27,'2026-02-07','2026-02-21','2026-02-22','Returned'),
(28,28,28,'2026-02-08','2026-02-22','2026-02-21','Returned'),
(29,29,29,'2026-02-09','2026-02-23','2026-02-25','Returned'),
(30,30,30,'2026-02-10','2026-02-24','2026-02-23','Returned'),
(31,31,31,'2026-02-11','2026-02-25',NULL,'Issued'),
(32,32,32,'2026-02-12','2026-02-26','2026-02-25','Returned'),
(33,33,33,'2026-02-13','2026-02-27','2026-03-01','Returned'),
(34,34,34,'2026-02-14','2026-02-28','2026-02-27','Returned'),
(35,35,35,'2026-02-15','2026-03-01',NULL,'Issued'),
(36,36,36,'2026-02-16','2026-03-02','2026-03-02','Returned'),
(37,37,37,'2026-02-17','2026-03-03','2026-03-05','Returned'),
(38,38,38,'2026-02-18','2026-03-04','2026-03-03','Returned'),
(39,39,39,'2026-02-19','2026-03-05',NULL,'Issued'),
(40,40,40,'2026-02-20','2026-03-06','2026-03-06','Returned'),
(41,41,41,'2026-03-01','2026-03-15','2026-03-14','Returned'),
(42,42,42,'2026-03-02','2026-03-16','2026-03-18','Returned'),
(43,43,43,'2026-03-03','2026-03-17',NULL,'Issued'),
(44,44,44,'2026-03-04','2026-03-18','2026-03-17','Returned'),
(45,45,45,'2026-03-05','2026-03-19','2026-03-19','Returned'),
(46,46,46,'2026-03-06','2026-03-20','2026-03-22','Returned'),
(47,47,47,'2026-03-07','2026-03-21',NULL,'Issued'),
(48,48,48,'2026-03-08','2026-03-22','2026-03-21','Returned'),
(49,49,49,'2026-03-09','2026-03-23','2026-03-25','Returned'),
(50,50,50,'2026-03-10','2026-03-24','2026-03-24','Returned'),
(51,51,51,'2026-03-11','2026-03-25',NULL,'Issued'),
(52,52,52,'2026-03-12','2026-03-26','2026-03-25','Returned'),
(53,53,53,'2026-03-13','2026-03-27','2026-03-29','Returned'),
(54,54,54,'2026-03-14','2026-03-28','2026-03-27','Returned'),
(55,55,55,'2026-03-15','2026-03-29',NULL,'Issued'),
(56,56,56,'2026-03-16','2026-03-30','2026-03-30','Returned'),
(57,57,57,'2026-03-17','2026-03-31','2026-04-02','Returned'),
(58,58,58,'2026-03-18','2026-04-01',NULL,'Issued'),
(59,59,59,'2026-03-19','2026-04-02','2026-04-01','Returned'),
(60,60,60,'2026-03-20','2026-04-03','2026-04-03','Returned'),
(61,61,61,'2026-04-01','2026-04-15',NULL,'Issued'),
(62,62,62,'2026-04-02','2026-04-16','2026-04-15','Returned'),
(63,63,63,'2026-04-03','2026-04-17','2026-04-19','Returned'),
(64,64,64,'2026-04-04','2026-04-18','2026-04-17','Returned'),
(65,65,65,'2026-04-05','2026-04-19',NULL,'Issued'),
(66,66,66,'2026-04-06','2026-04-20','2026-04-20','Returned'),
(67,67,67,'2026-04-07','2026-04-21','2026-04-23','Returned'),
(68,68,68,'2026-04-08','2026-04-22',NULL,'Issued'),
(69,69,69,'2026-04-09','2026-04-23','2026-04-22','Returned'),
(70,70,70,'2026-04-10','2026-04-24','2026-04-24','Returned'),
(71,71,71,'2026-05-01','2026-05-15',NULL,'Issued'),
(72,72,72,'2026-05-02','2026-05-16','2026-05-15','Returned'),
(73,73,73,'2026-05-03','2026-05-17','2026-05-19','Returned'),
(74,74,74,'2026-05-04','2026-05-18','2026-05-17','Returned'),
(75,75,75,'2026-05-05','2026-05-19',NULL,'Issued'),
(76,76,76,'2026-05-06','2026-05-20','2026-05-20','Returned'),
(77,77,77,'2026-05-07','2026-05-21','2026-05-23','Returned'),
(78,78,78,'2026-05-08','2026-05-22',NULL,'Issued'),
(79,79,79,'2026-05-09','2026-05-23','2026-05-22','Returned'),
(80,80,80,'2026-05-10','2026-05-24','2026-05-24','Returned'),
(81,81,81,'2026-06-01','2026-06-15',NULL,'Issued'),
(82,82,82,'2026-06-02','2026-06-16','2026-06-15','Returned'),
(83,83,83,'2026-06-03','2026-06-17','2026-06-19','Returned'),
(84,84,84,'2026-06-04','2026-06-18','2026-06-17','Returned'),
(85,85,85,'2026-06-05','2026-06-19',NULL,'Issued'),
(86,86,86,'2026-06-06','2026-06-20','2026-06-20','Returned'),
(87,87,87,'2026-06-07','2026-06-21','2026-06-23','Returned'),
(88,88,88,'2026-06-08','2026-06-22',NULL,'Issued'),
(89,89,89,'2026-06-09','2026-06-23','2026-06-22','Returned'),
(90,90,90,'2026-06-10','2026-06-24','2026-06-24','Returned'),
(91,91,91,'2026-07-01','2026-07-15',NULL,'Issued'),
(92,92,92,'2026-07-02','2026-07-16','2026-07-15','Returned'),
(93,93,93,'2026-07-03','2026-07-17','2026-07-19','Returned'),
(94,94,94,'2026-07-04','2026-07-18','2026-07-17','Returned'),
(95,95,95,'2026-07-05','2026-07-19',NULL,'Issued'),
(96,96,96,'2026-07-06','2026-07-20','2026-07-20','Returned'),
(97,97,97,'2026-07-07','2026-07-21','2026-07-23','Returned'),
(98,98,98,'2026-07-08','2026-07-22',NULL,'Issued'),
(99,99,99,'2026-07-09','2026-07-23','2026-07-22','Returned'),
(100,100,100,'2026-07-10','2026-07-24','2026-07-24','Returned');

insert into fines values
(1,2,15.00,'Paid','2026-01-20'),
(2,6,30.00,'Paid','2026-01-26'),
(3,11,20.00,'Pending',NULL),
(4,15,40.00,'Paid','2026-02-05'),
(5,19,25.00,'Pending',NULL),
(6,23,45.00,'Paid','2026-02-25'),
(7,27,15.00,'Paid','2026-02-25'),
(8,29,30.00,'Pending',NULL),
(9,33,30.00,'Paid','2026-03-05'),
(10,37,20.00,'Pending',NULL),
(11,42,30.00,'Paid','2026-03-20'),
(12,46,20.00,'Pending',NULL),
(13,49,30.00,'Paid','2026-03-30'),
(14,53,30.00,'Pending',NULL),
(15,57,20.00,'Paid','2026-04-05'),
(16,63,30.00,'Pending',NULL),
(17,67,30.00,'Paid','2026-04-25'),
(18,73,30.00,'Pending',NULL),
(19,77,30.00,'Paid','2026-05-25'),
(20,83,30.00,'Pending',NULL),
(21,87,30.00,'Paid','2026-06-25'),
(22,93,30.00,'Pending',NULL),
(23,97,30.00,'Paid','2026-07-25');

select COUNT(*) AS total_members from members;

select COUNT(*) AS total_books from books;

select COUNT(*) AS total_authors from authors;

select COUNT(*) AS total_loans from loans;

select COUNT(*) AS total_fines from fines;

select COUNT(*) AS total_categories FROM categories;

select COUNT(*) AS total_book_authors FROM book_authors;

show tables;


select book_id, title, total_copies, available_copies
from Books
where available_copies > 2;

select book_id, title, publication_year
from Books 
where publication_year > 2020;

select b.book_id, b.title, c.category_name
from Books b 
join Categories c
on b.category_id = c.category_id
where c.category_name = 'Technology';

select book_id, title, total_copies, available_copies
from Books 
where available_copies <= 2
order by available_copies asc;

select c.category_name,
COUNT(b.book_id) as total_books
from Categories c 
join Books b
on c.category_id = b.category_id
group by c.category_id, c.category_name
order by total_books desc;

select b.book_id, b.title,
COUNT(l.loan_id) as times_borrowed
from Books b 
join Loans l
on b.book_id = l.book_id
group by b.book_id, b.title
order by times_borrowed desc;

select m.member_id, m.member_name,
COUNT(l.loan_id) as total_books_borrowed
from Members m join Loans l
on m.member_id = l.member_id
group by m.member_id, m.member_name
order by total_books_borrowed asc;

select l.loan_id,m.member_name,
b.title,l.issue_date,l.due_date
from Loans l
join Members m
on l.member_id = m.member_id
join Books b
on l.book_id = b.book_id
where l.loan_status = 'Issued'
order by l.due_date;

select l.loan_id, m.member_name, b.title,
l.due_date,l.return_date,
DATEDIFF(l.return_date, l.due_date) 
as days_late
from Loans l
join Members m
on l.member_id = m.member_id
join Books b
on l.book_id = b.book_id
where l.return_date > l.due_date
order by days_late desc;

select SUM(fine_amount) as total_fine_amount from Fines;

select payment_status,
COUNT(*) as number_of_fines,
SUM(fine_amount) as total_amount
from Fines group by payment_status;

select c.category_name,
COUNT(b.book_id) as total_books from Categories c
join Books b
on c.category_id = b.category_id
group by c.category_id, c.category_name
having COUNT(b.book_id) > 5;

select membership_type,
COUNT(*) as total_members from Members
group by membership_type;

select loan_status,
COUNT(*) as total_loans from Loans
group by loan_status;

select MAX(fine_amount) as highest_fine from Fines;

select m.member_id, m.member_name,
f.fine_amount, f.payment_status
from Members m 
join Loans l
on m.member_id = l.member_id
join Fines f
on l.loan_id = f.loan_id
where f.payment_status = 'Pending';

select book_id, title, available_copies,
case 
when available_copies = 0 then 'Not Available'
when available_copies <= 2 then 'Low Availability'
else 'Available'
end as availability_status 
from Books;

select c.category_name,
COUNT(l.loan_id) as total_borrowed
from Categories c
join Books b
on c.category_id = b.category_id
join Loans l
on b.book_id = l.book_id
group by c.category_id, c.category_name
order by total_borrowed desc
limit 3;

select l.loan_id, m.member_name, b.title as book_title,
c.category_name, l.issue_date, l.due_date,
l.return_date, l.loan_status, f.fine_amount,
f.payment_status from Loans l
join Members m
on l.member_id = m.member_id
join Books b
on l.book_id = b.book_id
join Categories c
on b.category_id = c.category_id
left join Fines f
on l.loan_id = f.loan_id
order by l.issue_date;

create view Library_Loan_Details 
as select l.loan_id, m.member_id, m.member_name,
b.book_id, b.title 
as book_title, c.category_name,
l.issue_date, l.due_date, l.return_date, l.loan_status,
f.fine_amount, f.payment_status 
from Loans l 
join Members m
on l.member_id = m.member_id
join Books b
on l.book_id = b.book_id
join Categories c
on b.category_id = c.category_id
left join Fines f
on l.loan_id = f.loan_id;
    
select * from Library_Loan_Details;

drop view if exists Library_Loan_Details;

select member_name, book_title, issue_date,
due_date from Library_Loan_Details
where loan_status = 'Issued';

select member_name, book_title, fine_amount
from Library_Loan_Details
where payment_status = 'Pending';