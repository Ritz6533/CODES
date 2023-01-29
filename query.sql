	--GROUP 7
	--	RITESH JUNG SHAH
	--	RUPAK DAHAL
	--	DIPESH DHUNGANA
	--	RAHUL AHMED SEZAN 

--Format the columns
COLUMN street FORMAT A30;
COLUMN city FORMAT A20;
COLUMN country FORMAT A20;
-------------------------------
--Querying addresses where locations exist
--Usage of INTERSECT
SELECT a.city, a.street, a.country FROM addresses a
INTERSECT
SELECT l.address.city, l.address.street, l.address.country FROM locations l;

--Querying addresses where country is USA
SELECT a.city, a.street, a.country FROM addresses a
WHERE country LIKE '%USA';


--------------------- AMBASSADOR TABLE ------------------

--Query the whole table

--Format the columns
COLUMN firstname FORMAT A10
COLUMN lastname FORMAT A10
COLUMN contact_number FORMAT A15
COLUMN gender FORMAT A15 WOR
COLUMN current_country FORMAT A15 WOR


--Query with  address
SELECT ambassador_id, firstname, lastname, gender, c.contact_number, s.current_address.country AS current_country
FROM ambassadors s, TABLE (s.contact) c ORDER BY ambassador_id;

--Average salary of ambassador
SELECT AVG(salary) FROM ambassadors;

--Highest salary of ambassador
SELECT MAX(salary) FROM ambassadors;

--Ambassador having highest salary
SELECT s.ambassador_id, s.firstname, s.lastname, s.salary
FROM ambassadors s
WHERE s.salary IN(
	SELECT MAX(salary) FROM ambassadors);

--Lowest salary of ambassador
SELECT MIN(salary) FROM ambassadors;

--Ambassador having lowest salary
SELECT s.ambassador_id, s.firstname, s.lastname, s.salary
FROM ambassadors s
WHERE s.salary IN(
	SELECT MIN(salary) FROM ambassadors);

--Ambassador not having lowest salary
SELECT s.ambassador_id, s.firstname, s.lastname, s.salary
FROM ambassadors s
WHERE s.salary NOT IN(
	SELECT MIN(salary) FROM ambassadors);

--Total ambassador salary
SELECT SUM(salary) FROM ambassadors;

--Number of ambassadors
SELECT COUNT(ambassador_id) FROM ambassadors;

--Ambassadors email and number whose salary is less than 50000.

COLUMN email HEADING 'Email'
COLUMN salary HEADING 'Salary'
COLUMN contact_number HEADING 'Number'
SELECT a.email, a.salary, c.contact_number
FROM ambassadors a,  TABLE(a.contact) c
WHERE salary <50000;

--Using Between to find ambassador firstname (A-H)
SELECT 	ambassador_id, firstname, lastname, email
FROM 	ambassadors
WHERE 	firstname BETWEEN 'A%' AND 'H%';

-------------------------------
--Most Expensive Location
SELECT l.location_id, l.address.street AS street, l.address.city  AS city, l.address.country  AS country, l.capacity, l.price
FROM locations l
WHERE l.price IN(
	SELECT MAX(price) FROM locations);

--Cheapest Location
SELECT l.location_id, l.address.street AS street, l.address.city  AS city, l.address.country  AS country, l.capacity, l.price
FROM locations l
WHERE l.price IN(
	SELECT MIN(price) FROM locations);

--Location with highest capacity
SELECT l.location_id, l.address.street AS street, l.address.city  AS city, l.address.country  AS country, l.capacity, l.price
FROM locations l
WHERE l.capacity IN(
	SELECT MAX(capacity) FROM locations);

--Location with lowest capacity
SELECT l.location_id, l.address.street AS street, l.address.city  AS city, l.address.country  AS country, l.capacity, l.price
FROM locations l
WHERE l.capacity IN(
	SELECT MIN(capacity) FROM locations);

--Location between 100 and 500 capacity
SELECT l.location_id, l.address.street AS street, l.address.city  AS city, l.address.country  AS country, l.capacity, l.price
FROM locations l
WHERE  l.capacity 
BETWEEN 100 AND 500;

--Location in USA
SELECT l.location_id, l.address.street AS street, l.address.city  AS city, l.address.country  AS country, l.capacity, l.price
FROM locations l
WHERE l.address.country LIKE '%USA';

-------------------------------


--Experience Nature Id which currently has no location.
COLUMN experience_nature_id HEADING 'Experience nature ID'
SELECT experience_nature_id FROM experience_natures
INTERSECT
SELECT experience_nature_id FROM experiences
MINUS 
SELECT location_id FROM experiences;


-- union of names of experience and experience nature.
SELECT name FROM experience_natures
UNION
SELECT experience_name FROM experiences


--Using JOIN to link three different tables
SELECT a.ambassador_id, a.email, e.experience_ambassador_id, e.experience_nature_id, l.capacity
FROM ambassadors a JOIN experience_ambassadors e
ON a.ambassador_id = e.ambassador_id 
JOIN locations l
ON e.location_id  = l.location_id;

--Using Between to find ambassador firstname (A-H)
SELECT 	ambassador_id, firstname, lastname, email
FROM 	ambassadors
WHERE 	lastname BETWEEN 'A%' AND 'H%';

--More queries
SELECT 	ambassador_id, firstname,gender, salary
FROM 	ambassadors
WHERE 	firstname BETWEEN 'A%' AND 'P%'
AND 	salary BETWEEN 1000 AND 29000
AND 	gender = 'M';

--locations of different experiences
SELECT COUNT (location_id),experience_name
FROM experiences
GROUP BY experience_name;

