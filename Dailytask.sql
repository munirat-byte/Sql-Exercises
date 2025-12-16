/* ===============================
   EXERCISE 1: DATABASE CREATION
   =============================== */

/* Create database */
CREATE DATABASE test_db;

/* Select database */
USE test_db;


/* =================================
   EXERCISE 2: BASIC SQL SYNTAX
   ================================= */

/* Create a sample table */
CREATE TABLE sample_table (
    id INT,
    name VARCHAR(50)
);

/* Display all tables */
SHOW TABLES;

/* Drop the sample table */
DROP TABLE sample_table;


/* =========================================
   EXERCISE 3: INSERTING AND QUERYING DATA
   ========================================= */

/* Create students table */
CREATE TABLE students (
    student_id INT,
    student_name VARCHAR(50),
    age INT
);

/* Insert sample records */
INSERT INTO students (student_id, student_name, age) VALUES
(1, 'John', 20),
(2, 'Maryam', 22),
(3, 'Ahmed', 21);

/* Retrieve all student records */
SELECT * FROM students;

/* ===============================
   DAY 2 – SQL EXERCISES
   =============================== */


/* =====================================
   EXERCISE 1: DATABASE & TABLE CREATION
   ===================================== */

/* Create database */
CREATE DATABASE school_db;

/* Use the database */
USE school_db;


/* Create students table */
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT
);

/* Create courses table */
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

/* Create enrollments table */
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

/* Review tables */
SHOW TABLES;


/* =====================================
   EXERCISE 2: MODIFY TABLE & INSERT DATA
   ===================================== */

/* Add email column to students table */
ALTER TABLE students
ADD email VARCHAR(50);


/* Insert data into students table */
INSERT INTO students (student_id, student_name, age, email) VALUES
(1, 'John', 20, 'john@email.com'),
(2, 'Maryam', 22, 'maryam@email.com'),
(3, 'Ahmed', 21, 'ahmed@email.com');


/* Insert data into courses table */
INSERT INTO courses (course_id, course_name) VALUES
(101, 'Mathematics'),
(102, 'Computer Science'),
(103, 'Physics');


/* Insert data into enrollments table */
INSERT INTO enrollments (enrollment_id, student_id, course_id) VALUES
(1, 1, 101),
(2, 2, 102),
(3, 3, 103);

/* ===============================
   DAY 3 – SQL EXERCISES
   =============================== */


/* =====================================
   EXERCISE 1: ARITHMETIC & COMPARISON
   ===================================== */

/* Create products table */
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

/* Insert sample product data */
INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 3500),
(2, 'Smartphone', 1800),
(3, 'Monitor', 2500),
(4, 'Keyboard', 500);

/* Retrieve products with price > 2000 and apply 8% discount */
SELECT 
    product_name,
    price,
    price * 0.92 AS discount_price
FROM products
WHERE price > 2000;


/* =====================================
   EXERCISE 2: SORT & FILTER USING ORDER BY
   ===================================== */

/* Create employees table */
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    hire_date DATE
);

/* Insert sample employee data */
INSERT INTO employees (employee_id, employee_name, department, hire_date) VALUES
(1, 'Alice', 'Sales', '2023-01-15'),
(2, 'Bob', 'HR', '2022-03-20'),
(3, 'Charlie', 'Sales', '2021-11-05'),
(4, 'David', 'IT', '2022-07-10');

/* Query employee_name, department, hire_date from Sales ordered by hire_date */
SELECT 
    employee_name, 
    department, 
    hire_date
FROM employees
WHERE department = 'Sales'
ORDER BY hire_date;

/* ===============================
   DAY 4 – SQL EXERCISES
   =============================== */


/* =====================================
   EXERCISE 1: FILTERING WITH LOGICAL OPERATORS
   ===================================== */

/* Create employees table */
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    salary DECIMAL(10,2),
    phone_number VARCHAR(15),
    state VARCHAR(50)
);

/* Insert sample data */
INSERT INTO employees (employee_id, name, email, salary, phone_number, state) VALUES
(1, 'John', 'john@email.com', 60000, '08012345678', 'Kaduna'),
(2, 'Maryam', 'maryam@email.com', 45000, '08023456789', 'Lagos'),
(3, 'Ahmed', 'ahmed@email.com', 70000, '08034567890', 'Kaduna'),
(4, 'Fatima', 'fatima@email.com', 50000, '08045678901', 'Abuja');

/* Retrieve employees in Kaduna or Lagos with salary above 50,000 */
SELECT 
name, 
    email, 
    phone_number, 
    state
FROM employees
WHERE (state = 'Kaduna' OR state = 'Lagos')
  AND salary > 50000;


/* =====================================
   EXERCISE 2: JOINING TABLES
   ===================================== */

/* Create customers table */
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

/* Create orders table */
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

/* Insert sample data into customers */
INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

/* Insert sample data into orders */
INSERT INTO orders (order_id, customer_id, order_amount) VALUES
(101, 1, 250),
(102, 2, 400);

/* INNER JOIN: Display all orders with customer names */
SELECT 
    o.order_id,
    c.customer_name,
    o.order_amount
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id;

/* LEFT JOIN: Display all customers with or without orders */
SELECT 
    c.customer_name,
    o.order_id,
    o.order_amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

/* ===============================
   DAY 5 – SQL EXERCISES
   =============================== */


/* =====================================
   EXERCISE 1: GROUP DATA & HAVING
   ===================================== */

/* Create sales table */
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    salesperson VARCHAR(50),
    sale_amount DECIMAL(10,2)
);

/* Insert sample sales data */
INSERT INTO sales (sale_id, salesperson, sale_amount) VALUES
(1, 'Alice', 500),
(2, 'Bob', 1200),
(3, 'Alice', 600),
(4, 'Charlie', 1500),
(5, 'Bob', 800);

/* Calculate total sales per salesperson and filter > 1000 */
SELECT 
    salesperson,
    SUM(sale_amount) AS total_sales
FROM sales
GROUP BY salesperson
HAVING total_sales > 1000;


/* =====================================
   EXERCISE 2: CREATE A VIEW
   ===================================== */

/* Create employees table */
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50)
);

/* Insert sample employee data */
INSERT INTO employees (employee_id, employee_name, department) VALUES
(1, 'John', 'Engineering'),
(2, 'Maryam', 'Sales'),
(3, 'Ahmed', 'Engineering'),
(4, 'Fatima', 'HR');

/* Create a view for employees in Engineering department */
CREATE VIEW engineering_employees AS
SELECT *
FROM employees
WHERE department = 'Engineering';

/* Query the view to verify */
SELECT * FROM engineering_employees;

/* ===============================
   DAY 6 – SQL EXERCISES
   =============================== */


/* =====================================
   EXERCISE 1: DESIGN BASIC LOGICAL DATA MODEL
   ===================================== */

/* Create Customers table */
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(15),
    address VARCHAR(100)
);

/* Create Products table */
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

/* Create Orders table */
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

/* Create Order_Items table */
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


/* =====================================
   EXERCISE 2: OUTLINE ETL PROCESS FOR CUSTOMERS
   ===================================== */

/*
ETL Steps to load customer data from a CSV file:

1. Extract:
   - Read the CSV file containing customer data (customer_id, customer_name, email, phone_number, address)
   - Example file: customers.csv

2. Transform:
   - Validate data types (ensure IDs are integers, emails are valid, phone numbers are correct format)
   - Remove duplicates
   - Handle missing or null values

3. Load:
   - Insert data into the Customers table
   - Example SQL to load transformed data:

   LOAD DATA INFILE 'path_to/customers.csv'
   INTO TABLE customers
   FIELDS TERMINATED BY ','
   ENCLOSED BY '"'
   LINES TERMINATED BY '\n'
   IGNORE 1 ROWS
   (customer_id, customer_name, email, phone_number, address);

*/

/* ===============================
   DAY 7 – SQL EXERCISES
   =============================== */


/* =====================================
   EXERCISE 1: CREATE LOGICAL SCHEMA FOR PROJECT
   ===================================== */

/* Example: Small Inventory System */

/* Create Suppliers table */
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    contact_email VARCHAR(50),
    phone_number VARCHAR(15)
);

/* Create Products table */
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

/* Create Customers table */
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(15),
    address VARCHAR(100)
);

/* Create Orders table */
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

/* Create Order_Items table */
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


/* =====================================
   EXERCISE 2: IMPORT DATA FROM CSV
   ===================================== */

/*
Steps to import Customers data from CSV:

1. Prepare the CSV file, e.g., customers.csv:
   customer_id,customer_name,email,phone_number,address
   1,John,john@email.com,08012345678,123 Street, Lagos
   2,Maryam,maryam@email.com,08023456789,456 Avenue, Abuja

2. Load data into the Customers table using SQL:

   LOAD DATA INFILE 'path_to/customers.csv'
   INTO TABLE customers
   FIELDS TERMINATED BY ','
   ENCLOSED BY '"'
   LINES TERMINATED BY '\n'
   IGNORE 1 ROWS
   (customer_id, customer_name, email, phone_number, address);

3. Verify the data:

   SELECT * FROM customers;
*/
