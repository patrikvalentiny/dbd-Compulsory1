  -- add new schema named "public":
    -> CREATE SCHEMA IF NOT EXISTS "public";
  -- set comment to schema: "public":
    -> COMMENT ON SCHEMA "public" IS 'standard public schema';
  -- create "courses" table:
    -> CREATE TABLE "public"."courses" (
         "id" serial NOT NULL,
         "name" character varying(255) NOT NULL,
         "credits" integer NOT NULL,
         PRIMARY KEY ("id")
       );
  -- create "students" table:
    -> CREATE TABLE "public"."students" (
         "id" serial NOT NULL,
         "first_name" character varying(255) NOT NULL,
         "last_name" character varying(255) NOT NULL,
         "email" character varying(255) NOT NULL,
         "enrollment_date" date NOT NULL,
         PRIMARY KEY ("id")
       );
  -- create "enrollments" table:
    -> CREATE TABLE "public"."enrollments" (
         "id" serial NOT NULL,
         "student_id" integer NOT NULL,
         "course_id" integer NOT NULL,
         "grade" integer NULL,
         PRIMARY KEY ("id"),
         CONSTRAINT "enrollments_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "public"."courses" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
         CONSTRAINT "enrollments_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "public"."students" ("id") ON UPDATE CASCADE ON DELETE CASCADE
       );