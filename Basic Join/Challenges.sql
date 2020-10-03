/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
WITH CTE as (
Select  hackers.hacker_id , hackers.name  ,count (hackers.hacker_id  )  as ct ,
ROW_NUMBER() over (partition by count (hackers.hacker_id) order by hackers.name) As RN
from Challenges Challenges 
INNER JOIN Hackers hackers  ON Challenges.hacker_id = hackers.hacker_id
group by hackers.hacker_id , hackers.name
)
Select hacker_id ,  name , ct from CTE
WHERE CT = (Select MAX (CT) from CTE) OR  CT NOT IN (Select  CT  from CTE where RN > 1)
ORDER BY ct desc, hacker_id asc
