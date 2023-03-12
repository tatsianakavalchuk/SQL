1)

  SELECT author, title, price
    FROM book
   WHERE price <= 
           ( SELECT AVG(price) 
             FROM book)
ORDER BY  price DESC;

2)

  SELECT author, title, price
    FROM book
   WHERE ABS(price-(SELECT MIN(price) FROM book))<=150
ORDER BY price ASC;

3)

SELECT author, title, amount
  FROM book
 WHERE amount     IN (
              SELECT amount
                FROM book 
            GROUP BY amount
        HAVING COUNT(amount) = 1 );
		
4)

SELECT author, title , price 
  FROM book
 WHERE price < ALL (
               SELECT AVG(price)
               FROM book
               GROUP BY author);
			 
5)

SELECT title, author, amount,
      ((SELECT MAX(amount)
                      FROM book)-amount) AS Заказ
                      FROM book
                     WHERE amount < (SELECT MAX(amount) FROM book);
                    
6)

CREATE TABLE supply 
(supply_id INT PRIMARY KEY AUTO_INCREMENT,
               title VARCHAR(50), author VARCHAR(30),
               price DECIMAL(8, 2), amount INT);
			   
7)

INSERT INTO supply (title, author, price, amount) 
VALUES    ('Лирика', 'Пастернак Б.Л.', 518.99, 2),
          ('Черный человек', 'Есенин С.А.',	570.20,	6),
          ('Белая гвардия',	'Булгаков М.А.', 540.50, 7),
          ('Идиот',	'Достоевский Ф.М.',	360.80,	3);

SELECT*
FROM supply

8)

INSERT INTO book (title, author , price, amount )
     SELECT title , author , price, amount 
       FROM supply
      WHERE author NOT LIKE "Бул%" AND author NOT LIKE "Дост%";

SELECT * FROM book;
	 
9)

INSERT INTO book (title, author, price, amount)
     SELECT title, author, price, amount
       FROM supply
      WHERE author NOT IN (SELECT author FROM book);

SELECT * FROM book;

10)

UPDATE book
   SET price=0.9*price
 WHERE amount BETWEEN 5 AND 10;

SELECT * FROM book;

11)

UPDATE book
   SET price = IF(buy=0, 0.9*price, price),
       buy = IF(buy > amount, amount, buy);

SELECT * FROM book;

12)

UPDATE book, supply 
   SET book.amount = book.amount + supply.amount, 
       book.price= (book.price + supply.price)/2
 WHERE book.title = supply.title AND book.author = supply.author;

SELECT * FROM book;

13)

DELETE FROM supply
      WHERE author  IN (     SELECT author 
                    	       FROM book 
						   GROUP BY author
					    HAVING  SUM(amount) > 10); 

SELECT * FROM supply;

14)

 CREATE TABLE ordering AS
       SELECT author, title,
(SELECT ROUND (AVG(amount)) FROM book) AS amount
         FROM book
        WHERE amount<(SELECT ROUND(AVG(amount)) FROM book);

SELECT * FROM ordering;



