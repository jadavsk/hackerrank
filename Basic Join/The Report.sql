/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT  
CASE WHEN Grades.Grade < 8 THEN NULL ELSE Students.Name END AS NAME
, Grades.Grade , Students.Marks 
  FROM Students Students
  Inner  join Grades Grades   
  on Students.Marks between Grades.MIN_MARK and Grades.MAX_MARK
  ORDER BY Grades.Grade desc , Name ASC , Students.Marks  asc


  
