# Change based approach
Utilizing SQL scripts with Flyway for migrations

## E5. Rename Grade attribute to FinalGrade in Enrollment
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


## E7. Modify the Course Credits relation
If you've chosen to use integers for the Credits attribute, modify the type to decimal(5, 2) and vice versa.

Argue why you have chosen destructive vs non-destructive approach to your schema changes.

```sql
IF EXISTS (
    SELECT 1
    FROM courses
    WHERE credits >= 1000
)
BEGIN
    ALTER TABLE courses
    ADD credits_int INT;
    
    UPDATE courses
    SET credits_int = credits;

    UPDATE courses
    SET credits = 999 
    WHERE credits >= 1000;

    ALTER TABLE courses
    ALTER COLUMN credits DECIMAL(5, 2);
END
ELSE
BEGIN
    ALTER TABLE courses
    ALTER COLUMN credits DECIMAL(5, 2);
END
```
- This approach checks that the values can be converted to a 5-digit decimal with 2 digits after the decimal point.
- If values exist that are over the threshold, they will be copied to a new column for backup.
- We then update the value to 999, which is the largest possible value that will not cause an error.
- In my understanding, these values should not really exist from a business perspective, so we should establish logic to enforce proper values. This logic does not make sense to include in the database.
- If no values over 999 exist, we should be able to change the column type as passing an integer to a decimal value should not cause any issues on modern systems.