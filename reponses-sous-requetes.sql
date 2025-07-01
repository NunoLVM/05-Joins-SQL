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

SELECT first_name, last_name, exam
FROM student
JOIN exam on student_id

