DROP TABLE IF EXISTS students_courses CASCADE ;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS courses CASCADE ;

CREATE TABLE students(
    student_id SERIAL PRIMARY KEY ,
    student_fullname VARCHAR(50)
);

CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY ,
    course_name VARCHAR(50) NOT NULL
);

CREATE TABLE students_courses(
    student_id INT REFERENCES students (student_id) ON DELETE CASCADE ,
    course_id INT REFERENCES courses (course_id) ON DELETE CASCADE ,
    PRIMARY KEY (student_id , course_id),

    CONSTRAINT unique_student_course_key UNIQUE (student_id , course_id),
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students(student_id)ON DELETE CASCADE ,
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES  courses(course_id) ON DELETE CASCADE
);

INSERT INTO students VALUES
                         (1 , 'Ali Asadov'),
                         (2, 'Zeyneb Bagirova'),
                         (3, 'Vasif Agayev'),
                         (4, 'Ali Aliyev');

INSERT INTO courses VALUES
                        (14 , ' Turk dili '),
                        (47 , 'Rus dili '),
                        (13 , 'Alman dili ');

INSERT INTO students_courses (student_id, course_id) VALUES
                                                         (1 , 47 ),
                                                         (3 , 47),
                                                         (2, 14);


SELECT
    s.student_id AS "Student_id",
    s.student_fullname AS "Student_fullname"

FROM students s
LEFT JOIN students_courses sc ON s.student_id = sc.student_id
WHERE sc.student_id IS NULL


