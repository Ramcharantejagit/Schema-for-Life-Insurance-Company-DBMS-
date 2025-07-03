CREATE TABLE Policyholder (
 policyholder_id INT PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 date_of_birth DATE,
 gender VARCHAR(10),
 address VARCHAR(255),
 contact_number VARCHAR(20),
 email VARCHAR(100)
); 
CREATE TABLE Policy (
 policy_id INT PRIMARY KEY,
 policy_number VARCHAR(20),
 start_date DATE,
 end_date DATE,
 coverage_amount DECIMAL(10,2),
 premium_amount DECIMAL(10,2),
 policyholder_id INT,
 FOREIGN KEY (policyholder_id) REFERENCES Policyholder(policyholder_id)
);
CREATE TABLE Beneficiary (
 beneficiary_id INT PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 date_of_birth DATE,
 relationship VARCHAR(50),
 policy_id INT,
 FOREIGN KEY (policy_id) REFERENCES Policy(policy_id)
); 
CREATE TABLE PremiumPayment (
 payment_id INT PRIMARY KEY,
 amount DECIMAL(10,2),
 payment_date DATE,
 policy_id INT,
 FOREIGN KEY (policy_id) REFERENCES Policy(policy_id)
); 
CREATE TABLE Claim (
 claim_id INT PRIMARY KEY,
 claim_date DATE,
 claim_amount DECIMAL(10,2),
 status VARCHAR(20),
 policy_id INT,
 FOREIGN KEY (policy_id) REFERENCES Policy(policy_id)
);
INSERT INTO Policyholder VALUES
(1, 'John', 'Doe', '1980-01-15', 'Male', '123 Main St', '555-1234', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '1985-05-10', 'Female', '456 Oak St', '555-5678', 'jane.smith@example.com'),
(3, 'Bob', 'Johnson', '1972-08-22', 'Male', '789 Elm St', '555-9012', 'bob.johnson@example.com'),
(4, 'Alice', 'Williams', '1990-03-18', 'Female', '987 Pine St', '555-3456', 'alice.williams@example.com'),
(5, 'Charlie', 'Brown', '1982-12-05', 'Male', '654 Birch St', '555-7890', 'charlie.brown@example.com'); 
INSERT INTO Policy VALUES
(101, 'P12345', '2022-01-01', '2023-01-01', 500000, 1000, 1),
(102, 'P67890', '2022-02-01', '2023-02-01', 750000, 1500, 2),
(103, 'P13579', '2022-03-01', '2023-03-01', 600000, 1200, 3),
(104, 'P24680', '2022-04-01', '2023-04-01', 800000, 1600, 4),
(105, 'P98765', '2022-05-01', '2023-05-01', 550000, 1100, 5); 
INSERT INTO Beneficiary VALUES
(201, 'Sarah', 'Doe', '2000-10-10', 'Child', 101),
(202, 'John', 'Smith', '2010-03-15', 'Child', 102),
(203, 'Eva', 'Johnson', '1995-06-20', 'Spouse', 103),
(204, 'Bob Jr.', 'Williams', '2015-01-25', 'Child', 104),
(205, 'Lucy', 'Brown', '2008-08-05', 'Child', 105); 
INSERT INTO PremiumPayment VALUES
(301, 100, '2022-02-01', 101),
(302, 150, '2022-03-01', 102),
(303, 120, '2022-04-01', 103),
(304, 160, '2022-05-01', 104),
(305, 110, '2022-06-01', 105); 
INSERT INTO Claim VALUES
(401, '2022-06-15', 200000, 'Pending', 101),
(402, '2022-03-20', 300000, 'Approved', 102),
(403, '2022-04-10', 250000, 'Denied', 103),
(404, '2022-05-05', 400000, 'Pending', 104),
(405, '2022-07-01', 180000, 'Approved', 105); 
