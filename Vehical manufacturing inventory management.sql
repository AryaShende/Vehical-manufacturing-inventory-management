create database inventory1;
use inventory1;

-- Create tables 

CREATE TABLE Supplier 
(
    Sup_ID numeric(20) not null PRIMARY KEY,
    Material_ID VARCHAR(10) NOT NULL,
    Supp_Name VARCHAR(250) NOT NULL,
    Supp_Contact numeric(10) NOT NULL,
    Supp_Email VARCHAR(100)
);	
select * from Supplier;
alter table Supplier add foreign key(Material_ID) references Material(Material_ID);
drop table Supplier;

CREATE TABLE Material (
    Material_ID VARCHAR(10) PRIMARY KEY,
    Sup_ID numeric(20),
    Material_Name VARCHAR(100) NOT NULL,
    Unit_Cost FLOAT NOT NULL,
    Stock_Qty numeric
);
select * from Material;
alter table Material add foreign key(Sup_ID) references Supplier(Sup_ID);
drop table Material;

CREATE TABLE Customer (
    Cust_ID VARCHAR(10) PRIMARY KEY,
    Order_ID VARCHAR(10),
    Cust_Name VARCHAR(200) NOT NULL,
    Cust_Contact numeric(10) NOT NULL,
    Cust_Email VARCHAR(100) NOT NULL
);
alter table Customer add foreign key(Order_ID) references Orders(Order_ID);
select * from Customer;
drop table Customer;


-- Sales Table
CREATE TABLE Sales (
    Sale_ID VARCHAR(10) PRIMARY KEY,
    Model_ID VARCHAR(10),
    Cust_Name VARCHAR(150) NOT NULL,
    Sale_Date DATE NOT NULL,
    Sale_Price FLOAT NOT NULL
);
alter table Sales add foreign key(Model_ID) references Model(Model_ID);
select * from Sales;
drop table Sales;

-- Inventory Table
CREATE TABLE Inventory (
    Inventory_ID VARCHAR(10) PRIMARY KEY,
    Material_ID VARCHAR(100),
    Quantity numeric NOT NULL,
    In_Date DATE NOT NULL
);
alter table Inventory add foreign key(Material_ID) references Material(Material_ID);
select * from Inventory;

CREATE TABLE orders(
    Order_ID VARCHAR(10) PRIMARY KEY,
    Model_ID VARCHAR(10),
    Order_Date DATE NOT NULL,
    Due_Date DATE NOT NULL,
    Status VARCHAR(10) NOT NULL
);
alter table orders add foreign key(Model_ID) references Model(Model_ID);
select * from orders;


CREATE TABLE Model (
    Model_ID VARCHAR(10) PRIMARY KEY,
    Model_Name VARCHAR(100) NOT NULL,
    Production_Cost FLOAT NOT NULL,
    Assembly_Line numeric(2) NOT NULL
);
select * from Model;

CREATE TABLE Employee (
    Emp_ID VARCHAR(10) PRIMARY KEY,
    Emp_Name CHAR(150) NOT NULL,
    Emp_Pos CHAR(100) NOT NULL,
    Emp_Dept CHAR(100) NOT NULL,
    Emp_Sal FLOAT NOT NULL
);
select * from Employee;

CREATE TABLE Quality (
    QC_ID VARCHAR(10) PRIMARY KEY,
    Order_ID VARCHAR(10),
    Emp_ID VARCHAR(10),
    Inspection_Date DATE NOT NULL,
    Result VARCHAR(100) NOT NULL
);
alter table Quality add foreign key(Order_ID) references Orders(Order_ID);
alter table Quality add foreign key(Emp_ID) references Employee(Emp_ID);
select * from Quality;


-- Insert Quries

insert into Supplier values( 1,  'MAT001',  'ABC Supplies',  1234567890,  'abc@example.com'),
 (2,  'MAT002',  'XYZ Company',  2345678901,  'xyz@example.com'),
 (3,  'MAT003',  '123 Manufacturing',  3456789012,  '123@example.com'),
 (4,  'MAT004',  'Best Parts Co.',  4567890123,  'bestparts@example.com'),
 (5,  'MAT005',  'Global Components Ltd.',  5678901234,  'global@example.com'),
 (6,  'MAT006',  'Quality Suppliers Inc.',  6789012345,  'quality@example.com'),
 (7,  'MAT007',  'Superior Products Co.',  7890123456,  'superior@example.com'),
 (8,  'MAT008',  'Prime Materials Corp.',  8901234567,  'prime@example.com'),
 (9,  'MAT009',  'Dynamic Components LLC',  9012345678,  'dynamic@example.com'),
 (10,  'MAT010',  'Innovative Parts Ltd.',  1234567890,  'innovative@example.com'),
 (11,  'MAT011',  'Reliable Suppliers Co.',  2345678901,  'reliable@example.com'),
 (12,  'MAT012',  'Precision Manufacturing',  3456789012,  'precision@example.com'),
 (13,  'MAT013',  'Tech Components Inc.',  4567890123,  'tech@example.com'),
 (14,  'MAT014',  'Top Quality Parts',  5678901234,  'topquality@example.com'),
 (15,  'MAT015',  'Advanced Materials Corp.',  6789012345,  'advanced@example.com');
 
 insert into Material values( 'MAT001', 1, 'Steel Plates', 50.25,  1000),
 ('MAT002', 2, 'Aluminum Bars', 30.75,  800),
 ('MAT003', 3, 'Copper Wire', 15.50,  1200),
 ('MAT004', 4, 'Plastic Sheets', 10.20,  1500),
 ('MAT005', 5, 'Rubber Gaskets', 5.75,  2000),
 ('MAT006', 6, 'Glass Panes', 45.60,  600),
 ('MAT007', 7, 'Wooden Boards', 20.30,  1000),
 ('MAT008', 8, 'Brass Fittings', 25.80,  900),
 ('MAT009', 9, 'Ceramic Tiles', 18.90,  1100),
 ('MAT010', 10, 'Fiberglass Rolls', 32.40,  700),
 ('MAT011', 11, 'Stainless Steel Pipes', 65.75,  500),
 ('MAT012', 12, 'Bronze Sheets', 40.20,  800),
 ('MAT013', 13, 'Titanium Rods', 85.90,  400),
 ('MAT014', 14, 'Carbon Fiber Sheets', 75.60,  600),
 ('MAT015', 15, 'Platinum Wires', 150.25,  300);

insert into Customer values( 'CUST001',  'ORD001',  'John Doe',  1234567890,  'john.doe@example.com'),
 ('CUST002',  'ORD002',  'Jane Smith',  2345678901,  'jane.smith@example.com'),
 ('CUST003',  'ORD003',  'David Johnson',  3456789012,  'david.johnson@example.com'),
 ('CUST004',  'ORD004',  'Emily Brown',  4567890123,  'emily.brown@example.com'),
 ('CUST005',  'ORD005',  'Michael Wilson',  5678901234,  'michael.wilson@example.com'),
 ('CUST006',  'ORD006',  'Jennifer Martinez',  6789012345,  'jennifer.martinez@example.com'),
 ('CUST007',  'ORD007',  'Christopher Anderson',  7890123456,  'christopher.anderson@example.com'),
 ('CUST008',  'ORD008',  'Amanda Taylor',  8901234567,  'amanda.taylor@example.com'),
 ('CUST009',  'ORD009',  'Daniel Thomas',  9012345678,  'daniel.thomas@example.com'),
 ('CUST010',  'ORD010',  'Jessica Garcia',  1234567890,  'jessica.garcia@example.com'),
 ('CUST011',  'ORD011',  'Matthew Rodriguez',  2345678901,  'matthew.rodriguez@example.com'),
 ('CUST012',  'ORD012',  'Ashley Hernandez',  3456789012,  'ashley.hernandez@example.com'),
 ('CUST013',  'ORD013',  'Joshua Lopez',  4567890123,  'joshua.lopez@example.com'),
 ('CUST014',  'ORD014',  'Sarah Martinez',  5678901234,  'sarah.martinez@example.com'),
 ('CUST015',  'ORD015',  'Ryan Young',  6789012345,  'ryan.young@example.com');

insert into Sales values('SALE001',  'MOD001',  'John Doe',  '2024-03-01',  500.00),
 ('SALE002',  'MOD002',  'Jane Smith',  '2024-03-02',  750.00),
 ('SALE003',  'MOD003',  'David Johnson',  '2024-03-03',  1200.00),
 ('SALE004',  'MOD004',  'Emily Brown',  '2024-03-04',  850.00),
 ('SALE005',  'MOD005',  'Michael Wilson',  '2024-03-05',  1500.00),
 ('SALE006',  'MOD006',  'Jennifer Martinez',  '2024-03-06',  1100.00),
 ('SALE007',  'MOD007',  'Christopher Anderson',  '2024-03-07',  950.00),
 ('SALE008',  'MOD008',  'Amanda Taylor',  '2024-03-08',  800.00),
 ('SALE009',  'MOD009',  'Daniel Thomas',  '2024-03-09',  700.00),
 ('SALE010',  'MOD010',  'Jessica Garcia',  '2024-03-10',  950.00),
 ('SALE011',  'MOD011',  'Matthew Rodriguez',  '2024-03-11',  1250.00),
 ('SALE012',  'MOD012',  'Ashley Hernandez',  '2024-03-12',  1050.00),
 ('SALE013',  'MOD013',  'Joshua Lopez',  '2024-03-13',  950.00),
 ('SALE014',  'MOD014',  'Sarah Martinez',  '2024-03-14',  1300.00),
 ('SALE015',  'MOD015',  'Ryan Young',  '2024-03-15',  900.00);

insert into Inventory values( 'INV001',  'MAT001',  100,  '2024-03-01'),
 ('INV002',  'MAT002',  150,  '2024-03-02'),
 ('INV003',  'MAT003',  200,  '2024-03-03'),
 ('INV004',  'MAT004',  250,  '2024-03-04'),
 ('INV005',  'MAT005',  300,  '2024-03-05'),
 ('INV006',  'MAT006',  350,  '2024-03-06'),
 ('INV007',  'MAT007',  400,  '2024-03-07'),
 ('INV008',  'MAT008',  450,  '2024-03-08'),
 ('INV009',  'MAT009',  500,  '2024-03-09'),
 ('INV010',  'MAT010',  550,  '2024-03-10'),
 ('INV011',  'MAT011',  600,  '2024-03-11'),
 ('INV012',  'MAT012',  650,  '2024-03-12'),
 ('INV013',  'MAT013',  700,  '2024-03-13'),
 ('INV014',  'MAT014',  750,  '2024-03-14'),
 ('INV015',  'MAT015',  800,  '2024-03-15');
 
 insert into orders values('ORD001',  'MOD001',  '2024-03-01',  '2024-03-10',  'Pending'),
 ('ORD002',  'MOD002',  '2024-03-02',  '2024-03-11',  'Pending'),
 ('ORD003',  'MOD003',  '2024-03-03',  '2024-03-12',  'Pending'),
 ('ORD004',  'MOD004',  '2024-03-04',  '2024-03-13',  'Pending'),
 ('ORD005',  'MOD005',  '2024-03-05',  '2024-03-14',  'Pending'),
 ('ORD006',  'MOD006',  '2024-03-06',  '2024-03-15',  'Pending'),
 ('ORD007',  'MOD007',  '2024-03-07',  '2024-03-16',  'Pending'),
 ('ORD008',  'MOD008',  '2024-03-08',  '2024-03-17',  'Pending'),
 ('ORD009',  'MOD009',  '2024-03-09',  '2024-03-18',  'Pending'),
 ('ORD010',  'MOD010',  '2024-03-10',  '2024-03-19',  'Pending'),
 ('ORD011',  'MOD011',  '2024-03-11',  '2024-03-20',  'Pending'),
 ('ORD012',  'MOD012',  '2024-03-12',  '2024-03-21',  'Pending'),
 ('ORD013',  'MOD013',  '2024-03-13',  '2024-03-22',  'Pending'),
 ('ORD014',  'MOD014',  '2024-03-14',  '2024-03-23',  'Pending'),
 ('ORD015',  'MOD015',  '2024-03-15',  '2024-03-24',  'Pending');
 
 insert into Model values('MOD001',  'Tesla Model S',  80000.00,  1),
 ('MOD002',  'Tesla Model 3',  60000.00,  2),
 ('MOD003',  'Tesla Model X',  90000.00,  3),
 ('MOD004',  'Tesla Model Y',  70000.00,  1),
 ('MOD005',  'Tesla Roadster',  200000.00,  2),
 ('MOD006',  'Tesla Cybertruck',  50000.00,  3),
 ('MOD007',  'Tesla Semi',  150000.00,  1),
 ('MOD008',  'Tesla Model S Plaid',  120000.00,  2),
 ('MOD009',  'Tesla Model 3 Standard Range Plus',  40000.00,  3),
 ('MOD010',  'Tesla Model X Long Range Plus',  100000.00,  1),
 ('MOD011',  'Tesla Model Y Long Range',  80000.00,  2),
 ('MOD012',  'Tesla Model S Plaid+',  140000.00,  3),
 ('MOD013',  'Tesla Model 3 Performance',  55000.00,  1),
 ('MOD014',  'Tesla Model Y Performance',  75000.00,  2),
 ('MOD015',  'Tesla Model X Performance',  100000.00,  3);

insert into Employee values( 'EMP001',  'John Smith',  'Senior Engineer',  'Engineering',  75000.00),
 ('EMP002',  'Emily Johnson',  'Marketing Manager',  'Marketing',  80000.00),
 ('EMP003',  'Michael Williams',  'Financial Analyst',  'Finance',  70000.00),
 ('EMP004',  'Jennifer Brown',  'HR Manager',  'Human Resources',  85000.00),
 ('EMP005',  'Christopher Jones',  'Software Developer',  'Engineering',  70000.00),
 ('EMP006',  'Amanda Davis',  'Sales Representative',  'Sales',  60000.00),
 ('EMP007',  'Daniel Rodriguez',  'Operations Manager',  'Operations',  90000.00),
 ('EMP008',  'Sarah Martinez',  'Graphic Designer',  'Marketing',  65000.00),
 ('EMP009',  'James Taylor',  'Accountant',  'Finance',  72000.00),
 ('EMP010',  'Elizabeth Wilson',  'Customer Service Representative',  'Customer Service',  55000.00),
 ('EMP011',  'Andrew Anderson',  'Quality Assurance Specialist',  'Engineering',  68000.00),
 ('EMP012',  'Jessica Thomas',  'Event Coordinator',  'Marketing',  62000.00),
 ('EMP013',  'Matthew Jackson',  'Procurement Officer',  'Operations',  75000.00),
 ('EMP014',  'Lauren White',  'Public Relations Specialist',  'Marketing',  67000.00),
 ('EMP015',  'David Harris',  'Logistics Coordinator',  'Operations',  69000.00);
 
 insert into Quality values( 'QC001',  'ORD001',  'EMP011',  '2024-03-01',  'Pass'),
 ('QC002',  'ORD002',  'EMP011',  '2024-03-02',  'Pass'),
 ('QC003',  'ORD003',  'EMP011',  '2024-03-03',  'Fail'),
 ('QC004',  'ORD004',  'EMP011',  '2024-03-04',  'Pass'),
 ('QC005',  'ORD005',  'EMP011',  '2024-03-05',  'Pass'),
 ('QC006',  'ORD006',  'EMP011',  '2024-03-06',  'Fail'),
 ('QC007',  'ORD007',  'EMP011',  '2024-03-07',  'Pass'),
 ('QC008',  'ORD008',  'EMP011',  '2024-03-08',  'Pass'),
 ('QC009',  'ORD009',  'EMP011',  '2024-03-09',  'Fail'),	
 ('QC010',  'ORD010',  'EMP011',  '2024-03-10',  'Pass'),
 ('QC011',  'ORD011',  'EMP011',  '2024-03-11',  'Pass'),
 ('QC012',  'ORD012',  'EMP011',  '2024-03-12',  'Pass'),
 ('QC014',  'ORD014',  'EMP011',  '2024-03-14',  'Fail'),
 ('QC015',  'ORD015',  'EMP011',  '2024-03-15',  'Pass');
 
 
 
 -- Queries:
 Set sql_safe_updates = 0;
 
 -- 1. DDL Queries:
 
-- Create a new table named Supplier_Info with columns for supplier information.
CREATE TABLE Supplier_Info (
    Sup_Info_ID SERIAL PRIMARY KEY,
    Sup_ID numeric(20),
    Supp_Name VARCHAR(250) NOT NULL,
    Supp_Contact numeric(10) NOT NULL,
    Supp_Email VARCHAR(100)
);
alter table Supplier_Info add foreign key(Sup_ID) references Supplier(Sup_ID);

-- Add a new column Discount to the Customer table to store discount information.
ALTER TABLE Customer ADD COLUMN Discount FLOAT;

-- Drop the Inventory table.
Drop Table Inventory;

-- 2. DML Queries:

-- Insert a new supplier into the Supplier table.
insert into Supplier values(16,  'MAT016',  'DS Suppliers ',  5659612345,  'Ds_supplier@example.com');

-- Update the Order table to change the status of orders with a due date older than today to 'Overdue'
UPDATE orders SET Status = 'Overdue' WHERE Due_Date < CURRENT_DATE;
select * from orders;

-- Delete all records from the Quality table where the inspection result is 'Fail'.
Delete from Quality where Result = 'Fail';
select * from Quality;

-- 3. Aggregate Functions:

-- Count the number of suppliers in the Supplier table.
SELECT COUNT(*) AS Supplier_Count FROM Supplier;

-- Calculate the total sales revenue from the Sales table.
SELECT SUM(Sale_Price) AS Total_Sales_Revenue FROM Sales;

-- Find the average salary of employees in the Employee table.
SELECT AVG(Emp_Sal) AS Average_Salary FROM Employee;

-- 4. GROUP BY and HAVING:

-- Count the number of sales made by each customer and display only those with more than 5 sales.
SELECT Cust_Name, COUNT(*) AS Sales_Count FROM Sales GROUP BY Cust_Name HAVING COUNT(*) > 5;

-- Calculate the total quantity of each material in the inventory.
SELECT Material_ID, SUM(Quantity) AS Total_Quantity FROM Inventory GROUP BY Material_ID;

-- Find the average sale price for each model and display only those with an average sale price greater than 1000.
SELECT Model_ID, AVG(Sale_Price) AS Avg_Sale_Price FROM Sales GROUP BY Model_ID HAVING AVG(Sale_Price) > 1000;

-- 5. ORDER BY:

-- List the customers in alphabetical order of their names.
SELECT * FROM Customer ORDER BY Cust_Name;

-- List the sales in descending order of sale prices.
SELECT * FROM Sales ORDER BY Sale_Price DESC;
 
-- List the employees in ascending order of their salaries.
SELECT * FROM Employee ORDER BY Emp_Sal;

-- 6. JOINs:

-- Retrieve the order details along with the corresponding customer names.
SELECT o.* ,c.Cust_Name FROM orders o INNER JOIN Customer c ON o.Order_ID = c.Order_ID;

-- List all sales along with the customer names and their contact information.
SELECT s.*, c.Cust_Name, c.Cust_Contact, c.Cust_Email FROM Sales s INNER JOIN Customer c ON s.Cust_Name = c.Cust_Name;

-- Get the material details for each inventory item.
SELECT i.*, m.Material_Name FROM Inventory i INNER JOIN Material m ON i.Material_ID = m.Material_ID;

-- 7. Complex Queries:

-- List the top 5 customers with the highest total purchase amounts.
SELECT Cust_Name, SUM(Sale_Price) AS Total_Purchase_Amount FROM Sales GROUP BY Cust_Name ORDER BY Total_Purchase_Amount DESC LIMIT 5;

-- Retrieve the orders along with the corresponding model names, sorted by order date.
SELECT o.*, m.Model_Name FROM orders o INNER JOIN Model m ON o.Model_ID = m.Model_ID ORDER BY Order_Date;

-- Find the employee with the highest salary and display their name and position.
SELECT Emp_Name, Emp_Pos FROM Employee WHERE Emp_Sal = (SELECT MAX(Emp_Sal) FROM Employee);

-- 8. Normalization

-- Make a multi-value primary key for the Employee table using Emp_ID and Emp_Dept.
ALTER TABLE Employee ADD CONSTRAINT pk_employee PRIMARY KEY (Emp_ID, Emp_Dept);

-- List all employees along with their departments and salaries.
SELECT Emp_Name, Emp_Dept, Emp_Sal FROM Employee;

-- Retrieve the order details along with the corresponding model names and due dates, sorted by due date.
SELECT o.*, m.Model_Name, o.Due_Date FROM orders o INNER JOIN Model m ON o.Model_ID = m.Model_ID ORDER BY o.Due_Date;

-- Find the number of materials in stock for each supplier.
SELECT s.Supp_Name, COUNT(i.Material_ID) AS Materials_In_Stock FROM Supplier s LEFT JOIN Material m ON s.Sup_ID = m.Sup_ID LEFT JOIN Inventory i ON m.Material_ID = i.Material_ID GROUP BY s.Supp_Name;

-- Calculate the total production cost for each model.
SELECT m.Model_Name, SUM(m.Production_Cost) AS Total_Production_Cost FROM Model m GROUP BY m.Model_Name;