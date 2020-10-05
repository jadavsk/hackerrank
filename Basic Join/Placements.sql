select Students.Name 
from Friends Friends 
Inner join Packages Packages ON Friends.ID = Packages.ID
Inner join Packages Packages1 ON Friends.Friend_ID = Packages1.ID
Inner Join Students Students ON Friends.ID =  Students.ID
where Packages1.Salary >  Packages.Salary
order by  Packages1.Salary  
