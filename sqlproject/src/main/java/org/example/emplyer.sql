-- Create Employee Table
CREATE TABLE Employee (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  company_email VARCHAR(100),
  phone_number VARCHAR(20),
  hired_date DATE,
  job_id INT,
  salary DECIMAL(10, 2),
  commission_pct DECIMAL(4, 2),
  manager_id INT,
  department_id INT
);

-- Create Department Table
CREATE TABLE Department (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(50),
  manager_id INT,
  location_id INT
);

-- Create Jobs Table
CREATE TABLE Jobs (
  job_id INT PRIMARY KEY,
  job_title VARCHAR(50),
  min_salary DECIMAL(10, 2),
  max_salary DECIMAL(10, 2)
);

-- Create Job History Table
CREATE TABLE Job_History (
  employee_id INT,
  start_date DATE,
  PRIMARY KEY (employee_id, start_date)
);

-- Create Locations Table
CREATE TABLE Locations (
  location_id INT PRIMARY KEY,
  street_address VARCHAR(100),
  postal_code VARCHAR(20),
  city VARCHAR(50),
  state VARCHAR(50),
  country_id INT
);

-- Create Countries Table
CREATE TABLE Countries (
  country_id INT PRIMARY KEY,
  country_name VARCHAR(50),
  region_name VARCHAR(50)
);

-- Insert sample data into Employee Table
INSERT INTO Employee (employee_id, first_name, last_name, company_email, phone_number, hired_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES
  (1, 'Jepetl', 'alex', 'Jepetl.doe@example.com', '1234567890', '2022-07-01', 1, 5000.00, 0.10, NULL, 1),
  (2, 'Donte', 'Smith', 'donte.smith@example.com', '9876543210', '2023-07-01', 2, 6000.00, 0.15, 1, 1);
  -- Add more sample rows as needed

-- Insert sample data into Department Table
INSERT INTO Department (department_id, department_name, manager_id, location_id)
VALUES
  (1, 'Sales', 1, 1),
  (2, 'Marketing', 2, 2);
  -- Add more sample rows as needed

-- Insert sample data into Jobs Table
INSERT INTO Jobs (job_id, job_title, min_salary, max_salary)
VALUES
  (1, 'Manager', 5000.00, 10000.00),
  (2, 'Salesperson', 3000.00, 6000.00);
  -- Add more sample rows as needed

-- Insert sample data into Job History Table
INSERT INTO Job_History (employee_id, start_date)
VALUES
  (1, '2022-01-01'),
  (2, '2022-02-01');
  -- Add more sample rows as needed

-- Insert sample data into Locations Table
INSERT INTO Locations (location_id, street_address, postal_code, city, state, country_id)
VALUES
  (1, '123 Main St', '12345', 'New York', 'NY', 1),
  (2, '456 Park Ave', '67890', 'Los Angeles', 'CA', 2);
  -- Add more sample rows as needed

-- Insert sample data into Countries Table
INSERT INTO Countries (country_id, country_name, region_name)
VALUES
  (1, 'United States', 'North America'),
  (2, 'United Kingdom', 'Europe');
  -- Add more sample rows as needed

-- Retrieve information from the joined tables using INNER JOIN
SELECT E.employee_id, E.first_name, E.last_name, E.company_email, E.phone_number,
       E.hired_date, J.job_title, E.salary, E.commission_pct, D.department_name,
       L.street_address, L.city, L.state, L.postal_code, C.country_name
FROM Employee E
INNER JOIN Jobs J ON E.job_id = J.job_id
INNER JOIN Department D ON E.department_id = D.department_id
INNER JOIN Locations L ON D.location_id = L.location_id
INNER JOIN Countries C ON L.country_id = C.country_id;
