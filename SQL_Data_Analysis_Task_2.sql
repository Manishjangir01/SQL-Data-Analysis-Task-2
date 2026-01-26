
-- SQL Data Analysis Internship – Task 2
-- Student Management Database Extension

-- Students table (from Task 1)
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

-- Courses table
CREATE TABLE courses (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Enrollments table
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Sample Data for students
INSERT INTO students VALUES
(1, 'Rahul', 20),
(2, 'Neha', 21),
(3, 'Amit', 22),
(4, 'Pooja', 20);

-- Sample Data for courses
INSERT INTO courses VALUES
(1, 'Mathematics'),
(2, 'Computer Science'),
(3, 'English');

-- Sample Data for enrollments
INSERT INTO enrollments VALUES
(1, 1, 78),
(1, 2, 85),
(2, 1, 35),
(2, 3, 40),
(3, 2, 92),
(3, 3, 88),
(4, 1, 25);

-- Query 1: List all students enrolled in each course
SELECT s.name AS student_name, c.name AS course_name
FROM enrollments e
JOIN students s ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id;

-- Query 2: Average grade per course
SELECT c.name AS course_name, AVG(e.grade) AS avg_grade
FROM enrollments e
JOIN courses c ON e.course_id = c.id
GROUP BY c.name;

-- Query 3: Top 3 students overall
SELECT s.name AS student_name, AVG(e.grade) AS avg_grade
FROM enrollments e
JOIN students s ON e.student_id = s.id
GROUP BY s.name
ORDER BY avg_grade DESC
LIMIT 3;

-- Query 4: Count students who failed (grade < 40)
SELECT COUNT(DISTINCT student_id) AS failed_students
FROM enrollments
WHERE grade < 40;
