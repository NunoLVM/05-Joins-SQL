-- ### 📌 Q1 – Etudiants les plus jeunes  
--Afficher les étudiants les plus jeunes

SELECT first_name, last_name, birth_year
FROM Student
WHERE birth_year = (SELECT MAX(birth_year) FROM Student);


--### 📌 Q2 – Moyenne générale des examens  
--Afficher la moyenne générale des examens pour chaque étudiant

 
SELECT first_name, last_name,
(SELECT AVG(score) 
FROM Exam 
WHERE Exam.student_id = Student.student_id) AS moyenne
FROM Student;

--### 📌 Q3 – Meilleure note en Développement Web  
--Afficher les étudiants ayant obtenu **la meilleure note** dans le cours _Développement Web_.

SELECT s.first_name, s.last_name, e.score
FROM student AS s
JOIN Exam AS e ON s.student_id = e.student_id
WHERE e.course_id = 1 
    AND e.score = (SELECT MAX(score) FROM Exam 
    WHERE course_id = 1);


SELECT s.first_name, s.last_name, e.score
FROM student AS s
JOIN Exam AS e ON s.student_id = e.student_id
JOIN Course AS c ON s.course_id = c.course_id
WHERE c.course_name = 'Developpement Web'
    AND e.score =  (SELECT MAX(score) FROM Exam 
    JOIN Course ON e.course_id = c.course_id
    WHERE c.course_name = 'Developpement Web');

