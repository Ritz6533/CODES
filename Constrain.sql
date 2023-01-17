--@D:\university\year_2\database\as2\CODES/constrain.sql
 
 /*
	
	GROUP 7
		RITESH JUNG SHAH
		RUPAK DAHAL
		DIPESH DHUNGANA
		RAHUL AHMED SEZAN 

*/ 

--Display dbms output
SET SERVEROUTPUT ON


--compound primary key

ALTER TABLE experiences
ADD CONSTRAINT pk_experiences
PRIMARY KEY (experience_nature_id, location_id);


--alter primary key 
ALTER TABLE ambassadors
ADD CONSTRAINT pk_ambassadors
PRIMARY KEY (ambassador_id);

ALTER TABLE experience_natures 
ADD CONSTRAINT pk_experience_natures
PRIMARY KEY (experience_nature_id);

ALTER TABLE locations
ADD CONSTRAINT pk_locations
PRIMARY KEY (location_id);

ALTER TABLE experience_ambassadors
ADD CONSTRAINT pk_experience_ambassadors
PRIMARY KEY (experience_ambassador_id);


--alter foreign keys

ALTER TABLE ambassadors
ADD CONSTRAINT fk_a_ambassador_id
FOREIGN KEY (leader)
REFERENCES ambassadors(ambassador_id);

ALTER TABLE experiences
ADD CONSTRAINT fk_e_en_id
FOREIGN KEY (experience_nature_id)
REFERENCES experience_natures(experience_nature_id);

ALTER TABLE experiences
ADD CONSTRAINT fk_e_location_id
FOREIGN KEY (location_id)
REFERENCES locations(location_id);


ALTER TABLE experience_ambassadors
ADD CONSTRAINT fk_e_ambassador_id
FOREIGN KEY (ambassador_id)
REFERENCES ambassadors(ambassador_id);


--compound foreign key

ALTER TABLE experience_ambassadors
ADD CONSTRAINT fk_a_experience
FOREIGN KEY (experience_nature_id, location_id)
REFERENCES experiences(experience_nature_id, location_id);


--alter adding unique

ALTER TABLE ambassadors
ADD CONSTRAINT uc_email
UNIQUE (email);


--check

ALTER TABLE ambassadors
ADD CONSTRAINT ck_ambassador_gender
CHECK (gender IN('M', 'F'));

ALTER TABLE ambassadors
ADD CONSTRAINT ck_ambassador_firstname
CHECK (firstname= UPPER(firstname));

ALTER TABLE ambassadors
ADD CONSTRAINT ck_ambassador_lastname
CHECK (lastname= UPPER(lastname));

ALTER TABLE experience_natures 
ADD CONSTRAINT ck_experience_nature_name
CHECK (name= UPPER(name));

ALTER TABLE experience_natures 
ADD CONSTRAINT ck_en_experience_type
CHECK (experience_type= UPPER(experience_type));

ALTER TABLE experiences
ADD CONSTRAINT ck_experiences_experience_name
CHECK (experience_name = UPPER(experience_name));


--adding default value

ALTER TABLE ambassadors 
MODIFY(gender CHAR DEFAULT 'M');

--adding not null condition

ALTER TABLE ambassadors
MODIFY (leader NOT NULL)



COLUMN constraint_name FORMAT A30;
SELECT constraint_name FROM user_constraints
WHERE constraint_name NOT LIKE 'SYS%';



