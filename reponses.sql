-- 🔹 Partie 1 – INNER JOIN
-- 1. Afficher le nom complet de l’étudiant et l’intitulé de sa formation.

SELECT student.first_name, student.last_name 
FROM student 
INNER JOIN course 
ON student.course_id = course.course_id;

-- 2. Lister les étudiants inscrits en "Data Analyst".

SELECT student.first_name, student.last_name, course.course_name 
FROM student 
INNER JOIN course 
ON student.course_id = course.course_id 
WHERE course.course_name = 'Data Analyst';

-- 3. Lister les examens avec le prénom, nom de l’étudiant, le nom du cours, la note et la date.

SELECT s.first_name, s.last_name, c.course_name 
AS formation, e.score, e.exam_date 
FROM exam AS e 
INNER JOIN student AS s 
ON e.student_id = s.student_id 
INNER JOIN course AS c 
ON e.course_id = c.course_id;
 

--🔹 Partie 2 – LEFT JOIN
-- 4. Afficher tous les étudiants avec leur formation, y compris ceux sans formation.

SELECT student.first_name, student.last_name, course.course_name 
FROM student 
LEFT JOIN course 
ON student.course_id = course.course_id;

-- 5. Afficher les étudiants sans formation (champ NULL).

SELECT student.first_name, student.last_name, course.course_name 
FROM student 
LEFT JOIN course 
ON student.course_id = course.course_id 
WHERE course.course_name 
IS NULL;


-- 6. Afficher tous les étudiants avec leurs examens, même s’ils n’en ont pas passé.

SELECT s.first_name, s.last_name, e.exam_type
FROM student AS s
LEFT JOIN exam AS e 
ON s.student_id = e.student_id;



--🔹 Partie 3 – RIGHT JOIN
-- 7. Afficher toutes les formations même si aucun étudiant n'y est inscrit.

SELECT c.course_name, s.first_name, s.last_name
FROM student AS s
RIGHT JOIN course AS c
ON s.course_id = c.course_id;

-- 8. Afficher les examens associés à un cours, y compris les cours sans examens (si possible).

SELECT c.course_name AS formation, e.exam_type AS type_examen 
FROM exam AS e
RIGHT JOIN course  AS c
ON e.course_id = c.course_id;


-- 🔹 Partie 4 – FULL OUTER JOIN
-- 9. Lister toutes les combinaisons étudiant-formation même sans correspondance.

SELECT s.first_name, s.last_name, c.course_name 
FROM student AS s 
LEFT JOIN course AS c 
ON s.course_id = c.course_id 
UNION SELECT s.first_name, s.last_name, c.course_name 
FROM student AS s 
RIGHT JOIN course AS c 
ON s.course_id = c.course_id;

-- 10. Lister tous les examens et étudiants, même si l'un des deux est manquant.

SELECT s.first_name, s.last_name, e.exam_type 
FROM student AS s 
LEFT JOIN exam AS e 
ON s.student_id = e.student_id 
UNION SELECT s.first_name, s.last_name, e.exam_type 
FROM student AS s 
RIGHT JOIN exam AS e 
ON s.student_id = e.student_id;


-- 🔹 Partie 5 – SELF JOIN
-- 11. Trouver les paires d’étudiants nés la même année.

SELECT s1.first_name, s1.last_name, s2.first_name, s2.last_name, s1.birth_year
FROM student AS s1
JOIN student AS s2 
ON s1.birth_year = s2.birth_year
AND s1.student_id < s2.student_id;


-- 12. Associer chaque étudiant à ceux qui sont plus âgés qu’eux.

SELECT s1.first_name, s1.last_name, s2.first_name, s2.last_name 
FROM student AS s1 
JOIN student AS s2 
ON s1.birth_year > s2.birth_year;


-- 🔹 Partie 6 – CROSS JOIN
-- 13. Générer toutes les combinaisons possibles entre étudiants et types d’examen ('Écrit', 'Oral', 'Projet').

SELECT student.first_name, student.last_name, exam.exam_type
FROM student 
CROSS JOIN exam;

-- 14. Compter le nombre de lignes produites par ce CROSS JOIN.

SELECT COUNT(*) AS total_combinaisons
FROM student 
CROSS JOIN exam;


-- ## 🔹 Partie 7 – Aggrégations
-- 15. Afficher la moyenne des notes par étudiant.

SELECT student.first_name, student.last_name,
AVG(exam.score) AS moyenne
FROM student
JOIN exam 
ON student.student_id = exam.student_id
GROUP BY student.student_id;

-- 16. Afficher la note maximale obtenue par cours.

SELECT course.course_name,
MAX(exam.score) AS note_maximale
FROM course
JOIN exam 
ON course.course_id = exam.course_id
GROUP BY course.course_id;

-- 17. Lister les étudiants ayant obtenu une note supérieure à 15 à au moins un examen.

SELECT DISTINCT student.first_name, student.last_name
FROM student
JOIN exam ON student.student_id = exam.student_id
WHERE exam.score > 15;

