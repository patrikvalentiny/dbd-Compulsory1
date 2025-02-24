ALTER TABLE departments ADD COLUMN department_head_id INT;
ALTER TABLE departments ADD FOREIGN KEY (department_head_id) REFERENCES instructors(id);