CREATE DATABASE institute_of_management_system;
USE institute_of_management_system;
-- Table: Institute
CREATE TABLE Institute (
    institute_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Table: Course
CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    institute_id INT,
    FOREIGN KEY (institute_id) REFERENCES Institute(institute_id)
);

-- Table: Faculty
CREATE TABLE Faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    institute_id INT,
    FOREIGN KEY (institute_id) REFERENCES Institute(institute_id)
);

-- Table: Student
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    institute_id INT,
    FOREIGN KEY (institute_id) REFERENCES Institute(institute_id)
);

-- Table: Enrollment
CREATE TABLE Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Table: Attendance
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT,
    attendance_date DATE,
    status ENUM('Present', 'Absent'),
    FOREIGN KEY (enrollment_id) REFERENCES Enrollment(enrollment_id)
);

-- Table: Grades
CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT,
    grade DECIMAL(4,2),
    FOREIGN KEY (enrollment_id) REFERENCES Enrollment(enrollment_id)
);



SHOW TABLES;