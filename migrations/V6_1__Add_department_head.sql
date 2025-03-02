-- modify "departments" table
- >
ALTER TABLE "public"."departments"
ADD COLUMN "instructor_id" integer NULL,
ADD CONSTRAINT "departments_instructor_id_fkey" FOREIGN KEY ("instructor_id") REFERENCES "public"."instructors" ("id") ON UPDATE CASCADE ON DELETE SET NULL;