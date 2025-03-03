QUERIES

1- Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos/as. 
El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.

SELECT apellido1, apellido2, nombre 
FROM persona p 
WHERE p.tipo='alumno'
ORDER BY apellido1 asc, apellido2 asc, nombre asc;

2-Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.

SELECT nombre, apellido1, apellido2
FROM persona p 
WHERE p.tipo = 'alumno' AND telefono IS NULL; 

3-Devuelve el listado de los alumnos que nacieron en 1999.

SELECT nombre, apellido1, apellido2
FROM persona p 
WHERE p.tipo = 'alumno' AND YEAR (p.fecha_nacimiento) = 1989; 

4- Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF termina en K.

SELECT nombre, apellido1, apellido2,nif,telefono 
FROM persona p 
WHERE p.tipo = 'profesor' AND telefono IS NULL AND p.nif LIKE '%K';

5- Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

SELECT * FROM asignatura a
WHERE a.cuatrimestre = 1 AND a.curso = 3 AND a.id_grado = 7;

6-Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados. 
El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. 
El resultado estará ordenado alfabéticamente de menor a mayor por apellidos y nombre.

SELECT prs.apellido1,prs.apellido2,prs.nombre, nombredepartamento 
FROM persona prs JOIN (SELECT prf.id_profesor as idProfesor, dp.nombre as nombredepartamento  
FROM profesor as prf JOIN departamento as dp ON prf.id_departamento=dp.id) dp2  ON prs.id=dp2.idProfesor 
AND prs.tipo='profesor' 
ORDER BY apellido1 ASC,apellido2 ASC,nombre ASC;

7-Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.

SELECT a.nombre AS asignatura, ce.anyo_inicio, ce.anyo_fin FROM asignatura a
JOIN alumno_se_matricula_asignatura ama ON ama.id_asignatura = a.id
JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id
JOIN persona p ON p.id = ama.id_alumno
WHERE p.tipo = 'alumno' AND p.nif = '26902806M';

8- Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

SELECT DISTINCT d.nombre FROM departamento d
JOIN profesor prof ON prof.id_departamento = d.id
JOIN asignatura a ON a.id_profesor = prof.id_profesor
JOIN grado g ON g.id = a.id_grado
WHERE g.nombre = 'enginyeria Informàtica (Pla 2015)';

9- Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

SELECT DISTINCT apellido1, apellido2, nombre
FROM persona p
JOIN alumno_se_matricula_asignatura am ON am.id_alumno = p.id
JOIN curso_escolar ce ON ce.id = am.id_curso_escolar
WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;


Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

1-Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados. 
El listado también debe mostrar aquellos profesores/as que no tienen ningún departamento asociado. 
El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a.
El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y nombre.

SELECT p.apellido1 AS primer_apellido, p.apellido2 AS segundo_apellido, p.nombre, d.nombre AS nombre_departamento
FROM persona p
JOIN profesor prof ON prof.id_profesor = p.id
LEFT JOIN departamento d ON d.id = prof.id_departamento
ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

2- Devuelve un listado con los profesores/as que no están asociados a un departamento.

SELECT dep.nombre as nom_departament, per.apellido1, per.apellido2, per.nombre 
FROM persona per 
left JOIN profesor prf ON per.id=prf.id_profesor 
left JOIN departamento dep ON prf.id_departamento=dep.id 
WHERE dep.nombre IS NULL ORDER BY dep.nombre;


3- Devuelve un listado con los departamentos que no tienen profesores/as asociados.

SELECT * FROM departamento dep 
LEFT JOIN profesor prf ON prf.id_departamento=dep.id 
WHERE prf.id_profesor IS NULL;


4- Devuelve un listado con los profesores/as que no imparten ninguna asignatura.

SELECT * FROM persona per 
LEFT JOIN profesor prf ON per.id=prf.id_profesor 
LEFT JOIN asignatura asig ON prf.id_departamento=asig.id_profesor 
WHERE asig.tipo IS NULL;


5- Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.

SELECT a.nombre AS nombre_asignatura
FROM asignatura a
LEFT JOIN profesor prof ON a.id_profesor = prof.id_profesor
WHERE prof.id_profesor IS NULL;

6- Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

SELECT dep.nombre, asig.curso 
FROM departamento dep 
LEFT JOIN profesor prof ON dep.id=prof.id_departamento 
LEFT JOIN asignatura asig ON prof.id_profesor=asig.id_profesor
WHERE asig.curso IS NULL GROUP BY dep.nombre, asig.curso;



Consultas resumen:

1- Devuelve el número total de alumnos existentes.

SELECT COUNT(*) AS número_de_alumnos 
FROM persona a
WHERE a.tipo = 'alumno';

2- Calcula cuántos alumnos nacieron en 1999.

SELECT COUNT(*) AS número_de_alumnos 
FROM persona a
WHERE a.tipo = 'alumno'AND YEAR(fecha_nacimiento) = 1999;

3- Calcula cuántos profesores/as hay en cada departamento. 
El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores/as que hay en ese departamento.
El resultado sólo debe incluir los departamentos que tienen profesores/as asociados y tendrá que estar ordenado de mayor a menor por el número de profesores/as.

SELECT d.nombre AS nombre_departamento , COUNT(prof.id_profesor) AS número_profesores
FROM departamento d
JOIN profesor prof ON prof.id_departamento = d.id
GROUP BY d.nombre
ORDER BY COUNT(prof.id_profesor) DESC;

4- Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos.
Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también deben aparecer en el listado.

SELECT d.nombre AS nombre_departamento, COUNT(prof.id_profesor) AS número_profesores
FROM departamento d
LEFT JOIN profesor prof ON prof.id_departamento = d.id
GROUP BY d.nombre
ORDER BY COUNT(prof.id_profesor) ASC;

5- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. 
Ten en cuenta que pueden existir grados que carecen de asignaturas asociadas. Estos grados también deben aparecer en el listado. 
El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

SELECT g.nombre AS nombre_grado, COUNT(a.id) AS numero_asignaturas
FROM grado g
LEFT JOIN asignatura a ON a.id_grado = g.id
GROUP BY g.nombre
ORDER BY COUNT(a.id) DESC;

6- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

SELECT g.nombre AS nombre_grado, COUNT(a.id) AS numero_asignaturas
FROM grado g
LEFT JOIN asignatura a ON a.id_grado = g.id
GROUP BY g.nombre
ORDER BY COUNT(a.id) DESC;

7- Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. 
El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que existen de este tipo.

SELECT g.nombre AS nombre_grado, COUNT(a.id) AS numero_asignaturas
FROM grado g
LEFT JOIN asignatura a ON a.id_grado = g.id
GROUP BY g.nombre
HAVING COUNT(a.id) > 40
ORDER BY COUNT(a.id) ASC;

8- Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. 
El resultado tendrá que mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

SELECT ce.anyo_inicio AS anyo_inicio, COUNT(DISTINCT ama.id_alumno) AS numero_alumnos_matriculados
FROM curso_escolar ce
JOIN alumno_se_matricula_asignatura ama ON ama.id_curso_escolar = ce.id
GROUP BY ce.anyo_inicio;

9- Devuelve un listado con el número de asignaturas que imparte cada profesor/a. El listado debe tener en cuenta a aquellos profesores/as que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.

SELECT p.id AS id_profesor, p.nombre AS nombre_profesor, p.apellido1 AS primer_apellido, p.apellido2 AS segundo_apellido, COUNT(a.id) AS número_asignaturas
FROM persona p
JOIN profesor prof ON prof.id_profesor = p.id
JOIN asignatura a ON a.id_profesor = prof.id_profesor
GROUP BY prof.id_profesor;

10- Devuelve todos los datos del alumno/a más joven.

SELECT * FROM persona p
WHERE id >= 1 AND nombre IS NOT NULL AND nombre != '' AND fecha_nacimiento = (SELECT MIN(fecha_nacimiento) 
WHERE tipo = 'alumno') LIMIT 1; 

11- Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.

SELECT profesor.id_profesor AS id, CONCAT(persona.nombre, ' ', persona.apellido1, ' ', persona.apellido2) AS instructor, departamento.nombre AS department, asignatura.id AS subject 
FROM persona 
JOIN profesor ON persona.id = profesor.id_profesor 
LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor 
JOIN departamento ON profesor.id_departamento = departamento.id 
WHERE profesor.id_departamento IS NOT NULL AND asignatura.id IS NULL 
ORDER BY departamento.nombre;

