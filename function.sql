/*

	FUNCTION FILE
		-Contains create commands for functions 
		-These functions are used by the procedures or triggers
	
	GROUP 7
		RITESH JUNG SHAH
		RUPAK DAHAL
		DIPESH DHUNGANA
		RAHUL AHMED SEZAN 

*/



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

CREATE OR REPLACE FUNCTION func_discounted_price
(in_price1 locations.price%TYPE, in_price2 locations.price%TYPE)
RETURN NUMBER IS
	out_discounted_price NUMBER(10,2);
BEGIN
	out_discounted_price := (in_price1 + in_price2)/1.25;
	
	RETURN out_discounted_price;
END func_discounted_price;
/
SHOW ERRORS;

DECLARE
    discounted_price NUMBER(10,2);
BEGIN
    discounted_price := func_discounted_price(100, 50);
    DBMS_OUTPUT.PUT_LINE('Discounted price: ' || discounted_price);
END;
/
