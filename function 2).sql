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

--Function to get the price of most expensive location
CREATE OR REPLACE FUNCTION func_exp_location RETURN NUMBER IS
vn_price locations.price%TYPE;
BEGIN 
	SELECT MAX(price)
	INTO vn_price
	FROM locations;
RETURN vn_price;
END func_exp_location;
/
SHOW ERRORS;

--Function to get the price of cheapest location
CREATE OR REPLACE FUNCTION func_chp_location RETURN NUMBER IS
vn_price locations.price%TYPE;
BEGIN 
	SELECT MIN(price)
	INTO vn_price
	FROM locations;
RETURN vn_price;
END func_chp_location;
/
SHOW ERRORS;

-- Function to Increase Salary of a Ambassador
-- Takes in the current salary and percentage to raise, and returns the raised salary
CREATE OR REPLACE FUNCTION func_increase_salary (in_current_salary NUMBER,in_percent IN NUMBER) RETURN NUMBER IS
vn_salary NUMBER(10,2);
BEGIN 
	vn_salary:=(((in_percent)/100)*in_current_salary)+in_current_salary;
	RETURN vn_salary;
END func_increase_salary;
/
SHOW ERRORS;

-- Function to Discount Price of a Location
-- Takes in the current price and percentage to discount, and returns the discounted price
CREATE OR REPLACE FUNCTION func_discount_location (in_current_price NUMBER, in_percent IN NUMBER) RETURN NUMBER IS
vn_price NUMBER(10,2);
BEGIN 
	vn_price:= in_current_price - (((in_percent)/100)*in_current_price);
	RETURN vn_price;
END func_discount_location;
/
SHOW ERRORS


-- Function to retrieve ambassador username
-- Generates a username for the provided ambassador and returns it
CREATE OR REPLACE FUNCTION func_username(in_ambassador_id IN ambassador.ambassador_id%TYPE) RETURN VARCHAR2 IS
vc_username VARCHAR2(5);
BEGIN 
	SELECT CONCAT(SUBSTR(firstname,1,3),SUBSTR(lastname,1,2))
	INTO vc_username
	FROM ambassador
	WHERE ambassador_id = in_ambassador_id;
RETURN vc_username;
END func_username;
/
SHOW ERRORS;

-- Function to retrieve ambassador password 
-- Generates a password for the provided staff and returns it
CREATE OR REPLACE FUNCTION func_password(in_ambassador_id IN ambassador.ambassador_id%TYPE) RETURN VARCHAR2 IS
vc_date VARCHAR2(5);
vc_month VARCHAR2(5);
vc_name VARCHAR2(2);
vc_password VARCHAR2(5);
BEGIN 
	SELECT SUBSTR(firstname,1,1)
	INTO vc_name
	FROM ambassador
	WHERE staff_id = in_ambassador_id;

	SELECT TO_CHAR(SYSDATE,'dd'),TO_CHAR(SYSDATE,'mm') 
	INTO vc_date,vc_month
	FROM DUAL; 
	vc_password := vc_date||vc_month||vc_name;
RETURN vc_password;
END func_password;
/
SHOW ERRORS;

-- Function to check if given string contains a number
-- If it contains a number, returns 1, else returns 0
CREATE OR REPLACE FUNCTION func_check_string_num(in_string VARCHAR2) RETURN NUMBER IS
	vn_flag NUMBER(1):= 0;
BEGIN
	FOR vn_count IN 0 .. 9 LOOP
		IF in_string LIKE '%'||vn_count||'%' THEN 
			vn_flag:= 1;
		END IF;
	END LOOP;
RETURN vn_flag;
END func_check_string_num;
/
SHOW ERRORS;





