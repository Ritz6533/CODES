

--procedure for inserting into addresses object table
						 	
CREATE OR REPLACE PROCEDURE proc_insert_addresses(in_street IN VARCHAR2:=NULL, in_city IN VARCHAR2:=NULL, in_country IN VARCHAR2:=NULL) IS

BEGIN
	INSERT INTO addresses (street,city,country)
	VALUES (in_street,in_city,in_country);
	DBMS_OUTPUT.PUT_LINE('Address added SUCESSFULLY');
END proc_insert_addresses;
/

SHOW ERRORS;

-- procedure for inserting ambassadors table

CREATE OR REPLACE PROCEDURE proc_insert_ambassadors(in_firstname VARCHAR2, in_lastname VARCHAR2, in_gender CHAR,
											  in_email VARCHAR2, in_salary NUMBER, 
											  in_num_t1 VARCHAR2, in_type_t1 VARCHAR2, 
											  in_num_t2 VARCHAR2, in_type_t2 VARCHAR2,
											  in_street_c VARCHAR2, in_city_c VARCHAR2, in_country_c VARCHAR2) IS

BEGIN
	INSERT INTO ambassadors(ambassador_id,firstname,lastname,gender,email,leader,salary,contact,current_address)
	VALUES (seq_ambassador_id.NEXTVAL, in_firstname, in_lastname, in_gender, in_email, seq_ambassador_id.CURRVAL, in_salary,

	contact_detail_varray_type(contact_detail_type(in_num_t1, in_type_t1) ,contact_detail_type(in_num_t2, in_type_t2)) ,address_type(in_street_c, in_city_c, in_country_c));
	 
    DBMS_OUTPUT.PUT_LINE('ROW INSERTED SUCESSFULLY');

END proc_insert_ambassadors;
/

SHOW ERRORS; 


----------------------------------------------------------------------------------------------------------------------------

------------------------- procedure for inserting into experience_natures table ------------------
						 	
CREATE OR REPLACE PROCEDURE proc_insert_experience_natures(in_name IN experience_natures.name%TYPE, in_experience_type IN experience_natures.experience_type%TYPE) IS

BEGIN
	INSERT INTO experience_natures (experience_nature_id,name,experience_type)
	VALUES (seq_experience_nature_id.NEXTVAL,in_name,in_experience_type);
	DBMS_OUTPUT.PUT_LINE('ROW INSERTED SUCESSFULLY');
END proc_insert_experience_natures;
/

SHOW ERRORS;


----------------------------------------------------------------------------------------------------------------------------

------------------------- procedure for inserting into locations table ----------------------

CREATE OR REPLACE PROCEDURE proc_insert_locations(in_capacity IN locations.capacity%TYPE,in_price IN locations.price%TYPE,in_address_ref IN VARCHAR2) IS

BEGIN 
	INSERT INTO locations (location_id,capacity,price,address)
	SELECT seq_location_id.NEXTVAL,in_capacity,in_price, REF(a)
	FROM addresses a
	WHERE a.street = in_address_ref;
	DBMS_OUTPUT.PUT_LINE('ROW INSERTED SUCESSFULLY');
END proc_insert_locations;
/

SHOW ERRORS;


----------------------------------------------------------------------------------------------------------------------------

 

----------------------------------------------------------------------------------------------------------------------------

------------------------- procedure for inserting into experiences table ----------------------


CREATE OR REPLACE PROCEDURE proc_insert_experiences(in_experience_nature_id NUMBER, in_location_id NUMBER, in_experience_name VARCHAR2, 
											      in_experience_type VARCHAR2, in_experience_price NUMBER) IS

BEGIN
	INSERT INTO experiences(experience_nature_id,location_id,experience_name,experience_type,experience_price)
	VALUES (in_experience_nature_id, in_location_id, in_experience_name, in_experience_type, in_experience_price);

    DBMS_OUTPUT.PUT_LINE('ROW INSERTED SUCESSFULLY');
END proc_insert_experiences;
/

SHOW ERRORS; 

----------------------------------------------------------------------------------------------------------------------------

------------------------- procedure for inserting into experience_ambassadors table ----------------------


CREATE OR REPLACE PROCEDURE proc_insert_e_ambassadors(in_ambassador_id IN experience_ambassadors.ambassador_id%TYPE,in_experience_nature_id IN experience_ambassadors.experience_nature_id%TYPE,in_location_id IN experience_ambassadors.location_id%TYPE) IS

	BEGIN

	INSERT INTO experience_ambassadors (experience_ambassador_id,ambassador_id,experience_nature_id,location_id)
	VALUES (seq_experience_ambassador_id.NEXTVAL, in_ambassador_id, in_experience_nature_id, in_location_id);
			DBMS_OUTPUT.PUT_LINE('ROW INSERTED SUCESSFULLY');

	END proc_insert_e_ambassadors;
	/
	SHOW ERRORS; 



--PROCEDURE TO RESET SEQUENCE

--How to reset sequence https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:951269671592 

--This procedure takes a sequence as a parameter and resets it to 0
--Usage of EXECUTE IMMEDIATE
CREATE OR REPLACE PROCEDURE proc_reset_seq(p_seq_name IN VARCHAR2)
IS
    l_val NUMBER;
BEGIN
    EXECUTE IMMEDIATE
    'select ' || p_seq_name || '.nextval from dual' INTO l_val;
    EXECUTE IMMEDIATE
    'alter sequence ' || p_seq_name || ' increment by -' || l_val || ' minvalue 0';
    EXECUTE IMMEDIATE
    'select ' || p_seq_name || '.nextval from dual' INTO l_val;
    EXECUTE IMMEDIATE
    'alter sequence ' || p_seq_name || ' increment by 1 minvalue 0';
END proc_reset_seq;
/
SHOW ERRORS





----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Procedures for querying data----------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------


--Procedures using functions

----------------------------------------------------------------------------------------------------------------------------

-- This procedure displays the total number of ambassadors
-- It uses the function func_count_ambassadors to retrieve total number of staff
CREATE OR REPLACE PROCEDURE proc_count_ambassadors AS
	vn_count NUMBER(5):= func_count_ambassadors;
BEGIN
	IF vn_count>0 THEN
		DBMS_OUTPUT.PUT_LINE('There are '|| vn_count || ' ambassadors in the system.');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('There is no staff available.');
	END IF;
END proc_count_ambassadors;
/
SHOW ERRORS

----------------------------------------------------------------------------------------------------------------------------

-- This procedure displays the total number of staff with salary higher than provided as argument
-- It uses the function func_count_staff_salary to retrieve the number of staff
CREATE OR REPLACE PROCEDURE proc_count_ambassadors_salary(in_salary NUMBER) AS
	vn_count NUMBER(5):= func_count_ambassadors_salary(in_salary);
BEGIN
	IF vn_count>1 THEN
		DBMS_OUTPUT.PUT_LINE('There are '|| vn_count || ' staff in the system with salary more than '|| in_salary);
	ELSIF vn_count = 1 THEN 
		DBMS_OUTPUT.PUT_LINE('There is '|| vn_count || ' staff in the system with salary more than '|| in_salary);
	ELSE	
		DBMS_OUTPUT.PUT_LINE('There is no ambassadors with salary more than '|| in_salary);
	END IF;
END proc_count_ambassadors_salary;
/
SHOW ERRORS

----------------------------------------------------------------------------------------------------------------------------

-- This procedure displays the total number of experiences
-- It uses the function func_count_experiences to retrieve total number of experiences
CREATE OR REPLACE PROCEDURE proc_count_experiences AS
	vn_count NUMBER(5):= func_count_experiences;
BEGIN
	IF vn_count>0 THEN
		DBMS_OUTPUT.PUT_LINE('There are '|| vn_count || ' experiences in the system.');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('There is no festival available.');
	END IF;
END proc_count_experiences;
/
SHOW ERRORS


----------------------------------------------------------------------------------------------------------------------------

-- This procedure displays the highest price among the locations
CREATE OR REPLACE PROCEDURE proc_exp_location AS
BEGIN
	DBMS_OUTPUT.PUT_LINE('The most expensive location costs '|| func_exp_location);
END proc_exp_location;
/
SHOW ERRORS


----------------------------------------------------------------------------------------------------------------------------

-- This procedure displays the cheapest price among the locations
CREATE OR REPLACE PROCEDURE proc_chp_location AS
BEGIN
	DBMS_OUTPUT.PUT_LINE('The cheapest location costs '|| func_chp_location);
END proc_chp_location;
/
SHOW ERRORS
