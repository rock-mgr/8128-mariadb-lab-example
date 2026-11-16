CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(50) NOT NULL
);

CREATE TABLE instructors (
  instructor_id INT PRIMARY KEY,
  instructor_name VARCHAR(50) NOT NULL,
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE
);

CREATE TABLE student_info (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(50) NOT NULL,
  email VARCHAR(100),
  street_address VARCHAR(100),
  city VARCHAR(50),
  gpa DECIMAL(3,2),
  enrolled_date DATE
);

CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(50) NOT NULL,
  instructor_id INT,
  department_id INT,
  FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id) ON DELETE CASCADE,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE enrollments (
  enrollment_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  enrollment_date DATE,
  FOREIGN KEY (student_id) REFERENCES student_info(student_id) ON DELETE RESTRICT,
  FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Chemistry'),
(5, 'History');

INSERT INTO instructors (instructor_id, instructor_name, department_id) VALUES
(101, 'Alice Johnson', 1),
(102, 'Bob Smith', 2),
(103, 'Carol Davis', 3),
(104, 'David Wilson', 1),
(105, 'Eve Thompson', 4);

INSERT INTO student_info (student_id, student_name, email, street_address, city, gpa, enrolled_date) VALUES
(201, 'Tom Brown', 'tom.brown@example.com', '123 Maple St.', 'Springfield', 3.75, '2023-09-01'),
(202, 'Lucy Green', 'lucy.green@example.com', '456 Oak St.', 'Riverdale', 3.90, '2022-09-01'),
(203, 'Jack White', 'jack.white@example.com', '789 Pine St.', 'Hilltown', 3.20, '2023-01-15'),
(204, 'Anna Blue', 'anna.blue@example.com', '101 Cedar St.', 'Fairview', 3.60, '2022-09-01'),
(205, 'Mike Black', 'mike.black@example.com', '202 Birch St.', 'Lakeville', 3.85, '2021-09-01');

INSERT INTO courses (course_id, course_name, instructor_id, department_id) VALUES
(301, 'Data Structures', 101, 1),
(302, 'Calculus', 102, 2),
(303, 'Quantum Mechanics', 103, 3),
(304, 'Organic Chemistry', 105, 4),
(305, 'Operating Systems', 101, 1),
(306, 'Introduction to AI and Programming', 104, 1),
(307, 'Basic Mathematics', 104, 1);


INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(401, 201, 301, '2023-09-05'),
(402, 202, 302, '2022-09-10'),
(403, 203, 303, '2023-01-20'),
(404, 204, 304, '2022-09-15'),
(405, 205, 305, '2021-09-20');
