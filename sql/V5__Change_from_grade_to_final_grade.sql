ALTER TABLE enrollments ADD COLUMN final_grade INT;
UPDATE enrollments SET final_grade = grade;
ALTER TABLE enrollments ADD CONSTRAINT final_grade_is_grade_or_null CHECK (final_grade = grade OR final_grade IS NULL);