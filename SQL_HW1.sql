1)

CREATE TABLE book(
    book_id INT PRIMARY KEY AUTO_INCREMENT, 
	title   VARCHAR(50), 
    author  VARCHAR(30), 
	price   DECIMAL(8,2), 
    amount  INT
    );

2)

INSERT INTO  book (title, author, price ,amount)
     VALUES  ('Мастер и Маргарита', 'Булгаков М.А.',670.99,3);



SELECT * 
  FROM book
  
3)

INSERT INTO book (title, author, price, amount)
     VALUES ('Белая гвардия', 'Булгаков М.А.', 540.50, 5);
INSERT INTO book (title, author, price, amount)
     VALUES ('Идиот', 'Достоевский Ф.М.', 460.00, 10);
INSERT INTO book (title, author, price, amount)
     VALUES ('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2);

SELECT * 
  FROM book
 
4)

SELECT author, title, price
  FROM book
  
5)

SELECT title AS Название, author AS Автор
  FROM book
  
6)

SELECT title, amount, 1.65*amount AS pack
  FROM book
  
7)

SELECT  title, author, amount, 
 ROUND  ((price*70/100),2) AS new_price       
  FROM  book;

8)

SELECT author, title,
 ROUND (IF (author='Булгаков М.А.', price*1.1, IF (author='Есенин С.А.', price*1.05, price*1)),2) 
    AS new_price
  FROM book
  
9)

SELECT author, title, price
  FROM book
 WHERE amount <10

10)

SELECT title, author, price, amount
  FROM book
 WHERE (price <500 OR price >600) AND price*amount >=5000;
 
11)

SELECT title, author
  FROM book
 WHERE (price BETWEEN 540.50 AND 800) AND (amount IN ( 2,3,5,7));
 
12)

  SELECT author, title
    FROM book
   WHERE amount BETWEEN 2 AND 14
ORDER BY author DESC ,title ASC

13)

  SELECT title, author
    FROM book
   WHERE title  LIKE "%_ _%" AND
         author LIKE "%С.%"
ORDER BY title 

14)

SELECT DISTINCT amount
           FROM book
		   
15)

  SELECT author AS Автор , COUNT(amount) AS Различных_книг, SUM(amount) AS Количество_экземпляров
    FROM book
GROUP BY author;

16)

  SELECT author, MIN(price) AS Минимальная_цена, MAX(price) AS  Максимальная_цена, AVG(price) AS Средняя_цена
    FROM book
GROUP BY author;

17)

  SELECT author, SUM(price*amount) AS Стоимость, 
   ROUND ((SUM(price*amount)*0.18)/1.18, 2) AS НДС, 
   ROUND ((SUM(price*amount))/1.18, 2) AS Стоимость_без_НДС
    FROM book
GROUP BY author; 

18)

 SELECT  MIN(price) AS Минимальная_цена, MAX(price) AS Максимальная_цена,
  ROUND (AVG(price), 2) AS  Средняя_цена
   FROM book
   
19)

SELECT ROUND(AVG(price), 2) AS Средняя_цена, 
   SUM(price*amount) AS Стоимость
  FROM book
 WHERE amount  BETWEEN 5 AND 14;
 
20)

  SELECT author, SUM(price*amount) AS Стоимость
    FROM book
   WHERE title <> 'Идиот' AND title <> 'Белая гвардия'
GROUP BY author
  HAVING SUM(price*amount) >5000
ORDER BY SUM(price*amount) DESC