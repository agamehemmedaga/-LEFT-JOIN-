DROP TABLE IF EXISTS teachers_courses CASCADE ;
DROP TABLE IF EXISTS teachers CASCADE ;
DROP TABLE IF EXISTS courses CASCADE ;

CREATE TABLE teachers(
    teacher_id SERIAL PRIMARY KEY,
    teacher_fullname VARCHAR(50)NOT NULL
);

CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR (50) NOT NULL
);

CREATE TABLE teachers_courses(
    teacher_id INT REFERENCES  teachers(teacher_id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE ,
    PRIMARY KEY (teacher_id , course_id),

    CONSTRAINT unique_teacher_course UNIQUE (teacher_id , course_id),
    CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES teachers (teacher_id) ON DELETE CASCADE,
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses (course_id) ON DELETE CASCADE
);

INSERT INTO teachers VALUES
                         (1 , 'Elikram Babayev'),
                         (2, 'Eli Qemberov'),
                         (3, 'Melik Melikzade');

INSERT INTO courses VALUES
                        (45 , 'Java Development'),
                        (25, 'Fronted'),
                        (30,'Python');

INSERT INTO teachers_courses (teacher_id, course_id) VALUES
                                                         (2 ,45),
                                                         (3,30),
                                                         (1,25);

SELECT
    t.teacher_fullname AS "Teacher_fullname",
    c.course_name AS "Course_name"

FROM teachers_courses tc

INNER JOIN teachers t ON tc.teacher_id = t.teacher_id
INNER JOIN courses c ON tc.course_id = c.course_id




