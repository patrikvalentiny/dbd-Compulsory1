-- create "instructors" table:
- >
CREATE TABLE
    "public"."instructors" (
        "id" serial NOT NULL,
        "first_name" character varying(255) NOT NULL,
        "last_name" character varying(255) NOT NULL,
        "email" character varying(255) NOT NULL,
        "hire_date" date NOT NULL,
        PRIMARY KEY ("id")
    );

-- modify "courses" table:
- >
ALTER TABLE "public"."courses"
ADD COLUMN "instructor_id" integer NULL,
ADD CONSTRAINT "courses_instructor_id_fkey" FOREIGN KEY ("instructor_id") REFERENCES "public"."instructors" ("id") ON UPDATE CASCADE ON DELETE SET NULL;