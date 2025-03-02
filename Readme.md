5. Rename Grade attribute to FinalGrade in Enrollment
Rename the Grade attribute to FinalGrade in the Enrollment relation.

Argue why you have chosen destructive vs non-destructive approach to your schema changes.

```SQL
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

- Creating a new column allows developers to 