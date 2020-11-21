-----------------------------------------------------------------------------------------
--Please enter your SQL queries to Question 1.1-1.10 
--Please input your UID here: U6826541
------------------------------------------------------------------------------------------

-- Q1.1
SELECT  first_name,last_name,id
FROM person
WHERE year_born = 1945;






-- Q1.2
SELECT COUNT(country)
FROM movie
WHERE country = 'USA' ;





-- Q1.3
SELECT title
FROM movie
WHERE major_genre = 'comedy' AND production_year = 1993;


-- Q1.4
SELECT COUNT(*)
FROM (SELECT COUNT(id)
            FROM director d,movie m
            WHERE major_genre = 'action' AND M.title = d.title AND m.production_year = d.production_year
            GROUP BY d.id) e;







-- Q1.5

SELECT title,production_year,COUNT(*) AS number
FROM movie_award
WHERE result = 'won'
GROUP BY title,production_year
HAVING COUNT(*) >=2
ORDER BY number;







-- Q1.6

SELECT COUNT(*)
FROM director d1
WHERE d1.title NOT IN (SELECT d2.title
	                       FROM director_award d2
                                        WHERE d2.result = 'won');

 




-- Q1.7

SELECT w.id,w.title,w.production_year
FROM writer w,role r
WHERE w.id = r.id AND w.title = r.title AND w.production_year = r. production_year;






-- Q1.8

SELECT MAX(a.num)
FROM (SELECT COUNT(*) AS num,title,production_year
            FROM crew
            GROUP BY title,production_year) AS a;






-- Q1.9

SELECT id,first_name,last_name
FROM person
WHERE id in (SELECT d.id
FROM director d INNER JOIN (SELECT title,production_year
			FROM (SELECT title,production_year,COUNT(*) AS num
           			            FROM scene s
            			            GROUP BY title,production_year) AS a
			WHERE num = (SELECT MAX(num)
	         			         FROM (SELECT title,production_year,COUNT(*) AS num
	         	   			    FROM scene s
	         	   			    GROUP BY title,production_year) AS b)) AS p
ON p.title = d.title AND p.production_year = d.production_year);

-- Q1.10
SELECT id
FROM writer w
WHERE w.id NOT IN (SELECT id
		  FROM director) AND w.id NOT IN (SELECT id 
					         FROM crew)
UNION ALL
SELECT id
FROM director d
WHERE d.id NOT IN (SELECT id
		  FROM writer) AND d.id NOT IN (SELECT id 
					         FROM crew)
UNION ALL
SELECT id
FROM crew c
WHERE c.id NOT IN (SELECT id
		  FROM director) AND c.id NOT IN (SELECT id 
					         FROM writer)
UNION ALL
SELECT id
FROM director d
WHERE d.id in (SELECT id
	        FROM writer) AND d.id IN (SELECT id
				      FROM crew);









----------------------------------------------------------------
-- End of your answers
-----------------------------------------------------------------
