use bank;

/* ----------------------------bank_details--------------------------------------*/
-- 1. Arithmetic: Calculate the total number of banks and add 10 to it.
SELECT COUNT(*) + 10 AS total_banks_plus_10 FROM bank_details;

-- 2. Joins: Display bank details along with their branches.
SELECT bd.bank_name, br.branch_name 
FROM bank_details bd
JOIN branches br ON bd.bank_id = br.bank_id;

-- 3. Subquery: Find banks that have branches in 'Cityville'.
SELECT bank_name FROM bank_details 
WHERE bank_id IN (SELECT bank_id FROM branches WHERE city = 'Cityville');

-- 4. String Function: Display bank names in uppercase.
SELECT UPPER(bank_name) AS upper_bank_name FROM bank_details;

-- 5. Aggregate Function: Find the total number of banks.
SELECT COUNT(*) AS total_banks FROM bank_details;

-- 6. Bitwise: Check if bank_id is even or odd.
SELECT bank_id, bank_name, bank_id & 1 AS is_odd FROM bank_details;

-- 7. Arithmetic: Calculate the average length of bank names.
SELECT AVG(LENGTH(bank_name)) AS avg_name_length FROM bank_details;


/* ------------------------------Branches-----------------------------------*/
-- 1. Arithmetic: Calculate the total number of branches and multiply by 2.
SELECT COUNT(*) * 2 AS total_branches_times_2 FROM branches;

-- 2. Joins: Display branch details along with bank names.
SELECT br.branch_name, bd.bank_name 
FROM branches br
JOIN bank_details bd ON br.bank_id = bd.bank_id;

-- 3. Subquery: Find branches that are managed by staff with salary greater than 500000.
SELECT branch_name FROM branches 
WHERE manager_id IN (SELECT staff_id FROM staff WHERE salary > 500000);

-- 4. String Function: Display branch names in lowercase.
SELECT LOWER(branch_name) AS lower_branch_name FROM branches;

-- 5. Aggregate Function: Find the total number of branches per bank.
SELECT bank_id, COUNT(*) AS total_branches FROM branches GROUP BY bank_id;

-- 6. Bitwise: Check if branch_id is even or odd.
SELECT branch_id, branch_name, branch_id & 1 AS is_odd FROM branches;

-- 7. Arithmetic: Calculate the average length of branch names.
SELECT AVG(LENGTH(branch_name)) AS avg_name_length FROM branches;

/*---------------------------------------------Customers--------------------------------------------*/

-- 1. Arithmetic: Calculate the total number of customers and subtract 5 from it.
SELECT COUNT(*) - 5 AS total_customers_minus_5 FROM customers;

-- 2. Joins: Display customer details along with their account details.
SELECT c.cust_fname, c.cust_lname, ad.account_number 
FROM customers c
JOIN account_details ad ON c.customer_id = ad.customer_id;

-- 3. Subquery: Find customers who have accounts with a balance greater than 5000.
SELECT cust_fname, cust_lname FROM customers 
WHERE customer_id IN (SELECT customer_id FROM account_details WHERE balance > 5000);

-- 4. String Function: Display customer first names in uppercase.
SELECT UPPER(cust_fname) AS upper_cust_fname FROM customers;

-- 5. Aggregate Function: Find the total number of customers per city.
SELECT cust_city, COUNT(*) AS total_customers FROM customers GROUP BY cust_city;

-- 6. Bitwise: Check if customer_id is even or odd.
SELECT customer_id, cust_fname, customer_id & 1 AS is_odd FROM customers;

-- 7. Arithmetic: Calculate the average length of customer first names.
SELECT AVG(LENGTH(cust_fname)) AS avg_name_length FROM customers;

/*--------------------------------Customer Type---------------------------------------*/

-- 1. Arithmetic: Calculate the total number of customer types and add 3 to it.
SELECT COUNT(*) + 3 AS total_customer_types_plus_3 FROM CustomerType;

-- 2. Joins: Display customer types along with customer details.
SELECT ct.customer_type_name, c.cust_fname, c.cust_lname 
FROM CustomerType ct
JOIN customers c ON ct.customer_type_id = c.customer_id;

-- 3. Subquery: Find customer types that have more than 5 customers.
SELECT customer_type_name FROM CustomerType 
WHERE customer_type_id IN (SELECT customer_type_id FROM customers GROUP BY customer_type_id HAVING COUNT(*) > 5);

-- 4. String Function: Display customer type names in lowercase.
SELECT LOWER(customer_type_name) AS lower_customer_type_name FROM CustomerType;

-- 5. Aggregate Function: Find the total number of customer types.
SELECT COUNT(*) AS total_customer_types FROM CustomerType;

-- 6. Bitwise: Check if customer_type_id is even or odd.
SELECT customer_type_id, customer_type_name, customer_type_id & 1 AS is_odd FROM CustomerType;

-- 7. Arithmetic: Calculate the average length of customer type names.
SELECT AVG(LENGTH(customer_type_name)) AS avg_name_length FROM CustomerType;

/*----------------------------------CustomerCredential-------------------------------------*/

-- 1. Arithmetic: Calculate the total number of credentials and multiply by 2.
SELECT COUNT(*) * 2 AS total_credentials_times_2 FROM CustomerCredential;

-- 2. Joins: Display customer credentials along with customer details.
SELECT cc.cust_username, c.cust_fname, c.cust_lname 
FROM CustomerCredential cc
JOIN customers c ON cc.customer_id = c.customer_id;

-- 3. Subquery: Find credentials for customers who are active.
SELECT cust_username FROM CustomerCredential 
WHERE customer_id IN (SELECT customer_id FROM customers WHERE is_cust_active = '1');

-- 4. String Function: Display usernames in uppercase.
SELECT UPPER(cust_username) AS upper_username FROM CustomerCredential;

-- 5. Aggregate Function: Find the total number of credentials per customer.
SELECT customer_id, COUNT(*) AS total_credentials FROM CustomerCredential GROUP BY customer_id;

-- 6. Bitwise: Check if credential_id is even or odd.
SELECT credential_id, cust_username, credential_id & 1 AS is_odd FROM CustomerCredential;

-- 7. Arithmetic: Calculate the average length of usernames.
SELECT AVG(LENGTH(cust_username)) AS avg_username_length FROM CustomerCredential;

/*---------------------------staff---------------------------------*/

-- 1. Arithmetic: Calculate the total number of staff and add 5 to it.
SELECT COUNT(*) + 5 AS total_staff_plus_5 FROM staff;

-- 2. Joins: Display staff details along with their branch details.
SELECT s.staff_fname, s.staff_lname, br.branch_name 
FROM staff s
JOIN branches br ON s.staff_branch_id = br.branch_id;

-- 3. Subquery: Find staff who are managers.
SELECT staff_fname, staff_lname FROM staff 
WHERE staff_id IN (SELECT manager_id FROM branches);

-- 4. String Function: Display staff first names in lowercase.
SELECT LOWER(staff_fname) AS lower_staff_fname FROM staff;

-- 5. Aggregate Function: Find the total number of staff per branch.
SELECT staff_branch_id, COUNT(*) AS total_staff FROM staff GROUP BY staff_branch_id;

-- 6. Bitwise: Check if staff_id is even or odd.
SELECT staff_id, staff_fname, staff_id & 1 AS is_odd FROM staff;

-- 7. Arithmetic: Calculate the average length of staff first names.
SELECT AVG(LENGTH(staff_fname)) AS avg_name_length FROM staff;

/*-------------------------------------StaffCredential----------------------------------*/

-- 1. Arithmetic: Calculate the total number of staff credentials and subtract 2 from it.
SELECT COUNT(*) - 2 AS total_credentials_minus_2 FROM StaffCredential;

-- 2. Joins: Display staff credentials along with staff details.
SELECT sc.username, s.staff_fname, s.staff_lname 
FROM StaffCredential sc
JOIN staff s ON sc.staff_id = s.staff_id;

-- 3. Subquery: Find credentials for staff who are active.
SELECT username FROM StaffCredential 
WHERE staff_id IN (SELECT staff_id FROM staff WHERE is_staff_active = '1');

-- 4. String Function: Display usernames in uppercase.
SELECT UPPER(username) AS upper_username FROM StaffCredential;

-- 5. Aggregate Function: Find the total number of credentials per staff.
SELECT staff_id, COUNT(*) AS total_credentials FROM StaffCredential GROUP BY staff_id;

-- 6. Bitwise: Check if Staffcredential_id is even or odd.
SELECT Staffcredential_id, username, Staffcredential_id & 1 AS is_odd FROM StaffCredential;

-- 7. Arithmetic: Calculate the average length of usernames.
SELECT AVG(LENGTH(username)) AS avg_username_length FROM StaffCredential;

/*-----------------------------------accounttype--------------------------------------*/

-- 1. Arithmetic: Calculate the total number of account types and add 3 to it.
SELECT COUNT(*) + 3 AS total_account_types_plus_3 FROM accounttype;

-- 2. Joins: Display account types along with account details.
SELECT at.account_type_name, ad.account_number 
FROM accounttype at
JOIN account_details ad ON at.account_type_id = ad.account_id;

-- 3. Subquery: Find account types with a minimum balance greater than 1000.
SELECT account_type_name FROM accounttype 
WHERE account_type_id IN (SELECT account_type_id FROM account_details WHERE minimum_balance > 1000);

-- 4. String Function: Display account type names in lowercase.
SELECT LOWER(account_type_name) AS lower_account_type_name FROM accounttype;

-- 5. Aggregate Function: Find the total number of account types.
SELECT COUNT(*) AS total_account_types FROM accounttype;

-- 6. Bitwise: Check if account_type_id is even or odd.
SELECT account_type_id, account_type_name, account_type_id & 1 AS is_odd FROM accounttype;

-- 7. Arithmetic: Calculate the average length of account type names.
SELECT AVG(LENGTH(account_type_name)) AS avg_name_length FROM accounttype;

/*---------------------------Loantype------------------------------------*/

-- 1. Arithmetic: Calculate the total number of loan types and multiply by 2.
SELECT COUNT(*) * 2 AS total_loan_types_times_2 FROM loantype;

-- 2. Joins: Display loan types along with loan details.
SELECT lt.loan_type_name, l.loan_amount 
FROM loantype lt
JOIN loans l ON lt.loan_type_id = l.loan_type_id;

-- 3. Subquery: Find loan types with a minimum amount greater than 100000.
SELECT loan_type_name FROM loantype 
WHERE loan_type_id IN (SELECT loan_type_id FROM loans WHERE loan_amount > 100000);

-- 4. String Function: Display loan type names in uppercase.
SELECT UPPER(loan_type_name) AS upper_loan_type_name FROM loantype;

-- 5. Aggregate Function: Find the total number of loan types.
SELECT COUNT(*) AS total_loan_types FROM loantype;

-- 6. Bitwise: Check if loan_type_id is even or odd.
SELECT loan_type_id, loan_type_name, loan_type_id & 1 AS is_odd FROM loantype;

-- 7. Arithmetic: Calculate the average length of loan type names.
SELECT AVG(LENGTH(loan_type_name)) AS avg_name_length FROM loantype;

/*--------------------------PaymentMethod------------------------------*/

-- 1. Arithmetic: Calculate the total number of payment methods and subtract 1 from it.
SELECT COUNT(*) - 1 AS total_payment_methods_minus_1 FROM PaymentMethod;

-- 2. Joins: Display payment methods along with transaction details.
SELECT pm.payment_method_name, t.transaction_amount 
FROM PaymentMethod pm
JOIN transactions t ON pm.payment_method_id = t.payment_method_id;

-- 3. Subquery: Find payment methods with a transaction fee greater than 50.
SELECT payment_method_name FROM PaymentMethod 
WHERE payment_method_id IN (SELECT payment_method_id FROM transactions WHERE transaction_fee > 50);

-- 4. String Function: Display payment method names in lowercase.
SELECT LOWER(payment_method_name) AS lower_payment_method_name FROM PaymentMethod;

-- 5. Aggregate Function: Find the total number of payment methods.
SELECT COUNT(*) AS total_payment_methods FROM PaymentMethod;

-- 6. Bitwise: Check if payment_method_id is even or odd.
SELECT payment_method_id, payment_method_name, payment_method_id & 1 AS is_odd FROM PaymentMethod;

-- 7. Arithmetic: Calculate the average length of payment method names.
SELECT AVG(LENGTH(payment_method_name)) AS avg_name_length FROM PaymentMethod;

/* -----------------------------policies------------------------------------------*/

-- 1. Arithmetic: Calculate the total number of policies and add 2 to it.
SELECT COUNT(*) + 2 AS total_policies_plus_2 FROM policies;

-- 2. Joins: Display policies along with customer details.
SELECT p.policy_name, c.cust_fname, c.cust_lname 
FROM policies p
JOIN customers c ON p.customer_id = c.customer_id;

-- 3. Subquery: Find policies with a coverage amount greater than 1000000.
SELECT policy_name FROM policies 
WHERE policy_id IN (SELECT policy_id FROM policies WHERE coverage_amount > 1000000);

-- 4. String Function: Display policy names in uppercase.
SELECT UPPER(policy_name) AS upper_policy_name FROM policies;

-- 5. Aggregate Function: Find the total number of policies per customer.
SELECT customer_id, COUNT(*) AS total_policies FROM policies GROUP BY customer_id;

-- 6. Bitwise: Check if policy_id is even or odd.
SELECT policy_id, policy_name, policy_id & 1 AS is_odd FROM policies;

-- 7. Arithmetic: Calculate the average length of policy names.
SELECT AVG(LENGTH(policy_name)) AS avg_name_length FROM policies;

/*------------------------------ account_details -----------------------------*/

-- 1. Arithmetic: Calculate the total number of accounts and multiply by 3.
SELECT COUNT(*) * 3 AS total_accounts_times_3 FROM account_details;

-- 2. Joins: Display account details along with customer details.
SELECT ad.account_number, c.cust_fname, c.cust_lname 
FROM account_details ad
JOIN customers c ON ad.customer_id = c.customer_id;

-- 3. Subquery: Find accounts with a balance greater than 5000.
SELECT account_number FROM account_details 
WHERE account_id IN (SELECT account_id FROM account_details WHERE balance > 5000);

-- 4. String Function: Display account numbers in lowercase.
SELECT LOWER(account_number) AS lower_account_number FROM account_details;

-- 5. Aggregate Function: Find the total number of accounts per customer.
SELECT customer_id, COUNT(*) AS total_accounts FROM account_details GROUP BY customer_id;

-- 6. Bitwise: Check if account_id is even or odd.
SELECT account_id, account_number, account_id & 1 AS is_odd FROM account_details;

-- 7. Arithmetic: Calculate the average length of account numbers.
SELECT AVG(LENGTH(account_number)) AS avg_account_number_length FROM account_details;

/*---------------------------bank_transactions-----------------------------------*/
-- Arithmetic: Calculate the total amount of deposits and withdrawals
SELECT 
    SUM(CASE WHEN transaction_type = 'Deposit' THEN transaction_amount ELSE 0 END) AS total_deposits,
    SUM(CASE WHEN transaction_type = 'Withdrawal' THEN transaction_amount ELSE 0 END) AS total_withdrawals
FROM bank_transactions;

-- Joins: Join with account_details to get account holder names
SELECT bt.transaction_id, bt.transaction_date, bt.transaction_type, bt.transaction_amount, ad.account_holder_name
FROM bank_transactions bt
JOIN account_details ad ON bt.account_id = ad.account_id;

-- Subquery: Find transactions with amounts greater than the average transaction amount
SELECT * FROM bank_transactions
WHERE transaction_amount > (SELECT AVG(transaction_amount) FROM bank_transactions);

-- String Function: Extract the year from the transaction date
SELECT transaction_id, transaction_date, YEAR(transaction_date) AS transaction_year
FROM bank_transactions;

-- Aggregate Function: Count the number of transactions per account
SELECT account_id, COUNT(*) AS transaction_count
FROM bank_transactions
GROUP BY account_id;

-- Bitwise: Check if transaction_id is even (using bitwise AND)
SELECT transaction_id, transaction_date
FROM bank_transactions
WHERE transaction_id & 1 = 0;

-- Arithmetic: Calculate the total transaction amount per currency
SELECT currency, SUM(transaction_amount) AS total_amount
FROM bank_transactions
GROUP BY currency;

/*--------------------------- loan_details-------------------------------------------*/
-- Arithmetic: Calculate the total interest paid over the loan term
SELECT loan_id, loan_amount * interest_rate / 100 * term_length / 12 AS total_interest
FROM loan_details;

-- Joins: Join with customers to get customer names
SELECT ld.loan_id, ld.loan_type, ld.loan_amount, c.customer_name
FROM loan_details ld
JOIN customers c ON ld.customer_id = c.customer_id;

-- Subquery: Find loans with amounts greater than the average loan amount
SELECT * FROM loan_details
WHERE loan_amount > (SELECT AVG(loan_amount) FROM loan_details);

-- String Function: Concatenate loan type and status
SELECT loan_id, CONCAT(loan_type, ' - ', status) AS loan_info
FROM loan_details;

-- Aggregate Function: Find the total loan amount per loan type
SELECT loan_type, SUM(loan_amount) AS total_loan_amount
FROM loan_details
GROUP BY loan_type;

-- Bitwise: Check if loan_id is odd (using bitwise AND)
SELECT loan_id, loan_type
FROM loan_details
WHERE loan_id & 1 = 1;

-- Arithmetic: Calculate the monthly payment for each loan
SELECT loan_id, loan_amount * interest_rate / 100 / 12 AS monthly_interest
FROM loan_details;


/*----------------------------------credit_card-----------------------------------------*/
-- Arithmetic: Calculate the available credit (assuming a credit limit of 10000)
SELECT card_id, 10000 - balance AS available_credit
FROM credit_card;

-- Joins: Join with customers to get customer names
SELECT cc.card_id, cc.card_type, cc.balance, c.customer_name
FROM credit_card cc
JOIN customers c ON cc.customer_id = c.customer_id;

-- Subquery: Find cards with balances greater than the average balance
SELECT * FROM credit_card
WHERE balance > (SELECT AVG(balance) FROM credit_card);

-- String Function: Extract the last 4 digits of the card number
SELECT card_id, RIGHT(card_number, 4) AS last_four_digits
FROM credit_card;

-- Aggregate Function: Find the total balance per card type
SELECT card_type, SUM(balance) AS total_balance
FROM credit_card
GROUP BY card_type;

-- Bitwise: Check if card_id is even (using bitwise AND)
SELECT card_id, card_type
FROM credit_card
WHERE card_id & 1 = 0;

-- Arithmetic: Calculate the interest on the balance (assuming 2% interest)
SELECT card_id, balance * 0.02 AS interest
FROM credit_card;


/*------------------------------------------payment_history--------------------------*/
-- Arithmetic: Calculate the total amount of completed payments
SELECT SUM(amount) AS total_completed_payments
FROM payment_history
WHERE status = 'Completed';

-- Joins: Join with account_details to get account holder names
SELECT ph.payment_id, ph.payment_date, ph.amount, ad.account_holder_name
FROM payment_history ph
JOIN account_details ad ON ph.account_number = ad.account_number;

-- Subquery: Find payments with amounts greater than the average payment amount
SELECT * FROM payment_history
WHERE amount > (SELECT AVG(amount) FROM payment_history);

-- String Function: Extract the month from the payment date
SELECT payment_id, payment_date, MONTH(payment_date) AS payment_month
FROM payment_history;

-- Aggregate Function: Count the number of payments per status
SELECT status, COUNT(*) AS payment_count
FROM payment_history
GROUP BY status;

-- Bitwise: Check if payment_id is odd (using bitwise AND)
SELECT payment_id, payment_date
FROM payment_history
WHERE payment_id & 1 = 1;

-- Arithmetic: Calculate the total amount of payments per payment method
SELECT payment_method_name, SUM(amount) AS total_amount
FROM payment_history
GROUP BY payment_method_name;

/*-----------------------------------------BankCustomerReviews--------------------------------------------------------*/
-- Arithmetic: Calculate the average rating per bank
SELECT bank_id, AVG(Rating) AS average_rating
FROM BankCustomerReviews
GROUP BY bank_id;

-- Joins: Join with customers to get customer names
SELECT bcr.ReviewID, bcr.Rating, c.customer_name
FROM BankCustomerReviews bcr
JOIN customers c ON bcr.customer_id = c.customer_id;

-- Subquery: Find reviews with ratings greater than the average rating
SELECT * FROM BankCustomerReviews
WHERE Rating > (SELECT AVG(Rating) FROM BankCustomerReviews);

-- String Function: Concatenate review text and rating
SELECT ReviewID, CONCAT(ReviewText, ' - Rating: ', Rating) AS review_summary
FROM BankCustomerReviews;

-- Aggregate Function: Count the number of reviews per bank
SELECT bank_id, COUNT(*) AS review_count
FROM BankCustomerReviews
GROUP BY bank_id;

-- Bitwise: Check if ReviewID is even (using bitwise AND)
SELECT ReviewID, Rating
FROM BankCustomerReviews
WHERE ReviewID & 1 = 0;

-- Arithmetic: Calculate the total useful count per bank
SELECT bank_id, SUM(UsefulCount) AS total_useful_count
FROM BankCustomerReviews
GROUP BY bank_id;

/*-----------------------------bank_statements-------------------------*/
-- Arithmetic: Calculate the net change in balance for each statement
SELECT id, closing_balance - opening_balance AS net_balance_change
FROM bank_statements;

-- Joins: Join with account_details to get account holder names
SELECT bs.id, bs.statement_date, bs.closing_balance, ad.account_holder_name
FROM bank_statements bs
JOIN account_details ad ON bs.account_id = ad.account_id;

-- Subquery: Find statements with closing balances greater than the average closing balance
SELECT * FROM bank_statements
WHERE closing_balance > (SELECT AVG(closing_balance) FROM bank_statements);

-- String Function: Extract the year from the statement date
SELECT id, statement_date, YEAR(statement_date) AS statement_year
FROM bank_statements;

-- Aggregate Function: Find the total deposits per account
SELECT account_id, SUM(total_deposits) AS total_deposits
FROM bank_statements
GROUP BY account_id;

-- Bitwise: Check if id is odd (using bitwise AND)
SELECT id, statement_date
FROM bank_statements
WHERE id & 1 = 1;

-- Arithmetic: Calculate the average monthly balance change
SELECT account_id, AVG(closing_balance - opening_balance) AS avg_balance_change
FROM bank_statements
GROUP BY account_id;

/*-----------------------------Investments-------------------------*/
-- Arithmetic: Calculate the profit/loss for each investment
SELECT id, current_value - amount AS profit_loss
FROM investments;

-- Joins: Join with account_details to get account holder names
SELECT i.id, i.investment_type, i.current_value, ad.account_holder_name
FROM investments i
JOIN account_details ad ON i.account_id = ad.account_id;

-- Subquery: Find investments with current values greater than the average current value
SELECT * FROM investments
WHERE current_value > (SELECT AVG(current_value) FROM investments);

-- String Function: Concatenate investment type and current value
SELECT id, CONCAT(investment_type, ' - ', current_value) AS investment_info
FROM investments;

-- Aggregate Function: Find the total investment amount per investment type
SELECT investment_type, SUM(amount) AS total_investment_amount
FROM investments
GROUP BY investment_type;

-- Bitwise: Check if id is even (using bitwise AND)
SELECT id, investment_type
FROM investments
WHERE id & 1 = 0;

-- Arithmetic: Calculate the total profit/loss per account
SELECT account_id, SUM(current_value - amount) AS total_profit_loss
FROM investments
GROUP BY account_id;

/*---------------------------------Stocks----------------------------------------*/
-- Arithmetic: Calculate the total value of each stock holding
SELECT id, quantity * current_price AS total_value
FROM stocks;

-- Joins: Join with account_details to get account holder names
SELECT s.id, s.stock_symbol, s.current_price, ad.account_holder_name
FROM stocks s
JOIN account_details ad ON s.account_id = ad.account_id;

-- Subquery: Find stocks with current prices greater than the average current price
SELECT * FROM stocks
WHERE current_price > (SELECT AVG(current_price) FROM stocks);

-- String Function: Concatenate stock symbol and company name
SELECT id, CONCAT(stock_symbol, ' - ', company_name) AS stock_info
FROM stocks;

-- Aggregate Function: Find the total value of stocks per account
SELECT account_id, SUM(quantity * current_price) AS total_stock_value
FROM stocks
GROUP BY account_id;

-- Bitwise: Check if id is odd (using bitwise AND)
SELECT id, stock_symbol
FROM stocks
WHERE id & 1 = 1;

-- Arithmetic: Calculate the profit/loss for each stock
SELECT id, (current_price - purchase_price) * quantity AS profit_loss
FROM stocks;

/*----------------------------- -Bonds-------------------------------------*/
-- Arithmetic: Calculate the total interest earned for each bond
SELECT id, face_value * interest_rate / 100 * (DATEDIFF(maturity_date, purchase_date) / 365) AS total_interest
FROM bonds;

-- Joins: Join with account_details to get account holder names
SELECT b.id, b.bond_name, b.current_value, ad.account_holder_name
FROM bonds b
JOIN account_details ad ON b.account_id = ad.account_id;

-- Subquery: Find bonds with current values greater than the average current value
SELECT * FROM bonds
WHERE current_value > (SELECT AVG(current_value) FROM bonds);

-- String Function: Concatenate bond name and type
SELECT id, CONCAT(bond_name, ' - ', bond_type) AS bond_info
FROM bonds;

-- Aggregate Function: Find the total current value of bonds per account
SELECT account_id, SUM(current_value) AS total_bond_value
FROM bonds
GROUP BY account_id;

-- Bitwise: Check if id is even (using bitwise AND)
SELECT id, bond_name
FROM bonds
WHERE id & 1 = 0;

-- Arithmetic: Calculate the total face value of bonds per account
SELECT account_id, SUM(face_value) AS total_face_value
FROM bonds
GROUP BY account_id;

/*--------------------------------- Mutual Funds Table-------------------------------------*/

-- Arithmetic: Calculate the total value of each mutual fund holding
SELECT id, units * current_price AS total_value
FROM mutual_funds;

-- Joins: Join with account_details to get account holder names
SELECT mf.id, mf.fund_name, mf.current_price, ad.account_holder_name
FROM mutual_funds mf
JOIN account_details ad ON mf.account_id = ad.account_id;

-- Subquery: Find mutual funds with current prices greater than the average current price
SELECT * FROM mutual_funds
WHERE current_price > (SELECT AVG(current_price) FROM mutual_funds);

-- String Function: Concatenate fund name and type
SELECT id, CONCAT(fund_name, ' - ', fund_type) AS fund_info
FROM mutual_funds;

-- Aggregate Function: Find the total value of mutual funds per account
SELECT account_id, SUM(units * current_price) AS total_mutual_fund_value
FROM mutual_funds
GROUP BY account_id;

-- Bitwise: Check if id is odd (using bitwise AND)
SELECT id, fund_name
FROM mutual_funds
WHERE id & 1 = 1;

-- Arithmetic: Calculate the profit/loss for each mutual fund
SELECT id, (current_price - purchase_price) * units AS profit_loss
FROM mutual_funds;

/*--------------------------------Credit Scores Table------------------------------------------------*/
-- Arithmetic: Calculate the average credit score per account
SELECT account_id, AVG(score) AS average_score
FROM credit_scores
GROUP BY account_id;

-- Joins: Join with account_details to get account holder names
SELECT cs.id, cs.score, cs.score_date, ad.account_holder_name
FROM credit_scores cs
JOIN account_details ad ON cs.account_id = ad.account_id;

-- Subquery: Find credit scores greater than the average score
SELECT * FROM credit_scores
WHERE score > (SELECT AVG(score) FROM credit_scores);

-- String Function: Extract the year from the score date
SELECT id, score_date, YEAR(score_date) AS score_year
FROM credit_scores;

-- Aggregate Function: Find the highest credit score per account
SELECT account_id, MAX(score) AS highest_score
FROM credit_scores
GROUP BY account_id;

-- Bitwise: Check if id is even (using bitwise AND)
SELECT id, score
FROM credit_scores
WHERE id & 1 = 0;

-- Arithmetic: Calculate the total number of credit scores per account
SELECT account_id, COUNT(*) AS total_scores
FROM credit_scores
GROUP BY account_id;

/*-------------------------------Loan Payments Table------------------------------------------------*/

-- Arithmetic: Calculate the total amount paid for each loan
SELECT loan_id, SUM(payment_amount) AS total_paid
FROM loan_payments
GROUP BY loan_id;

-- Joins: Join with loan_details to get loan type
SELECT lp.id, lp.payment_amount, ld.loan_type
FROM loan_payments lp
JOIN loan_details ld ON lp.loan_id = ld.loan_id;

-- Subquery: Find payments with amounts greater than the average payment amount
SELECT * FROM loan_payments
WHERE payment_amount > (SELECT AVG(payment_amount) FROM loan_payments);

-- String Function: Concatenate payment status and method
SELECT id, CONCAT(payment_status, ' - ', payment_method) AS payment_info
FROM loan_payments;

-- Aggregate Function: Find the total remaining balance per loan
SELECT loan_id, SUM(remaining_balance) AS total_remaining_balance
FROM loan_payments
GROUP BY loan_id;

-- Bitwise: Check if id is odd (using bitwise AND)
SELECT id, payment_amount
FROM loan_payments
WHERE id & 1 = 1;

-- Arithmetic: Calculate the total interest paid per loan
SELECT loan_id, SUM(payment_amount - (remaining_balance - payment_amount)) AS total_interest_paid
FROM loan_payments
GROUP BY loan_id;

/*-------------------------------Deposits Table------------------------------------------------*/

-- Arithmetic: Calculate the total interest earned for each deposit
SELECT id, amount * interest_rate / 100 * (DATEDIFF(maturity_date, deposit_date) / 365 AS total_interest
FROM deposits;

-- Joins: Join with account_details to get account holder names
SELECT d.id, d.deposit_type, d.amount, ad.account_holder_name
FROM deposits d
JOIN account_details ad ON d.account_id = ad.account_id;

-- Subquery: Find deposits with amounts greater than the average deposit amount
SELECT * FROM deposits
WHERE amount > (SELECT AVG(amount) FROM deposits);

-- String Function: Concatenate deposit type and amount
SELECT id, CONCAT(deposit_type, ' - ', amount) AS deposit_info
FROM deposits;

-- Aggregate Function: Find the total deposit amount per account
SELECT account_id, SUM(amount) AS total_deposit_amount
FROM deposits
GROUP BY account_id;

-- Bitwise: Check if id is even (using bitwise AND)
SELECT id, deposit_type
FROM deposits
WHERE id & 1 = 0;

-- Arithmetic: Calculate the total interest earned per account
SELECT account_id, SUM(amount * interest_rate / 100 * (DATEDIFF(maturity_date, deposit_date) / 365) AS total_interest_earned
FROM deposits
GROUP BY account_id;
