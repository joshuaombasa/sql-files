
-- Add foreign key constraints to employee table
ALTER TABLE employee
ADD FOREIGN KEY(supervisor_id)
REFERENCES employee(employee_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;
