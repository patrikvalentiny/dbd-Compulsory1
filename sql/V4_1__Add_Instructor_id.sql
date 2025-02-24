ALTER TABLE courses ADD COLUMN instructor_id INT;
ALTER TABLE courses ADD FOREIGN KEY (instructor_id) REFERENCES instructors(id);