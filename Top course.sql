DROP TABLE IF EXISTS courses CASCADE ;

CREATE TABLE courses(
course_id SERIAL PRIMARY KEY ,
    course_name VARCHAR (50) NOT NULL,
    progress NUMERIC (5 , 2)
);

INSERT INTO courses (course_name, progress) VALUES
                                                ('Java Development' , 95.00),
                                                ('Data Science', 90.00),
                                                ('Web Development', 70.00),
                                                ('Web Development', 65.25),
                                                ('Cyber Security', 95.00),
                                                ('Cyber Security', 88.00);


SELECT
    course_name,
AVG (progress) AS orta_progress
FROM
    courses
GROUP BY
    course_name
ORDER BY
    orta_progress DESC

