use bank;

/* --------------------Bank Details ---------------------------------*/
-- Drop the structure& records from the table
drop table bank_details; 

-- delete the records from table
truncate table bank_details;

-- 1.Retrive bank table records
select * from bank_details;

-- 2.Count no. of bank name
select count(bank_name) from bank_details;

-- 3.Retrive records which match pattern
select * from bank_details where email like '%service%';
select * from bank_details where email like 'service%';
select * from bank_details where email like '%chase.com';

-- 4. Retrive website data 
select * from bank_details where website = 'www.bankofamerica.com';

-- 5.Retrive records for mentioned bank code
select * from bank_details where bank_code in ('USBANK987','REGIONS444' );

-- 7.Retrieve records using AND operator (getting single record)
select * from bank_details where bank_name = 'American Express Bank' and email = 'service@aexp.com';
select * from bank_details where bank_name = 'American Express Bank' and  email = 'contact@keybank.com'; -- getting empty records

-- 8.Retrieve records using OR operator (Getting 2 records)
select * from bank_details where bank_name = 'American Express Bank' or email = 'contact@keybank.com';

-- 9.Retrive records using order by clause
select * from bank_details order by 2 desc ;

-- 10.Count bank name using group by & order by clause
select count(bank_name), bank_name, bank_code from bank_details
group by bank_name, bank_code order by bank_code desc ;

-- 11. retrive records which not equal to American Express Bank
select * from bank_details where bank_name <> 'American Express Bank';
 
 -- 12.Retrieve records where bank code not equal to ''
select count(bank_code), bank_name, bank_code from bank_details
group by bank_name, bank_code
having bank_code <>'CHASE456'
order by bank_code desc ;

-- 13.Retrieve bank details where bank id between 5 to 15 and bank name match the pattern 
select * from bank_details where bank_id between '5' and '15' and bank_name like '%bank%';

/* ----------------------- branches -------------------------------*/
-- 1.Drop the structure& records from the table
drop table branches; 

-- 2.delete the records from table
truncate table branches;

-- Select query 
-- 3.Display all records
select * from branches;

-- 4.Update status 
update branches set status = 'DEACTIVE' WHERE BRANCH_ID = '19';

-- 5.RETRIEVE RECORDS FOR MANAGER ID WHOSE MANGAER ID BETWEEN 1 TO 5 
SELECT COUNT(MANAGER_ID),BRANCH_NAME,MANAGER_ID
FROM BRANCHES
GROUP BY MANAGER_ID,BRANCH_NAME
HAVING MANAGER_ID BETWEEN 1 AND 5 
ORDER BY MANAGER_ID ASC;

-- 6. Add column
ALTER TABLE Branches
ADD zipcode VARCHAR(35) DEFAULT '1234-5678' NOT NULL;

-- 7. drop column
alter table BRANCHES
drop column zipcode;

-- 8.check bank under one manager
select count(bank_id), manager_id
from branches
where manager_id in (select bank_id from branches where manager_id between 1 and 20 )
group by manager_id;

-- 9. String function
select upper('Downtown Branch'), lower('123 Main St, Cityville'), concat('Ash',' ','Canterbury'),substring('United state',1,5),left('United state',5),
right('United state',5),reverse('downtown@mail.com') from branches GROUP BY manager_id;

/*-------------------------------customer---------------------------- */
-- 1.Drop the structure & records from the table
drop table customers; 

-- 2.delete the records from table
truncate table customers;

-- Select query 
-- 3.Display all records
select * from customers;

-- 4.RETRIEVE CUSTOMER RECORDS WHOSE STATET IS Canterbury
select count(customer_id) AS  CUSTOMER from customers where cust_state = 'Canterbury';

-- 5.ADD AGE COLUMN
ALTER TABLE CUSTOMERS
ADD COLUMN AGE VARCHAR(3) default 18;

-- 6.ADD CONSTRAINT
ALTER TABLE CUSTOMERS
ADD constraint CHK_AGE CHECK(AGE >0);

DESC CUSTOMERS;

-- 7.MODIFY AGE DATA TYPE
ALTER TABLE CUSTOMERS
MODIFY COLUMN AGE varchar(4);

-- 8.UPDATE CUSTOMER AGE 
UPDATE CUSTOMERS SET AGE = 
CASE
WHEN CUSTOMER_ID BETWEEN 1 AND 5 THEN  25
WHEN CUSTOMER_ID BETWEEN 6 AND 10 THEN 30
WHEN CUSTOMER_ID BETWEEN 11 AND 15 THEN 35
ELSE 18
END
WHERE CUSTOMER_ID BETWEEN 1 AND 15;

/*-------------------------Customer Type ------------------------*/
-- 1.Drop the structure& records from the table
drop table customertype; 

-- 2.delete the records from table
truncate table customertype;

-- Select query 
-- 3..Display all records
select * from customertype;

-- 4. retrieve customer type records into desc order
select * from customertype order by 2 desc;

-- 5. delete record which match pattern data
delete from customertype where description like '%special%'; -- 2 records get deleted
delete from customertype where description like 'special%'; -- o records get affected
delete from customertype where description like '%special'; --  o records get affected

-- 6. Count number ofcustomer type name
select count(*) from customertype where customer_type_name like '%ship%';

-- 7.RETRIEVE CUSTOMER RECORDS ACCORDING CONDITION
select * from customertype where customer_type_name not in ('Student','Sole Proprietorship','Partnership','Non-Profit');
/*-------------------------Customer CREDENTIAL ------------------------*/
-- 1.Drop the structure& records from the table
drop table CustomerCredential; 

-- 2.delete the records from table
truncate table CustomerCredential;

-- Select query 
-- 3.Display all records
select * from CustomerCredential;

-- 4.retrive records using string option
select upper('michael   johnson'), concat('jamesgarcia','      ','jane.smith@example.com'),substr('danielhernandez',1,4) from CustomerCredential
group by cust_username;

-- 5.add permission level column 
alter table customercredential
add column last_login timestamp default current_timestamp;

-- 6.retrive records according to date & phone number
select * from customercredential
where created_at = '2025-03-03 15:59:25' and cust_phonenumber like '%234';

-- 7.update customer last login time
update customercredential set last_login = 
case 
when credential_id between 1 and 5 then '2024-03-05 20:18:05'
when credential_id between 6 and 9 then '2023-03-05 20:18:05'
when credential_id between 10 and 16 then '2021-03-05 20:18:05'
else current_timestamp()
end
where credential_id between 1 and 16;

-- 8. retrieve records according to condition
select * from customercredential 
where last_login = '2024-03-05 20:18:05' and cust_email like 'john%';


/*-------------------------STAFF ------------------------*/
-- 1.Drop the structure& records from the table
drop table staff; 

-- 2.delete the records from table
truncate table staff;

-- Select query 
-- 3.Display all records
select * from staff;

-- 4. ftech recordswhich match pattern
select * from staff where staff_fname like '%Christopher%';

-- 5. Add column
alter table staff
add column age varchar(3) not null default 25 check(age>=18);

-- 6 update age for multiple staff member
update staff set age = 
case 
when staff_id between 1 and  5 then '23'
when staff_id between 6 and  10 then '27'
when staff_id between 11 and  15 then '30'
else 25 
end 
where staff_id between 1 and 15; 

-- 7.fetch records using string function
select avg(salary), min(age), substring('Customer Service Representative', 1, 17), length('michael.johnson@bank.com'),concat('Daniel','   ','Hernandez')
from staff;

/*-------------------------STAFF CREDENTIAL ------------------------*/
-- 1.Drop the structure& records from the table
drop table staffcredential; 

-- 2.delete the records from table
truncate table staffcredential;

-- 3.Select query 
-- 1.Display all records
select * from staffcredential;

-- 4.fetch records according to the date
select * from staffcredential where created_at like '%2025-01-26%';

-- 5. modify column datatype
alter table staffcredential
modify last_login date default '2025-02-02';

-- 6.update is active value for staff
update staffcredential set is_active = '0' where staff_id not in ('1','2','6','8','9','11','16','17','28','19','20');

-- 7.count staff who are inactive
select count(staff_id) from staffcredential
where is_active = '0';



/*-------------------------ACCOUNT Type ------------------------*/
-- 1.Drop the structure& records from the table
drop table accounttype; 

-- 2.delete the records from table
truncate table accounttype;

-- 3.Select query 
-- 1.Display all records
select * from accounttype;

-- 4.update amounts field for business accounts
update accounttype set minimum_balance = minimum_balance+5000.78, account_fee = 1000,withdrawal_limit = withdrawal_limit*2.5
where  account_type_name like '%business%';

-- 5.retrieve data for which withdrawl limit is greater than min bal+fee
select sum(minimum_balance + account_fee) as total,withdrawal_limit
from accounttype
group by withdrawal_limit
having withdrawal_limit >sum(minimum_balance + account_fee);

-- 6.delete records whose account type is Joint Account
delete from accounttype where account_type_name = 'Joint Account';

-- 7.rename the column name
alter table accounttype
rename column minimum_balance to min_bal;


/*-------------------------LOAN TYPE ------------------------*/
-- 1.Drop the structure& records from the table
drop table loantype; 

-- 2.delete the records from table
truncate table loantype;

-- 3.Select query 
-- 1.Display all records
select * from loantype;

-- 4. check max loan term & description in uppercase letter
select max(loan_term),upper('An unsecured loan for personal use, typically with a fixed interest rate.')
from loantype;

-- 5. count loan type
select count(loan_type_name)from loantype where description like '%personal%'
limit 15;

-- 6. fetch records whose interest is max
SELECT count(loan_type_id),interest_rate
from loantype
group by loan_type_id,interest_rate
having interest_rate = max(interest_rate);

-- 7. add/rename/drop column using alter queries
alter table loantype
add column loan_policy_details text(1000);

alter table loantype
rename column loan_policy_details to loan_details;

alter table loantype
drop column loan_details;


/*--------------------------------Payment Method----------------------------------------------*/

-- 1.Drop the structure& records from the table
drop table PaymentMethod; 

-- 2.delete the records from table
truncate table PaymentMethod;

-- 3.Select query 
-- 1.Display all records
select * from PaymentMethod;

-- 4. fetch the data using like operator
select * from PaymentMethod where description like 'money%';
select * from PaymentMethod where description like '%money%';
select * from PaymentMethod where description like '%money';

-- 5 update transation fee
update PaymentMethod set transaction_fee = 2000.78 where transaction_fee = 0.00;

-- 6.fetch transaction fee details according to the condition
select min(transaction_fee), min(transaction_fee*0.90) as new_fee, max(transaction_fee - 1000) as updated_fee
from paymentmethod;

-- 7. fetch records whose max trnasction fee is less tham mentioned amount
SELECT payment_method_id,transaction_fee
from paymentmethod
group by transaction_fee,payment_method_id
having max(transaction_fee) <=200.00
order by 1 desc;


/*--------------------------------POLICY----------------------------------------------*/

-- 1.Drop the structure& records from the table
drop table policies; 

-- 2.delete the records from table
truncate table policies;

-- 3.Select query 
-- 1.Display all records
select * from policies;

-- 4.fetch the data using like operator
select * from policies where description like '%bank%' and policy_id between 11 and 17;

-- 5.fetch sum/avg amount and find the length of string
select sum(coverage_amount),avg(coverage_amount),length('Details the terms and conditions for various types of loans offered by the bank.')
from policies;

-- 6.update interest rate
update policies set interest_rate = interest_rate*1.05 where policy_id between 1 and 6;

-- 7. add column
alter table policies
add column policy_rating varchar(5) default 4.0;

/*--------------------------------account details----------------------------------------------*/

-- 1.Drop the structure& records from the table
drop table account_details; 

-- 2.delete the records from table
truncate table account_details;

-- 3.Select query 
-- 1.Display all records
select * from account_details;

-- 4.update interest rate & min bal for some records
update account_details set interest_rate = interest_rate-1.00 , minimum_balance= minimum_balance+1000.43
where balance > 3000;

-- 5.count the account id whose balance is greater than 200 & type is saving account
select count(account_id ) from account_details
where account_type = 'Savings Account' and balance >200;

-- 6.count branchid whose min bal is greater than 1500
select count(branch_id),minimum_balance
from account_details
group by minimum_balance
having minimum_balance>1500;

-- 7.fetch recrds whose account details not equal to ACC100004
select * from account_details where account_number <> 'ACC100004';

/*--------------------------------bank transactions----------------------------------------------*/

-- 1.Drop the structure& records from the table
drop table bank_transactions; 

-- 2.delete the records from table
truncate table bank_transactions;

-- 3.Select query 
-- 1.Display all records
select * from bank_transactions;

-- 4. find duplicate account_id
SELECT account_id, COUNT(*) as duplicate
FROM bank_transactions
GROUP BY account_id
HAVING COUNT(*) > 1;

-- 5.perform string operation
select upper('Withdrawal'),lower('Salary deposit'),substr('Business loan deposit', 1,4),length('Business loan deposit')
from bank_transactions;

-- 6.add column
alter table bank_transactions
add column updated_by varchar(100) not null default 11;

-- 7.update transaction status
update bank_transactions set transaction_status = 'Pending'
where transaction_amount >2000;



/*--------------------------------loan details----------------------------------------------*/

-- 1.Drop the structure& records from the table
drop table loan_details; 

-- 2.delete the records from table
truncate table loan_details;

-- 3.Select query 
-- 1.Display all records
select * from loan_details;

-- 4. perfroom arithmatic operation 
select sum(loan_amount/19), avg(interest_rate),max(monthly_payment)
from loan_details;

-- 5.modify the status
alter table loan_details
modify status enum('Active','pending','cancelled','In-progress');

-- 6.update status 
update loan_details set status = 'pending' where loan_id between 1 and 8;

-- 7.delete records whose monthly payment greater than 80000
delete from loan_details where monthly_payment >=80000.00;

/*--------------------------------credit card ----------------------------------------------*/

-- Drop the structure& records from the table
drop table credit_card; 

-- delete the records from table
truncate table credit_card;

-- Select query 
-- 1.Display all records
select * from credit_card;

-- 3.Perform string opertion
select card_number,length(card_number),card_type, upper(card_type), cardholder_name, lower(cardholder_name) from credit_card;

-- 4.UPDATE CARDHOLDER NAME & EXPIRATION DATE 
UPDATE credit_card
SET cardholder_name = 'Jane Doe', expiration_date = '2026-12-31'
WHERE id = 1;  

-- 5.FETCH EXPIRED CARD RECORDS
SELECT * FROM credit_card
WHERE exp_month < CURDATE();

-- 6.FETCH DATA ACCORDING TO PATTERN
SELECT * FROM credit_card
WHERE cardholder_name LIKE '%JOHN%';

--  7.DELETE RECORD WHICH ID IS 1
DELETE FROM credit_card WHERE card_id = 1; 

-- 8. ADD NEW COLUMN
ALTER TABLE credit_card
ADD COLUMN billing_address TEXT(100) NOT NULL;

/*--------------------------------payment_history ----------------------------------------------*/
-- 1.Drop the structure& records from the table
drop table payment_history; 

-- 2.delete the records from table
truncate table payment_history;

-- 3.Select query 
-- 1.Display all records
select * from payment_history;

-- 4.. retrieve min,max,sum,avg amount for payment method 
select avg(amount), max(amount), min(amount), sum(amount) from payment_history where payment_method_name = 'Credit Card';

-- 5.perform string operation on table
select upper('Credit Card'),lower('ACC100002'),substr('Bank Transfer', 1,4),length('Bank Transfer'),concat('Bank Transfer','  ','Pending'),
ltrim('Failed'),rtrim('Cash')
from payment_history;

-- 6.fetch records whose status is failed
select * from payment_history where status = 'failed';

-- 7. delete all records
delete from payment_history;

/*--------------------------------BankCustomerReviews ----------------------------------------------*/
-- 1.Drop the structure& records from the table
drop table BankCustomerReviews; 

-- 2.delete the records from table
truncate table BankCustomerReviews;

-- 3.Select query 
-- 1.Display all records
select * from BankCustomerReviews;

-- 4. rename column name
alter table BankCustomerReviews
rename column ReviewText to Reviews;

-- 5.update useful count
update BankCustomerReviews set usefulcount = 4 where usefulcount = 0;

-- 6. delete record whose customer id is 15
delete from BankCustomerReviews where customer_id = 15;

-- 7. retrieve bank records for rating is gretaer than 4
select count(Rating), bank_id
from BankCustomerReviews
group by bank_id,Rating
having Rating > 4;
 

/*--------------------------------bank_statements ----------------------------------------------*/
-- 1.Drop the structure& records from the table
drop table bank_statements; 

-- 2.delete the records from table
truncate table bank_statements;

-- 3.Select query 
-- 1.Display all records
select * from bank_statements;

-- 4.retrieve records using aggregate function
select min(opening_balance) as min_opening_bal, max(closing_balance) as max_closing_bal, avg(total_deposits)as avg_deposists,sum(total_withdrawals)
from bank_statements;

-- 5.retrieve records whose opening balance greater than 3000.23
select *from bank_statements
where opening_balance >= 3000.23;

-- 6.update statment data
update bank_statements set statement_date = '2025-02-12' where closing_balance> '2000'and total_withdrawals = 500;

set sql_safe_updates = 0;

-- 7. add column 
alter  table bank_statements
add column transaction_id int ;

-- 8 add foreign key constraint
alter  table bank_statements
add constraint fk_transaction_id FOREIGN KEY  (transaction_id) REFERENCES bank_transactions(transaction_id)
on update cascade
on delete set null  ;

-- 9drop constraint
alter  table bank_statements
drop  constraint fk_transaction_id;

-- 10.drop column
alter  table bank_statements
drop  column transaction_id;

desc bank_statements;

/*--------------------------------investments ----------------------------------------------*/
-- 1.Drop the structure& records from the table
drop table investments; 

-- 2.delete the records from table
truncate table investments;

-- 3.Select query 
-- 1.Display all records
select * from investments;

-- 4. fetch records whose interest rate is null
select * from investments where interest_rate is null; 

-- 5.update maturity_date and interest_rate
update investments set interest_rate = 
case
when investment_type in ('Stocks') then 7.89
when investment_type in ('Mutual Funds') then 8.89
when investment_type in ('Real Estate') then 6.89
end,
maturity_date = 
case 
when investment_type in ('Stocks') then '2025-02-10'
when investment_type in ('Mutual Funds') then '2026-02-15'
when investment_type in ('Real Estate') then '2025-03-15'
else current_date()
end
where investment_type in ('Stocks','Mutual Funds','Real Estate');


-- 6. fetch records for investment type
select * from investments
where investment_type in ('Stocks','Mutual Funds','Real Estate');

-- 7. update amount
update investments set amount = amount+255.90 
where interest_rate <> 7.89;

select * from investments
where interest_rate <> 7.89;

/*--------------------------------STOCKS ----------------------------------------------*/
-- 1.Drop the structure& records from the table
drop table stocks; 

-- 2.delete the records from table
truncate table stocks;

-- 3.Select query 
-- 1.Display all records
select * from stocks;

-- 4.find avg quantity for stock symbol
select avg(quantity), stock_symbol  from stocks
where stock_symbol not in ('GOOGL','NFLX')
group by stock_symbol ;

-- 5.fetch stock_symbol records whose quantity greater than 8 and purchase between mentioned datw 
select stock_symbol, sum(purchase_price), current_price+50 as new_price from stocks
where purchase_date between '2023-01-15' and '2023-02-20' and quantity >8 
group by stock_symbol,current_price ;

-- 6.modify data type range 
alter table stocks
modify stock_symbol varchar(25) not null;

desc stocks;

-- 7. add new column
alter table stocks
add column stock_code varchar(50) ; 

-- 8. add constraint
alter table stocks
add constraint uk_stock_code unique(stock_code) ; 
/*--------------------------------BONDS ----------------------------------------------*/
-- 1.Drop the structure& records from the table
drop table bonds; 

-- 2.delete the records from table
truncate table bonds;

-- 3.Select query 
-- 1.Display all records
select * from bonds;

-- 4.add column
alter table bonds
add column bond_id varchar(50);

-- 5. add constraint
alter table bonds
add constraint uk_bond_id unique(bond_id);

-- 6.drop constraint
alter table bonds
drop  constraint uk_bond_id;

desc bonds;

-- 7. drop column
alter table bonds
drop column bond_id;
/*--------------------------------mutual_funds ----------------------------------------------*/
-- 1.Drop the structure& records from the table
drop table mutual_funds; 

-- 2.delete the records from table
truncate table mutual_funds;

-- 3.Select query 
-- 1.Display all records
select * from mutual_funds;

-- 4.check max min vlue for mentioned funds
select min(units), max(purchase_price), fund_name, fund_type from mutual_funds
where fund_name in ('Vanguard 500 Index Fund','T. Rowe Price Growth Stock Fund','Fidelity Low-Priced Stock Fund','American Funds EuroPacific Growth Fund')
or fund_type in ('Equity','Bond')
group by fund_name,fund_type
order by fund_name desc;


-- 5.find max & min units
select max(units), fund_type from mutual_funds
where fund_type in ('Equity','Bond')
group by fund_type;

-- 6.check current price for 300 units 
select fund_name,fund_type, 300*current_price as units_price
from mutual_funds;

-- 7. calculate profit 
select fund_name,fund_type, current_price,purchase_price, current_price - purchase_price as profit
from mutual_funds;
/*--------------------------------credit card ----------------------------------------------*/
-- 1.Drop the structure& records from the table
drop table credit_scores; 

-- 2.delete the records from table
truncate table credit_scores;

-- 3.Select query 
-- 1.Display all records
select * from credit_scores;

-- 4. check the sum of all scroes
select sum(score) from credit_scores;

-- 5.check the avg of all scroes
select avg(score) from credit_scores;

-- 6.check max & min score after addition/deduction
select min(score+75) as new_score, max(score -50) as max_score_after_deduction, score_source from credit_scores
group by score_source
having score_source in ('Experian','TransUnion')
order by score_source desc;

-- 7.check max & min score 
select min(score), max(score), score_source from credit_scores
group by score_source
having score_source in ('Experian','TransUnion')
order by score_source desc
limit 10;


/*--------------------------------loan_payments ----------------------------------------------*/
-- 1.Drop the structure& records from the table
drop table loan_payments; 

-- 2.delete the records from table
truncate table loan_payments;

-- Select query 
-- 3..Display all records
select * from loan_payments;

-- 4.retrieve records using aggregate function 
select max(remaining_balance),sum(remaining_balance), min(payment_amount), count(payment_method)
from loan_payments;

-- 5.fetch 5 records using limit clause
select * from loan_payments
limit 5 offset 5;

-- 6.fetch records whose payment menthods not bank transfer and cash
select *from loan_payments
where payment_method not in ('Bank Transfer','Cash');

-- 7. fetch those records which match pattern
select *from loan_payments
where notes like '%payment for mortgage%';

/*-------------------------------- deposits ----------------------------------------------*/
-- 1.Drop the structure& records from the table
drop table deposits; 

-- 2.delete the records from table
truncate table deposits;

-- Select query 
-- 3.Display all records
select * from deposits;

-- 4.check insterest rate for saving account by multiplying 10 
select avg(interest_rate*10) as updated_interest_rate , deposit_type, account_id from deposits where deposit_type = 'savings'group by account_id;

-- 5.retrive records whose amount >5000 and interest raet greater than 3.50
select max(amount) as highest_amt, account_id,interest_rate from deposits
group by amount, account_id,interest_rate
having amount >= '5000' and interest_rate < '3.50'
order by 1 asc;

-- 6 check new amount after adding 1000
select account_id, amount as old_amount, amount + 1000 as new_amount
from deposits
where deposit_type in ('Recurring Deposit','Fixed Deposit');

-- 7. check null record data
select * from deposits where maturity_date is null;
 