/*
Project Name: Data Digger
Purpose: E-Commerce Store Database
*/

-- CREATE DATABASE
CREATE DATABASE data_digger;

-- SELECT THE DATBASE
USE data_digger;

-- CREATE CUSTOMERS TABLE
CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY, -- Unique Customer ID
    Name VARCHAR(100),           -- Customer Name
    Email VARCHAR(100),          -- Customer Email
    Address VARCHAR(200)         -- Customer Address
);

-- Display the structure of Customers table
DESC Customers;

-- Query 1:Insert 5 sample customers into the Customers table
INSERT INTO Customers
(Customer_id, Name, Email, Address)
VALUES
(1, 'Alice', 'alice@gmail.com', 'Surat'),
(2, 'Riya', 'riya@gmail.com', 'Vadodara'),
(3, 'Rahul', 'rahul@gmail.com', 'Ahmedabad'),
(4, 'Neha', 'neha@gmail.com', 'Rajkot'),
(5, 'Amit', 'amit@gmail.com', 'Navsari');

-- Query 2:Retrieve all customer details
SELECT * FROM Customers;

-- Query 3:Update Customer Address
UPDATE Customers SET Address = 'Mumbai' WHERE Customer_id = 2;

-- Query 4:Delete a specific customer
DELETE FROM Customers WHERE Customer_id = 5;

-- Query 5: Find the customer named Alice
SELECT * FROM Customers WHERE Name = 'Alice';






-- CREATE ORDERS TABLE
CREATE TABLE Orders(
    Order_id INT PRIMARY KEY,
    Customer_id INT,
    Order_date DATE,
    Total_amount DECIMAL(10,2),
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

-- Display the structure of Orders table
DESC Orders;

-- Query 1:Insert 5 sample orders into the Orders table
INSERT INTO Orders
(Order_id, Customer_id, Order_date, Total_amount)
VALUES
(101, 1, '2026-10-01', 2500.00),
(102, 2, '2026-10-05', 4500.00),
(103, 3, '2026-10-10', 1200.00),
(104, 4, '2026-10-15', 3200.00),
(105, 1, '2026-10-20', 5500.00);

-- Display All Orders
SELECT * FROM Orders;

-- Query 2: Retrieve all orders made by a specific customer
SELECT * FROM Orders WHERE customer_id = 1;

-- Query 3: Update an order's total amount
UPDATE Orders SET Total_amount = 6000.00 WHERE Order_id = 101;

-- Query 4: Delete an order using OrderID
DELETE FROM Orders WHERE Order_id = 105;

-- Query 5: Retrieve orders placed in the last 30 days
SELECT * FROM Orders WHERE Order_date >= CURRENT_DATE - INTERVAL 30 DAY;

-- Query 6(1): Find the highest order amount
SELECT MAX(Total_amount) AS Highest_Amount FROM Orders;

-- Query 6(2): Find the lowest order amount
SELECT MIN(Total_amount) AS Lowest_Amount FROM Orders;

-- Query 6(3): Find the average  order amount
SELECT AVG(Total_amount) AS Average_Amount FROM Orders;




-- CREATE PRODUCTS TABLE
CREATE TABLE Products (
    Product_id INT PRIMARY KEY,
    Product_name VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);

-- Display the structure of Products table
DESC Products;

-- Query 1:Insert 5 sample products into the Products table
INSERT INTO Products
(Product_id, Product_name, Price, Stock)
VALUES
(1, 'Laptop', 45000.00, 10),
(2, 'Mouse', 500.00, 25),
(3, 'Keyboard', 1200.00, 15),
(4, 'Headphones', 1800.00, 0),
(5, 'Mobile', 15000.00, 8);

-- Display All Product
SELECT * FROM Products;

-- Query 2(1): Retrieve products sorted by price in descending order
SELECT * FROM Products ORDER BY Price DESC;

-- Query 2(2): Retrieve products sorted by price in ascending order
SELECT * FROM Products ORDER BY Price ASC;

-- Query 3: Update the price of a specific product
UPDATE Products SET Price = 48000.00 WHERE Product_id = 1;

-- Query 4: Delete products that are out of stock
DELETE FROM Products WHERE Stock = 0;

-- Query 5: Retrieve products priced between 500 and 2000
SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000;

-- Query 6(1): Find the highest product price
SELECT MAX(Price) AS Highest_Price FROM Products;

-- Query 6(2): Find the lowest product price
SELECT MIN(Price) AS Lowest_Price FROM Products;





-- CREATE ORDER_DETAILS TABLE
CREATE TABLE Order_Details (
    Order_detail_id INT PRIMARY KEY,
    Order_id INT,
    Product_id INT,
    Quantity INT,
    Sub_Total DECIMAL(10,2),
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
    FOREIGN KEY (Product_id) REFERENCES Products(Product_id)
);

-- Display the structure of order_details table
DESC Order_Details;

-- Query 1: Insert 5 sample records into Order_Details
INSERT INTO Order_Details
(Order_detail_id, Order_id, Product_id, Quantity, Sub_Total)
VALUES
(1, 101, 1, 1, 45000.00),
(2, 101, 2, 2, 1000.00),
(3, 102, 3, 1, 1200.00),
(4, 103, 1, 2, 3600.00),
(5, 104, 5, 1, 15000.00);

-- Query 2: Retrieve all details for a specific order
SELECT * FROM Order_Details WHERE Order_id = 101;

-- Query 3: Calculate total revenue from all orders
SELECT SUM(Sub_Total) AS Total_Revenue FROM Order_Details;

-- Query 4: Retrieve the top 3 most ordered products
SELECT Product_id, SUM(Quantity) AS Total_Quantity
FROM Order_Details
GROUP BY Product_id
ORDER BY Total_Quantity DESC
LIMIT 3;

-- Query 5: Count how many times a product has been sold
SELECT Product_id, COUNT(*) AS Times_Sold
FROM Order_Details
WHERE Product_id = 1
GROUP BY Product_id;
