# Bank Management System - Phase 1

## Overview
This project is a **Bank Management System** designed to manage various banking operations such as customer accounts, transactions, loans, investments, and more. The system is built using a relational database (SQL) and includes multiple tables to store and manage data related to banks, branches, customers, staff, accounts, transactions, loans, and other financial activities.

## Key Features
1. **Bank and Branch Management**: 
   - Stores details of banks and their branches, including contact information, addresses, and managers.
   
2. **Customer Management**:
   - Manages customer information such as personal details, account types, and credentials.
   
3. **Account Management**:
   - Tracks different types of accounts (e.g., savings, checking, business) with details like balance, interest rates, and status.
   
4. **Transaction Management**:
   - Records all financial transactions (deposits, withdrawals, transfers) with details like transaction type, amount, and status.
   
5. **Loan Management**:
   - Manages loan details, including loan types, amounts, interest rates, and repayment schedules.
   
6. **Investment Management**:
   - Tracks investments in stocks, bonds, and mutual funds, including purchase details and current values.
   
7. **Payment and Credit Management**:
   - Manages payment methods, credit cards, and loan payments.
   
8. **Customer Reviews**:
   - Allows customers to leave reviews and ratings for banks and branches.
   
9. **Credit Score Tracking**:
   - Tracks customer credit scores over time.
   
10. **Policy Management**:
    - Stores bank policies related to loans, accounts, fees, and more.

## Database Schema
The database consists of **25 tables** that cover all aspects of banking operations. Below is a brief overview of the main tables:

1. **Bank Details**: Stores information about banks.
2. **Branches**: Stores details of bank branches.
3. **Customers**: Manages customer information.
4. **Customer Credentials**: Stores customer login credentials.
5. **Account Details**: Tracks customer accounts.
6. **Bank Transactions**: Records all financial transactions.
7. **Loan Details**: Manages loan information.
8. **Credit Cards**: Tracks customer credit cards.
9. **Payment History**: Records payment transactions.
10. **Investments**: Tracks customer investments in stocks, bonds, and mutual funds.
11. **Credit Scores**: Stores customer credit scores.
12. **Loan Payments**: Tracks loan repayments.
13. **Deposits**: Manages customer deposits (savings, fixed deposits, etc.).
14. **Policies**: Stores bank policies.
15. **Customer Reviews**: Stores customer feedback and ratings.

## Sample Data
The project includes sample data for each table, providing a realistic dataset for testing and demonstration purposes. For example:
- **Bank Details**: Includes data for banks like Bank of America, Chase Bank, Wells Fargo, etc.
- **Customers**: Includes sample customer records with names, addresses, and contact details.
- **Transactions**: Includes sample transactions like deposits, withdrawals, and transfers.
- **Loans**: Includes sample loan records for personal loans, home loans, auto loans, etc.

## How to Use
1. **Database Setup**:
   - Run the provided SQL script (`phase1.sql`) to create the database and all tables.
   - The script also inserts sample data into each table for testing.

2. **Querying Data**:
   - Use SQL queries to retrieve, update, or delete data from the tables.
   - Example: `SELECT * FROM customers;` will display all customer records.

3. **Modifying Data**:
   - You can insert, update, or delete records as needed using standard SQL commands.

## Future Enhancements
- **Phase 2**: 
  - Implement a user interface (UI) for easier interaction with the database.
  - Add more advanced features like reporting, analytics, and integration with external systems.
  
- **Phase 3**:
  - Implement security features like encryption and user authentication.
  - Add support for multi-currency transactions and international banking.

## Conclusion
This **Bank Management System** is a comprehensive solution for managing banking operations. It provides a solid foundation for further development and customization, making it suitable for both small and large banking institutions.

---

For more details, refer to the SQL script (`phase1.sql`) provided in the project.
