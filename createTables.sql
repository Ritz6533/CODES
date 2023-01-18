-- CSY2038_181@student/CSY2038_181
--@D:\university\year_2\database\as2\CODES/createtables.sql
 /*completed
	
	GROUP 7
		RITESH JUNG SHAH
		RUPAK DAHAL
		DIPESH DHUNGANA
		RAHUL AHMED SEZAN 

*/
--address_type
CREATE OR REPLACE TYPE address_type AS OBJECT(
	street VARCHAR2(25),
	city VARCHAR2(20),
	country VARCHAR2(20)
);
/

--addresses table made of address_type
CREATE TABLE addresses OF address_type;

--contact_detail_type
CREATE OR REPLACE TYPE contact_detail_type AS OBJECT(
	contact_number VARCHAR2(15),
	number_type VARCHAR2(20)
);
/

--contact_detail_varray_type made of contact_detail_type
CREATE TYPE contact_detail_varray_type AS VARRAY(2) OF contact_detail_type;
/


--CREATING TABLES

--ambassadors table and the sequence
CREATE TABLE ambassadors(
	ambassador_id NUMBER(5),
	firstname VARCHAR2(20),
	lastname VARCHAR2(20),
	gender CHAR,
	email VARCHAR2(50),
	leader NUMBER(5),
	salary NUMBER(10, 2),
	contact contact_detail_varray_type,
	current_address address_type
);

CREATE SEQUENCE seq_ambassador_id
INCREMENT BY 1
START WITH 1
MINVALUE 0
MAXVALUE 99999;


--experience_natures table and the sequence
CREATE TABLE experience_natures(
	experience_nature_id NUMBER(5),
	name VARCHAR2(20),
	experience_type VARCHAR2(30)
);

CREATE SEQUENCE seq_experience_nature_id
INCREMENT BY 1
START WITH 1
MINVALUE 0 
MAXVALUE 99999;


--Locations table and the sequence
CREATE TABLE locations(
	location_id NUMBER(5),
	address REF address_type SCOPE IS addresses,
	capacity NUMBER(5),
	price NUMBER(10,2)
);

CREATE SEQUENCE seq_location_id
INCREMENT BY 1
START WITH 1
MINVALUE 0 
MAXVALUE 99999;


--experiences table
CREATE TABLE experiences(
	experience_nature_id NUMBER(5) NOT NULL,
	location_id NUMBER(5) NOT NULL,
	experience_name VARCHAR2(20),
	experience_type VARCHAR2(20),
	Experience_price NUMBER(5)
);

--experience_ambassadors table and the sequence
CREATE TABLE experience_ambassadors(
	experience_ambassador_id NUMBER(5),
	ambassador_id NUMBER(5) NOT NULL,
	experience_nature_id NUMBER(5) NOT NULL,
	location_id NUMBER(5) NOT NULL
);

CREATE SEQUENCE seq_experience_ambassador_id
INCREMENT BY 1
START WITH 1
MINVALUE 0 
MAXVALUE 99999;


--------------------------------------------VIEW-------------------------------------------------
--Confirm that all the creates have worked properly 

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



