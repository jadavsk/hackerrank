
with t1 as (
Select  Submissions.hacker_id , Submissions.Challenge_id , MAX (Submissions.score) as MX_Score
from Submissions Submissions 
GROUP BY    Submissions.hacker_id , Submissions.Challenge_id )
    
select  t1.hacker_id, Hackers.name , SUM (MX_Score) as Total_Score from t1 t1 
inner join Hackers Hackers ON Hackers.hacker_id = t1.hacker_id
group by t1.hacker_id, Hackers.name having SUM (MX_Score) > 0
order by SUM (MX_Score) desc, hacker_id asc
