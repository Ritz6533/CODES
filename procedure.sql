	--GROUP 7
	--	RITESH JUNG SHAH
	--	RUPAK DAHAL
	--	DIPESH DHUNGANA
	--	RAHUL AHMED SEZAN 

SET SERVEROUTPUT ON;

--procedure to update an existing ambassador's salary
CREATE OR REPLACE PROCEDURE proc_ambassador_salary(in_ambassador_id IN NUMBER, in_percentage IN NUMBER)
AS
   vn_old_salary NUMBER;
BEGIN
   SELECT salary INTO vn_old_salary FROM ambassadors WHERE ambassador_id = in_ambassador_id;
   
   UPDATE ambassadors
   SET salary = salary * (1 + (in_percentage / 100))
   WHERE ambassador_id = in_ambassador_id;
   
   COMMIT;
   
   DBMS_OUTPUT.PUT_LINE('Previous Salary: '|| vn_old_salary);
   DBMS_OUTPUT.PUT_LINE('New Salary: '|| (vn_old_salary * (1 + (in_percentage / 100))));
   DBMS_OUTPUT.PUT_LINE('Salary has been increased by '|| in_percentage ||'%'); 
END proc_ambassador_salary;
/
SHOW ERRORS

EXEC proc_ambassador_salary(1, 15);



--create a username from firstname and last name combination
CREATE OR REPLACE PROCEDURE proc_username (in_ambassador_id IN NUMBER) IS 
vc_username VARCHAR2(20);
vc_firstname ambassadors.firstname%TYPE;
vc_lastname ambassadors.lastname%TYPE;

BEGIN
SELECT firstname, lastname
INTO vc_firstname,vc_lastname
FROM ambassadors
WHERE ambassador_id = in_ambassador_id;

vc_username:=SUBSTR(vc_firstname,1,2) || SUBSTR(vc_lastname,1,5);
DBMS_OUTPUT.PUT_LINE(vc_username); 

END proc_username;
/


EXEC proc_username(2);
EXEC proc_username(3);

--Show the discounted price for the location Reduced 20% .
CREATE OR REPLACE PROCEDURE proc_discounted_price(in_location_id IN NUMBER) IS
vn_disc_price NUMBER(10,2);
vn_price1 locations.price%TYPE;

BEGIN
SELECT price
INTO vn_price1
FROM locations
WHERE location_id = in_location_id;

vn_disc_price := (vn_price1 )/1.25;
    DBMS_OUTPUT.PUT_LINE('Orignal price: ' || vn_price1 ||'  Discounted price: ' || vn_disc_price);

END proc_discounted_price;
/
SHOW ERRORS

EXEC proc_discounted_price(3);
EXEC proc_discounted_price(2);

--procedure to delete ambassadors

CREATE OR REPLACE PROCEDURE proc_delete_ambassador (in_ambassador_id IN NUMBER) IS 
BEGIN
  DELETE FROM ambassadors
  WHERE ambassador_id = in_ambassador_id;

  DBMS_OUTPUT.PUT_LINE('Ambassador with ID ' || in_ambassador_id || ' has been deleted.');

END proc_delete_ambassador;
/
SHOW ERRORS

