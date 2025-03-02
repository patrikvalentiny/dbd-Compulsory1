CREATE TABLE
    students (
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(255) NOT NULL,
        last_name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        enrollment_date DATE NOT NULL,
        middle_name VARCHAR(255),
        date_of_birth DATE NULL
    );

CREATE TABLE
    instructors (
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(255) NOT NULL,
        last_name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        hire_date DATE NOT NULL
    );

CREATE TABLE
    departments (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        budget NUMERIC(10, 2) NOT NULL,
        start_date DATE NOT NULL,
        instructor_id INT NULL,
        FOREIGN KEY (instructor_id) REFERENCES instructors (id) ON DELETE SET NULL ON UPDATE CASCADE
    );

CREATE TABLE
    courses (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        credits DECIMAL(5,2) NOT NULL,
        instructor_id INT NULL,
        FOREIGN KEY (instructor_id) REFERENCES instructors (id) ON DELETE SET NULL ON UPDATE CASCADE
    );

CREATE TABLE
    enrollments (
        id SERIAL PRIMARY KEY,
        student_id INT NOT NULL,
        course_id INT NOT NULL,
        final_grade INT,
        FOREIGN KEY (student_id) REFERENCES students (id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (course_id) REFERENCES courses (id) ON DELETE CASCADE ON UPDATE CASCADE
    );