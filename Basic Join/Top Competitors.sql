Select  Submissions.hacker_id , hackers.name     
from Submissions Submissions 
INNER JOIN Challenges Challenges ON Submissions.Challenge_id = Challenges.Challenge_id
INNER JOIN Difficulty  Difficulty ON Difficulty.difficulty_level = Challenges.difficulty_level
INNER JOIN Hackers hackers  ON Submissions.hacker_id = hackers.hacker_id
WHERE Submissions.score = Difficulty.score
GROUP BY    Submissions.hacker_id  , hackers.name having count (*) > 1
order by count (*) desc , Submissions.hacker_id  asc  
