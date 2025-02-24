CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    budget NUMERIC(10, 2) NOT NULL,
    start_date DATE NOT NULL
);