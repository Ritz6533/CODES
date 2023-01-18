
--procedure to update an existing ambassador's salary
CREATE OR REPLACE PROCEDURE update_ambassador_salary(p_ambassador_id IN NUMBER, p_new_salary IN NUMBER)
AS
BEGIN
   UPDATE ambassadors
   SET salary = p_new_salary
   WHERE ambassador_id = p_ambassador_id;
   COMMIT;
END;
/

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
