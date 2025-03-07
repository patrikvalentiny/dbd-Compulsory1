ALTER TABLE enrollments ADD COLUMN final_grade INT;
UPDATE enrollments SET final_grade = grade;
ALTER TABLE enrollments ADD CONSTRAINT final_grade_is_grade_or_null CHECK (final_grade = grade OR final_grade IS NULL);

CREATE TRIGGER sync_grades_trigger
BEFORE INSERT OR UPDATE ON enrollments
FOR EACH ROW
BEGIN
    IF NEW.grade IS NOT NULL AND NEW.final_grade IS NULL THEN
        NEW.final_grade := NEW.grade;
    ELSIF NEW.final_grade IS NOT NULL AND NEW.grade IS NULL THEN
        NEW.grade := NEW.final_grade;
    END IF;
    RETURN NEW;
END;