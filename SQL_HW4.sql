1)
 
  SELECT title, name_genre, price
    FROM  genre INNER JOIN book
      ON  book.genre_id = genre.genre_id
   WHERE amount>8
ORDER BY price DESC;

2)

SELECT name_genre
  FROM genre LEFT JOIN book
    ON book.genre_id = genre.genre_id
 WHERE book.genre_id is Null;

3)

  SELECT name_city, name_author,
DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 365) DAY) AS Дата
    FROM  city, author
ORDER BY 1, 3 DESC;

4)

    SELECT name_genre, title, name_author
      FROM   author 
INNER JOIN  book ON author.author_id = book.author_id
INNER JOIN genre ON genre.genre_id = book.genre_id
     WHERE name_genre ='Роман'
  ORDER BY title;
  
5)

  SELECT name_author, SUM(amount) AS "Количество" 
    FROM author LEFT JOIN book    
      ON author.author_id = book.author_id 
GROUP BY name_author 
  HAVING Количество < 10 OR COUNT(title) = 0
ORDER BY Количество; 

6)

SELECT DISTINCT name_author
           FROM author
      LEFT JOIN book ON author.author_id = book.author_id
      LEFT JOIN (
         SELECT author_id, AVG(genre_id) AS avg_genre
           FROM book
       GROUP BY author_id
           ) AS avg_genres ON author.author_id = avg_genres.author_id
          WHERE genre_id = avg_genre;

7)
	
    SELECT book.title AS Название, name_author AS Автор, SUM(book.amount + supply.amount) AS Количество
      FROM 
    author 
INNER JOIN book USING (author_id)   
INNER JOIN supply ON book.title = supply.title 
                         AND author.name_author = supply.author
     WHERE book.price = supply.price
  GROUP BY book.title, name_author;	
  
8)

INSERT INTO author (name_author)
     SELECT supply.author
       FROM author 
 RIGHT JOIN supply ON author.name_author = supply.author
      WHERE name_author IS Null;

SELECT * FROM author;


