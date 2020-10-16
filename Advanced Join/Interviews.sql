WITH 

Subs as (
select  challenge_id as ci, SUM( total_submissions) as tsb, SUM(total_accepted_submissions) as  tas 
from Submission_Stats  
Group by challenge_id   having ( 
SUM( total_submissions) != 0 AND  SUM( total_accepted_submissions) != 0  )
)

,Vws as ( 
select  challenge_id as ci ,   SUM( total_views) as tv , SUM( total_unique_views) as tuv
from View_Stats 
Group by  challenge_id   having (  SUM( total_views) != 0 AND SUM( total_unique_views) != 0 ) )

, Con As (
select co.contest_id as conid,   ch.Challenge_id as Chall_id from Colleges co
Inner Join Challenges ch ON co.college_id = ch.college_id )


, total as (    
select Con.conid as conid ,  SUM( Subs.tsb ) as tsb , SUM( Subs.tas  ) tas  , SUM( Vws.tv ) as tv , SUM( Vws.tuv )  as tuv
from Con Con
Left outer Join  Subs  Subs ON Con.Chall_id = Subs.ci
Left outer Join  Vws  Vws ON Con.Chall_id = Vws.ci
Group by Con.conid )

select Contests.contest_id, Contests.hacker_id, Contests.name, total.tsb  , total.tas , total.tv , total.tuv from total total
inner join Contests  Contests ON total.conid = Contests.contest_id
order by Contests.contest_id





