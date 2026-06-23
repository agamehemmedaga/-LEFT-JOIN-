DROP TABLE IF EXISTS enrollments CASCADE ;
DROP TABLE IF EXISTS students CASCADE ;
DROP TABLE IF EXISTS courses CASCADE;

CREATE TABLE students(
    student_id SERIAL PRIMARY KEY ,
    student_fullname VARCHAR (50) NOT NULL
);

CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY ,
    course_name VARCHAR (50) NOT NULL
);

CREATE TABLE enrollments(
    enrollments_id SERIAL PRIMARY KEY ,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    progress INT NOT NULL CHECK (progress >=0 and progress <=100),
    progress_date DATE DEFAULT CURRENT_DATE,

    CONSTRAINT unique_student_course UNIQUE (student_id , course_id),

    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students (student_id) ON DELETE CASCADE ,
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses (course_id) ON DELETE CASCADE
);


INSERT INTO students VALUES
                         (1 , 'Cahet Agayev'),
                         (2, 'Banu Asadova'),
                         (3, 'Serdar Babayev');

INSERT INTO courses VALUES
                        (250 , 'Compar Academy'),
                        (240 , 'Jet Academy'),
                        (200, 'Code Academy');

INSERT INTO enrollments (student_id, course_id, progress) VALUES
                                                              (3 , 250 ,  100),
                                                              (1, 200,  85),
                                                              (2 , 240 ,  80);



SELECT
    s.student_fullname AS "Student fullname",
    c.course_name AS "Course name ",
    e.progress
FROM enrollments e
INNER JOIN students s ON e.student_id = s.student_id
INNER JOIN courses c ON e.course_id = c.course_id;





