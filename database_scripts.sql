CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    supervisor_id INT,
    branch_id INT
);

DESCRIBE employee;

CREATE TABLE branch (
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(40),
    manager_id  INT,
    manager_start_date DATE,
    FOREIGN KEY(manager_id) REFERENCES employee(employee_id) ON DELETE SET NULL 
);

ALTER TABLE employee
ADD FOREIGN KEY(supervisor_id)
REFERENCES employee(employee_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

CREATE TABLE client (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE  works_with(
    employee_id INT,
    client_id INT,
    tatal_sales INT,
    PRIMARY KEY(employee_id, client_id),
    FOREIGN KEY(employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id,supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


INSERT INTO employee VALUES(100, 'Joshua' ,' Ombasa', '2000-01-26','M',89000,NULL,NULL);

SELECT * FROM employee;


INSERT INTO branch VALUES(1,'Mombasa',100,'2020-01-01');

UPDATE employee
SET branch_id = 1
WHERE employee_id = 100;

INSERT INTO employee VALUES(101,'Esther', 'Mulu', '2002-02-02','F',90000,100,1);

INSERT INTO employee VALUES(102,'Junior', 'Otieno', '2003-03-03','M',100000,100,NULL);

INSERT INTO branch VALUES(2,'Kisumu',102,'2021-02-02');

UPDATE employee
SET branch_id = 2
WHERE employee_id = 102;

INSERT INTO employee VALUES(103,'Dalmas', 'Otieno', '2004-04-04','M',300000,102,2);
INSERT INTO employee VALUES(104,'Justin', 'Kiprop', '2005-05-05','M',250000,102,2);
INSERT INTO employee VALUES(105,'Clara', 'Sibo', '2006-06-06','F',250000,102,2);


INSERT INTO employee VALUES(106,'Stephon', 'Bonaldi', '2002-05-05','M',250000,100,NULL);

INSERT INTO branch VALUES(3,'Nairobi',106,'2021-02-02');

UPDATE employee
SET branch_id = 3
WHERE employee_id = 106;

INSERT INTO employee VALUES(107,'Lilian', 'Awuor', '2001-05-05','F',250000,106,3);
INSERT INTO employee VALUES(108,'Molly', 'Nasumba', '2002-05-05','F',250000,106,3);

INSERT INTO client (client_id, client_name, branch_id) 
VALUES 
(400, 'Kenya Commercial Bank', 1),
(401, 'NCBA Bank', 2),
(402, 'Safaricom', 3),
(403, 'Equity Bank', 1),
(404, 'Coca-Cola East Africa', 2),
(405, 'East African Breweries Ltd', 3),
(406, 'Total Energies', 1),
(407, 'Nation Media Group', 2),
(408, 'Standard Group', 3),
(409, 'KenGen', 1),
(410, 'Kenya Airways', 2),
(411, 'Bamburi Cement', 3);

INSERT INTO branch_supplier VALUES 
(1, 'AccessKenya', 'Networking Equipment'),
(1, 'Jamii Telecommunications', 'Fiber Connectivity'),
(2, 'Wananchi Group', 'Broadband Services'),
(2, 'Liquid Intelligent Technologies', 'Data Center Services'),
(2, 'Seven Seas Technologies', 'IT Solutions'),
(3, 'Computech Limited', 'Software Development'),
(3, 'Dimension Data', 'Managed IT Services'),
(3, 'Kinetic Limited', 'IT Infrastructure Solutions'),
(1, 'Technobrain', 'Custom ERP Solutions'),
(2, 'Cellulant', 'Mobile Payment Integration'),
(3, 'Symphony Technologies', 'Enterprise Hardware Solutions');

INSERT INTO works_with (employee_id, client_id, tatal_sales) 
VALUES 
-- Mombasa Branch (Branch ID: 1, Clients: 400, 403, 406, 409)
(100, 400, 1500000), -- Joshua handles Kenya Commercial Bank
(101, 403, 2500000), -- Esther handles Equity Bank
(101, 406, 1800000), -- Esther handles Total Energies
(100, 409, 3000000), -- Joshua handles KenGen

-- Kisumu Branch (Branch ID: 2, Clients: 401, 404, 407, 410)
(102, 401, 2200000), -- Junior handles NCBA Bank
(103, 404, 4000000), -- Dalmas handles Coca-Cola East Africa
(104, 407, 2800000), -- Justin handles Nation Media Group
(105, 410, 2000000), -- Clara handles Kenya Airways

-- Nairobi Branch (Branch ID: 3, Clients: 402, 405, 408, 411)
(106, 402, 3500000), -- Stephon handles Safaricom
(107, 405, 4500000), -- Lilian handles East African Breweries Ltd
(108, 408, 1800000), -- Molly handles Standard Group
(107, 411, 5000000); -- Lilian handles Bamburi Cement


SELECT * FROM employee;
SELECT * FROM branch;
SELECT * FROM client;
SELECT * FROM branch_supplier;
SELECT * FROM works_with;

