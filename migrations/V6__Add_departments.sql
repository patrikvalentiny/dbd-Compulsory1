  -- create "departments" table:
    -> CREATE TABLE "public"."departments" (
         "id" serial NOT NULL,
         "name" character varying(255) NOT NULL,
         "budget" numeric(10,2) NOT NULL,
         "start_date" date NOT NULL,
         PRIMARY KEY ("id")
       );