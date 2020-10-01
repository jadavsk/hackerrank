/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select Name from STUDENTS where Marks > 75
order by substring(Name , len(Name)-2,3), ID ASC
