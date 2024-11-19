create database gestionUsuariosChuys;
use gestionUsuariosChuys;
-- Create Clients table (with password)
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(150),
    Phone VARCHAR(15),
    Address VARCHAR(250),
    RegistrationDate DATE,
    Password VARCHAR(255)  -- To store the hashed password
);

-- Create Employees table (with password)
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(150),
    Position VARCHAR(100),
    HireDate DATE,
    Password VARCHAR(255)  -- To store the hashed password
);

-- Create Newsletters table (with cascade delete if a client is deleted)
CREATE TABLE Newsletters (
    NewsletterID INT PRIMARY KEY AUTO_INCREMENT,
    Subject VARCHAR(200),
    Body TEXT,
    SentDate DATE,
    ClientID INT,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID) ON DELETE CASCADE
);

-- Create Workstations table (with cascade delete if an employee is deleted)
CREATE TABLE Workstations (
    WorkstationID INT PRIMARY KEY AUTO_INCREMENT,
    Number INT,
    Status VARCHAR(50),  -- e.g., Available/Occupied
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);