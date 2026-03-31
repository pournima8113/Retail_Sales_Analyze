-- inserting data
INSERT INTO Employees (EmployeeName, Gender, HireDate, Salary, City) VALUES 
('Amit Sharma', 'Male', '2024-01-10', 25000, 'Mumbai'),
('Priya Patil', 'Female', '2024-02-15', 26000, 'Pune'),
('Sagar Deshmukh', 'Male', '2024-03-01', 24500, 'Mumbai'),
('Anjali Vichare', 'Female', '2024-01-20', 27000, 'Nagpur'),
('Vikram Mohite', 'Male', '2024-05-10', 22000, 'Satara');

INSERT INTO Customers (CustomerName, City, LoyaltyPoints) VALUES 
('Rahul Patil', 'Mumbai', 120), ('Sneha Kulkarni', 'Pune', 450), 
('Shivani Bhangale', 'Jalgaon', 600), ('Anuja Koshti', 'Raver', 940), 
('Chandana Chaudhari', 'Nashik', 230), ('Amol Shinde', 'Mumbai', 150),
('Vijay Kale', 'Pune', 300), ('Deepa Dhar', 'Nagpur', 50);

INSERT INTO Products (ProductName, Category, CostPrice, SellingPrice, StockQuantity) VALUES 
('Smart Watch', 'Electronics', 2000, 3500, 50),
('Cotton Shirt', 'Fashion', 400, 1200, 100), 
('Jeans', 'Fashion', 600, 1500, 80),
('LED Lamp', 'Electronics', 250, 600, 40),
('Face Wash', 'Beauty', 90, 180, 150),
('Laptop Bag', 'Accessories', 500, 1100, 60),
('Bluetooth Speaker', 'Electronics', 1200, 2200, 30);

-- order and orderItem
INSERT INTO Orders (CustomerID, EmployeeID, TotalAmount) VALUES 
(1, 1, 4700), (2, 2, 1200), (3, 1, 3500), (4, 3, 1800), (5, 4, 600), (6, 2, 2200);

INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES 
(1, 1, 1, 3500), (1, 2, 1, 1200), -- Order 1 has 2 items
(2, 2, 1, 1200),
(3, 1, 1, 3500),
(4, 3, 1, 1500), (4, 5, 1, 180), (4, 4, 1, 120), -- Order 4 has 3 items
(5, 4, 1, 600),
(6, 7, 1, 2200);

INSERT INTO Payments (OrderID, PaymentMethod, PaymentStatus) VALUES 
(1, 'Online', 'Success'), (2, 'Cash', 'Success'), (3, 'Card', 'Success'), 
(4, 'UPI', 'Success'), (5, 'Cash', 'Success'), (6, 'Online', 'Success');

INSERT INTO Offers (OfferName, DiscountPercentage, ProductID, StartDate, EndDate) VALUES 
('Summer Sale', 10, 1, '2026-03-01', '2026-04-30'),
('Fashion Bonanza', 20, 2, '2026-03-01', '2026-03-31'),
('Electronics Blast', 15, 7, '2026-04-01', '2026-04-30');