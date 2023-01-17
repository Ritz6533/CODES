-- 





--Set linesize to display all the columns in a nice format without title line breaks
SET linesize 125

--Query log details
COLUMN event_date FORMAT A20;
SELECT * FROM login_details ORDER BY event_date ASC;


--Format the columns
COLUMN street FORMAT A30;
COLUMN city FORMAT A20;
COLUMN country FORMAT A20;

--Query whole table
--INITCAP makes the text appear in Camel Case
SELECT INITCAP(street) AS street, city, country FROM addresses;

--Other queries

--Querying addresses where no locations exist or no ambassador live
--Usage of MINUS and UNION
--Help taken from tutorial week 10
SELECT a.city, a.street, a.country FROM addresses a
MINUS(
SELECT s.current_address.city, s.current_address.street, s.current_address.country FROM ambassador s
UNION
SELECT ss.permanent_address.city, ss.permanent_address.street, ss.permanent_address.country FROM ambassador ss
UNION
SELECT l.address.city, l.address.street, l.address.country FROM locations l);
--As expected, the addresses that exist in the locations are only removed as locations used in ambassador table are object types and unique to 
--data in the addresses table.


--Querying addresses where locations exist
--Usage of INTERSECT
SELECT a.city, a.street, a.country FROM addresses a
INTERSECT
SELECT l.address.city, l.address.street, l.address.country FROM locations l;

--------------------- AMBASSADOR TABLE ------------------

--Query the whole table

--Format the columns
COLUMN firstname FORMAT A10
COLUMN lastname FORMAT A10
COLUMN contact_number FORMAT A15
COLUMN number_type FORMAT A12
COLUMN current_street FORMAT A15 WOR
COLUMN current_city FORMAT A15 WOR
COLUMN current_country FORMAT A15 WOR
COLUMN permanent_street FORMAT A16 WOR
COLUMN permanent_city FORMAT A15 WOR
COLUMN permanent_country FORMAT A18 WOR

--Query with current address
SELECT ambassador_id, firstname, lastname, gender, c.contact_number, c.number_type, s.current_address.street AS current_street, s.current_address.city AS current_city, s.current_address.country AS current_country
FROM ambassador s, TABLE (s.contact) c ORDER BY ambassador_id;

--Query with permanent address
SELECT ambassador_id, firstname, lastname, gender, c.contact_number, c.number_type, s.permanent_address.street AS permanent_street, s.permanent_address.city AS permanent_city, s.permanent_address.country AS permanent_country
FROM ambassador s, TABLE (s.contact) c ORDER BY ambassador_id;


--Other queries

--Ambassador with leader names
--Usage of INNER JOIN
SELECT s.ambassador_id, s.firstname, s.lastname, l.ambassador_id AS leader_id, l.firstname AS leader_firstname, l.lastname AS leader_lastname
FROM ambassador s JOIN ambassador l ON
s.leader = l.ambassador_id
ORDER BY s.ambassador_id;


--Ambassador having higher salary than leaders using subquery
SELECT s.firstname, s.lastname, s.salary
FROM ambassador s
WHERE EXISTS(
	SELECT l.ambassador_id FROM ambassador l
	WHERE s.leader = l.ambassador_id
	AND s.salary>l.salary);

--Average salary of ambassador
SELECT AVG(salary) FROM ambassador;

--Highest salary of ambassador
SELECT MAX(salary) FROM ambassador;

--ambassador having highest salary
SELECT s.ambassador_id, s.firstname, s.lastname, s.salary
FROM ambassador s
WHERE s.salary IN(
	SELECT MAX(salary) FROM ambassador);

--Lowest salary of ambassador
SELECT MIN(salary) FROM ambassador;

--ambassador having lowest salary
SELECT s.ambassador_id, s.firstname, s.lastname, s.salary
FROM ambassador s
WHERE s.salary IN(
	SELECT MIN(salary) FROM ambassador);

--Rest of the ambassador (ambassador not having lowest salary)
SELECT s.ambassador_id, s.firstname, s.lastname, s.salary
FROM ambassador s
WHERE s.salary NOT IN(
	SELECT MIN(salary) FROM ambassador);

--Total budget of company allocated in ambassador salary
SELECT SUM(salary) FROM ambassador;

--Number of ambassador
SELECT COUNT(ambassador_id) FROM ambassador;

--ambassador having leaders
SELECT s.ambassador_id, s.firstname, s.lastname
FROM ambassador s
WHERE s.leader != s.ambassador_id;

--ambassador having no leaders
SELECT s.ambassador_id, s.firstname, s.lastname
FROM ambassador s
WHERE s.leader = s.ambassador_id;

--Query using procedure

--Get username and password
EXEC proc_username_password(2);
EXEC proc_username_password(&ambassador_id);


--Total number of ambassador
EXEC proc_count_ambassador;

--Total number of ambassador with salary more than provided number
EXEC proc_count_ambassador_salary(10000);
EXEC proc_count_ambassador_salary(15000);
EXEC proc_count_ambassador_salary(&amount);

--Query ambassador details using id
EXEC proc_show_ambassador_address(1);
EXEC proc_show_ambassador_address(2);
EXEC proc_show_ambassador_address(3);
EXEC proc_show_ambassador_address(4);
EXEC proc_show_ambassador_address(5);
EXEC proc_show_ambassador_address(&ambassador_id);

--Query ambassador firstname and lastname
EXEC proc_ambassador_firstname(1);
EXEC proc_ambassador_surname(1);

EXEC proc_ambassador_firstname(3);
EXEC proc_ambassador_surname(3);

EXEC proc_ambassador_firstname(&ambassador_id);
EXEC proc_ambassador_surname(&ambassador_id);

--Query using cursor
--View ambassador contact details 
EXEC proc_ambassador_contact_cursor;

--Query ambassador weekly salary using cursor
EXEC proc_weekly_sal_cursor(1);
EXEC proc_weekly_sal_cursor(3);
EXEC proc_weekly_sal_cursor(4);
EXEC proc_weekly_sal_cursor(&ambassador_id);

--------------------- FESTIVAL_NATURES TABLE ------------------

--Query the whole table

COLUMN name FORMAT a20
COLUMN experience_type FORMAT a15

SELECT * FROM experience_natures;

--Other queries

--Experience natures for old people
SELECT * FROM experience_natures WHERE experience_type = 'HIGH';

--Cartesian product (NOT READABLE)
SELECT fn.name, fn.experience_type, l.capacity, l.price FROM experience_natures fn, locations l;

--Using cursor
--Usage of OUT parameter 
VAR TOTAL_EXPERIENCE_NATURES NUMBER;
EXEC proc_experience_natures_cursor(:TOTAL_EXPERIENCE_NATURES);
PRINT TOTAL_EXPERIENCE_NATURES;

--------------------- LOCATIONS TABLE ------------------
 
--Query the whole table

COLUMN street FORMAT A15 WOR
COLUMN city FORMAT A15 WOR
COLUMN country FORMAT A15 WOR

SELECT location_id, capacity, price, l.address.street AS street, l.address.city  AS city, l.address.country  AS country FROM locations l ORDER BY location_id;

--Other queries


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

--Query using procedure

--Price of most expensive location
EXEC proc_exp_location;

--Price of cheapest location
EXEC proc_chp_location;


--Query the number of groups that can fit in a location
--The format:- First Argument: locaion_id, Second Argument: Group Size
EXEC proc_location_capacity_ck(3, 50);
EXEC proc_location_capacity_ck(5, 70);
EXEC proc_location_capacity_ck(2, 111);
EXEC proc_location_capacity_ck(2, 5);

--Query using cursor 

--Variable used as out parameter to display number of records
VAR TOTAL_LOCATIONS NUMBER;
EXEC proc_address_cursor(:TOTAL_LOCATIONS);
PRINT TOTAL_LOCATIONS;


--Displays Number of locations below given price
--Also increases the location prices by 50
EXEC proc_num_locations_price(200);
EXEC proc_num_locations_price(20000);






------------------------ FESTIVALS TABLE ---------------------

--Query the whole table

COLUMN experience_name FORMAT A20 WOR
COLUMN experience_type FORMAT A20 WOR
COLUMN experience_price FORMAT A20 WOR
COLUMN artist FORMAT A20 WOR
COLUMN genre FORMAT A15

SELECT experience_nature_id, location_id, experience_name, e.type AS experience_type,e_price AS experience_price
FROM experiences f, TABLE (f.performance) p;






--------------------- EXPERIENCE_AMBASSADOR TABLE ------------------

--Query the whole table

SELECT experience_ambassador_id, experience_nature_id, location_id, ambassador_id FROM experience_ambassador;


--Other queries

--experience_ambassador with location details and experience_nature details along with ambassador details
--Formatting
COLUMN experience_nature FORMAT A20 WOR
COLUMN ambassador FORMAT A20 WOR
COLUMN location FORMAT A40 WOR

--Query
SELECT fs.experience_ambassador_id, CONCAT(CONCAT(s.firstname, ' '),  s.lastname) AS ambassador, fn.name AS experience_nature, CONCAT(CONCAT(CONCAT(CONCAT(l.address.street, ', '), l.address.city), ', '), l.address.country) AS location
FROM experience_ambassador fs JOIN experiences f
ON fs.festival_nature_id = f.experience_nature_id
JOIN experience_natures fn
ON fn.experience_nature_id = f.experience_nature_id
JOIN locations l
ON f.location_id = l.location_id
JOIN ambassador s
ON s.ambassador_id = fs.ambassador_id
ORDER BY fs.experience_ambassador_id;


--Query using left join with ambassador
SELECT s.ambassador_id, CONCAT(CONCAT(s.firstname, ' '),  s.lastname) AS ambassador, fs.ambassador_id AS FS_ambassador_id, fs.experience_ambassador_id, fs.experience_nature_id, fs.location_id 
FROM ambassador s 
LEFT JOIN experience_ambassador fs
ON fs.ambassador_id = s.ambassador_id;


--Same query using right join (Should display same result)
SELECT s.ambassador_id, CONCAT(CONCAT(s.firstname, ' '),  s.lastname) AS ambassador, fs.ambassador_id AS FS_ambassador_id, fs.experience_ambassador_id, fs.experience_nature_id, fs.location_id 
FROM experience_ambassador fs 
RIGHT JOIN ambassador s
ON fs.ambassador_id = s.ambassador_id;


--Get ambassador id and total experiences ambassador is involved with in each location
--This query returns only the records of ambassador except the ambassador with id 2
SELECT ambassador_id, COUNT(experience_ambassador_id)
FROM experience_ambassador
GROUP BY ambassador_id
HAVING ambassador_id != 2;