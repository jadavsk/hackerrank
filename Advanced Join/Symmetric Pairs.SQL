select F1.X , F1.Y from Functions F1
INNER JOIN Functions F2 ON F1.X = F2.Y AND F1.Y = F2.X
where F1.X <= F1.Y 
GROUP BY F1.X , F1.Y HAVING (COUNT(*) > 1 AND F1.X = F1.Y) or (F1.X != F1.Y)
ORDER BY F1.X 
