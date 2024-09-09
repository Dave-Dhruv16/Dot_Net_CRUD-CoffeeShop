CREATE TABLE New_User (
    UserID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    UserName varchar(50) NOT NULL,
    Email varchar(50) NOT NULL,
    Password varchar(50) NOT NULL,
    MobileNo varchar(50) NOT NULL,
    Address varchar(50) NOT NULL,
    IsActive bit NOT NULL
);

INSERT INTO New_User (UserName, Email, Password, MobileNo, Address, IsActive)
VALUES
('John Doe', 'john.doe@example.com', 'password123', '1234567890', '123 Main St', 1),
('Jane Smith', 'jane.smith@example.com', 'password456', '0987654321', '456 Elm St', 1),
('Alice Johnson', 'alice.johnson@example.com', 'password789', '1122334455', '789 Pine St', 0),
('Bob Brown', 'bob.brown@example.com', 'password321', '2233445566', '321 Oak St', 1),
('Charlie Davis', 'charlie.davis@example.com', 'password654', '3344556677', '654 Cedar St', 0),
('David Evans', 'david.evans@example.com', 'password111', '4455667788', '111 Maple St', 1),
('Eva Green', 'eva.green@example.com', 'password222', '5566778899', '222 Birch St', 0),
('Frank Harris', 'frank.harris@example.com', 'password333', '6677889900', '333 Willow St', 1),
('Grace Lee', 'grace.lee@example.com', 'password444', '7788990011', '444 Spruce St', 1),
('Henry King', 'henry.king@example.com', 'password555', '8899001122', '555 Cherry St', 0);
-------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Product (
    ProductID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    ProductName varchar(50) NOT NULL,
    ProductPrice decimal(10,2) NOT NULL,
    ProductCode varchar(50) NOT NULL,
    Description varchar(50) NOT NULL,
    UserID int FOREIGN KEY REFERENCES New_User(UserID)
);

INSERT INTO Product (ProductName, ProductPrice, ProductCode, Description, UserID)
VALUES
('Product A', 10.00, 'PRA100', 'Description of Product A', 1),
('Product B', 20.00, 'PRB200', 'Description of Product B', 2),
('Product C', 30.00, 'PRC300', 'Description of Product C', 1),
('Product D', 40.00, 'PRD400', 'Description of Product D', 3),
('Product E', 50.00, 'PRE500', 'Description of Product E', 2),
('Product F', 60.00, 'PRF600', 'Description of Product F', 3),
('Product G', 70.00, 'PRG700', 'Description of Product G', 1),
('Product H', 80.00, 'PRH800', 'Description of Product H', 2),
('Product I', 90.00, 'PRI900', 'Description of Product I', 3),
('Product J', 100.00, 'PRJ1000', 'Description of Product J', 1);
------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Customer (
    CustomerID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    CustomerName varchar(50) NOT NULL,
    HomeAddress varchar(50) NOT NULL,
    Email varchar(50) NOT NULL,
    MobileNo varchar(50) NOT NULL,
    GST_NO varchar(50) NOT NULL,
    CityName varchar(50) NOT NULL,
    PinCode varchar(50) NOT NULL,
    NetAmount decimal(10,2) NOT NULL,
    UserID Int FOREIGN KEY REFERENCES New_User(UserID)
);
INSERT INTO Customer (CustomerName, HomeAddress, Email, MobileNo, GST_NO, CityName, PinCode, NetAmount, UserID)
VALUES
('Alice Green', '789 Pine St', 'alice.green@example.com', '1234567890', 'GST1234567890', 'Pine City', '123456', 1000.00, 1),
('Bob White', '321 Oak St', 'bob.white@example.com', '0987654321', 'GST0987654321', 'Oak Town', '654321', 2000.00, 2),
('Charlie Black', '456 Elm St', 'charlie.black@example.com', '1122334455', 'GST1122334455', 'Elm Village', '789012', 1500.00, 3),
('David Blue', '654 Cedar St', 'david.blue@example.com', '2233445566', 'GST2233445566', 'Cedar Grove', '345678', 2500.00, 4),
('Emma Yellow', '123 Main St', 'emma.yellow@example.com', '3344556677', 'GST3344556677', 'Main City', '567890', 3000.00, 5),
('Frank Orange', '789 Birch St', 'frank.orange@example.com', '4455667788', 'GST4455667788', 'Birch Town', '678901', 1750.00, 1),
('Grace Purple', '321 Willow St', 'grace.purple@example.com', '5566778899', 'GST5566778899', 'Willow Grove', '890123', 2250.00, 2),
('Henry Brown', '456 Maple St', 'henry.brown@example.com', '6677889900', 'GST6677889900', 'Maple Village', '901234', 2750.00, 3),
('Isabel Silver', '654 Spruce St', 'isabel.silver@example.com', '7788990011', 'GST7788990011', 'Spruce Town', '123789', 3250.00, 4),
('Jack Gold', '123 Cedar St', 'jack.gold@example.com', '8899001122', 'GST8899001122', 'Cedar City', '345012', 3500.00, 5);
------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE New_Order (
    OrderID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    OrderDate datetime NOT NULL,
    CustomerID int FOREIGN KEY REFERENCES Customer(CustomerID),
    PaymentMode varchar(50),
    TotalAmount decimal(10,2),
    ShippingAddress varchar(50) NOT NULL,
    UserID int FOREIGN KEY REFERENCES New_User(UserID)
);
INSERT INTO New_Order (OrderDate, CustomerID, PaymentMode, TotalAmount, ShippingAddress, UserID)
VALUES
  ('2023-07-01 10:30:00', 1, 'Credit Card', 150.75, '123 Main St', 1),
('2023-07-02 14:00:00', 2, 'PayPal', 200.00, '456 Elm St', 2),
('2023-07-03 09:15:00', 3, 'Credit Card', 120.00, '789 Pine St', 3),
('2023-07-04 11:45:00', 4, 'Cash', 99.99, '321 Oak St', 4),
('2023-07-05 16:20:00', 5, 'Debit Card', 175.50, '654 Cedar St', 5),
('2023-07-06 12:00:00', 1, 'Credit Card', 220.75, '123 Main St', 1),
('2023-07-07 08:45:00', 2, 'PayPal', 300.00, '456 Elm St', 2),
('2023-07-08 17:30:00', 3, 'Cash', 180.25, '789 Pine St', 3),
('2023-07-09 13:10:00', 4, 'Credit Card', 210.00, '321 Oak St', 4),
('2023-07-10 10:50:00', 5, 'Debit Card', 250.00, '654 Cedar St', 5);
------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE OrderDetail (
    OrderDetailID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    OrderID int FOREIGN KEY REFERENCES New_Order(OrderID),
    ProductID int FOREIGN KEY REFERENCES Product(ProductID),
    Quantity int NOT NULL,
    Amount decimal(10,2),
    TotalAmount decimal(10,2),
    UserID int FOREIGN KEY REFERENCES New_User(UserID)
);
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Amount, TotalAmount, UserID)
VALUES
(1, 1, 1, 10.00, 10.00, 1),
(1, 2, 2, 20.00, 40.00, 1),
(2, 3, 1, 30.00, 30.00, 2),
(2, 4, 2, 40.00, 80.00, 2),
(3, 5, 1, 50.00, 50.00, 3),
(3, 1, 3, 10.00, 30.00, 3),
(4, 2, 2, 20.00, 40.00, 1),
(4, 3, 1, 30.00, 30.00, 1),
(5, 4, 2, 40.00, 80.00, 2),
(5, 5, 1, 50.00, 50.00, 2);
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Bills (
    BillID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    BillNumber varchar(50) NOT NULL,
    BillDate datetime NOT NULL,
    OrderID int FOREIGN KEY REFERENCES New_Order(OrderID),
    TotalAmount decimal(10,2),
    Discount decimal(10,2),
    NetAmount decimal(10,2) NOT NULL,
    UserID int FOREIGN KEY REFERENCES New_User(UserID)
);
INSERT INTO Bills (BillNumber, BillDate, OrderID, TotalAmount, Discount, NetAmount, UserID)
VALUES
('BILL001', '2024-07-01', 1, 100.00, 5.00, 95.00, 1),
('BILL002', '2024-07-02', 2, 200.00, 10.00, 190.00, 2),
('BILL003', '2024-07-03', 3, 300.00, 15.00, 285.00, 3),
('BILL004', '2024-07-04', 4, 150.00, NULL, 150.00, 1),
('BILL005', '2024-07-05', 5, 250.00, 12.50, 237.50, 2),
('BILL006', '2024-07-06', 1, 120.00, 6.00, 114.00, 1),
('BILL007', '2024-07-07', 2, 220.00, 11.00, 209.00, 2),
('BILL008', '2024-07-08', 3, 320.00, 16.00, 304.00, 3),
('BILL009', '2024-07-09', 4, 180.00, 9.00, 171.00, 1),
('BILL010', '2024-07-10', 5, 270.00, 13.50, 256.50, 2);

SELECT * FROM New_User;
SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM New_Order;
SELECT * FROM OrderDetail;
SELECT * FROM Bills;

--------PROCEDURES--------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------### Table-Product ###----------------------------------------------------------------------

---GetALL & GetById 
CREATE PROCEDURE [dbo].[GetProducts]
    @ProductID int = NULL
AS
BEGIN
    IF @ProductID IS NULL
    BEGIN
        SELECT * FROM [dbo].Product;
    END
    ELSE
    BEGIN
        SELECT * FROM [dbo].Product WHERE ProductID = @ProductID;
    END
END;
EXEC [dbo].[GetProducts] 2

---INSERT
CREATE PROCEDURE [dbo].[InsertProduct]
    @ProductName varchar(50),
    @ProductPrice decimal(10,2),
    @ProductCode varchar(50),
    @Description varchar(50),
    @UserID int
AS
BEGIN
    INSERT INTO [dbo].Product (ProductName, ProductPrice, ProductCode, Description, UserID)
    VALUES (@ProductName, @ProductPrice, @ProductCode, @Description, @UserID);
END;
EXEC [dbo].[InsertProduct] 'Item4', 100.00, '123', 'Item4 Description', 3 

--UPDATE
CREATE PROCEDURE [dbo].[UpdateProduct]
    @ProductID int,
    @ProductName varchar(50),
    @ProductPrice decimal(10,2),
    @ProductCode varchar(50),
    @Description varchar(50),
    @UserID int
AS
BEGIN
    UPDATE [DBO].Product
    SET 
		ProductName = @ProductName,
        ProductPrice = @ProductPrice,
        ProductCode = @ProductCode,
        Description = @Description,
        UserID = @UserID
    WHERE ProductID = @ProductID;
END;
EXEC [dbo].[UpdateProduct] 4 ,'Item4', 100.00, '123', 'Item4 Des', 3 

--DELETE
CREATE PROCEDURE [dbo].[DeleteProduct]
    @ProductID int
AS
BEGIN
    DELETE FROM [DBO].Product WHERE ProductID = @ProductID;
END;
EXEC [dbo].[DeleteProduct] 4

-----------------------------------------------------### TABLE - USER ###----------------------------------------------------------------------

--GETALL & GETBYID
CREATE PROCEDURE [dbo].[GetNewUsers]
    @UserID int = NULL
AS
BEGIN
    IF @UserID IS NULL
    BEGIN
        SELECT * FROM [dbo].New_User;
    END
    ELSE
    BEGIN
        SELECT * FROM [dbo].New_User WHERE UserID = @UserID;
    END
END;
EXEC [dbo].[GetNewUsers]

--INSERT
CREATE PROCEDURE [dbo].[InsertNewUser]
    @UserName varchar(50),
    @Email varchar(50),
    @Password varchar(50),
    @MobileNo varchar(50),
    @Address varchar(50),
    @IsActive bit
AS
BEGIN
    INSERT INTO [DBO].New_User (UserName, Email, Password, MobileNo, Address, IsActive)
    VALUES (@UserName, @Email, @Password, @MobileNo, @Address, @IsActive);
END;
EXEC [dbo].[InsertNewUser] 'aaa', 'aaa@gmail.com', '123', '123', 'jam', 3

--Update
CREATE PROCEDURE [dbo].[UpdateNewUser]
    @UserID int,
    @UserName varchar(50),
    @Email varchar(50),
    @Password varchar(50),
    @MobileNo varchar(50),
    @Address varchar(50),
    @IsActive bit
AS
BEGIN
    UPDATE [dbo].New_User
    SET UserName = @UserName,
        Email = @Email,
        Password = @Password,
        MobileNo = @MobileNo,
        Address = @Address,
        IsActive = @IsActive
    WHERE UserID = @UserID;
END;
EXEC [dbo].[UpdateNewUser] 4 ,'aaa', 'aaa@gmail.com', '123', '123', 'jamnagar', 3

--Delete
CREATE PROCEDURE [dbo].[DeleteNewUser]
    @UserID int
AS
BEGIN
    DELETE FROM [dbo].New_User WHERE UserID = @UserID;
END;
EXEC [dbo].[DeleteNewUser] 4

-----------------------------------------------------### TABLE - Order ###----------------------------------------------------------------------

--GetAll & GetById
CREATE PROCEDURE [dbo].[GetOrders]
    @OrderID int = NULL
AS
BEGIN
    IF @OrderID IS NULL
    BEGIN
        SELECT * FROM [dbo].New_Order;
    END
    ELSE
    BEGIN
        SELECT * FROM [dbo].New_Order WHERE OrderID = @OrderID;
    END
END;
EXEC [dbo].[GetOrders]

--Insert
CREATE PROCEDURE [dbo].[InsertOrder]
    @OrderDate datetime,
    @CustomerID int,
    @PaymentMode varchar(50),
    @TotalAmount decimal(10,2),
    @ShippingAddress varchar(50),
    @UserID int
AS
BEGIN
    INSERT INTO [dbo].New_Order (OrderDate, CustomerID, PaymentMode, TotalAmount, ShippingAddress, UserID)
    VALUES (@OrderDate, @CustomerID, @PaymentMode, @TotalAmount, @ShippingAddress, @UserID);
END;
EXEC [dbo].[InsertOrder] '2020-02-02', 3, 'Credit', 1000.00, 'Main St', 2

--Update
CREATE PROCEDURE [dbo].[UpdateOrder]
    @OrderID int,
    @OrderDate datetime,
    @CustomerID int,
    @PaymentMode varchar(50),
    @TotalAmount decimal(10,2),
    @ShippingAddress varchar(50),
    @UserID int
AS
BEGIN
    UPDATE [dbo].New_Order
    SET OrderDate = @OrderDate,
        CustomerID = @CustomerID,
        PaymentMode = @PaymentMode,
        TotalAmount = @TotalAmount,
        ShippingAddress = @ShippingAddress,
        UserID = @UserID
    WHERE OrderID = @OrderID;
END;
EXEC [dbo].[UpdateOrder] 4, '2020-02-02', 3, 'Credit', 2000.00, 'Main St', 2

--Delete
CREATE PROCEDURE [dbo].[DeleteOrder]
    @OrderID int
AS
BEGIN
    DELETE FROM New_Order WHERE OrderID = @OrderID;
END;
EXEC [dbo].[DeleteOrder] 4

-----------------------------------------------------### TABLE - Order_Details ###----------------------------------------------------------------------

--GetAll & GetById
CREATE PROCEDURE [dbo].[GetOrderDetails]
    @OrderDetailID int = NULL
AS
BEGIN
    IF @OrderDetailID IS NULL
    BEGIN
        SELECT * FROM [dbo].OrderDetail;
    END
    ELSE
    BEGIN
        SELECT * FROM [dbo].OrderDetail WHERE OrderDetailID = @OrderDetailID;
    END
END;
EXEC [dbo].[GetOrderDetails] 

--Insert
CREATE PROCEDURE [dbo].[InsertOrderDetail]
    @OrderID int,
    @ProductID int,
    @Quantity int,
    @Amount decimal(10,2),
    @TotalAmount decimal(10,2),
    @UserID int
AS
BEGIN
    INSERT INTO [dbo].OrderDetail (OrderID, ProductID, Quantity, Amount, TotalAmount, UserID)
    VALUES (@OrderID, @ProductID, @Quantity, @Amount, @TotalAmount, @UserID);
END;

--Update
CREATE PROCEDURE [dbo].[UpdateOrderDetail]
    @OrderDetailID int,
    @OrderID int,
    @ProductID int,
    @Quantity int,
    @Amount decimal(10,2),
    @TotalAmount decimal(10,2),
    @UserID int
AS
BEGIN
    UPDATE [dbo].OrderDetail
    SET OrderID = @OrderID,
        ProductID = @ProductID,
        Quantity = @Quantity,
        Amount = @Amount,
        TotalAmount = @TotalAmount,
        UserID = @UserID
    WHERE OrderDetailID = @OrderDetailID;
END;

--Delete
CREATE PROCEDURE [dbo].[DeleteOrderDetail]
    @OrderDetailID int
AS
BEGIN
    DELETE FROM [dbo].OrderDetail WHERE OrderDetailID = @OrderDetailID;
END;

-----------------------------------------------------### TABLE - Bills ###----------------------------------------------------------------------

--GetAll & GetById
CREATE PROCEDURE [dbo].[GetBills]
    @BillID int = NULL
AS
BEGIN
    IF @BillID IS NULL
    BEGIN
        SELECT * FROM Bills;
    END
    ELSE
    BEGIN
        SELECT * FROM Bills WHERE BillID = @BillID;
    END
END;
Exec [dbo].[GetBills]

--Insert
CREATE PROCEDURE [dbo].[InsertBill]
    @BillNumber varchar(50),
    @BillDate datetime,
    @OrderID int,
    @TotalAmount decimal(10,2),
    @Discount decimal(10,2),
    @NetAmount decimal(10,2),
    @UserID int
AS
BEGIN
    INSERT INTO [dbo].Bills (BillNumber, BillDate, OrderID, TotalAmount, Discount, NetAmount, UserID)
    VALUES (@BillNumber, @BillDate, @OrderID, @TotalAmount, @Discount, @NetAmount, @UserID);
END;

--Update
CREATE PROCEDURE [dbo].[UpdateBill]
    @BillID int,
    @BillNumber varchar(50),
    @BillDate datetime,
    @OrderID int,
    @TotalAmount decimal(10,2),
    @Discount decimal(10,2),
    @NetAmount decimal(10,2),
    @UserID int
AS
BEGIN
    UPDATE Bills
    SET BillNumber = @BillNumber,
        BillDate = @BillDate,
        OrderID = @OrderID,
        TotalAmount = @TotalAmount,
        Discount = @Discount,
        NetAmount = @NetAmount,
        UserID = @UserID
    WHERE BillID = @BillID;
END;

--Delete
CREATE PROCEDURE [dbo].[DeleteBill]
    @BillID int
AS
BEGIN
    DELETE FROM Bills WHERE BillID = @BillID;
END;

-----------------------------------------------------### TABLE - Customer ###----------------------------------------------------------------------

--GetAll & GetById
CREATE PROCEDURE [dbo].[GetCustomers]
    @CustomerID int = NULL
AS
BEGIN
    IF @CustomerID IS NULL
    BEGIN
        SELECT * FROM Customer;
    END
    ELSE
    BEGIN
        SELECT * FROM Customer WHERE CustomerID = @CustomerID;
    END
END;

--Insert
CREATE PROCEDURE [dbo].[InsertCustomer]
    @CustomerName varchar(50),
    @HomeAddress varchar(50),
    @Email varchar(50),
    @MobileNo varchar(50),
    @GST_NO varchar(50),
    @CityName varchar(50),
    @PinCode varchar(50),
    @NetAmount decimal(10,2),
    @UserID int
AS
BEGIN
    INSERT INTO Customer (CustomerName, HomeAddress, Email, MobileNo, GST_NO, CityName, PinCode, NetAmount, UserID)
    VALUES (@CustomerName, @HomeAddress, @Email, @MobileNo, @GST_NO, @CityName, @PinCode, @NetAmount, @UserID);
END;

--Update
CREATE PROCEDURE [dbo].[UpdateCustomer]
    @CustomerID int,
    @CustomerName varchar(50),
    @HomeAddress varchar(50),
    @Email varchar(50),
    @MobileNo varchar(50),
    @GST_NO varchar(50),
    @CityName varchar(50),
    @PinCode varchar(50),
    @NetAmount decimal(10,2),
    @UserID int
AS
BEGIN
    UPDATE Customer
    SET CustomerName = @CustomerName,
        HomeAddress = @HomeAddress,
        Email = @Email,
        MobileNo = @MobileNo,
        GST_NO = @GST_NO,
        CityName = @CityName,
        PinCode = @PinCode,
        NetAmount = @NetAmount,
        UserID = @UserID
    WHERE CustomerID = @CustomerID;
END;

--Delete
CREATE PROCEDURE [dbo].[DeleteCustomer]
    @CustomerID int
AS
BEGIN
    DELETE FROM Customer WHERE CustomerID = @CustomerID;
END;










