# S2.02-MySQLqueries-University

## Summary: exercise description
View the E-R diagram in an editor and perform the following queries:

1- Returns a list with the first surname, middle surname and first name of all students. The list must be sorted alphabetically from lowest to highest by first surname, middle surname and first name.
2- Find out the name and both surnames of students who have not registered their telephone number in the database.
3- Returns the list of students who were born in 1999.
4- Returns the list of teachers who have not registered their telephone number in the database and whose NIF ends in K.
5- Returns the list of subjects taught in the first semester, in the third year of the degree that has the identifier 7.
6- Returns a list of teachers along with the name of the department to which they are linked. The list must return four columns, first surname, second surname, name and name of the department. The result will be sorted alphabetically from lowest to highest by surname and name.
7-Return a list with the name of the subjects, start year and end year of the school year of the student with NIF 26902806M.
8- Return a list with the name of all the departments that have professors who teach a subject in the Degree in Computer Engineering (2015 Plan).
9- Return a list with all the students who have enrolled in a subject during the 2018/2019 school year.

Solve the following 6 queries using the LEFT JOIN and RIGHT JOIN clauses.

1-Return a list with the names of all the professors and the departments they are linked to. The list should also show those teachers who do not have any associated department. The list should return four columns, department name, first last name, middle last name and teacher's name. The result will be sorted alphabetically from lowest to highest by department name, last name and first name.
2- Returns a list of teachers who are not associated with a department.
3- Returns a list of departments that do not have associated teachers.
4- Returns a list of teachers who do not teach any subject.
5- Returns a list of subjects that do not have a teacher assigned.
6- Returns a list of all departments that have not taught subjects in any school year.

Summary queries:

1- Returns the total number of students there are.
2- Calculate how many students were born in 1999.
3- Calculate how many teachers there are in each department. The result should only show two columns, one with the name of the department and another with the number of teachers in that department. The result should only include departments that have associated teachers and should be sorted from highest to lowest by the number of teachers.
4- Return a list with all the departments and the number of teachers in each of them. Keep in mind that there may be departments that do not have associated teachers. These departments should also appear in the list.
5- Return a list with the name of all the degrees in the database and the number of subjects that each one has. Keep in mind that there may be degrees that do not have associated subjects. These degrees should also appear in the list. The result must be sorted from highest to lowest by the number of subjects.
6- Returns a list with the name of all the degrees in the database and the number of subjects that each one has, of the degrees that have more than 40 associated subjects.
7- Returns a list that shows the name of the degrees and the sum of the total number of credits that exist for each type of subject. The result must have three columns: name of the degree, type of subject and the sum of the credits of all the subjects that exist of this type.
8- Returns a list that shows how many students have enrolled in a subject in each of the school years. The result must show two columns, one column with the start year of the school year and another with the number of students enrolled.
9- Returns a list with the number of subjects that each teacher teaches. The list must take into account those teachers who do not teach any subject. The result will show five columns: id, name, first name, second name and number of subjects. The result will be sorted from highest to lowest by the number of subjects.
10- Returns all the data of the youngest student.
11- Returns a list with the teachers who have an associated department and who do not teach any subject.

## Technologies Used
Requirements: MySql or MariaDb database.

Installation: Run the sql file in the database prompt.

Execution: Running the sql file will create both the database and the project tables automatically.

Deployment: Download or clone the project and use the sql file.

## Contribution
Contributions are welcome! Please follow these steps to contribute:

-Fork the repository -Create a new branch git checkout -b feature/NewFeature -Make your changes and commit them: git commit -m 'Add New Feature' -Upload the changes to your branch: git push origin feature/NewFeature -Make a pull request

