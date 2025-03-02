-- Check if we need to preserve integer values
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
    SET credits  = 999 WHERE credits >= 1000;

    ALTER TABLE courses
    ALTER COLUMN credits DECIMAL(5, 2);

END
ELSE
BEGIN
    ALTER TABLE courses
    ALTER COLUMN credits DECIMAL(5, 2);
END