CREATE DATABASE Divine_Sushi_Shop;
USE Divine_Sushi_Shop;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    MiddleInitial CHAR(1),
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL,
    CityTown VARCHAR(50) NOT NULL,
    Street VARCHAR(100) NOT NULL,
    HouseNumber INT UNIQUE,
    PaymentInfo VARCHAR(100)
);

CREATE TABLE Restaurant_Staff (
    StaffID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15) UNIQUE NOT NULL,
    ShiftSchedule VARCHAR(50),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Administrators (
    AdminID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(50) UNIQUE NOT NULL,
    SystemActivityLog VARCHAR(255)
);

CREATE TABLE Sushi_Item (
    ItemID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ItemName VARCHAR(100) NOT NULL,
    Description TEXT UNIQUE,
    Price DECIMAL(10,2) NOT NULL,
    AvailabilityStatus VARCHAR(50) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Ingredients TEXT
);

CREATE TABLE Delivery_Personnel (
    DeliveryPersonID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15) UNIQUE NOT NULL,
    DeliveryZone VARCHAR(50) NOT NULL,
    AvailabilityStatus VARCHAR(50) NOT NULL
);

CREATE TABLE Vehicle_Info (
    VehicleID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    DeliveryPersonID INT NOT NULL,
    Brand VARCHAR(50) NOT NULL,
    TypeOfVehicle VARCHAR(50) NOT NULL,
    PlateNumber VARCHAR(50) UNIQUE NOT NULL,
    Color VARCHAR(50) NOT NULL,
    FOREIGN KEY(DeliveryPersonID) REFERENCES Delivery_Personnel(DeliveryPersonID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    DeliveryPersonID INT NOT NULL,
    ItemID INT NOT NULL,
    OrderStatus VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL,
    OrderTime DATETIME NOT NULL,
    PaymentStatus VARCHAR(50) NOT NULL,
    Feedback TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (DeliveryPersonID) REFERENCES Delivery_Personnel(DeliveryPersonID),
    FOREIGN KEY (ItemID) REFERENCES Sushi_Item(ItemID)
);



INSERT INTO Administrators (Name, Role, ContactNumber, Email, Username, Password, SystemActivityLog) 
VALUES 
    ('John Doe', 'System Administrator', '1234567890', 'john@example.com', 'john_admin', 'password123', 'System activity log for John Doe'),
    ('Jane Smith', 'Admin Assistant', '0987654321', 'jane@example.com', 'jane_admin', 'pass123', 'System activity log for Jane Smith'),
    ('Michael Johnson', 'Senior Administrator', '5551234567', 'michael@example.com', 'michael_admin', 'adminpass', 'System activity log for Michael Johnson'),
    ('Emily Brown', 'Administrator', '9876543210', 'emily@example.com', 'emily_admin', 'admin123', 'System activity log for Emily Brown'),
    ('David Wilson', 'System Administrator', '1112223333', 'david@example.com', 'david_admin', 'securepass', 'System activity log for David Wilson'),
    ('Sarah Lee', 'Admin Assistant', '3334445555', 'sarah@example.com', 'sarah_admin', 'p@ssw0rd', 'System activity log for Sarah Lee'),
    ('Christopher Davis', 'Administrator', '7778889999', 'chris@example.com', 'chris_admin', 'adminpass123', 'System activity log for Christopher Davis'),
    ('Jessica Taylor', 'Senior Administrator', '6667778888', 'jessica@example.com', 'jessica_admin', 'passadmin', 'System activity log for Jessica Taylor'),
    ('Daniel Martinez', 'Administrator', '2223334444', 'daniel@example.com', 'daniel_admin', 'adminpassword', 'System activity log for Daniel Martinez'),
    ('Amanda Harris', 'System Administrator', '4445556666', 'amanda@example.com', 'amanda_admin', 'admin1234', 'System activity log for Amanda Harris');

INSERT INTO Customer (FirstName, MiddleInitial, LastName, Email, PhoneNumber, CityTown, Street, HouseNumber, PaymentInfo) 
VALUES 
    ('Alice', 'M', 'Johnson', 'alice@example.com', '1234567890', 'Cityville', 'Main Street', 231, 'Credit Card'),
    ('Bob', NULL, 'Smith', 'bob@example.com', '9876543210', 'Townsville', 'Oak Avenue', 456, 'PayPal'),
    ('Charlie', NULL, 'Brown', 'charlie@example.com', '5554443333', 'Villageton', 'Elm Street', 789, 'Cash'),
    ('Diana', 'L', 'Miller', 'diana@example.com', '1112223333', 'Cityburg', 'Maple Road', 1011, 'Credit Card'),
    ('Ethan', 'P', 'Davis', 'ethan@example.com', '7778889999', 'Townland', 'Cedar Lane', 1213, 'Credit Card'),
    ('Fiona', NULL, 'Garcia', 'fiona@example.com', '4445556666', 'Villageville', 'Pine Street', 1415, 'PayPal'),
    ('Greg', 'R', 'Martinez', 'greg@example.com', '2223334444', 'Cityton', 'Birch Avenue', 1617, 'Cash'),
    ('Hannah', 'K', 'Lopez', 'hannah@example.com', '8887776666', 'Townburg', 'Spruce Drive', 1819, 'Credit Card'),
    ('Ian', NULL, 'Wilson', 'ian@example.com', '9998887777', 'Villageburg', 'Willow Lane', 2021, 'PayPal');

INSERT INTO Delivery_Personnel (Name, ContactNumber, DeliveryZone, AvailabilityStatus) 
VALUES 
    ('John Smith', '1234567890', 'Main Street Cityville', 'Available'),
    ('Emily Johnson', '9876543210', 'Oak Avenue Townsville', 'Available'),
    ('Michael Brown', '5554443333', 'Elm Street Villageton', 'Unavailable'),
    ('Sarah Davis', '1112223333', 'Maple Road Cityburg', 'Available'),
    ('David Garcia', '7778889999', 'Cedar Lane Townland', 'Available'),
    ('Jessica Martinez', '4445556666', 'Pine Street Villageville', 'Unavailable'),
    ('Daniel Miller', '2223334444', 'Birch Avenue Cityton', 'Available'),
    ('Amanda Wilson', '8887776666', 'Spruce Drive Townburg', 'Unavailable'),
    ('Grace Lopez', '9998887777', 'Willow Lane', 'Available');

INSERT INTO Sushi_Item (ItemName, Description, Price, AvailabilityStatus, Category, Ingredients) 
VALUES 
    ('Salmon Nigiri', 'Sushi rice topped with salmon', 5.99, 'Available', 'Nigiri', 'Sushi rice, salmon'),
    ('Tuna Sashimi', 'Fresh tuna slices', 9.99, 'Available', 'Sashimi', 'Fresh tuna slices'),
    ('Spicy Tuna Roll', 'Tuna roll with spicy mayo', 10.99, 'Available', 'Rolls', 'Rice, tuna, spicy mayo, cucumber'),
    ('Dragon Roll', 'Shrimp tempura and eel roll', 12.99, 'Available', 'Special Rolls', 'Rice, shrimp tempura, avocado, eel, eel sauce'),
    ('California Hand Roll', 'Hand roll with crab meat', 7.99, 'Available', 'Hand Rolls', 'Rice, avocado, cucumber, crab meat'),
    ('Salmon Avocado Roll', 'Roll with salmon and avocado', 11.99, 'Available', 'Rolls', 'Rice, salmon, avocado'),
    ('Rainbow Roll', 'Assorted fish roll', 13.99, 'Available', 'Special Rolls', 'Rice, assorted fish, avocado, cucumber'),
    ('Shrimp Tempura Roll', 'Shrimp tempura roll with avocado', 9.99, 'Available', 'Rolls', 'Rice, shrimp tempura, avocado, cucumber'),
    ('Vegetable Tempura Roll', 'Vegetarian tempura roll', 8.99, 'Available', 'Vegetarian Rolls', 'Rice, assorted tempura vegetables');

INSERT INTO Orders (CustomerID, DeliveryPersonID, ItemID, OrderStatus, Quantity, TotalPrice, OrderTime, PaymentStatus, Feedback) 
VALUES 
    (2, 2, 1, 'Pending', 2, 17.98, '2024-09-24 12:00:00', 'Paid', 'Quick delivery!'),
    (1, 1, 3, 'Completed', 1, 10.99, '2024-09-24 13:00:00', 'Paid', 'Delicious!'),
    (3, 3, 4, 'Pending', 3, 38.97, '2024-09-24 14:00:00', 'Pending', 'None'),
    (4, 4, 5, 'Completed', 1, 7.99, '2024-09-24 15:00:00', 'Paid', 'Great flavor!'),
    (5, 5, 2, 'Pending', 2, 19.98, '2024-09-24 16:00:00', 'Pending', 'None');

INSERT INTO Restaurant_Staff (Name, Role, ContactNumber, ShiftSchedule, Email, Username, Password) 
VALUES 
    ('Emily Watson', 'Chef', '5556667777', 'Full-Time', 'emilywatson@example.com', 'emily_chef', 'chefpassword'),
    ('Robert Brown', 'Waiter', '5558889999', 'Part-Time', 'robertbrown@example.com', 'robert_waiter', 'waiterpass'),
    ('Alice White', 'Cashier', '5551112222', 'Full-Time', 'alicewhite@example.com', 'alice_cashier', 'cashierpass'),
    ('Chris Green', 'Manager', '5554443333', 'Full-Time', 'chrisgreen@example.com', 'chris_manager', 'managerpass'),
    ('Sophie Black', 'Delivery Coordinator', '5552223333', 'Part-Time', 'sophieblack@example.com', 'sophie_delivery', 'deliverypass');


INSERT INTO Vehicle_Info (DeliveryPersonID, Brand, TypeOfVehicle, PlateNumber, Color) 
VALUES 
    (1, 'Toyota', 'Sedan', 'XYZ1234', 'Red'),
    (2, 'Honda', 'Crossover', 'ABC5678', 'Blue'),
    (4, 'Ford', 'Van', 'LMN9101', 'White'),
    (5, 'Chevrolet', 'Pickup', 'QRS2345', 'Black'),
    (8, 'Nissan', 'Sedan', 'TUV6789', 'Silver');

    


UPDATE Customer
SET PhoneNumber = '09195034746'
WHERE CustomerID = 9;

UPDATE Restaurant_Staff 
SET ShiftSchedule = 'Part-Time'
WHERE Name = 'Emily Watson';

UPDATE Administrators
SET ContactNumber = '911'
WHERE Name = 'John Doe';

UPDATE Sushi_Item
SET Price = 7.05
WHERE ItemName = 'Salmon Nigiri';

UPDATE Orders
SET OrderStatus = 'Pending'
WHERE CustomerID = 1;
