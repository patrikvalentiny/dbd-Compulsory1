IF EXISTS (
    SELECT
        1
    FROM
        courses
    WHERE
        credits >= 1000
    LIMIT
        1
) BEGIN
ADD COLUMN credits_decimal DECIMAL(5, 2);
UPDATE courses SET credits_decimal = credits WHERE credits < 1000 ;
ELSE
ALTER TABLE courses
ALTER COLUMN credits DECIMAL(5, 2);

END