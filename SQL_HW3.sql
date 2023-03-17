 1)

  SELECT name, city, per_diem, date_first, date_last
    FROM trip
   WHERE name LIKE '%а %'
ORDER BY date_last DESC;

2)

SELECT DISTINCT name
           FROM trip
          WHERE city = 'Москва'
       ORDER BY name ASC;
	   
3)

  SELECT  city, COUNT(city) AS Количество
    FROM trip
GROUP BY city
ORDER BY city;

4)

  SELECT city, COUNT(city) AS Количество
    FROM trip
GROUP BY city
ORDER BY Количество DESC
   LIMIT 2;

5)

  SELECT name, city, DATEDIFF(date_last, date_first)+1 AS Длительность
    FROM trip
   WHERE city <>'Москва' AND city <> 'Санкт-Петербург'
ORDER BY Длительность DESC, city DESC;

6)

SELECT name, city, date_first, date_last
  FROM trip
 WHERE DATEDIFF(date_last, date_first) = (SELECT MIN(DATEDIFF(date_last, date_first)) FROM trip);
 
7)

  SELECT name,  city, date_first, date_last 
    FROM trip
   WHERE MONTH(date_first) = MONTH(date_last)
ORDER BY city ASC, name  ASC;
	   
8)

  SELECT MONTHNAME(date_first) AS Месяц, COUNT(MONTHNAME(date_first))  AS Количество
    FROM trip
GROUP BY MONTHNAME(date_first)
ORDER BY Количество DESC, Месяц ASC;

9)

  SELECT name ,  city , date_first, (DATEDIFF(date_last,date_first)+1)*per_diem AS Сумма
    FROM trip
   WHERE YEAR(date_first)=2020 AND (MONTH(date_first)=3 OR MONTH(date_first)=2)
ORDER BY name ASC, Сумма DESC;

10)

      SELECT name , SUM((DATEDIFF(date_last,date_first)+1)*per_diem) AS Сумма
        FROM trip  
    GROUP BY name
HAVING COUNT(name) > 3
    ORDER BY Сумма DESC;

11)

CREATE TABLE fine(
    fine_id INT PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(30), 
    number_plate VARCHAR(6), 
	violation VARCHAR(50), 
	sum_fine DECIMAL(8,2), 
	date_violation DATE,
	date_payment DATE );
	
12)

INSERT INTO fine ( name , number_plate, violation,sum_fine , date_violation, date_payment)
     VALUES 
	 ( 'Баранов П.Е.', 'Р523ВТ ', 'Превышение скорости(от 40 до 60)', NULL  , '2020-02-14',  NULL ),
     ( 'Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', NULL  , '2020-02-23',  NULL ),
     ( 'Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', NULL  , '2020-03-03',  NULL );

SELECT * FROM fine;

13)

UPDATE fine f, traffic_violation tv
   SET f.sum_fine = tv.sum_fine
 WHERE f.violation = tv.violation AND f.sum_fine IS NULL;

SELECT * FROM fine;

14)

  SELECT name,number_plate,violation 
    FROM fine
GROUP BY name, number_plate,violation 
  HAVING COUNT(violation ) >= 2 
ORDER BY name ASC, number_plate ASC, violation  ASC ;






	   