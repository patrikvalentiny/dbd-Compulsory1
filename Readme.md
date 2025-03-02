5. Rename Grade attribute to FinalGrade in Enrollment
Rename the Grade attribute to FinalGrade in the Enrollment relation.

Argue why you have chosen destructive vs non-destructive approach to your schema changes.

```SQL
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
```

- Creating a new column allows developers to have time to move to the new naming. 
- Adding the constraint forces us to keep the data the same in both columns.
- Creating the trigger puts the responsibility on the database but should make the transition smoother.
- After a transition period, the grade column should be removed to clean up the schema and avoid confusion.