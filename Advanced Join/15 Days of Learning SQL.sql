 WITH 
 
DR as (
select  hacker_id , submission_date
, dense_rank() over (partition by hacker_id order by submission_date  ) as dr
from Submissions 
 )
, DRC as  (
select   submission_date , Count (distinct hacker_id) as chk from DR
WHERE DAY(submission_date) = DR
group by submission_date --order by submission_date 
)
, HKR as (
select submission_date ,hacker_id , count(submission_id) as scnt
from Submissions
group by submission_date ,hacker_id
)

,hkr1 as (
select HKR.submission_date , HKR.hacker_id , HKR.scnt , Hackers.name
, RANK() over (partition by submission_date order by scnt desc,HKR.hacker_id ) as MRN
from HKR  HKR Inner join Hackers Hackers ON Hackers.hacker_id = HKR.hacker_id 
--order by submission_date ,hacker_id ,  scnt desc
)

select hkr1.submission_date , chk , hkr1.hacker_id , name
from hkr1 hkr1 inner join DRC DRC ON DRC.submission_date = hkr1.submission_date
where MRN = 1
order by  hkr1.submission_date 
 
