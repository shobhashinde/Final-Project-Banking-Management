/* ----------------------Create a database-------------------*/
Create database if not exists bank;

-- drop database if exists
drop database if exists bank;
Use bank;

/* ----------------------------------------------------
				 Table 1- banks
--------------------------------------------------------*/
create table bank_details (
    bank_id int primary key auto_increment, -- Unique identifier for each bank_details record
    bank_name varchar(100) NOT NULL, -- name of the banks
    bank_code varchar(20), -- bank code
    contact_number varchar(15), -- bank contact number 
    email varchar(100), -- bank email id
    website varchar(100) -- website of the bank
);

-- Inserting records into table
insert into bank_details (bank_name, bank_code, contact_number, email, website) 
values ('Bank of America', 'BOA123', '800-432-1000', 'contact@bankofamerica.com', 'www.bankofamerica.com'),
('Chase Bank', 'CHASE456', '800-935-9935', 'support@chase.com', 'www.chase.com'),
('Wells Fargo', 'WELLS789', '800-869-3557', 'info@wellsfargo.com', 'www.wellsfargo.com'),
('Citibank', 'CITI321', '800-374-9700', 'customer.service@citibank.com', 'www.citibank.com'),
('PNC Bank', 'PNC654', '888-762-2265', 'info@pnc.com', 'www.pnc.com'),
('US Bank', 'USBANK987', '800-872-2657', 'support@usbank.com', 'www.usbank.com'),
('Capital One', 'CAPITAL111', '800-227-4825', 'help@capitalone.com', 'www.capitalone.com'),
('TD Bank', 'TD222', '888-751-9000', 'customerservice@td.com', 'www.td.com'),
('HSBC Bank', 'HSBC333', '800-975-4722', 'info@hsbc.com', 'www.hsbc.com'),
('Regions Bank', 'REGIONS444', '800-734-4667', 'contact@regions.com', 'www.regions.com'),
('Santander Bank', 'SANTANDER555', '877-768-2265', 'support@santander.com', 'www.santander.com'),
('Fifth Third Bank', 'FIFTH666', '800-972-3030', 'info@53.com', 'www.53.com'),
('KeyBank', 'KEYBANK777', '800-539-2968', 'contact@keybank.com', 'www.keybank.com'),
('BMO Harris Bank', 'BMO888', '888-340-2265', 'info@bmo.com', 'www.bmoharris.com'),
('M&T Bank', 'MT999', '800-724-2440', 'contact@mtb.com', 'www.mtb.com'),
('American Express Bank', 'AMEX000', '800-528-4800', 'service@aexp.com', 'www.americanexpress.com'),
('Ally Bank', 'ALLY111', '877-247-2559', 'support@ally.com', 'www.ally.com'),
('Discover Bank', 'DISCOVER222', '800-347-7000', 'contact@discover.com', 'www.discover.com'),
('SunTrust Bank', 'SUNTRUST333', '800-786-8787', 'info@suntrust.com', 'www.suntrust.com'),
('First Republic Bank', 'FRB444', '888-408-2822', 'info@firstrepublic.com', 'www.firstrepublic.com');

-- Drop the structure& records from the table
drop table bank_details; 

-- delete the records from table
truncate table bank_details;

-- Select query 
-- 1.Display all records
select * from bank_details;



/* ----------------------------------------------------
				 Table 2 - Branch
--------------------------------------------------------*/

create table Branches (
    branch_id int primary key auto_increment,  -- Unique identifier for each Branches record
    branch_name varchar(100) NOT NULL, -- bank branch  name 
    address varchar(255), -- address of the bank 
    city varchar(50), -- city of the bank
    state varchar(50), -- state of bank 
    postal_code varchar(10), -- postal_code of the bank
    country varchar(50), -- country of the bank
    phone_number varchar(15),  -- phone_number of the bank
    email varchar(100),  -- email of the bank
    manager_id INT,  -- manager_id of the bank
    opening_date DATE,  -- opening_date of the bank
    status varchar(20) DEFAULT 'Active',  -- Bank is active or not means its open or permantely close
    created_at timestamp default current_timestamp,  -- add time of the inserted record
    updated_at timestamp default current_timestamp, -- update time when record updated
    bank_id int, -- foreign key 
    FOREIGN KEY (manager_id) REFERENCES Staff(staff_id)
    on delete set NULL
    on update cascade,
    FOREIGN KEY (bank_id) REFERENCES bank_details(bank_id)
    on delete set NULL
    on update cascade
);

-- Inserting records into table
insert into Branches (branch_name, address,city,state,postal_code,country, phone_number,email,manager_id,opening_Date, bank_id) 
values('Downtown Branch', '123 Main St, Cityville','Ash','Canterbury','CT3','United state', '555-123-4567', 'downtown@mail.com','1','2020-11-22',1),
('Uptown Branch', '456 Elm St, Cityville', 'Abberley','England','LE14','United state', '555-234-5678', 'Uptown@mail.com','2','2020-11-22',1),
('Westside Branch', '789 Oak St, Cityville', 'Abberton','England','BA8','United state', '555-345-6789', 'Westside@mail.com','2','2020-11-22',1),
('Eastside Branch', '321 Pine St, Cityville','Abberton','England','BA8','United state', '555-456-7890', 'Eastside@mail.com','3','2020-11-22',2),
('North Branch', '654 Maple St, Cityville','Abbess Roding','England','WR10','United state', '555-567-8901','North@mail.com','3','2020-11-22', 3),
('South Branch', '987 Cedar St, Cityville', 'Abbey Village','England','CO5','United state', '555-678-9012','South@mail.com','4','2020-11-22', 3),
('Central Branch', '159 Birch St, Cityville','Abberton','England','CM5','United state', '555-789-0123','Central@mail.com','4','2020-11-22', 4),
('Airport Branch', '753 Spruce St, Cityville','Ash','England','CT3','United state', '555-890-1234','Airport@mail.com','4','2020-11-22', 4),
('Mall Branch', '852 Walnut St, Cityville','Abbey Dore','England','WR6','United state', '555-901-2345','Mall@mail.com','5','2020-11-22', 5),
('Suburban Branch', '951 Chestnut St, Cityville', 'Abbey Hill','England','MK77','United state', '555-012-3456','Suburban@mail.com','5','2020-11-22', 5),
('Corporate Branch', '1590 Corporate Blvd, Cityville','Abbey road','England','WR6','United state', '555-123-4568','Corporate@mail.com','1','2020-11-22', 6),
('Community Branch', '2460 Community Dr, Cityville', 'Abbey Dore','England','ST2','United state', '555-234-5679','Community@mail.com','2','2020-11-22', 6),
('Investment Branch', '3690 Investment Ave, Cityville', 'Abbey Village','England','CO5','United state', '555-345-6780','Investment@mail.com','3','2020-11-22', 7),
('Loan Center', '1470 Loan St, Cityville','Ash','England','CT3','United state', '555-456-7891','Loan@mail.com','4','2020-11-22', 7),
('Savings Branch', '2580 Savings Rd, Cityville','Abbey Wood	','Canterbury','NW8','United state', '555-567-8902','Savings@mail.com','5','2020-11-22', 8),
('Checking Branch', '3690 Checking Ln, Cityville','Ash','Canterbury','CT3','United state', '555-678-9013','Checking@mail.com','6','2020-11-22', 8),
('Wealth Management', '7410 Wealth St, Cityville', 'Abbey Ward','Canterbury','PR6','United state', '555-789-0124', 'Wealth@mail.com','7','2020-11-22',9),
('Business Branch', '8520 Business Blvd, Cityville','Abbots Bromley	','Canterbury','WR6','United state', '555-890-1235','Business@mail.com','7','2020-11-22', 9),
('International Branch', '9630 International Dr, Cityville', 'Abbots Langley','Canterbury','CB09','United state', '555-901-2346','International@mail.com','4','2020-11-22', 10);

-- Drop the structure& records from the table
drop table branches; 

-- delete the records from table
truncate table branches;

-- Select query 
-- 1.Display all records
select * from branches;

/* ----------------------------------------------------
				 Table 3- Customer
--------------------------------------------------------*/

Create table customers (
customer_id int primary key auto_increment, -- Unique identifier for each customer (Primary Key)
cust_fname varchar(30) not null, -- customer first
cust_lname varchar(30) not null, -- customer last name
cust_address varchar(100) not null, -- customer address
cust_city varchar(15) not null, -- customer city
cust_state varchar(15) not null, -- customer state
cust_postcode varchar(20) not null, -- customer postcode
cust_dob date, -- customer date of birth
cust_phonenumber varchar(40) not null unique, -- customer phonenumber
cust_email varchar(40) not null unique, -- customer email id
is_cust_active enum('1','0') not null -- customer is active or not
);

-- Inserting records into table
INSERT INTO customers (cust_fname, cust_lname, cust_address, cust_city, cust_state, cust_postcode,cust_dob,cust_phonenumber,cust_email) 
VALUES('John', 'Doe', '123 Elm St, Cityville, ST 12345','Ash','Canterbury','CT3','1985-05-15', '555-123-4567', 'john.doe@example.com'),
('Jane', 'Smith', '456 Oak St, Cityville, ST 12345','Ash','Canterbury','CT3','1990-07-20', '555-234-5678', 'jane.smith@example.com'),
('Michael', 'Johnson', '789 Pine St, Cityville, ST 12345','Abberley','England','LE14','1982-03-10', '555-345-6789', 'michael.johnson@example.com'),
('Emily', 'Davis','321 Maple St, Cityville, ST 12345','Abberton','England','BA8','1995-11-30', '555-456-7890', 'emily.davis@example.com'),
('David', 'Wilson', '654 Cedar St, Cityville, ST 12345','Abbess Roding','England','WR10','1988-01-25', '555-567-8901', 'david.wilson@example.com'),
('Sarah', 'Brown', '987 Birch St, Cityville, ST 12345','Abbey Village','England','CO5','1992-09-15', '555-678-9012', 'sarah.brown@example.com'),
('James', 'Garcia', '159 Walnut St, Cityville, ST 12345','Abbey Village','England','CO5','1980-12-05', '555-789-0123', 'james.garcia@example.com'),
('Jessica', 'Martinez', '753 Spruce St, Cityville, ST 12345','Abbey Village','England','CO5','1993-04-18', '555-890-1234', 'jessica.martinez@example.com'),
('Daniel', 'Hernandez', '852 Chestnut St, Cityville, ST 12345','Abbey Dore','England','WR6', '1987-06-22', '555-901-2345', 'daniel.hernandez@example.com'),
('Laura', 'Lopez','951 Fir St, Cityville, ST 12345','Abbey Hill','England','MK77','1991-10-30', '555-012-3456', 'laura.lopez@example.com'),
('Matthew', 'Gonzalez', '258 Willow St, Cityville, ST 12345','Abbey road','England','WR6', '1983-08-14', '555-123-4568', 'matthew.gonzalez@example.com'),
('Sophia', 'Wilson', '369 Poplar St, Cityville, ST 12345','Abbey Wood','Canterbury','NW8','1994-02-28', '555-234-5679', 'sophia.wilson@example.com'),
('Christopher', 'Anderson', '147 Elm St, Cityville, ST 12345','Abbey road','England','WR6', '1986-05-12', '555-345-6780', 'christopher.anderson@example.com'),
('Olivia', 'Thomas', '258 Oak St, Cityville, ST 12345','Abbots Bromley','Canterbury','WR6','1990-07-19', '555-456-7891', 'olivia.thomas@example.com'),
('Joshua', 'Taylor', '369 Pine St, Cityville, ST 12345','Abbots Bromley','Canterbury','WR6', '1989-03-03', '555-567-8902', 'joshua.taylor@example.com'),
('Ava', 'Moore', '741 Maple St, Cityville, ST 12345','Abbey Ward','Canterbury','PR6','1995-11-11', '555-678-9013', 'ava.moore@example.com'),
('Ethan', 'Jackson', '852 Cedar St, Cityville, ST 12345','Abbots Langley','Canterbury','CB09','1984-01-01', '555-789-0124', 'ethan.jackson@example.com'),
('Mia', 'White', '963 Birch St, Cityville, ST 12345','Abberton','England','CM5','1992-09-09', '555-890-1235', 'mia.white@example.com'),
('jack', 'Doe', '123 Elm St, Cityville, ST 12345','Ash','Canterbury','CT3','1985-05-15', '555-123-4589', 'jack.doe@example.com'),
('Juli', 'Smith', '456 Oak St, Cityville, ST 12345','Ash','Canterbury','CT3','1990-07-20', '555-234-5687', 'Juli.smith@example.com');

-- Drop the structure& records from the table
drop table customers; 

-- delete the records from table
truncate table customers;

-- Select query 
-- 1.Display all records
select * from customers;

/* ----------------------------------------------------
				 Table 4- Customer Type
--------------------------------------------------------*/
CREATE TABLE CustomerType (
    customer_type_id int primary key auto_increment, -- Unique identifier for each CustomerType 
    customer_type_name varchar(60) not null unique, -- mention ed customer type like individual account customer, business related customer account etc
    description TEXT -- mention description of the account tytpe
);


-- Inserting records into table

INSERT INTO CustomerType (customer_type_name, description) 
VALUES('Individual', 'A single person who holds an account with the bank.'),
('Joint', 'An account held by two or more individuals.'),
('Business', 'A company or organization that holds an account.'),
('Corporate', 'A large corporation that has multiple accounts and services.'),
('Non-Profit', 'An organization that operates for charitable purposes.'),
('Government', 'A government entity or agency that holds an account.'),
('Trust', 'An account held in the name of a trust.'),
('Partnership', 'An account held by two or more partners in a business.'),
('Sole Proprietorship', 'A business owned and run by one individual.'),
('Student', 'A special account type for students with benefits.'),
('Senior Citizen', 'Accounts designed for senior citizens with special features.'),
('Minor', 'Accounts held in the name of a minor, usually managed by a guardian.'),
('Freelancer', 'An account type for self-employed individuals.'),
('Startup', 'Accounts tailored for new businesses and startups.'),
('Franchise', 'Accounts for franchise businesses.'),
('Foreign National', 'Accounts for non-residents or foreign nationals.'),
('Affiliate', 'Accounts for affiliate businesses or partners.'),
('Investor', 'Accounts designed for individuals or entities focused on investments.'),
('Real Estate', 'Accounts for real estate businesses or transactions.'),
('E-commerce', 'Accounts tailored for online businesses and e-commerce platforms.');

-- Drop the structure& records from the table
drop table customertype; 

-- delete the records from table
truncate table customertype;

-- Select query 
-- 1.Display all records
select * from customertype;

/* ----------------------------------------------------
				 Table 5- Customer Credential
--------------------------------------------------------*/
create table CustomerCredential (
    credential_id int primary key auto_increment, -- Unique identifier for each CustomerType 
    customer_id int, -- it is primary key from customers table which we used in this table as foreign key
    cust_username varchar(50) NOT NULL UNIQUE, -- customer unique user name will be created for each user
    cust_password varchar(255) NOT NULL, -- unique password will be created & stored in this table
    cust_email varchar(40), -- it is column from customers table which we used in this table 
	cust_phonenumber varchar(40), -- -- it is column from customers table which we used in this table
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp,
    is_active enum('1','0') not null, -- check customer is active or not
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    on update cascade
    on delete set null
    );


-- Inserting records into table

INSERT INTO CustomerCredential (customer_id,cust_username, cust_password,cust_email,cust_phonenumber)
VALUES(1,'johndoe', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','john.doe@example.com',5551234567), -- password: password123
(2, 'janesmith', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','jane.smith@example.com',5552345678), -- password: mysecurepassword
(3,'michaeljohnson', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','michael.johnson@example.com',5553456789), -- password: mjohnson2023
(4,'emilydavis', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','emily.davis@example.com',5554567890), -- password: emily123
( 5,'davidwilson', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','david.wilson@example.com',5555678901), -- password: wilson2023
(6,'sarahbrown', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','sarah.brown@example.com',5556789012), -- password: sarahsecure
(7,'jamesgarcia', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','james.garcia@example.com',5557890123), -- password: garcia2023
(8,'jessicamartinez', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','jessica.martinez@example.com',5558901234), -- password: martinez123
(9,'danielhernandez', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','daniel.hernandez@example.com',5559012345), -- password: daniel2023
(10,'lauralopez', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','laura.lopez@example.com',5550123456), -- password: laura123
(11,'matthewgonzalez', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','matthew.gonzalez@example.com',5551234568), -- password: matthew123
(12,'sophiawilson', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','sophia.wilson@example.com',5552345679), -- password: sophia123
(13,'christopheranderson', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','christopher.anderson@example.com',5553456780), -- password: christopher123
(14,'oliviathomas', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','olivia.thomas@example.com',5554567891), -- password: olivia123
(15,'joshuataylor', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','joshua.taylor@example.com',5555678902), -- password: joshua123
(16,'avamoore', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','ava.moore@example.com',5556789013), -- password: ava123
(17,'ethanjackson', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','ethan.jackson@example.com',5557890124), -- password: ethan123
(18,'miawhite', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','mia.white@example.com',5558901235), -- password: mia123
(19,'jackdoe', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','jack.doe@example.com',5551234589), -- password: jack123
(20,'julismith', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','Juli.smith@example.com',5552345687); --  -- password: Juli123

-- Drop the structure& records from the table
drop table CustomerCredential; 

-- delete the records from table
truncate table CustomerCredential;

-- Select query 
-- 1.Display all records
select * from CustomerCredential;

/* ----------------------------------------------------
				 Table 6- Staff
--------------------------------------------------------*/

create table staff (
staff_id int primary key auto_increment, -- Unique identifier for each staff (Primary Key)
staff_fname varchar(30) not null, -- first name of the staff member
staff_lname varchar(30) not null, -- last name of the staff member
staff_position varchar(50) not null, -- position of the staff member in the bank
staff_email varchar(40) not null unique, -- email id of the staff member
staff_phonenumber varchar(40) not null unique, -- phone number of the staff member
hire_date date not null, -- joining date of the staff member
staff_branch_id varchar(6) not null, -- staff work for which bank branch
salary decimal(10, 2) not null check(salary > 0), -- salary of the staff 
is_staff_active enum('1','0') not null -- staff is currently active or not
);


-- Inserting records into table

INSERT INTO staff (staff_fname, staff_lname, staff_position, staff_email, staff_phonenumber, hire_date, staff_branch_id,salary) 
VALUES('John', 'Doe', 'Branch Manager', 'john.doe@bank.com', '555-123-4567', '2020-01-15', 1,1000000.00),
('Jane', 'Smith', 'Customer Service Representative', 'jane.smith@bank.com', '555-234-5678', '2021-03-10', 1,1000000.00),
('Michael', 'Johnson', 'Loan Officer', 'michael.johnson@bank.com', '555-345-6789', '2019-05-20', 2,1000000.00),
('Emily', 'Davis', 'Teller', 'emily.davis@bank.com', '555-456-7890', '2022-07-15', 2,1000000.00),
('David', 'Wilson', 'Financial Advisor', 'david.wilson@bank.com', '555-567-8901', '2018-11-30', 3,1000000.00),
('Sarah', 'Brown', 'Branch Manager', 'sarah.brown@bank.com', '555-678-9012', '2020-02-25', 3,1000000.00),
('James', 'Garcia', 'Customer Service Representative', 'james.garcia@bank.com', '555-789-0123', '2021-04-18', 4,1000000.00),
('Jessica', 'Martinez', 'Teller', 'jessica.martinez@bank.com', '555-890-1234', '2022-08-10', 4,1000000.00),
('Daniel', 'Hernandez', 'Loan Officer', 'daniel.hernandez@bank.com', '555-901-2345', '2019-06-05', 5,1000000.00),
('Laura', 'Lopez', 'Financial Advisor', 'laura.lopez@bank.com', '555-012-3456', '2020-09-12', 5,1000000.00),
('Matthew', 'Doe', 'Branch Manager', 'Matthew.doe@bank.com', '555-234-5658', '2020-01-15', 1,1000000.00),
('Jane', 'Smith', 'Customer Service Representative', 'jane.smith1@bank.com', '555-234-5657', '2021-03-10', 1,1000000.00),
('Michael', 'Johnson', 'Loan Officer', 'michael.johnson1@bank.com', '555-234-5656', '2019-05-20', 2,1000000.00),
('Sophia', 'Davis', 'Teller', 'Sophia.davis@bank.com', '555-234-5655', '2022-07-15', 2,1000000.00),
('David', 'Wilson', 'Financial Advisor', 'david.wilson1@bank.com', '555-234-5654', '2018-11-30', 3,1000000.00),
('Christopher', 'Brown', 'Branch Manager', 'Christopher.brown@bank.com', '555-234-5653', '2020-02-25', 3,1000000.00),
('Olivia', 'Garcia', 'Customer Service Representative', 'Olivia.garcia@bank.com', '555-234-5652', '2021-04-18', 4,1000000.00),
('Joshua', 'Martinez', 'Teller', 'Joshua.martinez@bank.com', '555-234-5651', '2022-08-10', 4,1000000.00),
('Ava', 'Hernandez', 'Loan Officer', 'Ava.hernandez@bank.com', '555-234-5650', '2019-06-05', 5,1000000.00),
('Ava', 'Lopez', 'Financial Advisor', 'Ava.lopez@bank.com', '555-234-5666', '2020-09-12', 5,1000000.00);

-- Drop the structure& records from the table
drop table staff; 

-- delete the records from table
truncate table staff;

-- Select query 
-- 1.Display all records
select * from staff;
/* ----------------------------------------------------
				 Table 7- Staff crdential
--------------------------------------------------------*/
create table StaffCredential (
    Staffcredential_id int primary key auto_increment, -- Unique identifier for each staff (Primary Key)
    staff_id int, -- staff id is primary key in in satff table which we used as foreign key in this table
    username varchar(50) NOT NULL UNIQUE, -- username for staff
    staff_password varchar(100) NOT NULL, -- password for the staff account
    staff_email varchar(40),  -- staff email id
    created_at timestamp default current_timestamp, -- shows when last record created & updated 
    updated_at timestamp default current_timestamp,
    is_active enum('1','0') not null, -- check staff is ative or not
    last_login DATETIME, -- when staff ;ast login to his/her account
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
    on delete set null
    on update cascade,
    FOREIGN KEY (staff_email) REFERENCES staff(staff_email) 
    on delete set null
    on update cascade
);

-- Inserting records into table

INSERT INTO staffcredential (staff_id,username,staff_password,staff_email)
VALUES(1,'johndoe', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','john.doe@bank.com'), -- password: password123
(2,'janesmith', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','jane.smith@bank.com'), -- password: mysecurepassword
(3,'michaeljohnson', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','michael.johnson@bank.com'), -- password: mjohnson2023
(4,'emilydavis', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','emily.davis@bank.com'), -- password: emily123
(5,'davidwilson', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','david.wilson@bank.com'), -- password: wilson2023
(6,'sarahbrown', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','sarah.brown@bank.com'), -- password: sarahsecure
(7,'jamesgarcia', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','james.garcia@bank.com'), -- password: garcia2023
(8,'jessicamartinez', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','jessica.martinez@bank.com'), -- password: martinez123
(9,'danielhernandez', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','daniel.hernandez@bank.com'), -- password: daniel2023
(10,'lauralopez', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','laura.lopez@bank.com'), -- password: laura123
(11,'matthewdoe', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','Matthew.doe@bank.com'),  -- password: matthew123
(12,'janesmith1', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','jane.smith1@bank.com'),
(13,'michaeljohnson1', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','michael.johnson1@bank.com'),
(14,'sophiadavis', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','Sophia.davis@bank.com'),
(15,'davidwilson1', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','david.wilson1@bank.com'),
(16,'christopherbrown', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','Christopher.brown@bank.com'),
(17,'oliviagarcia', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','Olivia.garcia@bank.com'),
(18,'Joshuamartinez', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','Joshua.martinez@bank.com'),
(19,'Avahernandez', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','Ava.hernandez@bank.com'),
(20,'Avalopez', '$2y$10$EIXZ1Z1Z1Z1Z1Z1Z1Z1Z1Oe1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1','Ava.lopez@bank.com'); -- password: matthew2023

-- Drop the structure& records from the table
drop table staffcredential; 

-- delete the records from table
truncate table staffcredential;

-- Select query 
-- 1.Display all records
select * from staffcredential;

select * from staffcredential where created_at like '%2025-01-26%';


/* ----------------------------------------------------
				 Table 8- Account Type
--------------------------------------------------------*/

create table accounttype (
    account_type_id int primary key auto_increment,  -- Unique identifier for each staff (Primary Key)
    account_type_name varchar(50) not null UNIQUE, -- check the type of account where it saving or current account etc.
    description TEXT, -- description of the account
    minimum_balance decimal(10, 2), -- min balance available in account to keep it open
    interest_rate decimal(5, 2), -- interest per account
    account_fee decimal(10, 2), -- account opening charges
    withdrawal_limit decimal(10, 2), -- how much balance user will be withdraw from account
    created_at timestamp default current_timestamp, -- last record created & updated date
    updated_at timestamp default current_timestamp,
    is_active enum('1','0') not null -- check account account is active or not
);


-- Inserting records into table

INSERT INTO accounttype (account_type_name, description,minimum_balance,interest_rate,account_fee,withdrawal_limit) 
VALUES('Savings Account', 'An account that earns interest on deposits and is used for saving money.',1000.00,5.45,0.00,25000.00),
('Checking Account', 'An account that allows for deposits and withdrawals, typically used for daily transactions.',1000.98,5.45,0.00,50000.00),
('Business Account', 'An account designed for business transactions and operations.',10000.00,5.45,0.00,55000.00),
('Joint Account', 'An account shared by two or more individuals.',1000.00,5.45,0.00,25000.00),
('Certificate of Deposit (CD)', 'A time deposit account that earns interest at a fixed rate for a specified term.',1000.00,5.45,0.00,25000.00),
('Money Market Account', 'A savings account that typically earns a higher interest rate and may require a higher minimum balance.',1000.00,5.45,0.00,25000.00),
('Retirement Account', 'An account designed for retirement savings, such as an IRA.',1000.00,5.45,0.00,25000.00),
('Student Account', 'An account designed for students, often with lower fees and minimum balance requirements.',1000.00,5.45,0.00,25000.00),
('Senior Citizen Account', 'An account with benefits tailored for senior citizens.',1000.00,5.45,0.00,25000.00),
('Health Savings Account (HSA)', 'An account that allows individuals to save for medical expenses with tax advantages.',1000.00,5.45,0.00,25000.00),
('Trust Account', 'An account held in the name of a trust for the benefit of a third party.',1000.00,5.45,0.00,25000.00),
('Foreign Currency Account', 'An account that holds funds in foreign currencies.',1000.00,5.45,0.00,25000.00),
('Investment Account', 'An account used for buying and selling investments, such as stocks and bonds.',1000.00,5.45,0.00,25000.00),
('Online Savings Account', 'A savings account that is managed online, often with higher interest rates.',1000.00,5.45,0.00,25000.00),
('High-Yield Savings Account', 'A savings account that offers a higher interest rate than traditional savings accounts.',1000.00,5.45,0.00,25000.00),
('Checking Plus Account', 'A checking account that offers additional features and benefits.',1000.00,5.45,0.00,25000.00),
('Business Savings Account', 'A savings account designed specifically for business savings.',1000.00,5.45,0.00,25000.00),
('Youth Account', 'An account designed for minors, often with parental oversight.',1000.00,5.45,0.00,25000.00),
('Payroll Account', 'An account used for direct deposit of payroll checks.',1000.00,5.45,0.00,25000.00),
('Special Purpose Account', 'An account designated for a specific purpose, such as travel or education savings.',1000.00,5.45,0.00,25000.00);

-- Drop the structure& records from the table
drop table accounttype; 

-- delete the records from table
truncate table accounttype;

-- Select query 
-- 1.Display all records
select * from accounttype;
/* ----------------------------------------------------
				 Table 9 - Loan Type
--------------------------------------------------------*/
create table loantype (
    loan_type_id int primary key auto_increment, --  Unique identifier for each staff (Primary Key)
    loan_type_name varchar(100) NOT NULL UNIQUE, -- types of the loan
    description text, -- description of the loan type
    interest_rate decimal(5,2), -- interest rate applied different loan type
    loan_term varchar(50), -- Duration of the loan 
    minimum_amount decimal(10, 2) check (minimum_amount>0), -- Minimum loan amount that can be borrowed.
    maximum_amount decimal(10, 2) check (maximum_amount>0), -- Maximum loan amount available for borrowing.
    processing_fee decimal(10, 2) check (processing_fee>0), -- processing fee which applied for loan documentation & work
    created_at timestamp default current_timestamp, -- last record created & updated date
    updated_at timestamp default current_timestamp,
    is_active enum('1','0') not null -- loan is active or not
);


-- Inserting records into table

INSERT INTO loantype (loan_type_name, description,interest_rate,loan_term,minimum_amount,maximum_amount,processing_fee)
VALUES('Personal Loan', 'An unsecured loan for personal use, typically with a fixed interest rate.',13.40,60,100000,2000000,1000),
('Home Loan', 'A loan specifically for purchasing a home, secured by the property.',10.40,365,100000,3000000,1000),
('Auto Loan', 'A loan for purchasing a vehicle, secured by the vehicle itself.',10.40,67,100000,4000000,1000),
('Student Loan', 'A loan designed to help students pay for education-related expenses.',11.40,77,100000,5000000,1000),
('Business Loan', 'A loan for business purposes, which can be secured or unsecured.',12.40,87,100000,6000000,1000),
('Mortgage Loan', 'A long-term loan secured by real estate, typically used to purchase a home.',5.40,12,100000,7000000,1000),
('Home Equity Loan', 'A loan that allows homeowners to borrow against the equity in their home.',6.40,13,100000,8000000,1000),
('Line of Credit', 'A flexible loan option that allows borrowers to draw funds as needed.',7.40,55,100000,9000000,1000),
('Debt Consolidation Loan', 'A loan used to pay off multiple debts, combining them into one payment.',8.40,34,100000,1100000,1000),
('Payday Loan', 'A short-term, high-interest loan typically due on the borrower’s next payday.',9.40,56,100000,2200000,1000),
('Construction Loan', 'A short-term loan used to finance the building of a home or other real estate.',10.00,44,330000,2000000,1000),
('Refinance Loan', 'A loan taken out to pay off an existing loan, often at a lower interest rate.',13.65,60,100000,4400000,1000),
('Small Business Administration (SBA) Loan', 'A loan backed by the SBA to help small businesses.',6.89,60,100000,5500000,1000),
('Agricultural Loan', 'A loan specifically for agricultural purposes, such as purchasing equipment or land.',4.40,60,100000,6600000,1000),
('Vacation Loan', 'A personal loan specifically for financing a vacation or travel expenses.',2.50,60,100000,7700000,1000),
('Medical Loan', 'A loan designed to cover medical expenses not covered by insurance.',3.54,60,100000,8800000,1000),
('Green Loan', 'A loan for financing environmentally friendly projects or energy-efficient upgrades.',3.45,60,100000,2100000,1000),
('Bridge Loan', 'A short-term loan used until a person secures permanent financing or removes an existing obligation.',1.43,60,100000,1200000,1000),
('Peer-to-Peer Loan', 'A loan facilitated through online platforms that connect borrowers with individual lenders.',13.40,60,100000,4300000,1000),
('Bad Credit Loan', 'A loan designed for borrowers with poor credit history, often with higher interest rates.',13.40,60,100000,5600000,1000);

-- Drop the structure& records from the table
drop table loantype; 

-- delete the records from table
truncate table loantype;

-- Select query 
-- 1.Display all records
select * from loantype;
/* ----------------------------------------------------
				 Table 10 - Payment method Type
--------------------------------------------------------*/
create table PaymentMethod (
    payment_method_id int primary key auto_increment, --  Unique identifier for each staff (Primary Key)
    payment_method_name varchar(100) NOT NULL UNIQUE, -- payment method like cash card gpay
    description text, -- description of the payment method
    transaction_fee decimal(10, 2) DEFAULT 0.00, -- if we used 3rd party payment method then applied charges
    is_active enum('1','0') not null -- check payment method is active or not 
);


-- Inserting records into table

INSERT INTO PaymentMethod (payment_method_name, description,transaction_fee) VALUES
('Credit Card', 'A card issued by a financial institution allowing the holder to borrow funds for purchases.',0.00),
('Debit Card', 'A card that deducts money directly from a consumer’s checking account to pay for a purchase.',0.00),
('Bank Transfer', 'A method of transferring money from one bank account to another.',0.00),
('Cash', 'Physical currency used for transactions.',0.00),
('Check', 'A written order directing a bank to pay a specific amount from a person’s account.',0.00),
('Mobile Payment', 'Payments made through mobile devices using apps or digital wallets.',10.00),
('Online Payment', 'Payments made over the internet using various platforms and services.',0.00),
('Wire Transfer', 'An electronic transfer of funds across a network administered by hundreds of banks around the world.',100.00),
('Cryptocurrency', 'Digital or virtual currency that uses cryptography for security.',220.00),
('Prepaid Card', 'A card that is preloaded with a specific amount of money for use until the balance is depleted.',0.00),
('Direct Deposit', 'An electronic transfer of a payment directly into a bank account.',0.00),
('Recurring Payment', 'A payment that is automatically deducted from an account on a regular basis.',0.00),
('E-check', 'An electronic version of a paper check used for online payments.',50.00),
('Payment Gateway', 'A service that authorizes credit card or direct payments for online businesses.',230.00),
('Point of Sale (POS)', 'A system that allows merchants to accept payments at retail locations.',100.00),
('Buy Now, Pay Later', 'A payment option that allows consumers to make purchases and pay for them over time.',100.00),
('Gift Card', 'A prepaid card that can be used as a payment method at specific retailers.',100.00),
('Contactless Payment', 'A secure method for consumers to purchase products or services using a debit or credit card or a mobile device.',100.00),
('Installment Payment', 'A payment method that allows consumers to pay for a purchase in multiple smaller payments over time.',100.00),
('Payment Plan', 'An arrangement to pay for a product or service in installments over a specified period.',100.00);

-- Drop the structure& records from the table
drop table PaymentMethod; 

-- delete the records from table
truncate table PaymentMethod;

-- Select query 
-- 1.Display all records
select * from PaymentMethod;
/* ----------------------------------------------------
				 Table 11 - Policy 
--------------------------------------------------------*/
create table policies (
    policy_id int primary key auto_increment, -- A unique identifier for each policy (primary key).
    policy_name varchar(100) NOT NULL, -- The name of the policy (e.g., "Loan Approval Policy", "Customer Privacy Policy").
    description text(300), -- A detailed description of the policy, outlining its purpose and key points.
    start_date date, -- The date when the policy comes into effect.
    end_date date, -- The date when the policy is set to expire (if applicable). This can be NULL if the policy is ongoing.
    coverage_amount decimal(15, 2), -- The date when the policy is set to expire (if applicable). This can be NULL if the policy is ongoing.
    premium_amount decimal(15, 2), -- This column represents the cost of the policy, which can be a monthly or annual premium.
    interest_rate decimal(5, 2), --  interest rate applied different policy type
    term_length int, -- Duration of the policy
    status varchar(20) DEFAULT 'Active',
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
    on delete set NULL
    on update cascade
);


-- Inserting records into table


INSERT INTO policies (policy_name, description, start_date,end_date,coverage_amount,premium_amount,interest_rate,term_length,customer_id) VALUES
('Loan Policy', 'Details the terms and conditions for various types of loans offered by the bank.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,1),
('Account Policy', 'Outlines the rules and regulations governing bank accounts.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,2),
('Privacy Policy', 'Describes how the bank collects, uses, and protects customer information.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,3),
('Fee Policy', 'Lists all fees associated with accounts and services provided by the bank.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,4),
('Overdraft Policy', 'Explains the terms and conditions related to overdraft protection.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,5),
('Credit Card Policy', 'Details the terms and conditions for credit card usage and payments.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,6),
('Investment Policy', 'Outlines the guidelines for investment products offered by the bank.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,7),
('Loan Default Policy', 'Describes the procedures and consequences of loan defaults.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,8),
('Customer Service Policy', 'Outlines the standards for customer service and support.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,9),
('Dispute Resolution Policy', 'Details the process for resolving disputes between the bank and customers.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,10),
('Account Closure Policy', 'Describes the procedures for closing bank accounts.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,11),
('Fraud Prevention Policy', 'Outlines measures taken to prevent fraud and protect customers.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,12),
('Data Retention Policy', 'Describes how long customer data is retained and the process for its disposal.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,12),
('Loan Application Policy', 'Details the requirements and process for applying for a loan.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,13),
('Foreign Transaction Policy', 'Outlines the fees and terms for foreign currency transactions.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,13),
('ATM Usage Policy', 'Describes the rules and fees associated with ATM usage.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,13),
('Online Banking Policy', 'Outlines the terms and conditions for using online banking services.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,14),
('Mobile Banking Policy', 'Details the guidelines for using mobile banking applications.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,15),
('Security Policy', 'Describes the security measures in place to protect customer accounts.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,16),
('Compliance Policy', 'Outlines the bank’s commitment to regulatory compliance and ethical standards.', '2023-01-01','2026-12-30',2000000,50000.00,5.98, 120,17);


-- Drop the structure& records from the table
drop table policies; 

-- delete the records from table
truncate table policies;

-- Select query 
-- 1.Display all records
select * from policies;
/* ----------------------------------------------------
				 Table 12 - Account details
--------------------------------------------------------*/

create table account_details (
    account_id int primary key auto_increment,  -- A unique identifier for each policy (primary key).
    account_number varchar(20) UNIQUE NOT NULL, -- account number of bank account which opened by customer
    account_type varchar(50) NOT NULL, -- type of the account opened by customer
    balance decimal(15, 2) DEFAULT 0.00, -- balance available in the account
    currency varchar(3) NOT NULL, -- cuurency use by bank
    status varchar(20) DEFAULT 'Active', -- status of account
	customer_id int, -- this is primary key in customer table which we use as foreign key
    opening_date date NOT NULL, -- opening date of the bank account
    closing_date date, -- closing date of the bank account
    interest_rate decimal(5, 2), -- annual interest rate applied to the account
    minimum_balance decimal(15, 2), --  minimum balance that must be maintained in the account to avoid penalties or fees
    overdraft_limit decimal(15, 2), -- maximum amount that an account can be overdrawn
    branch_id int, -- id of the branch to which account is associated
    created_at timestamp default current_timestamp, -- last record created & updated date
    updated_at timestamp default current_timestamp,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    on delete set NULL
    on update cascade,
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
     on delete set NULL
    on update cascade
);

-- Inserting single record into table


INSERT INTO account_details (account_number, account_type, balance, currency, status, customer_id,opening_date,interest_rate,minimum_balance,overdraft_limit,branch_id) VALUES
('ACC100001', 'Savings Account', 1500.00, 'USD', 'Active', 1,'2018-01-08',8.40,500,25000,2);


-- Inserting records into table

INSERT INTO account_details (account_number, account_type, balance, currency, status, customer_id,opening_date,interest_rate,minimum_balance,overdraft_limit,branch_id) VALUES
('ACC100002', 'Checking Account', 2500.00, 'USD', 'Active', 1,'2018-01-08',8.40,500,25000,2),
('ACC100003', 'Business Account', 5000.00, 'USD', 'Active', 2,'2018-01-08',8.40,500,25000,3),
('ACC100004', 'Savings Account', 3000.00, 'USD', 'Active', 3,'2018-01-08',8.40,500,25000,3),
('ACC100005', 'Checking Account', 1200.00, 'USD', 'Active', 4,'2018-01-08',8.40,500,25000,4),
('ACC100006', 'Savings Account', 4500.00, 'USD', 'Active', 5,'2018-01-08',8.40,500,25000,5),
('ACC100007', 'Joint Account', 2000.00, 'USD', 'Active', 6,'2018-01-08',8.40,500,25000,6),
('ACC100008', 'Savings Account', 8000.00, 'USD', 'Active', 7,'2018-01-08',8.40,500,25000,7),
('ACC100009', 'Checking Account', 600.00, 'USD', 'Active', 8,'2018-01-08',8.40,500,25000,8),
('ACC100010', 'Savings Account', 7500.00, 'USD', 'Active', 9,'2018-01-08',8.40,500,25000,9),
('ACC100011', 'Business Account', 10000.00, 'USD', 'Active', 10,'2018-01-08',8.40,500,25000,10),
('ACC100012', 'Savings Account', 200.00, 'USD', 'Active', 11,'2018-01-08',8.40,500,25000,18),
('ACC100013', 'Checking Account', 1500.00, 'USD', 'Active', 12,'2018-01-08',8.40,500,25000,11),
('ACC100014', 'Savings Account', 300.00, 'USD', 'Active', 13,'2018-01-08',8.40,500,25000,12),
('ACC100015', 'Checking Account', 4000.00, 'USD', 'Active', 14,'2018-01-08',8.40,500,25000,13),
('ACC100016', 'Savings Account', 500.00, 'USD', 'Active', 15,'2018-01-08',8.40,500,25000,14),
('ACC100017', 'Business Account', 6000.00, 'USD', 'Active', 16,'2018-01-08',8.40,500,25000,4),
('ACC100018', 'Joint Account', 7000.00, 'USD', 'Active', 17,'2018-01-08',8.40,500,25000,15),
('ACC100019', 'Savings Account', 8500.00, 'USD', 'Active', 18,'2018-01-08',8.40,500,25000,16),
('ACC100020', 'Checking Account', 950.00, 'USD', 'Active', 19,'2018-01-08',8.40,500,25000,17),
('ACC100021', 'Checking Account', 950.00, 'USD', 'Active', 20,'2018-01-08',8.40,500,25000,17);

-- Drop the structure& records from the table
drop table account_details; 

-- delete the records from table
truncate table account_details;

-- Select query 
-- 1.Display all records
select * from account_details;


/* ----------------------------------------------------
				 Table 13 - Bank Transaction
--------------------------------------------------------*/
create table bank_transactions (
    transaction_id int primary key auto_increment, -- A unique identifier for each bank transaction (primary key).
    transaction_date datetime NOT NULL, --  records the date and time when the transaction occurred
    transaction_type varchar(20) NOT NULL, -- the type of transaction being recorded, such as "Deposit," "Withdrawal
    transaction_amount decimal(15, 2) NOT NULL, -- amount of money involved in the transaction
    currency varchar(3) NOT NULL, -- the currency in which the transaction is conducted
    account_id INT, -- foreign key linking the transaction to a specific bank account
    description TEXT, -- additional details about the transaction
    transaction_status varchar(20) DEFAULT 'Completed', -- indicates the current status of the transaction, such as "Completed," "Pending,
    medium_of_transaction varchar(20), --  method through which the transaction was conducted, such as "Online," "ATM," 
    reference_number varchar(40) unique not null, -- unique reference number for the transaction, which can be used for tracking and reconciliation purposes
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp,
    FOREIGN KEY (account_id) REFERENCES account_details(account_id)
    on delete set NULL
    on update cascade
);


-- Inserting records into table

INSERT INTO bank_transactions (transaction_date, transaction_type, transaction_amount, currency, account_id, description, transaction_status,medium_of_transaction,reference_number) 
VALUES('2023-01-15 10:30:00', 'Deposit', 1500.00, 'USD', 1, 'Salary deposit', 'Completed','Credit Card',001),
('2023-01-16 14:45:00', 'Withdrawal', 200.00, 'USD', 1, 'ATM withdrawal', 'Completed','Debit Card',002),
('2023-01-17 09:00:00', 'Transfer', 500.00, 'USD', 2, 'Transfer to savings', 'Completed','Bank Transfer',003),
('2023-01-18 11:15:00', 'Deposit', 3000.00, 'USD', 3, 'Business loan deposit', 'Completed','Cash',004),
('2023-01-19 16:30:00', 'Withdrawal', 150.00, 'USD', 4, 'Grocery shopping', 'Completed','Check',005),
('2023-01-20 12:00:00', 'Transfer', 1000.00, 'USD', 5, 'Transfer to checking', 'Completed','Mobile Payment',006),
('2023-01-21 08:30:00', 'Deposit', 800.00, 'USD', 6, 'Cash deposit', 'Completed','Online Payment',007),
('2023-01-22 15:00:00', 'Withdrawal', 250.00, 'USD', 7, 'Online purchase', 'Completed','E-check',008),
('2023-01-23 10:00:00', 'Transfer', 1200.00, 'USD', 8, 'Transfer to joint account', 'Completed','Card',009),
('2023-01-24 14:00:00', 'Deposit', 500.00, 'USD', 9, 'Refund from merchant', 'Completed','Card',010),
('2023-01-25 09:30:00', 'Withdrawal', 300.00, 'USD', 10, 'Utility bill payment', 'Completed','Cash',011),
('2023-01-26 11:45:00', 'Transfer', 400.00, 'USD', 11, 'Transfer to savings', 'Completed','Card',012),
('2023-01-27 13:00:00', 'Deposit', 2000.00, 'USD', 12, 'Investment return', 'Completed','Card',013),
('2023-01-28 16:15:00', 'Withdrawal', 100.00, 'USD', 13, 'Dining out', 'Completed','Card',014),
('2023-01-29 10:30:00', 'Transfer', 600.00, 'USD', 14, 'Transfer to business account', 'Completed','Card',015),
('2023-01-30 12:00:00', 'Deposit', 750.00, 'USD', 15, 'Gift from family', 'Completed','Card',016),
('2023-01-31 14:30:00', 'Withdrawal', 50.00, 'USD', 16, 'Coffee shop', 'Completed','Wire Transfer',017),
('2023-02-01 09:00:00', 'Transfer', 900.00, 'USD', 17, 'Transfer to personal account', 'Completed','Wire Transfer',018),
('2023-02-02 11:15:00', 'Deposit', 1200.00, 'USD', 18, 'Freelance payment', 'Completed','Payment Gateway',019),
('2023-02-03 13:45:00', 'Withdrawal', 400.00, 'USD', 19, 'Shopping', 'Completed','Online Payment',020),
('2023-02-04 15:30:00', 'Transfer', 300.00, 'USD', 20, 'Transfer to savings', 'Completed','Mobile Payment',021);

-- Drop the structure& records from the table
drop table bank_transactions; 

-- delete the records from table
truncate table bank_transactions;

-- Select query 
-- 1.Display all records
select * from bank_transactions;
select * from account_details;

/* ----------------------------------------------------
				 Table 14- loan_details
--------------------------------------------------------*/

create table loan_details (
    loan_id int primary key auto_increment, -- unique identifier for each loan record. It is defined as the primary key
    loan_type varchar(50) NOT NULL, -- the type of loan being issued, such as Personal Loan,Home Loan ,Auto Loan
    loan_amount decimal(15, 2) NOT NULL, -- the total amount of money being borrowed through the loan
    interest_rate decimal(5, 2) NOT NULL, -- the annual interest rate applied to the loan.
    term_length int NOT NULL, --  length of the loan term in months 
    start_date date NOT NULL, -- the date when the loan agreement becomes effective and the borrower can access the funds. 
    end_date date NOT NULL, -- the date when the loan is scheduled to be fully repaid
    monthly_payment decimal(15, 2) NOT NULL, -- the amount that the borrower is required to pay each month to repay the loan
    status varchar(20) DEFAULT 'Active', -- the current status of the loan, such as Active,Paid Off etc
    customer_id int,  -- foreign key linking the loan to a specific customer account
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
    on delete set NULL
    on update cascade
);



-- Inserting records into table

INSERT INTO loan_details (loan_type, loan_amount, interest_rate, term_length, start_date, end_date, monthly_payment, status, customer_id) 
VALUES('Personal Loan', 100000.00, 5.5, 24, '2023-01-15', '2025-01-15', 219000.36, 'Active', 1),
('Home Loan', 6000000.00, 3.75, 360, '2020-06-01', '2050-06-01', 115700.79, 'Active', 2),
('Auto Loan', 200000.00, 4.5, 60, '2022-03-10', '2027-03-10', 372000.24, 'Active', 3),
('Education Loan', 400000.00, 6.0, 48, '2021-09-01', '2025-09-01', 368000.33, 'Active', 4),
('Home Equity Loan', 2500000.00, 4.0, 120, '2022-05-15', '2032-05-15', 760000.00, 'Active', 5),
('Debt Consolidation Loan', 100000.00, 7.0, 36, '2023-02-01', '2026-02-01', 322000.67, 'Active', 6),
('Small Business Loan', 2000000.00, 5.0, 60, '2021-11-15', '2026-11-15', 566000.14, 'Active', 7),
('Vacation Loan', 50000.00, 6.5, 24, '2023-03-01', '2025-03-01', 34800.56, 'Active', 8),
('Medical Loan', 1500000.00, 8.0, 36, '2022-08-01', '2025-08-01', 39600.24, 'Active', 9),
('Construction Loan', 10000000.00, 4.25, 180, '2021-01-01', '2031-01-01', 1160000.00, 'Active', 10),
('Refinance Loan', 200000.00, 3.5, 240, '2020-12-01', '2040-12-01', 798000.00, 'Active', 11),
('Agricultural Loan', 100000.00, 5.75, 60, '2022-04-01', '2027-04-01', 96600.00, 'Active', 12),
('Peer-to-Peer Loan', 250000.97, 9.0, 24, '2023-01-10', '2025-01-10', 32800.00, 'Active', 13),
('Green Loan', 250000.00, 4.5, 48, '2022-06-15', '2026-06-15', 610000.00, 'Active', 14),
('Home Improvement Loan', 150000.00, 5.0, 36, '2023-02-15', '2026-02-15', 449000.00, 'Active', 15),
('Credit Builder Loan', 90000.00, 10.0, 12, '2023-03-01', '2024-03-01', 275000.00, 'Active', 16),
('Business Expansion Loan',  890999.00, 10.0, 12, '2023-03-01', '2024-03-01', 2750000.00, 'Active', 17),
('Pay-Day Loan',  95000.32, 10.0, 06, '2023-03-01', '2024-03-01', 98000.00, 'Active', 17),
('Gold Loan',  495000.00, 11.41, 36, '2023-03-01', '2024-03-01', 76890.00, 'Active', 17);

-- Drop the structure& records from the table
drop table loan_details; 

-- delete the records from table
truncate table loan_details;

-- Select query 
-- 1.Display all records
select * from loan_details;

/* ----------------------------------------------------
				 Table 15 - Credit Card
--------------------------------------------------------*/
create table credit_card (
    card_id int primary key auto_increment, --  unique identifier for each card record.
    card_type varchar(50) NOT NULL, --  the type of card being issued, such as Credit Card,Debit Card,Prepaid Card
    card_number varchar(25) NOT NULL UNIQUE, --  the unique number assigned to the card, which is used for transactions.
    exp_month int NOT NULL, -- month when the card expires, represented 
    exp_year int NOT NULL, -- indicates the year when the card expires
    cardholder_name varchar(100) NOT NULL, --  name of the individual or entity to whom the card is issued.
    cvv int NOT NULL, -- represents the Card Verification Value (CVV), a security feature used to verify that the cardholder
    balance decimal(15, 2) DEFAULT 0.00, -- indicates the current balance available on the card,
    status varchar(20) DEFAULT 'Active', -- indicates the current status of the card, such as Active,Inactive,Blocked
    customer_id int, --  foreign key linking the card to a specific customer
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
	on delete set NULL
    on update cascade
);

-- Inserting records into table

INSERT INTO credit_card (card_type, card_number, exp_month, exp_year, cardholder_name, cvv, balance, status, customer_id) VALUES
('Visa', '4111111111111111', 12, 2025, 'John Doe', 123, 5000.00, 'Active', 1),
('MasterCard', '5500000000000004', 11, 2024, 'Jane Smith', 456, 3000.00, 'Active', 2),
('American Express', '378282246310005', 10, 2026, 'Alice Johnson', 789, 7000.00, 'Active', 3),
('Discover', '6011000990139424', 9, 2023, 'Bob Brown', 321, 2500.00, 'Active', 4),
('Visa', '4111111111111112', 8, 2025, 'Charlie Davis', 654, 1500.00, 'Active', 5),
('MasterCard', '5500000000000005', 7, 2024, 'Eve White', 987, 4000.00, 'Active', 6),
('American Express', '378282246310006', 6, 2026, 'Frank Black', 159, 6000.00, 'Active', 7),
('Discover', '6011000990139425', 5, 2023, 'Grace Green', 753, 3500.00, 'Active', 8),
('Visa', '4111111111111113', 4, 2025, 'Hank Blue', 852, 2000.00, 'Active', 9),
('MasterCard', '5500000000000006', 3, 2024, 'Ivy Red', 246, 4500.00, 'Active', 10),
('American Express', '378282246310007', 2, 2026, 'Jack Yellow', 369, 8000.00, 'Active', 11),
('Discover', '6011000990139426', 1, 2023, 'Kathy Purple', 147, 3000.00, 'Active', 12),
('Visa', '4111111111111114', 12, 2025, 'Leo Orange', 258, 5500.00, 'Active', 13),
('MasterCard', '5500000000000007', 11, 2024, 'Mona Pink', 369, 3700.00, 'Active', 14),
('American Express', '378282246310008', 10, 2026, 'Nina Grey', 159, 4900.00, 'Active', 15),
('Discover', '6011000990139427', 9, 2023, 'Oscar Cyan', 753, 6200.00, 'Active', 16),
('Visa', '4111111111111115', 8, 2025, 'Paul Magenta', 852, 2800.00, 'Active', 17),
('MasterCard', '5500000000000008', 7, 2024, 'Quinn Brown', 246, 3300.00, 'Active', 18),
('American Express', '378282246310009', 6, 2026, 'Rita White', 159, 7200.00, 'Active', 19),
('Discover', '6011000990139428', 5, 2023, 'Sam Black', 753, 4100.00, 'Active', 20);

-- Drop the structure& records from the table
drop table credit_card; 

-- delete the records from table
truncate table credit_card;

-- Select query 
-- 1.Display all records
select * from credit_card;
/* ----------------------------------------------------
				 Table 16 - payment history
--------------------------------------------------------*/
CREATE TABLE payment_history (
    payment_id int primary key auto_increment, --  unique identifier for each payment record.
    payment_date date, --  records the date when the payment was made.
    amount decimal(10, 2), --  total amount of money involved in the payment
    payment_method_name varchar(100), -- indicates the method used to make the payment, such as Credit Card,Debit Card, Bank Transfer etc
    status varchar(10), -- indicates the current status of the payment, such as Completed,Pending,Failed,Refunded
    account_number varchar(20), -- contains the account number associated with the payment.
    foreign key (payment_method_name) references PaymentMethod(payment_method_name)
    on delete set NULL
    on update cascade,
	foreign key (account_number) references Account_details(account_number)
	on delete set NULL
    on update cascade
);

-- Inserting records into table

INSERT INTO payment_history (payment_date,amount,payment_method_name,status,account_number)
VALUES ( '2025-01-01', 1500.00, 'Credit Card', 'Completed', 'ACC100002'),
( '2025-01-02', 500.00, 'Debit Card', 'Completed', 'ACC100003'),
('2025-01-03', 2000.00, 'Bank Transfer', 'Pending', 'ACC100004'),
('2025-01-04', 1000.00, 'Cash', 'Completed', 'ACC100005'),
('2025-01-05', 750.00, 'Credit Card', 'Failed', 'ACC100006'),
( '2025-01-06', 3000.00, 'Debit Card', 'Completed', 'ACC100007'),
( '2025-01-07', 1200.00, 'Bank Transfer', 'Completed', 'ACC100008'),
( '2025-01-08', 2500.00, 'Cash', 'Completed', 'ACC100009'),
('2025-01-08',500.00, 'Credit Card', 'Completed', 'ACC100010'),
('2025-01-10', 800.00, 'Debit Card', 'Completed', 'ACC100011'),
('2025-01-11', 600.00, 'Bank Transfer', 'Completed', 'ACC100012'),
( '2025-01-12', 400.00, 'Cash', 'Pending', 'ACC100013'),
( '2025-01-13', 900.00, 'Credit Card', 'Completed', 'ACC100014'),
( '2025-01-14', 1200.00, 'Debit Card', 'Completed', 'ACC100015'),
( '2025-01-15', 300.00, 'Bank Transfer', 'Failed', 'ACC100016'),
( '2025-01-16', 1500.00, 'Cash', 'Completed', 'ACC100017'),
( '2025-01-17', 200.00, 'Credit Card', 'Completed', 'ACC100018'),
( '2025-01-18', 600.00, 'Debit Card', 'Completed', 'ACC100019'),
( '2025-01-19', 1800.00, 'Bank Transfer', 'Completed', 'ACC100020'),
('2025-01-20', 700.00, 'Cash', 'Completed', 'ACC100021');


-- Drop the structure& records from the table
drop table payment_history; 

-- delete the records from table
truncate table payment_history;

-- Select query 
-- 1.Display all records
select * from payment_history;

/* ----------------------------------------------------
				 Table 17 - Customer Reviews
--------------------------------------------------------*/
CREATE TABLE BankCustomerReviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT, -- unique identifier for each review record. 
    customer_id INT, --  Identifier for the customer who submitted the review, linking it to the customer table.
    bank_id INT, -- Identifier for the bank being reviewed, linking it to the bank table.
    Rating INT CHECK (Rating BETWEEN 1 AND 5), -- Customer's rating of the bank on a scale of 1 to 5
    ReviewText TEXT, -- Text of the review, allowing for detailed customer feedback
    ReviewDate DATETIME, --  Date and time when the review was submitted
    UsefulCount INT, -- Count of how many users found the review helpful
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
	on delete set NULL
    on update cascade,
    FOREIGN KEY (bank_id) REFERENCES bank_details(bank_id)
	on delete set NULL
    on update cascade
);

-- Inserting records into table

INSERT INTO BankCustomerReviews (ReviewID, customer_id, Bank_ID, Rating, ReviewText, ReviewDate, UsefulCount) VALUES
(1, 1, 1, 5, 'Excellent service and friendly staff!', '2025-01-01', 10),
(2, 2, 2, 4, 'Good experience, but the wait time was long.', '2025-01-02', 5),
(3, 3, 3, 3, 'Average service, nothing special.', '2025-01-03', 2),
(4, 4, 4, 2, 'Had issues with my account, not satisfied.', '2025-01-04', 1),
(5, 5, 5, 1, 'Terrible experience, will not return.', '2025-01-05', 0),
(6, 6, 6, 5, 'Highly recommend! Quick and efficient.', '2025-01-06', 15),
(7, 7, 7, 4, 'Good rates, but customer service could improve.', '2025-01-07', 8),
(8, 8, 8, 3, 'Decent bank, but I found better options.', '2025-01-08', 3),
(9, 9, 9, 2, 'Not happy with the fees.', '2025-01-09', 1),
(10, 10, 10, 5, 'Best bank I have ever used!', '2025-01-10', 20),
(11, 11, 11, 4, 'Solid bank, but the app is buggy.', '2025-01-11', 7),
(12, 12, 12, 3, 'Okay service, but could be better.', '2025-01-12', 4),
(13, 13, 13, 2, 'Not impressed with the loan process.', '2025-01-13', 2),
(14, 14, 14, 1, 'Horrible experience, avoid at all costs.', '2025-01-14', 0),
(15, 15, 15, 5, 'Fantastic customer support!', '2025-01-15', 12),
(16, 16, 16, 4, 'Great bank, but the website is slow.', '2025-01-16', 6),
(17, 17, 17, 3, 'Average experience, nothing to complain about.', '2025-01-17', 3),
(18, 18, 18, 2, 'Had some issues with my debit card.', '2025-01-18', 1),
(19, 19, 19, 1, 'Very poor service, will not recommend.', '2025-01-19', 0),
(20, 20, 20, 1, 'Very poor service, will not recommend.', '2025-01-19', 0);


-- Drop the structure& records from the table
drop table BankCustomerReviews; 

-- delete the records from table
truncate table BankCustomerReviews;

-- Select query 
-- 1.Display all records
select * from BankCustomerReviews;


/* ----------------------------------------------------
				 Table 18 - Bank Statements
--------------------------------------------------------*/

CREATE TABLE bank_statements (
    id  INT PRIMARY KEY AUTO_INCREMENT,                -- Unique identifier for each statement
    account_id int,              -- Foreign key to link to the account details
    statement_date DATE NOT NULL,         -- Date of the statement
    opening_balance DECIMAL(15, 2) NOT NULL,  -- Opening balance for the statement period
    closing_balance DECIMAL(15, 2) NOT NULL,  -- Closing balance for the statement period
    total_deposits DECIMAL(15, 2) DEFAULT 0.00, -- Total deposits during the period
    total_withdrawals DECIMAL(15, 2) DEFAULT 0.00, -- Total withdrawals during the period
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP , 
    FOREIGN KEY (account_id) REFERENCES account_details(account_id) -- Assuming there is an accounts table
    on delete set NULL
    on update cascade
);

-- Inserting records into table

INSERT INTO bank_statements (account_id, statement_date, opening_balance, closing_balance, total_deposits, total_withdrawals) VALUES
(1, '2023-01-31', 1500.00, 1800.00, 500.00, 200.00),
(1, '2023-02-28', 1800.00, 1600.00, 300.00, 500.00),
(1, '2023-03-31', 1600.00, 2000.00, 800.00, 400.00),
(2, '2023-01-31', 2500.00, 2700.00, 300.00, 100.00),
(2, '2023-02-28', 2700.00, 2900.00, 400.00, 200.00),
(2, '2023-03-31', 2900.00, 2500.00, 100.00, 500.00),
(3, '2023-01-31', 3200.00, 3400.00, 300.00, 100.00),
(3, '2023-02-28', 3400.00, 3600.00, 400.00, 200.00),
(3, '2023-03-31', 3600.00, 3800.00, 500.00, 300.00),
(4, '2023-01-31', 4000.00, 4200.00, 300.00, 100.00),
(4, '2023-02-28', 4200.00, 4500.00, 400.00, 100.00),
(4, '2023-03-31', 4500.00, 4300.00, 200.00, 400.00),
(5, '2023-01-31', 5000.00, 5200.00, 300.00, 100.00),
(5, '2023-02-28', 5200.00, 5400.00, 200.00, 100.00),
(5, '2023-03-31', 5400.00, 6000.00, 800.00, 200.00),
(6, '2023-01-31', 6000.00, 6200.00, 300.00, 100.00),
(6, '2023-02-28', 6200.00, 6400.00, 200.00, 100.00),
(6, '2023-03-31', 6400.00, 6500.00, 100.00, 0.00),
(7, '2023-01-31', 7000.00, 7200.00, 300.00, 100.00),
(7, '2023-02-28', 7200.00, 7400.00, 200.00, 100.00),
(7, '2023-03-31', 7400.00, 7300.00, 100.00, 200.00);

-- Drop the structure& records from the table
drop table bank_statements; 

-- delete the records from table
truncate table bank_statements;

-- Select query 
-- 1.Display all records
select * from bank_statements;
/* ----------------------------------------------------
				 Table 19 - Investments
--------------------------------------------------------*/
CREATE TABLE investments (
    id  INT PRIMARY KEY AUTO_INCREMENT,                -- Unique identifier for each investment
    account_id INT,              -- Foreign key to link to the account
    investment_type VARCHAR(50) NOT NULL, -- Type of investment (e.g., stocks, bonds, mutual funds)
    investment_date DATE NOT NULL,        -- Date of the investment
    amount DECIMAL(15, 2) NOT NULL,      -- Amount invested
    current_value DECIMAL(15, 2) NOT NULL, -- Current value of the investment
    interest_rate DECIMAL(5, 2),          -- Interest rate (if applicable)
    maturity_date DATE,                   -- Maturity date (if applicable)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP , -- Timestamp of when the record was updated
    FOREIGN KEY (account_id) REFERENCES account_details(account_id) -- Assuming there is an accounts table
	on delete set NULL
    on update cascade
);

-- Inserting records into table

INSERT INTO investments (account_id, investment_type, investment_date, amount, current_value, interest_rate, maturity_date) VALUES
(1, 'Stocks', '2023-01-15', 1000.00, 1200.00, NULL, NULL),
(1, 'Bonds', '2023-02-10', 2000.00, 2100.00, 5.00, '2025-02-10'),
(1, 'Mutual Funds', '2023-03-05', 1500.00, 1600.00, NULL, NULL),
(2, 'Stocks', '2023-01-20', 2500.00, 2700.00, NULL, NULL),
(2, 'Bonds', '2023-02-15', 3000.00, 3200.00, 4.50, '2026-02-15'),
(2, 'Real Estate', '2023-03-10', 5000.00, 5500.00, NULL, NULL),
(3, 'Stocks', '2023-01-25', 1200.00, 1300.00, NULL, NULL),
(3, 'Mutual Funds', '2023-02-20', 1800.00, 1900.00, NULL, NULL),
(3, 'Bonds', '2023-03-15', 2200.00, 2300.00, 3.75, '2025-03-15'),
(4, 'Stocks', '2023-01-30', 3000.00, 3100.00, NULL, NULL),
(4, 'Bonds', '2023-02-25', 4000.00, 4200.00, 4.00, '2027-02-25'),
(4, 'Mutual Funds', '2023-03-20', 2500.00, 2600.00, NULL, NULL),
(5, 'Real Estate', '2023-01-10', 6000.00, 6200.00, NULL, NULL),
(5, 'Stocks', '2023-02-05', 3500.00, 3600.00, NULL, NULL),
(5, 'Bonds', '2023-03-25', 1500.00, 1600.00, 5.25, '2024-03-25'),
(6, 'Mutual Funds', '2023-01-12', 2000.00, 2100.00, NULL, NULL),
(6, 'Stocks', '2023-02-18', 4000.00, 4200.00, NULL, NULL),
(6, 'Bonds', '2023-03-30', 2500.00, 2600.00, 4.75, '2025-03-30'),
(7, 'Stocks', '2023-01-22', 5000.00, 5100.00, NULL, NULL),
(7, 'Real Estate', '2023-02-12', 7000.00, 7200.00, NULL, NULL),
(7, 'Mutual Funds', '2023-03-28', 3000.00, 3100.00, NULL, NULL);


-- Drop the structure& records from the table
drop table investments; 

-- delete the records from table
truncate table investments;

-- Select query 
-- 1.Display all records
select * from investments;

/* ----------------------------------------------------
				 Table 20 - Stocks
--------------------------------------------------------*/

CREATE TABLE stocks (
    id INT PRIMARY KEY AUTO_INCREMENT,                -- Unique identifier for each stock record
    account_id INT,              -- Foreign key to link to the account
    stock_symbol VARCHAR(10) NOT NULL,    -- Stock symbol (e.g., AAPL, GOOGL)
    company_name VARCHAR(100) NOT NULL,    -- Name of the company
    purchase_date DATE NOT NULL,          -- Date when the stock was purchased
    quantity INT NOT NULL,                 -- Number of shares purchased
    purchase_price DECIMAL(15, 2) NOT NULL, -- Price per share at the time of purchase
    current_price DECIMAL(15, 2) NOT NULL, -- Current market price per share
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Timestamp of last update
    FOREIGN KEY (account_id) REFERENCES account_details(account_id) -- refer account id as foreign key from accounts table
    on delete set NULL
    on update cascade
);


-- Inserting records into table

INSERT INTO stocks (account_id, stock_symbol, company_name, purchase_date, quantity, purchase_price, current_price) VALUES
(1, 'AAPL', 'Apple Inc.', '2023-01-15', 10, 150.00, 175.00),
(1, 'GOOGL', 'Alphabet Inc.', '2023-02-10', 5, 2800.00, 2900.00),
(1, 'AMZN', 'Amazon.com Inc.', '2023-03-05', 8, 3300.00, 3400.00),
(2, 'MSFT', 'Microsoft Corporation', '2023-01-20', 15, 300.00, 320.00),
(2, 'TSLA', 'Tesla Inc.', '2023-02-15', 12, 700.00, 750.00),
(2, 'NFLX', 'Netflix Inc.', '2023-03-10', 7, 500.00, 550.00),
(3, 'FB', 'Meta Platforms Inc.', '2023-01-25', 20, 250.00, 260.00),
(3, 'NVDA', 'NVIDIA Corporation', '2023-02-20', 10, 600.00, 650.00),
(3, 'DIS', 'The Walt Disney Company', '2023-03-15', 5, 180.00, 190.00),
(4, 'BRK.B', 'Berkshire Hathaway Inc.', '2023-01-30', 3, 400.00, 420.00),
(4, 'V', 'Visa Inc.', '2023-02-25', 10, 220.00, 230.00),
(4, 'JNJ', 'Johnson & Johnson', '2023-03-20', 8, 160.00, 170.00),
(5, 'PYPL', 'PayPal Holdings Inc.', '2023-01-10', 25, 200.00, 210.00),
(5, 'INTC', 'Intel Corporation', '2023-02-05', 30, 50.00, 55.00),
(5, 'CSCO', 'Cisco Systems Inc.', '2023-03-25', 15, 60.00, 65.00),
(6, 'NFLX', 'Netflix Inc.', '2023-01-12', 10, 500.00, 520.00),
(6, 'AMD', 'Advanced Micro Devices Inc.', '2023-02-18', 20, 90.00, 95.00),
(6, 'ORCL', 'Oracle Corporation', '2023-03-30', 12, 80.00, 85.00),
(7, 'CRM', 'Salesforce.com Inc.', '2023-01-22', 5, 250.00, 260.00),
(7, 'ADBE', 'Adobe Inc.', '2023-02-12', 8, 500.00, 510.00),
(7, 'NFLX', 'Netflix Inc.', '2023-03-28', 10, 550.00, 560.00);

-- Drop the structure& records from the table
drop table stocks; 

-- delete the records from table
truncate table stocks;

-- Select query 
-- 1.Display all records
select * from stocks;

/* ----------------------------------------------------
				 Table 21 - Bonds
--------------------------------------------------------*/
CREATE TABLE bonds (
    id INT PRIMARY KEY AUTO_INCREMENT,                -- Unique identifier for each bond record
    account_id INT,              -- Foreign key to link to the account
    bond_name VARCHAR(100) NOT NULL,      -- Name of the bond
    bond_type VARCHAR(50) NOT NULL,       -- Type of bond (e.g., corporate, municipal, government)
    purchase_date DATE NOT NULL,          -- Date when the bond was purchased
    face_value DECIMAL(15, 2) NOT NULL,   -- Face value of the bond
    purchase_price DECIMAL(15, 2) NOT NULL, -- Price paid for the bond
    current_value DECIMAL(15, 2) NOT NULL, -- Current market value of the bond
    interest_rate DECIMAL(5, 2) NOT NULL,  -- Interest rate of the bond
    maturity_date DATE NOT NULL,          -- Maturity date of the bond
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP , -- Timestamp of last update
    FOREIGN KEY (account_id) REFERENCES account_details(account_id) -- Assuming there is an accounts table
    on delete set null
    on update cascade
);

-- Inserting records into table

INSERT INTO bonds (account_id, bond_name, bond_type, purchase_date, face_value, purchase_price, current_value, interest_rate, maturity_date) VALUES
(1, 'US Treasury Bond 10Y', 'Government', '2023-01-15', 10000.00, 9800.00, 10200.00, 2.50, '2033-01-15'),
(1, 'Apple Inc. Corporate Bond', 'Corporate', '2023-02-10', 5000.00, 4900.00, 5100.00, 3.00, '2025-02-10'),
(1, 'Municipal Bond NY', 'Municipal', '2023-03-05', 7000.00, 6800.00, 7200.00, 2.75, '2028-03-05'),
(2, 'Tesla Inc. Corporate Bond', 'Corporate', '2023-01-20', 15000.00, 14500.00, 15500.00, 3.50, '2026-01-20'),
(2, 'US Treasury Bond 5Y', 'Government', '2023-02-15', 20000.00, 19500.00, 20500.00, 2.00, '2028-02-15'),
(2, 'Municipal Bond CA', 'Municipal', '2023-03-10', 12000.00, 11800.00, 12500.00, 2.90, '2030-03-10'),
(3, 'Amazon Corporate Bond', 'Corporate', '2023-01-25', 8000.00, 7800.00, 8200.00, 3.25, '2027-01-25'),
(3, 'US Treasury Bond 30Y', 'Government', '2023-02-20', 25000.00, 24000.00, 26000.00, 2.75, '2053-02-20'),
(3, 'Municipal Bond TX', 'Municipal', '2023-03-15', 9000.00, 8800.00, 9500.00, 3.10, '2035-03-15'),
(4, 'Microsoft Corporate Bond', 'Corporate', '2023-01-30', 11000.00, 10800.00, 11500.00, 2.85, '2029-01-30'),
(4, 'US Treasury Bond 7Y', 'Government', '2023-02-25', 13000.00, 12800.00, 13500.00, 2.40, '2030-02-25'),
(4, 'Municipal Bond FL', 'Municipal', '2023-03-20', 6000.00, 5900.00, 6200.00, 3.20,'2030-02-25');

-- Drop the structure& records from the table
drop table bonds; 

-- delete the records from table
truncate table bonds;

-- Select query 
-- 1.Display all records
select * from bonds;

/* ----------------------------------------------------
				 Table 22 - Mutual Funds
--------------------------------------------------------*/
CREATE TABLE mutual_funds (
    id int primary key auto_increment,                -- Unique identifier for each mutual fund record
    account_id INT ,              -- Foreign key to link to the account
    fund_name VARCHAR(100) NOT NULL,      -- Name of the mutual fund
    fund_type VARCHAR(50) NOT NULL,       -- Type of mutual fund (e.g., equity, debt, hybrid)
    purchase_date DATE NOT NULL,          -- Date when the mutual fund was purchased
    units DECIMAL(15, 2) NOT NULL,        -- Number of units purchased
    purchase_price DECIMAL(15, 2) NOT NULL, -- Price per unit at the time of purchase
    current_price DECIMAL(15, 2) NOT NULL, -- Current market price per unit
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP , -- Timestamp of last update
    FOREIGN KEY (account_id) REFERENCES account_details(account_id) 
    on delete set null
    on update cascade
);

-- Inserting records into table

INSERT INTO mutual_funds (account_id, fund_name, fund_type, purchase_date, units, purchase_price, current_price) VALUES
(1, 'Vanguard 500 Index Fund', 'Equity', '2023-01-15', 100, 150.00, 175.00),
(1, 'Fidelity Contrafund', 'Equity', '2023-02-10', 50, 120.00, 130.00),
(1, 'T. Rowe Price Growth Stock Fund', 'Equity', '2023-03-05', 75, 200.00, 210.00),
(2, 'Schwab S&P 500 Index Fund', 'Equity', '2023-01-20', 200, 150.00, 160.00),
(2, 'PIMCO Total Return Fund', 'Bond', '2023-02-15', 150, 110.00, 115.00),
(2, 'Vanguard Total Bond Market Index Fund', 'Bond', '2023-03-10', 100, 105.00, 107.00),
(3, 'Fidelity Low-Priced Stock Fund', 'Equity', '2023-01-25', 80, 90.00, 95.00),
(3, 'American Funds EuroPacific Growth Fund', 'Equity', '2023-02-20', 60, 130.00, 135.00),
(3, 'Vanguard Wellington Fund', 'Balanced', '2023-03-15', 40, 150.00, 155.00),
(4, 'T. Rowe Price Dividend Growth Fund', 'Equity', '2023-01-30', 90, 120.00, 125.00),
(4, 'Fidelity Strategic Income Fund', 'Bond', '2023-02-25', 70, 110.00, 112.00),
(4, 'Vanguard Balanced Index Fund', 'Balanced', '2023-03-20', 50, 140.00, 145.00),
(5, 'BlackRock Global Allocation Fund', 'Balanced', '2023-01-10', 30, 160.00, 165.00),
(5, 'Invesco QQQ Trust', 'Equity', '2023-02-05', 100, 300.00, 310.00),
(5, 'Vanguard Short-Term Bond Index Fund', 'Bond', '2023-03-25', 80, 105.00, 106.00),
(6, 'Fidelity Growth Company Fund', 'Equity', '2023-01-12', 120, 200.00, 205.00),
(6, 'Vanguard Total International Stock Index Fund', 'Equity', '2023-02-18', 50, 150.00, 155.00),
(6, 'PIMCO Income Fund', 'Bond', '2023-03-25', 80, 105.00, 106.00);

-- Drop the structure& records from the table
drop table mutual_funds; 

-- delete the records from table
truncate table mutual_funds;

-- Select query 
-- 1.Display all records
select * from mutual_funds;
/* ----------------------------------------------------
				 Table 23 - Credit score
--------------------------------------------------------*/
CREATE TABLE credit_scores (
    id int primary key auto_increment,                -- Unique identifier for each credit score record
    account_id INT ,              -- Foreign key to link to the account
    score INT NOT NULL,                    -- Credit score value
    score_date DATE NOT NULL,             -- Date when the score was recorded
    score_source VARCHAR(100),             -- Source of the credit score (e.g., Experian, TransUnion, Equifax)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Timestamp of last update
	FOREIGN KEY (account_id) REFERENCES account_details(account_id) 
    on delete set null
    on update cascade
);

-- Inserting records into table

INSERT INTO credit_scores (account_id, score, score_date, score_source) VALUES
(1, 750, '2023-01-15', 'Experian'),
(1, 760, '2023-02-15', 'TransUnion'),
(1, 755, '2023-03-15', 'Equifax'),
(2, 680, '2023-01-20', 'Experian'),
(2, 690, '2023-02-20', 'TransUnion'),
(2, 685, '2023-03-20', 'Equifax'),
(3, 800, '2023-01-25', 'Experian'),
(3, 805, '2023-02-25', 'TransUnion'),
(3, 802, '2023-03-25', 'Equifax'),
(4, 620, '2023-01-30', 'Experian'),
(4, 630, '2023-02-28', 'TransUnion'),
(4, 625, '2023-03-30', 'Equifax'),
(5, 720, '2023-01-10', 'Experian'),
(5, 730, '2023-02-05', 'TransUnion'),
(5, 725, '2023-03-05', 'Equifax'),
(6, 690, '2023-01-12', 'Experian'),
(6, 695, '2023-02-18', 'TransUnion'),
(6, 692, '2023-03-18', 'Equifax'),
(7, 740, '2023-01-22', 'Experian'),
(7, 745, '2023-02-12', 'TransUnion'),
(7, 742, '2023-03-12', 'Equifax');

-- Drop the structure& records from the table
drop table credit_scores; 

-- delete the records from table
truncate table credit_scores;

-- Select query 
-- 1.Display all records
select * from credit_scores;
/* ----------------------------------------------------
				 Table 24 - Loan Payments
--------------------------------------------------------*/
CREATE TABLE loan_payments (
    id int primary key auto_increment,                -- Unique identifier for each payment record
    loan_id INT ,                 -- Foreign key to link to the loan
    payment_date DATE NOT NULL,           -- Date of the payment
    payment_amount DECIMAL(15, 2) NOT NULL, -- Amount paid
    remaining_balance DECIMAL(15, 2) NOT NULL, -- Remaining balance after payment
    payment_method VARCHAR(50),           -- Method of payment (e.g., bank transfer, check, cash)
    payment_status VARCHAR(20) NOT NULL,  -- Status of the payment (e.g., completed, pending)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP , -- Timestamp of last update
    notes TEXT,-- Additional notes regarding the payment
	FOREIGN KEY (loan_id) REFERENCES loan_details(loan_id) 
    on delete set null
    on update cascade
);

-- Inserting records into table


INSERT INTO loan_payments (loan_id, payment_date, payment_amount, remaining_balance, payment_method, payment_status, notes) VALUES
(1, '2023-01-15', 219.36, 4780.64, 'Bank Transfer', 'Completed', 'First payment for personal loan'),
(1, '2023-02-15', 219.36, 4561.28, 'Bank Transfer', 'Completed', 'Second payment for personal loan'),
(1, '2023-03-15', 219.36, 4341.92, 'Bank Transfer', 'Completed', 'Third payment for personal loan'),
(2, '2023-01-20', 322.67, 9677.33, 'Check', 'Completed', 'First payment for personal loan'),
(2, '2023-02-20', 322.67, 9354.66, 'Check', 'Completed', 'Second payment for personal loan'),
(2, '2023-03-20', 322.67, 9031.99, 'Check', 'Completed', 'Third payment for personal loan'),
(3, '2023-01-25', 242.00, 6258.00, 'Cash', 'Completed', 'First payment for personal loan'),
(3, '2023-02-25', 242.00, 6016.00, 'Cash', 'Completed', 'Second payment for personal loan'),
(3, '2023-03-25', 242.00, 5774.00, 'Cash', 'Completed', 'Third payment for personal loan'),
(4, '2023-01-30', 1150.00, 248850.00, 'Bank Transfer', 'Completed', 'First payment for mortgage'),
(4, '2023-02-28', 1150.00, 247700.00, 'Bank Transfer', 'Completed', 'Second payment for mortgage'),
(4, '2023-03-30', 1150.00, 246550.00, 'Bank Transfer', 'Completed', 'Third payment for mortgage'),
(5, '2023-01-10', 372.00, 19628.00, 'Bank Transfer', 'Completed', 'First payment for auto loan'),
(5, '2023-02-10', 372.00, 19256.00, 'Bank Transfer', 'Completed', 'Second payment for auto loan'),
(5, '2023-03-10', 372.00, 18884.00, 'Bank Transfer', 'Completed', 'Third payment for auto loan'),
(6, '2023-01-12', 242.00, 5758.00, 'Check', 'Completed', 'First payment for personal loan'),
(6, '2023-02-12', 242.00, 5516.00, 'Check', 'Completed', 'Second payment for personal loan'),
(6, '2023-03-12', 242.00, 5274.00, 'Check', 'Completed', 'Third payment for personal loan'),
(7, '2023-01-22', 1210.00, 118790.00, 'Cash', 'Completed', 'First payment for mortgage'),
(7, '2023-01-22', 1210.00, 118790.00, 'Cash', 'Completed', 'Second payment for mortgage');

-- Drop the structure& records from the table
drop table loan_payments; 

-- delete the records from table
truncate table loan_payments;

-- Select query 
-- 1.Display all records
select * from loan_payments;
/* ----------------------------------------------------
				 Table 25 - Deposit
--------------------------------------------------------*/
CREATE TABLE deposits (
    id SERIAL PRIMARY KEY,                -- Unique identifier for each deposit record
    account_id INT NOT NULL,              -- Foreign key to link to the account
    deposit_type VARCHAR(50) ,    -- Type of deposit (e.g., savings, fixed deposit, recurring deposit)
    amount DECIMAL(15, 2) NOT NULL,       -- Amount deposited
    interest_rate DECIMAL(5, 2),           -- Interest rate applicable (if any)
    maturity_date DATE,                    -- Maturity date (if applicable)
    deposit_date DATE NOT NULL,           -- Date of the deposit
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Timestamp of last update
    FOREIGN KEY (account_id) REFERENCES account_details(account_id) 
);

-- Inserting records into table

INSERT INTO deposits (account_id, deposit_type, amount, interest_rate, maturity_date, deposit_date) VALUES
(1, 'Savings', 1500.00, 1.50, NULL, '2023-01-15'),
(1, 'Fixed Deposit', 5000.00, 3.00, '2025-01-15', '2023-02-10'),
(1, 'Recurring Deposit', 200.00, 2.50, '2024-01-10', '2023-03-05'),
(2, 'Savings', 2500.00, 1.75, NULL, '2023-01-20'),
(2, 'Fixed Deposit', 10000.00, 3.50, '2026-02-20', '2023-02-15'),
(2, 'Recurring Deposit', 300.00, 2.75, '2024-02-15', '2023-03-10'),
(3, 'Savings', 3200.00, 1.60, NULL, '2023-01-25'),
(3, 'Fixed Deposit', 7000.00, 3.25, '2025-03-25', '2023-02-20'),
(3, 'Recurring Deposit', 400.00, 2.80, '2024-03-20', '2023-03-15'),
(4, 'Savings', 4000.00, 1.80, NULL, '2023-01-30'),
(4, 'Fixed Deposit', 15000.00, 3.75, '2026-04-30', '2023-02-25'),
(4, 'Recurring Deposit', 500.00, 2.90, '2024-04-25', '2023-03-20'),
(5, 'Savings', 6000.00, 1.90, NULL, '2023-01-10'),
(5, 'Fixed Deposit', 8000.00, 3.60, '2025-05-10', '2023-02-05'),
(5, 'Recurring Deposit', 600.00, 3.00, '2024-05-05', '2023-03-25'),
(6, 'Savings', 7000.00, 2.00, NULL, '2023-01-12'),
(6, 'Fixed Deposit', 12000.00, 3.80, '2026-06-12', '2023-02-18'),
(6, 'Recurring Deposit', 700.00, 3.10, '2024-06-12', '2023-03-30'),
(7, 'Savings', 8000.00, 2.10, NULL, '2023-01-22'),
(7, 'Fixed Deposit', 9000.00, 3.90, '2025-07-22', '2023-02-12'),
(7, 'Recurring Deposit', 800.00, 3.20, '2024-07-22', '2023-03-28');

-- Drop the structure& records from the table
drop table deposits; 

-- delete the records from table
truncate table deposits;

-- Select query 
-- 1.Display all records
select * from deposits;
