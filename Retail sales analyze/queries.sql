-- salesman handled analyze
SELECT 
    e.EmployeeName, 
    COUNT(DISTINCT o.OrderID) AS Orders_Handled, 
    SUM(oi.Quantity) AS Total_Items_Sold,
    SUM(o.TotalAmount) AS Total_Sales_Revenue,
    SUM((p.SellingPrice - p.CostPrice) * oi.Quantity) AS Estimated_Profit
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY e.EmployeeID
ORDER BY Total_Sales_Revenue DESC;

-- stock and profit
SELECT 
    ProductName, 
    Category, 
    StockQuantity, 
    CostPrice, 
    SellingPrice, 
    (SellingPrice - CostPrice) AS Profit_Per_Unit,
    ROUND(((SellingPrice - CostPrice) / CostPrice) * 100, 2) AS Profit_Percentage
FROM Products
ORDER BY Profit_Percentage DESC;

-- payment mode analyze
SELECT 
    p.PaymentMethod, 
    COUNT(p.PaymentID) AS Total_Transactions, 
    SUM(o.TotalAmount) AS Total_Collection
FROM Payments p
JOIN Orders o ON p.OrderID = o.OrderID
GROUP BY p.PaymentMethod;

-- impact analyze
SELECT 
    p.ProductName, 
    p.SellingPrice AS OriginalPrice, 
    f.OfferName, 
    f.DiscountPercentage,
    (p.SellingPrice - (p.SellingPrice * f.DiscountPercentage / 100)) AS Final_Price
FROM Products p
INNER JOIN Offers f ON p.ProductID = f.ProductID;

-- all data analyze
SELECT 
    o.OrderID,
    o.OrderDate,
    c.CustomerName,
    c.City AS Customer_City,
    e.EmployeeName AS Sales_Person,
    p.ProductName,
    p.Category,
    oi.Quantity,
    oi.UnitPrice AS Selling_Price,
    (oi.Quantity * oi.UnitPrice) AS Total_Line_Item_Value,
    (p.CostPrice * oi.Quantity) AS Total_Cost_Value,
    ((oi.UnitPrice - p.CostPrice) * oi.Quantity) AS Net_Profit,
    pay.PaymentMethod,
    pay.PaymentStatus,
    COALESCE(off.OfferName, 'No Offer') AS Applied_Offer,
    COALESCE(off.DiscountPercentage, 0) AS Discount_Applied
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
JOIN Payments pay ON o.OrderID = pay.OrderID
LEFT JOIN Offers off ON p.ProductID = off.ProductID;

-- union data
SELECT 'Staff Performance' AS Report_Type, e.EmployeeName AS Name, SUM(o.TotalAmount) AS Value
FROM Employees e JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeName
UNION ALL
SELECT 'Product Sales' AS Report_Type, p.ProductName AS Name, SUM(oi.Quantity * oi.UnitPrice) AS Value
FROM Products p JOIN OrderItems oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductName
UNION ALL
SELECT 'Payment Method' AS Report_Type, p.PaymentMethod AS Name, SUM(o.TotalAmount) AS Value
FROM Payments p JOIN Orders o ON p.OrderID = o.OrderID
GROUP BY p.PaymentMethod;