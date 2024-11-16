
-- Insert initial data into employee table
INSERT INTO employee VALUES
(100, 'Joshua', 'Ombasa', '2000-01-26', 'M', 89000, NULL, NULL),
(101, 'Esther', 'Mulu', '2002-02-02', 'F', 90000, 100, 1),
(102, 'Junior', 'Otieno', '2003-03-03', 'M', 100000, 100, NULL),
(103, 'Dalmas', 'Otieno', '2004-04-04', 'M', 300000, 102, 2),
(104, 'Justin', 'Kiprop', '2005-05-05', 'M', 250000, 102, 2),
(105, 'Clara', 'Sibo', '2006-06-06', 'F', 250000, 102, 2),
(106, 'Stephon', 'Bonaldi', '2002-05-05', 'M', 250000, 100, NULL),
(107, 'Lilian', 'Awuor', '2001-05-05', 'F', 250000, 106, 3),
(108, 'Molly', 'Nasumba', '2002-05-05', 'F', 250000, 106, 3);

-- Insert initial data into branch table
INSERT INTO branch VALUES
(1, 'Mombasa', 100, '2020-01-01'),
(2, 'Kisumu', 102, '2021-02-02'),
(3, 'Nairobi', 106, '2021-02-02');

-- Update employee branch assignments
UPDATE employee SET branch_id = 1 WHERE employee_id = 100;
UPDATE employee SET branch_id = 2 WHERE employee_id = 102;
UPDATE employee SET branch_id = 3 WHERE employee_id = 106;

-- Insert initial data into client table
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

-- Insert initial data into branch_supplier table
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

-- Insert initial data into works_with table
INSERT INTO works_with (employee_id, client_id, tatal_sales) 
VALUES 
(100, 400, 1500000),
(101, 403, 2500000),
(101, 406, 1800000),
(100, 409, 3000000),
(102, 401, 2200000),
(103, 404, 4000000),
(104, 407, 2800000),
(105, 410, 2000000),
(106, 402, 3500000),
(107, 405, 4500000),
(108, 408, 1800000),
(107, 411, 5000000);
