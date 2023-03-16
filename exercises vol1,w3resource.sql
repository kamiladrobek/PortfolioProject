--SQL EXERCISES W3RESOURCE VOL1- RETRIEVE DATA FROM TABLES

--1.Looking at all the information about all salespeople
SELECT *
FROM salesman;

--2.Display a string "This is SQL Exercise"
SELECT 'This is SQL Exercise';

--3.Display three numbers in the three columns.
SELECT 5, 10, 15;

--4.Display the sum of two numbers 10 and 15 from the RDBMS server.
SELECT SUM(10+15);
--alternative
SELECT 10+15;

--5.Display the result ot an arithmetic expression.
SELECT 20+4*2-1;

--6.Display specific columns such as names and comissions for all salespeople.
SELECT name, comission
FROM salesman;

--7.Display the columns in a specific order
SELECT order_date, salesman_id, ord_no
FROM orders;

--8.Indentify the unique salespeople Id.
SELECT DISTINCT salesman_id
FROM orders;

--9.locate salespeople who live in the city of 'Paris'. Return salesperson's name, city.
SELECT name, city
FROM salesman
WHERE city='Paris';

--10.SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id.
SELECT customer_id, cust_name, city, grade, salesman_id 
FROM customer
WHERE grade=200;

--11.find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt.
SELECT ord_no, ord_date, purch_amt
FROM orders
WHERE salesperson_id= 5001;

--12.find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner. 
SELECT year, subject, winner
FROM nobel_win
WHERE year=1970

--13. find the Nobel Prize winner in ‘Literature’ for 1970. Return winner
SELECT winner
FROM nobel_win
WHERE subject='Literature' AND year=1970;

--14.locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject
SELECT year, subject
FROM nobel_win
WHERE winner='Dennis Gabor';

--15.find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner.
SELECT winner
FROM nobel_win
where subject='Physics' AND year>=1950;

--16.find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. Begin and end values are included. Return year, subject, winner, and country.
SELECT winner, year, subject, country
FROM nobel_win
WHERE subject='chemistry'
AND year>= 1965 AND year<=1975;

--17.display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.
SELECT *
FROM nobel_win
WHERE year> 1972
AND winner IN ('Menachem Begin', 'Yitzhak Rabin');

--18.Retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category. 
SELECT year, subject, winner, country, category
From nobel_win
WHERE winner LIKE 'louis%';

--19.SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category.
SELECT *
from nobel_win
WHERE (Subject='Physics' AND year=1970)
UNION 
(SELECT * FROM nobel_win WHERE (subject='Economics' AND year=1971));


--20.SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category. 
SELECT *
FROM nobel_win
WHERE year=1970 AND subject NOT IN ('Physiology','Economics');

--21.SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category.
SELECT *
FROM nobel_win
WHERE (subject='Physiology' AND year<1971)
UNION
(SELECT *
FROM nobel_win
WHERE (subject='Peace' AND year>=1974));

--22.SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.
SELECT *
FROM nobel_win
WHERE winner='Johannes Georg Bednorz';

--23.SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending.  
SELECT *
FROM noble_win
WHERE subject NOT LIKE 'P%'
ORDER BY year DESC, winner;

--24.SQL query to find the details of 1970 Nobel Prize winners. Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category.
SELECT *
FROM nobel_win
WHERE year=1970 
ORDER BY
 CASE
    WHEN subject IN ('Economics','Chemistry') THEN 1
    ELSE 0
 END ASC,
 subject,
 winner;

 --25. SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com.
 SELECT *
 FROM item_mast
 WHERE PRICE BETWEEN 200 and 600;

 --26.SQL query to calculate the average price for a manufacturer code of 16. Return avg.
SELECT AVG(pro_price) 
FROM item_mast 
  WHERE pro_com=16;

--27.SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.' 
SELECT pro_name AS 'Item Name', pro_priceas AS 'price in RS'
FROM item_mast;

--28.SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price. 
SELECT pro_name, pro_price
FROM item_mast
WHERE price>= 250
ORDER BY pro_price DESC, pro_name;

--29.SQL query to calculate average price of the items for each company. Return average price and company code.
SELECT AVG(pro_price), pro_com
FROM item_mast
GROUP BY pro_com;

--30.SQL query to find the cheapest item(s). Return pro_name and, pro_price.
SELECT pro_price, pro_name
FROM item_mast
WHERE pro_price= (SELECT MIN(pro_price) FROM item_mast);


--31.SQL query to find the unique last name of all employees. Return emp_lname.
SELECT DISTINCT(emp_name)
FROM emp_details;

--32.SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept.
SELECT *
from emp_details
WHERE emp_lname='Snares';

--33.SQL query to retrieve the details of the employees who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept.
SELECT *
from emp_details
WHERE emp_dept=57;
