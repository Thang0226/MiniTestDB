CREATE DATABASE QuanLyHocVien;

USE QuanLyHocVien;

CREATE TABLE Address (
	id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(50) NOT NULL
);

CREATE TABLE Class (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    language VARCHAR(20) NOT NULL,
    description TEXT
);

CREATE TABLE Student (
	id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(20) NOT NULL,
    address_id INT NOT NULL,
    age INT,
    phone VARCHAR(15) UNIQUE,
    class_id INT NOT NULL,
    FOREIGN KEY (address_id) REFERENCES Address(id),
    FOREIGN KEY (class_id) REFERENCES Class(id)
);

CREATE TABLE Course (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE Point (
	id INT PRIMARY KEY AUTO_INCREMENT,
	course_id INT NOT NULL,
    student_id INT NOT NULL,
    point INT
);

INSERT INTO Address (address)
VALUES 
    ('123 Main Street'),
    ('456 Elm Avenue'),
    ('789 Oak Boulevard'),
    ('321 Pine Road'),
    ('654 Maple Lane');
    
INSERT INTO Class (name, language, description)
VALUES
    ('Web Dev', 'JavaScript', 'Learn to create interactive web applications using JavaScript.'),
    ('Data Science', 'Python', 'An introductory course to data analysis and visualization using Python.'),
    ('AI Basics', 'Python', 'Fundamentals of artificial intelligence and machine learning concepts.'),
    ('Frontend Design', 'HTML & CSS', 'Master the art of designing responsive and user-friendly websites.'),
    ('Database Management', 'SQL', 'Understand relational databases and how to query them using SQL.');
    
INSERT INTO Student (fullname, address_id, age, phone, class_id)
VALUES
    ('Alice Johnson', 1, 20, '1234567890', 1),
    ('Bob Smith', 2, 22, '0987654321', 2),
    ('Charlie Brown', 3, 19, '1112223333', 3),
    ('Diana Prince', 4, 21, '2223334444', 4),
    ('Edward Elric', 5, 23, '3334445555', 5),
    ('Fiona Black', 1, 20, '4445556666', 1),
    ('George White', 2, 22, '5556667777', 2),
    ('Hannah Green', 3, 19, '6667778888', 3),
    ('Ian Gray', 4, 21, '7778889999', 4),
    ('Jane Doe', 5, 20, '8889990000', 5);
    
INSERT INTO Course (name, description)
VALUES
    ('HTML Basics', 'Introduction to HTML, the backbone of web pages.'),
    ('CSS Fundamentals', 'Learn to style web pages with CSS.'),
    ('JavaScript Basics', 'Get started with JavaScript programming.'),
    ('Advanced JavaScript', 'Deep dive into advanced JavaScript concepts.'),
    ('Python for Beginners', 'Introduction to programming with Python.'),
    ('Python Data Analysis', 'Learn to analyze data with Python libraries.'),
    ('Machine Learning', 'Explore the basics of machine learning.'),
    ('Deep Learning', 'Introduction to neural networks and deep learning.'),
    ('SQL for Databases', 'Learn to query databases using SQL.'),
    ('Web Development', 'Build full-stack web applications.'),
    ('Mobile App Development', 'Create mobile applications using modern tools.'),
    ('React Basics', 'Learn React for building UI components.'),
    ('Node.js Fundamentals', 'Understand backend development with Node.js.'),
    ('Data Visualization', 'Create stunning visualizations with tools like Matplotlib and D3.js.'),
    ('Cybersecurity Basics', 'Understand the fundamentals of cybersecurity.'),
    ('DevOps Essentials', 'Learn the basics of DevOps practices and tools.'),
    ('Cloud Computing', 'Introduction to cloud services and architectures.'),
    ('Artificial Intelligence', 'Explore AI concepts and their applications.'),
    ('Natural Language Processing', 'Learn NLP techniques and tools.'),
    ('Project Management', 'Understand key project management methodologies.');
    
INSERT INTO Point (course_id, student_id, point)
VALUES
    (1, 1, 85),
    (2, 1, 90),
    (3, 2, 78),
    (4, 2, 88),
    (5, 3, 92),
    (6, 3, 81),
    (7, 4, 75),
    (8, 4, 89),
    (9, 5, 94),
    (10, 5, 87),
    (11, 6, 77),
    (12, 6, 84),
    (13, 7, 88),
    (14, 7, 79),
    (15, 8, 91);
    


SELECT id, fullname 
FROM student
WHERE fullname LIKE "nguyen %";

SELECT id, fullname 
FROM student
WHERE fullname LIKE "% anh";

SELECT id, fullname, age
FROM student
WHERE age BETWEEN 18 AND 25;

SELECT id, fullname
FROM student
WHERE id IN (12, 13);



SELECT  c.name AS 'Class', COUNT(s.id) AS 'Number of students'
FROM student s
JOIN class c ON s.class_id = c.id
GROUP BY c.id;

INSERT INTO Student (fullname, address_id, age, phone, class_id) VALUES
	("Nguyen Duc Anh", 1, 30, '0333666999', 5);

SELECT SUBSTRING(a.address,5) AS Address, COUNT(s.id) AS 'Number of students'
FROM student s
JOIN address a ON s.address_id = a.id
GROUP BY Address;

SELECT course.id, course.name, ROUND(AVG(point.point)) AS AveragePoint
FROM course
LEFT JOIN point ON course.id = point.course_id
GROUP BY course.id;

SELECT MAX(point) AS 'Highest point', MIN(point) AS 'Lowest point' 
FROM point;

SELECT * 
FROM student;

SELECT UCASE(fullname) FROM student;

SELECT course.id, course.name AS CourseName, ROUND(AVG(point.point)) AS AveragePoint
FROM course
LEFT JOIN point ON course.id = point.course_id
GROUP BY course.id
HAVING AveragePoint >= ALL(
	SELECT ROUND(AVG(point))
    FROM point
	GROUP BY course_id
);

select * from point;

SELECT course.id, course.name AS CourseName, ROUND(AVG(point.point)) AS AveragePoint
FROM course
LEFT JOIN point ON course.id = point.course_id
GROUP BY course.id
ORDER BY AveragePoint DESC
LIMIT 1;








