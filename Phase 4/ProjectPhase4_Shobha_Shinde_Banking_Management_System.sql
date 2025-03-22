use bank;

/*------------------------------bank_details-------------------------------------------*/
-- View
CREATE VIEW bank_details_view AS
SELECT bank_name, bank_code, contact_number
FROM bank_details;

-- CTE
WITH BankCTE AS (
    SELECT bank_name, contact_number
    FROM bank_details
    WHERE bank_code LIKE 'BOA%'
)
SELECT * FROM BankCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetBankDetails(IN bankName VARCHAR(100))
BEGIN
    SELECT * FROM bank_details WHERE bank_name = bankName;
END //
DELIMITER ;

-- Window Function
SELECT bank_name, bank_code,
       ROW_NUMBER() OVER (ORDER BY bank_id) AS row_num
FROM bank_details;

-- TCL
START TRANSACTION;
UPDATE bank_details SET contact_number = '800-000-0000' WHERE bank_id = 1;
COMMIT;

-- DCL
GRANT SELECT ON bank_details TO 'user'@'localhost';
REVOKE SELECT ON bank_details FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_bank_insert
BEFORE INSERT ON bank_details
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;

/*------------------------------------Branches-----------------------------------------------*/
-- View
CREATE VIEW branches_view AS
SELECT branch_name, city, state
FROM Branches;

-- CTE
WITH BranchCTE AS (
    SELECT branch_name, city
    FROM Branches
    WHERE state = 'Canterbury'
)
SELECT * FROM BranchCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetBranchDetails(IN branchCity VARCHAR(50))
BEGIN
    SELECT * FROM Branches WHERE city = branchCity;
END //
DELIMITER ;

-- Window Function
SELECT branch_name, city,
       RANK() OVER (ORDER BY branch_id) AS rank_num
FROM Branches;

-- TCL
START TRANSACTION;
UPDATE Branches SET status = 'Inactive' WHERE branch_id = 1;
ROLLBACK;

-- DCL
GRANT INSERT ON Branches TO 'user'@'localhost';
REVOKE INSERT ON Branches FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_branch_insert
BEFORE INSERT ON Branches
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;
/*------------------------------------customers-----------------------------------------------*/
-- View
CREATE VIEW customers_view AS
SELECT cust_fname, cust_lname, cust_email
FROM customers;

-- CTE
WITH CustomerCTE AS (
    SELECT cust_fname, cust_lname
    FROM customers
    WHERE cust_state = 'Canterbury'
)
SELECT * FROM CustomerCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetCustomerDetails(IN custEmail VARCHAR(40))
BEGIN
    SELECT * FROM customers WHERE cust_email = custEmail;
END //
DELIMITER ;

-- Window Function
SELECT cust_fname, cust_lname,
       DENSE_RANK() OVER (ORDER BY customer_id) AS dense_rank_num
FROM customers;

-- TCL
START TRANSACTION;
UPDATE customers SET is_cust_active = '0' WHERE customer_id = 1;
COMMIT;

-- DCL
GRANT UPDATE ON customers TO 'user'@'localhost';
REVOKE UPDATE ON customers FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_customer_insert
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;
/*------------------------------------CustomerType-----------------------------------------------*/
-- View
CREATE VIEW customer_type_view AS
SELECT customer_type_name, description
FROM CustomerType;

-- CTE
WITH CustomerTypeCTE AS (
    SELECT customer_type_name
    FROM CustomerType
    WHERE description LIKE '%business%'
)
SELECT * FROM CustomerTypeCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetCustomerTypeDetails(IN typeName VARCHAR(60))
BEGIN
    SELECT * FROM CustomerType WHERE customer_type_name = typeName;
END //
DELIMITER ;

-- Window Function
SELECT customer_type_name,
       NTILE(4) OVER (ORDER BY customer_type_id) AS ntile_group
FROM CustomerType;

-- TCL
START TRANSACTION;
UPDATE CustomerType SET description = 'Updated Description' WHERE customer_type_id = 1;
ROLLBACK;

-- DCL
GRANT DELETE ON CustomerType TO 'user'@'localhost';
REVOKE DELETE ON CustomerType FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_customer_type_insert
BEFORE INSERT ON CustomerType
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;
/*------------------------------------CustomerCredential-----------------------------------------------*/
-- View
CREATE VIEW customer_credential_view AS
SELECT cust_username, cust_email
FROM CustomerCredential;

-- CTE
WITH CredentialCTE AS (
    SELECT cust_username
    FROM CustomerCredential
    WHERE is_active = '1'
)
SELECT * FROM CredentialCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetCustomerCredentialDetails(IN custUsername VARCHAR(50))
BEGIN
    SELECT * FROM CustomerCredential WHERE cust_username = custUsername;
END //
DELIMITER ;

-- Window Function
SELECT cust_username,
       LEAD(cust_username, 1) OVER (ORDER BY credential_id) AS next_username
FROM CustomerCredential;

-- TCL
START TRANSACTION;
UPDATE CustomerCredential SET is_active = '0' WHERE credential_id = 1;
COMMIT;

-- DCL
GRANT SELECT ON CustomerCredential TO 'user'@'localhost';
REVOKE SELECT ON CustomerCredential FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_credential_insert
BEFORE INSERT ON CustomerCredential
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;
/*------------------------------------staff-----------------------------------------------*/
-- View
CREATE VIEW staff_view AS
SELECT staff_fname, staff_lname, staff_position
FROM staff;

-- CTE
WITH StaffCTE AS (
    SELECT staff_fname, staff_lname
    FROM staff
    WHERE staff_position = 'Branch Manager'
)
SELECT * FROM StaffCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetStaffDetails(IN staffEmail VARCHAR(40))
BEGIN
    SELECT * FROM staff WHERE staff_email = staffEmail;
END //
DELIMITER ;

-- Window Function
SELECT staff_fname, staff_lname,
       LAG(staff_fname, 1) OVER (ORDER BY staff_id) AS prev_staff_name
FROM staff;

-- TCL
START TRANSACTION;
UPDATE staff SET is_staff_active = '0' WHERE staff_id = 1;
ROLLBACK;

-- DCL
GRANT INSERT ON staff TO 'user'@'localhost';
REVOKE INSERT ON staff FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_staff_insert
BEFORE INSERT ON staff
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;
/*------------------------------------StaffCredential-----------------------------------------------*/
-- View
CREATE VIEW staff_credential_view AS
SELECT username, staff_email
FROM StaffCredential;

-- CTE
WITH StaffCredentialCTE AS (
    SELECT username
    FROM StaffCredential
    WHERE is_active = '1'
)
SELECT * FROM StaffCredentialCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetStaffCredentialDetails(IN staffUsername VARCHAR(50))
BEGIN
    SELECT * FROM StaffCredential WHERE username = staffUsername;
END //
DELIMITER ;

-- Window Function
SELECT username,
       FIRST_VALUE(username) OVER (ORDER BY Staffcredential_id) AS first_username
FROM StaffCredential;

-- TCL
START TRANSACTION;
UPDATE StaffCredential SET is_active = '0' WHERE Staffcredential_id = 1;
COMMIT;

-- DCL
GRANT UPDATE ON StaffCredential TO 'user'@'localhost';
REVOKE UPDATE ON StaffCredential FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_staff_credential_insert
BEFORE INSERT ON StaffCredential
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;
/*------------------------------------accounttype-----------------------------------------------*/
-- View
CREATE VIEW account_type_view AS
SELECT account_type_name, description
FROM accounttype;

-- CTE
WITH AccountTypeCTE AS (
    SELECT account_type_name
    FROM accounttype
    WHERE minimum_balance > 1000
)
SELECT * FROM AccountTypeCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetAccountTypeDetails(IN typeName VARCHAR(50))
BEGIN
    SELECT * FROM accounttype WHERE account_type_name = typeName;
END //
DELIMITER ;

-- Window Function
SELECT account_type_name,
       LAST_VALUE(account_type_name) OVER (ORDER BY account_type_id) AS last_account_type
FROM accounttype;

-- TCL
START TRANSACTION;
UPDATE accounttype SET is_active = '0' WHERE account_type_id = 1;
ROLLBACK;

-- DCL
GRANT DELETE ON accounttype TO 'user'@'localhost';
REVOKE DELETE ON accounttype FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_account_type_insert
BEFORE INSERT ON accounttype
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;
/*------------------------------------loantype-----------------------------------------------*/
-- View
CREATE VIEW loan_type_view AS
SELECT loan_type_name, description
FROM loantype;

-- CTE
WITH LoanTypeCTE AS (
    SELECT loan_type_name
    FROM loantype
    WHERE interest_rate > 10
)
SELECT * FROM LoanTypeCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetLoanTypeDetails(IN loanName VARCHAR(100))
BEGIN
    SELECT * FROM loantype WHERE loan_type_name = loanName;
END //
DELIMITER ;

-- Window Function
SELECT loan_type_name,
       PERCENT_RANK() OVER (ORDER BY loan_type_id) AS percent_rank
FROM loantype;

-- TCL
START TRANSACTION;
UPDATE loantype SET is_active = '0' WHERE loan_type_id = 1;
COMMIT;

-- DCL
GRANT SELECT ON loantype TO 'user'@'localhost';
REVOKE SELECT ON loantype FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_loan_type_insert
BEFORE INSERT ON loantype
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;
/*------------------------------------PaymentMethod-----------------------------------------------*/
-- View
CREATE VIEW payment_method_view AS
SELECT payment_method_name, description
FROM PaymentMethod;

-- CTE
WITH PaymentMethodCTE AS (
    SELECT payment_method_name
    FROM PaymentMethod
    WHERE transaction_fee > 0
)
SELECT * FROM PaymentMethodCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetPaymentMethodDetails(IN methodName VARCHAR(100))
BEGIN
    SELECT * FROM PaymentMethod WHERE payment_method_name = methodName;
END //
DELIMITER ;

-- Window Function
SELECT payment_method_name,
       CUME_DIST() OVER (ORDER BY payment_method_id) AS cume_dist
FROM PaymentMethod;

-- TCL
START TRANSACTION;
UPDATE PaymentMethod SET is_active = '0' WHERE payment_method_id = 1;
ROLLBACK;

-- DCL
GRANT INSERT ON PaymentMethod TO 'user'@'localhost';
REVOKE INSERT ON PaymentMethod FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_payment_method_insert
BEFORE INSERT ON PaymentMethod
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;

/*------------------------------------policies-----------------------------------------------*/
-- View
CREATE VIEW policies_view AS
SELECT policy_name, description
FROM policies;

-- CTE
WITH PoliciesCTE AS (
    SELECT policy_name
    FROM policies
    WHERE coverage_amount > 1000000
)
SELECT * FROM PoliciesCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetPolicyDetails(IN policyName VARCHAR(100))
BEGIN
    SELECT * FROM policies WHERE policy_name = policyName;
END //
DELIMITER ;

-- Window Function
SELECT policy_name,
       ROW_NUMBER() OVER (ORDER BY policy_id) AS row_num
FROM policies;

-- TCL
START TRANSACTION;
UPDATE policies SET status = 'Inactive' WHERE policy_id = 1;
COMMIT;

-- DCL
GRANT UPDATE ON policies TO 'user'@'localhost';
REVOKE UPDATE ON policies FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_policy_insert
BEFORE INSERT ON policies
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;
/*------------------------------------account_details-----------------------------------------------*/
-- View
CREATE VIEW account_details_view AS
SELECT account_number, account_type, balance
FROM account_details;

-- CTE
WITH AccountDetailsCTE AS (
    SELECT account_number, balance
    FROM account_details
    WHERE balance > 5000
)
SELECT * FROM AccountDetailsCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetAccountDetails(IN accNumber VARCHAR(20))
BEGIN
    SELECT * FROM account_details WHERE account_number = accNumber;
END //
DELIMITER ;

-- Window Function
SELECT account_number,
       SUM(balance) OVER (ORDER BY account_id) AS running_total
FROM account_details;

-- TCL
START TRANSACTION;
UPDATE account_details SET status = 'Inactive' WHERE account_id = 1;
ROLLBACK;

-- DCL
GRANT DELETE ON account_details TO 'user'@'localhost';
REVOKE DELETE ON account_details FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_account_details_insert
BEFORE INSERT ON account_details
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;
/*------------------------------------bank_transactions-----------------------------------------------*/
-- View
CREATE VIEW bank_transactions_view AS
SELECT transaction_type, transaction_amount, transaction_status
FROM bank_transactions;

-- CTE
WITH TransactionCTE AS (
    SELECT transaction_type, transaction_amount
    FROM bank_transactions
    WHERE transaction_status = 'Completed'
)
SELECT * FROM TransactionCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetTransactionDetails(IN transType VARCHAR(20))
BEGIN
    SELECT * FROM bank_transactions WHERE transaction_type = transType;
END //
DELIMITER ;

-- Window Function
SELECT transaction_type,
       AVG(transaction_amount) OVER (ORDER BY transaction_id) AS avg_amount
FROM bank_transactions;

-- TCL
START TRANSACTION;
UPDATE bank_transactions SET transaction_status = 'Pending' WHERE transaction_id = 1;
COMMIT;

-- DCL
GRANT SELECT ON bank_transactions TO 'user'@'localhost';
REVOKE SELECT ON bank_transactions FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_transaction_insert
BEFORE INSERT ON bank_transactions
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;

/*------------------------------------loan_details-----------------------------------------------*/
-- View
CREATE VIEW loan_details_view AS
SELECT loan_type, loan_amount, status
FROM loan_details;

-- CTE
WITH LoanDetailsCTE AS (
    SELECT loan_type, loan_amount
    FROM loan_details
    WHERE status = 'Active'
)
SELECT * FROM LoanDetailsCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetLoanDetails(IN loanType VARCHAR(50))
BEGIN
    SELECT * FROM loan_details WHERE loan_type = loanType;
END //
DELIMITER ;

-- Window Function
SELECT loan_type,
       SUM(loan_amount) OVER (ORDER BY loan_id) AS total_loan_amount
FROM loan_details;

-- TCL
START TRANSACTION;
UPDATE loan_details SET status = 'Paid Off' WHERE loan_id = 1;
ROLLBACK;

-- DCL
GRANT INSERT ON loan_details TO 'user'@'localhost';
REVOKE INSERT ON loan_details FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_loan_details_insert
BEFORE INSERT ON loan_details
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;

/*------------------------------------------credit_card------------------------------------------------*/
-- View
CREATE VIEW credit_card_view AS
SELECT card_type, card_number, balance
FROM credit_card;

-- CTE
WITH CreditCardCTE AS (
    SELECT card_type, balance
    FROM credit_card
    WHERE balance > 5000
)
SELECT * FROM CreditCardCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetCreditCardDetails(IN cardType VARCHAR(50))
BEGIN
    SELECT * FROM credit_card WHERE card_type = cardType;
END //
DELIMITER ;

-- Window Function
SELECT card_type,
       MAX(balance) OVER (ORDER BY card_id) AS max_balance
FROM credit_card;

-- TCL
START TRANSACTION;
UPDATE credit_card SET status = 'Inactive' WHERE card_id = 1;
COMMIT;

-- DCL
GRANT UPDATE ON credit_card TO 'user'@'localhost';
REVOKE UPDATE ON credit_card FROM 'user'@'localhost';

-- Trigger
DELIMITER //
CREATE TRIGGER before_credit_card_insert
BEFORE INSERT ON credit_card
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END //
DELIMITER ;

/*------------------------------------payment_history-----------------------------------------------*/
-- View
CREATE VIEW payment_history_view AS
SELECT payment_date, amount, status
FROM payment_history;

-- CTE
WITH PaymentHistoryCTE AS (
    SELECT payment_date, amount
    FROM payment_history
    WHERE status = 'Completed'
)
SELECT * FROM PaymentHistoryCTE;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetPaymentHistoryDetails(IN paymentDate DATE)
BEGIN
    SELECT *
/*----------------------------------------payment_history----------------------------------------------------*/
-- 1. View: Create a view to show completed payments
CREATE VIEW completed_payments AS
SELECT payment_id, payment_date, amount, payment_method_name, account_number
FROM payment_history
WHERE status = 'Completed';

-- 2. CTE: Use a CTE to find the total amount of payments made by each payment method
WITH PaymentTotals AS (
    SELECT payment_method_name, SUM(amount) AS total_amount
    FROM payment_history
    GROUP BY payment_method_name
)
SELECT * FROM PaymentTotals;

-- 3. Stored Procedure: Create a stored procedure to insert a new payment record
DELIMITER //
CREATE PROCEDURE InsertPayment(
    IN p_payment_date DATE,
    IN p_amount DECIMAL(10, 2),
    IN p_payment_method_name VARCHAR(100),
    IN p_status VARCHAR(10),
    IN p_account_number VARCHAR(20)
BEGIN
    INSERT INTO payment_history (payment_date, amount, payment_method_name, status, account_number)
    VALUES (p_payment_date, p_amount, p_payment_method_name, p_status, p_account_number);
END //
DELIMITER ;

-- 4. Window Function: Use a window function to calculate the running total of payments
SELECT payment_id, payment_date, amount,
       SUM(amount) OVER (ORDER BY payment_date) AS running_total
FROM payment_history;

-- 5. TCL: Use Transaction Control Language to insert a new payment and commit it
START TRANSACTION;
INSERT INTO payment_history (payment_date, amount, payment_method_name, status, account_number)
VALUES ('2025-01-21', 1000.00, 'Credit Card', 'Completed', 'ACC100022');
COMMIT;

-- 6. DCL: Grant SELECT permission on the payment_history table to a user
GRANT SELECT ON payment_history TO 'user_name';

-- 7. Trigger: Create a trigger to log an entry into a log table when a new payment is inserted
CREATE TABLE payment_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_id INT,
    log_message VARCHAR(255),
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_payment_insert
AFTER INSERT ON payment_history
FOR EACH ROW
BEGIN
    INSERT INTO payment_log (payment_id, log_message)
    VALUES (NEW.payment_id, 'New payment inserted');
END //
DELIMITER ;
/*------------------------------------bank_statements-----------------------------------------------*/
-- 1. View: Create a view to show the latest bank statement for each account
CREATE VIEW latest_bank_statements AS
SELECT account_id, MAX(statement_date) AS latest_statement_date
FROM bank_statements
GROUP BY account_id;

-- 2. CTE: Calculate the total deposits and withdrawals for each account
WITH account_summary AS (
    SELECT account_id, 
           SUM(total_deposits) AS total_deposits, 
           SUM(total_withdrawals) AS total_withdrawals
    FROM bank_statements
    GROUP BY account_id
)
SELECT * FROM account_summary;

-- 3. Stored Procedure: Create a stored procedure to insert a new bank statement
DELIMITER //
CREATE PROCEDURE InsertBankStatement(
    IN p_account_id INT, 
    IN p_statement_date DATE, 
    IN p_opening_balance DECIMAL(15, 2), 
    IN p_closing_balance DECIMAL(15, 2), 
    IN p_total_deposits DECIMAL(15, 2), 
    IN p_total_withdrawals DECIMAL(15, 2)
BEGIN
    INSERT INTO bank_statements (account_id, statement_date, opening_balance, closing_balance, total_deposits, total_withdrawals)
    VALUES (p_account_id, p_statement_date, p_opening_balance, p_closing_balance, p_total_deposits, p_total_withdrawals);
END //
DELIMITER ;

-- 4. Window Function: Calculate the running balance for each account
SELECT account_id, statement_date, 
       SUM(closing_balance) OVER (PARTITION BY account_id ORDER BY statement_date) AS running_balance
FROM bank_statements;

-- 5. TCL: Start a transaction to update a bank statement
START TRANSACTION;
UPDATE bank_statements SET closing_balance = 2000.00 WHERE id = 1;
COMMIT;

-- 6. DCL: Grant SELECT permission to a user
GRANT SELECT ON bank_statements TO 'user_name';

-- 7. Trigger: Create a trigger to update the updated_at timestamp
DELIMITER //
CREATE TRIGGER update_bank_statements_timestamp
BEFORE UPDATE ON bank_statements
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END //
DELIMITER ;

/*-----------------------------------------investments-------------------------------------------------*/
-- 1. View: Create a view to show the total investment amount for each account
CREATE VIEW total_investments AS
SELECT account_id, SUM(amount) AS total_investment_amount
FROM investments
GROUP BY account_id;

-- 2. CTE: Calculate the average interest rate for each investment type
WITH investment_avg_interest AS (
    SELECT investment_type, AVG(interest_rate) AS avg_interest_rate
    FROM investments
    GROUP BY investment_type
)
SELECT * FROM investment_avg_interest;

-- 3. Stored Procedure: Create a stored procedure to insert a new investment
DELIMITER //
CREATE PROCEDURE InsertInvestment(
    IN p_account_id INT, 
    IN p_investment_type VARCHAR(50), 
    IN p_investment_date DATE, 
    IN p_amount DECIMAL(15, 2), 
    IN p_current_value DECIMAL(15, 2), 
    IN p_interest_rate DECIMAL(5, 2), 
    IN p_maturity_date DATE
)
BEGIN
    INSERT INTO investments (account_id, investment_type, investment_date, amount, current_value, interest_rate, maturity_date)
    VALUES (p_account_id, p_investment_type, p_investment_date, p_amount, p_current_value, p_interest_rate, p_maturity_date);
END //
DELIMITER ;

-- 4. Window Function: Calculate the cumulative investment amount for each account
SELECT account_id, investment_date, 
       SUM(amount) OVER (PARTITION BY account_id ORDER BY investment_date) AS cumulative_investment
FROM investments;

-- 5. TCL: Start a transaction to delete an investment
START TRANSACTION;
DELETE FROM investments WHERE id = 1;
ROLLBACK;

-- 6. DCL: Revoke INSERT permission from a user
REVOKE INSERT ON investments FROM 'user_name';

-- 7. Trigger: Create a trigger to update the current value of an investment
DELIMITER //
CREATE TRIGGER update_investment_value
BEFORE UPDATE ON investments
FOR EACH ROW
BEGIN
    SET NEW.current_value = NEW.amount * (1 + NEW.interest_rate / 100);
END //
DELIMITER ;

/*-----------------------------------------stocks-------------------------------------------------*/
-- 1. View: Create a view to show the total value of stocks for each account
CREATE VIEW total_stock_value AS
SELECT account_id, SUM(quantity * current_price) AS total_stock_value
FROM stocks
GROUP BY account_id;

-- 2. CTE: Calculate the average purchase price for each stock symbol
WITH stock_avg_price AS (
    SELECT stock_symbol, AVG(purchase_price) AS avg_purchase_price
    FROM stocks
    GROUP BY stock_symbol
)
SELECT * FROM stock_avg_price;

-- 3. Stored Procedure: Create a stored procedure to insert a new stock
DELIMITER //
CREATE PROCEDURE InsertStock(
    IN p_account_id INT, 
    IN p_stock_symbol VARCHAR(10), 
    IN p_company_name VARCHAR(100), 
    IN p_purchase_date DATE, 
    IN p_quantity INT, 
    IN p_purchase_price DECIMAL(15, 2), 
    IN p_current_price DECIMAL(15, 2)
)
BEGIN
    INSERT INTO stocks (account_id, stock_symbol, company_name, purchase_date, quantity, purchase_price, current_price)
    VALUES (p_account_id, p_stock_symbol, p_company_name, p_purchase_date, p_quantity, p_purchase_price, p_current_price);
END //
DELIMITER ;

-- 4. Window Function: Calculate the running total of stock purchases for each account
SELECT account_id, purchase_date, 
       SUM(quantity * purchase_price) OVER (PARTITION BY account_id ORDER BY purchase_date) AS running_total
FROM stocks;

-- 5. TCL: Start a transaction to update a stock's current price
START TRANSACTION;
UPDATE stocks SET current_price = 180.00 WHERE id = 1;
COMMIT;

-- 6. DCL: Grant UPDATE permission to a user
GRANT UPDATE ON stocks TO 'user_name';

-- 7. Trigger: Create a trigger to update the updated_at timestamp
DELIMITER //
CREATE TRIGGER update_stocks_timestamp
BEFORE UPDATE ON stocks
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END //
DELIMITER ;

/*-----------------------------------------bonds-------------------------------------------------*/
-- 1. View: Create a view to show the total bond value for each account
CREATE VIEW total_bond_value AS
SELECT account_id, SUM(current_value) AS total_bond_value
FROM bonds
GROUP BY account_id;

-- 2. CTE: Calculate the average interest rate for each bond type
WITH bond_avg_interest AS (
    SELECT bond_type, AVG(interest_rate) AS avg_interest_rate
    FROM bonds
    GROUP BY bond_type
)
SELECT * FROM bond_avg_interest;

-- 3. Stored Procedure: Create a stored procedure to insert a new bond
DELIMITER //
CREATE PROCEDURE InsertBond(
    IN p_account_id INT, 
    IN p_bond_name VARCHAR(100), 
    IN p_bond_type VARCHAR(50), 
    IN p_purchase_date DATE, 
    IN p_face_value DECIMAL(15, 2), 
    IN p_purchase_price DECIMAL(15, 2), 
    IN p_current_value DECIMAL(15, 2), 
    IN p_interest_rate DECIMAL(5, 2), 
    IN p_maturity_date DATE
)
BEGIN
    INSERT INTO bonds (account_id, bond_name, bond_type, purchase_date, face_value, purchase_price, current_value, interest_rate, maturity_date)
    VALUES (p_account_id, p_bond_name, p_bond_type, p_purchase_date, p_face_value, p_purchase_price, p_current_value, p_interest_rate, p_maturity_date);
END //
DELIMITER ;

-- 4. Window Function: Calculate the cumulative bond value for each account
SELECT account_id, purchase_date, 
       SUM(current_value) OVER (PARTITION BY account_id ORDER BY purchase_date) AS cumulative_bond_value
FROM bonds;

-- 5. TCL: Start a transaction to delete a bond
START TRANSACTION;
DELETE FROM bonds WHERE id = 1;
ROLLBACK;

-- 6. DCL: Revoke DELETE permission from a user
REVOKE DELETE ON bonds FROM 'user_name';

-- 7. Trigger: Create a trigger to update the current value of a bond
DELIMITER //
CREATE TRIGGER update_bond_value
BEFORE UPDATE ON bonds
FOR EACH ROW
BEGIN
    SET NEW.current_value = NEW.face_value * (1 + NEW.interest_rate / 100);
END //
DELIMITER ;

/*-----------------------------------------mutual_funds-------------------------------------------------*/
-- 1. View: Create a view to show the total mutual fund value for each account
CREATE VIEW total_mutual_fund_value AS
SELECT account_id, SUM(units * current_price) AS total_mutual_fund_value
FROM mutual_funds
GROUP BY account_id;

-- 2. CTE: Calculate the average purchase price for each fund type
WITH mutual_fund_avg_price AS (
    SELECT fund_type, AVG(purchase_price) AS avg_purchase_price
    FROM mutual_funds
    GROUP BY fund_type
)
SELECT * FROM mutual_fund_avg_price;

-- 3. Stored Procedure: Create a stored procedure to insert a new mutual fund
DELIMITER //
CREATE PROCEDURE InsertMutualFund(
    IN p_account_id INT, 
    IN p_fund_name VARCHAR(100), 
    IN p_fund_type VARCHAR(50), 
    IN p_purchase_date DATE, 
    IN p_units DECIMAL(15, 2), 
    IN p_purchase_price DECIMAL(15, 2), 
    IN p_current_price DECIMAL(15, 2)
)
BEGIN
    INSERT INTO mutual_funds (account_id, fund_name, fund_type, purchase_date, units, purchase_price, current_price)
    VALUES (p_account_id, p_fund_name, p_fund_type, p_purchase_date, p_units, p_purchase_price, p_current_price);
END //
DELIMITER ;

-- 4. Window Function: Calculate the cumulative mutual fund value for each account
SELECT account_id, purchase_date, 
       SUM(units * current_price) OVER (PARTITION BY account_id ORDER BY purchase_date) AS cumulative_mutual_fund_value
FROM mutual_funds;

-- 5. TCL: Start a transaction to update a mutual fund's current price
START TRANSACTION;
UPDATE mutual_funds SET current_price = 180.00 WHERE id = 1;
COMMIT;

-- 6. DCL: Grant SELECT permission to a user
GRANT SELECT ON mutual_funds TO 'user_name';

-- 7. Trigger: Create a trigger to update the updated_at timestamp
DELIMITER //
CREATE TRIGGER update_mutual_funds_timestamp
BEFORE UPDATE ON mutual_funds
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END //
DELIMITER ;

/*-----------------------------------------credit_scores-------------------------------------------------*/
-- 1. View: Create a view to show the latest credit score for each account
CREATE VIEW latest_credit_scores AS
SELECT account_id, MAX(score_date) AS latest_score_date
FROM credit_scores
GROUP BY account_id;

-- 2. CTE: Calculate the average credit score for each account
WITH avg_credit_score AS (
    SELECT account_id, AVG(score) AS avg_score
    FROM credit_scores
    GROUP BY account_id
)
SELECT * FROM avg_credit_score;

-- 3. Stored Procedure: Create a stored procedure to insert a new credit score
DELIMITER //
CREATE PROCEDURE InsertCreditScore(
    IN p_account_id INT, 
    IN p_score INT, 
    IN p_score_date DATE, 
    IN p_score_source VARCHAR(100)
)
BEGIN
    INSERT INTO credit_scores (account_id, score, score_date, score_source)
    VALUES (p_account_id, p_score, p_score_date, p_score_source);
END //
DELIMITER ;

-- 4. Window Function: Calculate the running average credit score for each account
SELECT account_id, score_date, 
       AVG(score) OVER (PARTITION BY account_id ORDER BY score_date) AS running_avg_score
FROM credit_scores;

-- 5. TCL: Start a transaction to delete a credit score
START TRANSACTION;
DELETE FROM credit_scores WHERE id = 1;
ROLLBACK;

-- 6. DCL: Revoke UPDATE permission from a user
REVOKE UPDATE ON credit_scores FROM 'user_name';

-- 7. Trigger: Create a trigger to update the updated_at timestamp
DELIMITER //
CREATE TRIGGER update_credit_scores_timestamp
BEFORE UPDATE ON credit_scores
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END //
DELIMITER ;

/*-----------------------------------------loan_payments-------------------------------------------------*/
-- 1. View: Create a view to show the total payments made for each loan
CREATE VIEW total_loan_payments AS
SELECT loan_id, SUM(payment_amount) AS total_payments
FROM loan_payments
GROUP BY loan_id;

-- 2. CTE: Calculate the average payment amount for each loan
WITH avg_loan_payment AS (
    SELECT loan_id, AVG(payment_amount) AS avg_payment_amount
    FROM loan_payments
    GROUP BY loan_id
)
SELECT * FROM avg_loan_payment;

-- 3. Stored Procedure: Create a stored procedure to insert a new loan payment
DELIMITER //
CREATE PROCEDURE InsertLoanPayment(
    IN p_loan_id INT, 
    IN p_payment_date DATE, 
    IN p_payment_amount DECIMAL(15, 2), 
    IN p_remaining_balance DECIMAL(15, 2), 
    IN p_payment_method VARCHAR(50), 
    IN p_payment_status VARCHAR(20), 
    IN p_notes TEXT
)
BEGIN
    INSERT INTO loan_payments (loan_id, payment_date, payment_amount, remaining_balance, payment_method, payment_status, notes)
    VALUES (p_loan_id, p_payment_date, p_payment_amount, p_remaining_balance, p_payment_method, p_payment_status, p_notes);
END //
DELIMITER ;

-- 4. Window Function: Calculate the cumulative payment amount for each loan
SELECT loan_id, payment_date, 
       SUM(payment_amount) OVER (PARTITION BY loan_id ORDER BY payment_date) AS cumulative_payment
FROM loan_payments;

-- 5. TCL: Start a transaction to update a loan payment
START TRANSACTION;
UPDATE loan_payments SET payment_amount = 250.00 WHERE id = 1;
COMMIT;

-- 6. DCL: Grant DELETE permission to a user
GRANT DELETE ON loan_payments TO 'user_name';

-- 7. Trigger: Create a trigger to update the updated_at timestamp
DELIMITER //
CREATE TRIGGER update_loan_payments_timestamp
BEFORE UPDATE ON loan_payments
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END //
DELIMITER ;

/*-----------------------------------------deposits-------------------------------------------------*/
-- 1. View: Create a view to show the total deposit amount for each account
CREATE VIEW total_deposits AS
SELECT account_id, SUM(amount) AS total_deposit_amount
FROM deposits
GROUP BY account_id;

-- 2. CTE: Calculate the average interest rate for each deposit type
WITH deposit_avg_interest AS (
    SELECT deposit_type, AVG(interest_rate) AS avg_interest_rate
    FROM deposits
    GROUP BY deposit_type
)
SELECT * FROM deposit_avg_interest;

-- 3. Stored Procedure: Create a stored procedure to insert a new deposit
DELIMITER //
CREATE PROCEDURE InsertDeposit(
    IN p_account_id INT, 
    IN p_deposit_type VARCHAR(50), 
    IN p_amount DECIMAL(15, 2), 
    IN p_interest_rate DECIMAL(5, 2), 
    IN p_maturity_date DATE, 
    IN p_deposit_date DATE
)
BEGIN
    INSERT INTO deposits (account_id, deposit_type, amount, interest_rate, maturity_date, deposit_date)
    VALUES (p_account_id, p_deposit_type, p_amount, p_interest_rate, p_maturity_date, p_deposit_date);
END //
DELIMITER ;

-- 4. Window Function: Calculate the cumulative deposit amount for each account
SELECT account_id, deposit_date, 
       SUM(amount) OVER (PARTITION BY account_id ORDER BY deposit_date) AS cumulative_deposit
FROM deposits;

-- 5. TCL: Start a transaction to delete a deposit
START TRANSACTION;
DELETE FROM deposits WHERE id = 1;
ROLLBACK;

-- 6. DCL: Revoke INSERT permission from a user
REVOKE INSERT ON deposits FROM 'user_name';

-- 7. Trigger: Create a trigger to update the updated_at timestamp
DELIMITER //
CREATE TRIGGER update_deposits_timestamp
BEFORE UPDATE ON deposits
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END //
DELIMITER ;
