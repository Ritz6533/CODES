--@D:\university\year_2\database\as2\CODES/drop.sql
 
	--GROUP 7
	--	RITESH JUNG SHAH
	--	RUPAK DAHAL
	--	DIPESH DHUNGANA
	--	RAHUL AHMED SEZAN 
	
--Display dbms output
SET SERVEROUTPUT ON

--Drop check

ALTER TABLE ambassadors
DROP CONSTRAINT ck_ambassador_gender;

ALTER TABLE ambassadors
DROP CONSTRAINT ck_ambassador_firstname;

ALTER TABLE ambassadors
DROP CONSTRAINT ck_ambassador_lastname;

ALTER TABLE experience_natures 
DROP CONSTRAINT ck_experience_nature_name;

ALTER TABLE experience_natures 
DROP CONSTRAINT ck_en_experience_type;

ALTER TABLE experiences
DROP CONSTRAINT ck_experiences_experience_name;

--Drop unique 

ALTER TABLE ambassadors
DROP CONSTRAINT uc_email;

--Drop foreign keys

ALTER TABLE ambassadors
DROP CONSTRAINT fk_a_ambassador_id;

ALTER TABLE experiences
DROP CONSTRAINT fk_e_en_id;

ALTER TABLE experiences
DROP CONSTRAINT fk_e_location_id;

ALTER TABLE experience_ambassadors
DROP CONSTRAINT fk_e_ambassador_id;

ALTER TABLE experience_ambassadors
DROP CONSTRAINT fk_a_experience;

--Drop primary key

ALTER TABLE experiences
DROP CONSTRAINT pk_experiences;

ALTER TABLE ambassadors
DROP CONSTRAINT pk_ambassadors;

ALTER TABLE experience_natures 
DROP CONSTRAINT pk_experience_natures;

ALTER TABLE locations
DROP CONSTRAINT pk_locations;

ALTER TABLE experience_ambassadors
DROP CONSTRAINT pk_experience_ambassadors;

--Drop tables
DROP TABLE ambassadors;
DROP TABLE experience_natures;
DROP TABLE locations;
DROP TABLE experiences;
DROP TABLE experience_ambassadors;
DROP TABLE addresses;

--Drop type
DROP TYPE address_type;
DROP TYPE contact_detail_varray_type;
DROP TYPE contact_detail_type;

--Drop sequences
DROP SEQUENCE seq_ambassador_id;
DROP SEQUENCE seq_experience_nature_id;
DROP SEQUENCE seq_location_id;
DROP SEQUENCE seq_experience_ambassador_id;





PURGE RECYCLEBIN;

--------------------------------------------VIEW-------------------------------------------------

--View objects
COLUMN object_name FORMAT A30;
COLUMN object_type FORMAT A12;
SELECT object_name, object_type FROM user_objects
WHERE object_type = 'TYPE';

--View tables
COLUMN tname FORMAT A30;
SELECT * FROM TAB;

--View Sequences
COLUMN sequence_name FORMAT A30;
SELECT sequence_name FROM user_sequences;


--View constraints
COLUMN constraint_name FORMAT A30;
SELECT constraint_name FROM user_constraints
WHERE constraint_name NOT LIKE 'SYS%';

-- PROCEDURE DROPS 
----ROUGH WORK
--DROP PROCEDURE proc_insert_addresses;


-- FUNCTION DROPS
--DROP FUNCTION func_count_ambassadors;
PURGE RECYCLEBIN;