	--GROUP 7
	--	RITESH JUNG SHAH
	--	RUPAK DAHAL
	--	DIPESH DHUNGANA
	--	RAHUL AHMED SEZAN 


SET SERVEROUTPUT ON;

--PL/SQL Anonymous Block to show the initials of the ambassadors first name

DECLARE
  vn_counter NUMBER := 1;
  vc_firstname VARCHAR2(20);
  vn_length NUMBER;
BEGIN
  SELECT firstname, LENGTH(firstname) INTO vc_firstname, vn_length 
  FROM ambassadors WHERE ambassador_id = 1;
  LOOP
    DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_firstname, vn_counter, 1));
    vn_counter := vn_counter + 1;
    EXIT WHEN vn_counter > vn_length;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('First Name is - '||vc_firstname);
END;
/
SHOW ERRORS




-- Function to count total number of ambassadors
CREATE OR REPLACE FUNCTION func_count_ambassadors RETURN NUMBER IS
vn_count NUMBER(5);
BEGIN 
	SELECT COUNT(ambassador_id)
	INTO vn_count
	FROM ambassadors;
RETURN vn_count;
END func_count_ambassadors;
/
SHOW ERRORS;

SELECT func_count_ambassadors FROM DUAL;

----------------------------------------------------------------------------------------------------------------------------
--Function to count number of ambassadors with salary more than provided amount
CREATE OR REPLACE FUNCTION func_count_ambassadors_salary(in_salary NUMBER) RETURN NUMBER IS
vn_count NUMBER(5);
BEGIN 
	SELECT COUNT(ambassador_id)
	INTO vn_count
	FROM ambassadors
	WHERE salary>in_salary;
RETURN vn_count;
END func_count_ambassadors_salary;
/
SHOW ERRORS;
SELECT func_count_ambassadors_salary(25000) FROM DUAL;

----------------------------------------------------------------------------------------------------------------------------
--Function to count number of experiences
CREATE OR REPLACE FUNCTION func_count_experiences RETURN NUMBER IS
vn_count NUMBER(5);
BEGIN 
	SELECT COUNT(experience_nature_id)
	INTO vn_count
	FROM experiences;
RETURN vn_count;
END func_count_experiences;
/
SHOW ERRORS;
 
SELECT func_count_experiences FROM DUAL;
--

CREATE OR REPLACE FUNCTION func_fullname (in_ambassador_id IN NUMBER)
RETURN VARCHAR2
AS
  vc_firstname VARCHAR2(50);
  vc_lastname VARCHAR2(50);
  vc_fullname VARCHAR2(100);
BEGIN
  SELECT firstname, lastname INTO vc_firstname, vc_lastname
  FROM ambassadors WHERE ambassador_id = in_ambassador_id;

  vc_fullname := vc_firstname || ' ' || vc_lastname;
  RETURN vc_fullname;
END func_fullname;
/
SHOW ERRORS;

SELECT func_fullname(2) FROM DUAL;

--
CREATE OR REPLACE FUNCTION func_lastname (in_ambassador_id IN NUMBER)
RETURN VARCHAR2
AS
  vn_counter NUMBER := 1;
  vc_lastname VARCHAR2(20);
  vn_length NUMBER;
BEGIN
  SELECT lastname, LENGTH(lastname) INTO vc_lastname, vn_length 
  FROM ambassadors WHERE ambassador_id = in_ambassador_id;
  LOOP
    DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_lastname, vn_counter, 1));
    vn_counter := vn_counter + 1;
    EXIT WHEN vn_counter > vn_length;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Last Name is - '||vc_lastname);
  RETURN vc_lastname;
END func_lastname;
/
SHOW ERRORS;
SELECT func_lastname(2) FROM DUAL;