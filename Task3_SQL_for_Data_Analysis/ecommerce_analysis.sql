
-- Drop tables if they exist
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    CreatedAt DATE
);

-- Insert Customers
INSERT INTO Customers VALUES
(1, 'John', 'Doe', 'john@example.com', 'New York', 'USA', '2022-01-01'),
(2, 'Jane', 'Smith', 'jane@example.com', 'London', 'UK', '2022-01-10'),
(3, 'Ravi', 'Kumar', 'ravi@example.com', 'Delhi', 'India', '2022-01-20'),
(4, 'Sara', 'Ali', 'sara@example.com', 'Toronto', 'Canada', '2022-02-01');

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    InStock INT
);

-- Insert Products
INSERT INTO Products VALUES
(101, 'Wireless Mouse', 'Electronics', 25.99, 100),
(102, 'Keyboard', 'Electronics', 45.50, 50),
(103, 'Notebook', 'Stationery', 5.75, 200),
(104, 'Pen Pack', 'Stationery', 2.50, 500);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert Orders
INSERT INTO Orders VALUES
(201, 1, '2022-03-01', 71.49),
(202, 2, '2022-03-05', 11.50),
(203, 3, '2022-03-07', 25.99);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert OrderDetails
INSERT INTO OrderDetails VALUES
(301, 201, 101, 2, 51.98),
(302, 201, 103, 2, 11.50),
(303, 202, 104, 5, 11.50),
(304, 203, 101, 1, 25.99);

-- SQL ANALYSIS QUERIES

-- SELECT, WHERE, ORDER BY
SELECT * FROM Customers WHERE Country = 'India';
SELECT ProductName, Price FROM Products WHERE Price > 20 ORDER BY Price DESC;

-- GROUP BY, HAVING
SELECT Country, COUNT(*) AS Num_Customers FROM Customers GROUP BY Country;
SELECT Category, AVG(Price) AS Avg_Price FROM Products GROUP BY Category HAVING AVG(Price) > 10;

-- JOIN types
SELECT O.OrderID, C.FirstName, C.LastName, O.OrderDate, O.TotalAmount FROM Orders O INNER JOIN Customers C ON O.CustomerID = C.CustomerID;
SELECT C.CustomerID, C.FirstName, O.OrderID, O.TotalAmount FROM Customers C LEFT JOIN Orders O ON C.CustomerID = O.CustomerID;
-- RIGHT JOIN (only for MySQL/PostgreSQL)
SELECT O.OrderID, O.TotalAmount, C.FirstName, C.Country FROM Orders O RIGHT JOIN Customers C ON O.CustomerID = C.CustomerID;

-- Subqueries
SELECT * FROM Customers WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Orders);
SELECT * FROM Products WHERE Price = (SELECT MAX(Price) FROM Products);

-- Aggregate functions
SELECT SUM(TotalAmount) AS Total_Sales FROM Orders;
SELECT AVG(TotalAmount) AS Average_Order_Value FROM Orders;
SELECT P.ProductName, SUM(OD.Quantity) AS Total_Quantity_Sold FROM OrderDetails OD JOIN Products P ON OD.ProductID = P.ProductID GROUP BY P.ProductName;

-- Views
CREATE VIEW OrderSummary AS
SELECT O.OrderID, C.FirstName || ' ' || C.LastName AS CustomerName, O.OrderDate, O.TotalAmount
FROM Orders O JOIN Customers C ON O.CustomerID = C.CustomerID;
SELECT * FROM OrderSummary;

-- Indexing
CREATE INDEX idx_customer_id ON Customers(CustomerID);
CREATE INDEX idx_order_customer_id ON Orders(CustomerID);
CREATE INDEX idx_product_id ON Products(ProductID);
