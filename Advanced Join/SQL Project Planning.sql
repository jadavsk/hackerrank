/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
with t as (
select  Start_Date ,  End_Date  
, row_number() OVER (ORDER BY  Start_Date ) AS RN,
  DAy( Start_Date) - row_number() OVER (ORDER BY  Start_Date ) AS grp
  from  [Projects]  ) 

  select MIN (Start_Date) , MAX (End_Date  )
  from t 
  group by grp order by DATEDIFF ( day ,MIN (Start_Date) , MAX (End_Date  ))  , MIN (Start_Date)
