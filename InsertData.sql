--@D:\university\year_2\database\as2\CODES/insertdata.sql
 
 /*
	
	GROUP 7
		RITESH JUNG SHAH
		RUPAK DAHAL
		DIPESH DHUNGANA
		RAHUL AHMED SEZAN 

*/
--Display dbms output
SET SERVEROUTPUT ON

--ADDRESSES OBJECT TABLE 
 
 --Format the table
COLUMN street FORMAT A30;
COLUMN city FORMAT A20;
COLUMN country FORMAT A20;

--Verify empty table
SELECT street, city, country FROM addresses;

--Insert without procedure
INSERT INTO addresses(street, city, country)
VALUES ('101 BEECH AVENUE', 'NORTHAMPTON', 'UK');

--Insert using procedure
EXEC proc_insert_addresses('566 Creeds Avenue', 'Texas', 'USA');
EXEC proc_insert_addresses('123 Sun WAY', 'SAN FERNANDO', 'USA');
EXEC proc_insert_addresses('852 UNI DRIVE', 'SAN DIEGO', 'USA');
EXEC proc_insert_addresses('456 COVO STREET', 'LUTON', 'UK');
EXEC proc_insert_addresses('056 TIME SQUARE', 'NEW YORK', 'USA');
EXEC proc_insert_addresses('111 HUMBERG STREET', 'COLORADO', 'UK');
EXEC proc_insert_addresses('963 SANINT AVE', 'SAN DIEGO', 'USA');
EXEC proc_insert_addresses('152 KETTERING ROAD', 'NORTHAMPTON', 'UK');
EXEC proc_insert_addresses('33 CASTLE ASBY', 'NORTHAMPTON', 'UK');

--Verify insert
SELECT street, city, country FROM addresses; 
--Result   : The inserted data appears in the table

--AMBASSADOR TABLE

--Verify empty table
SELECT ambassador_id,firstname,lastname,gender,leader,salary,current_address FROM ambassadors;

--Insert without procedure
INSERT INTO ambassadors(ambassador_id,firstname,lastname,gender,email,leader,salary,contact,current_address)
VALUES (seq_ambassador_id.NEXTVAL, 'RITESH', 'SHAH', 'M', '64SH5AHRITESHJUNG6533@GMAIL.COM', seq_ambassador_id.CURRVAL, 979.66 ,contact_detail_varray_type(contact_detail_type('0743456456', 'MOBILE') ,contact_detail_type('07543456456', 'HOME')) ,address_type('101 BEECH AVENUE', 'NORTHAMPTON', 'UK'));


--Insert with procedure
EXEC proc_insert_ambassadors('HAPPY', 'APPLE', 'F', 'HAPPYAPPLE@GMAIL.COM', 10000.50 ,'7412365895', 'MOBILE' ,'8520369874', 'HOME','566 Creeds Avenue', 'Texas', 'USA');
EXEC proc_insert_ambassadors('SAD', 'MANGO', 'M', 'SADMANGO@GMAIL.COM', 15000.00 ,'7894561230', 'MOBILE' ,'9632587412', 'HOME','123 Sun WAY', 'SAN FERNANDO', 'USA');
EXEC proc_insert_ambassadors('CALM', 'BANANA', 'M', 'CALMBANANA@GMAIL.COM', 20000.50 ,'7532148920', 'MOBILE' ,'9856325015', 'HOME','852 UNI DRIVE', 'SAN DIEGO', 'USA');
EXEC proc_insert_ambassadors('RUDE', 'GUAVA', 'F', 'RUDEGUAVA@GMAIL.COM', 20099.99 ,'7391468202', 'MOBILE' ,'9856230145', 'HOME','111 HUMBERG STREET', 'COLORADO', 'UK');
EXEC proc_insert_ambassadors('LOVELY', 'BERRY', 'M', 'LOVELYBERRY@GMAIL.COM', 35000.00 ,'7897897890', 'MOBILE' ,'8894521035', 'HOME','152 KETTERING ROAD', 'NORTHAMPTON', 'UK');
EXEC proc_insert_ambassadors('BORED', 'MANGO', 'M', 'BOREDMANGO@GMAIL.COM', 40000.00 ,'7414118520', 'MOBILE' ,'8426795130', 'HOME','33 CASTLE ASBY', 'NORTHAMPTON', 'UK');



--Verify insert
SELECT firstname, lastname FROM ambassadors;
--Result   : The inserted data appears in the table

--EXPERIENCE_NATURE TABLE


--Verify empty table
SELECT * FROM experience_natures;

--Insert without procedure
INSERT INTO experience_natures (experience_nature_id,name,experience_type)
VALUES (seq_experience_nature_id.NEXTVAL, 'HIKING', 'PHYSICAL AND OUTDOOR');

--Insert using procedure
EXEC proc_insert_experience_natures('CONCERT', 'MUSIC AND 2021 RAVE');
EXEC proc_insert_experience_natures('BINGO', 'OLD PEOPLES GAME');
EXEC proc_insert_experience_natures('DANCE AND DRINK', 'YOUTH RNB DANCE');
EXEC proc_insert_experience_natures('KIDS FESTIVAL', 'KIDS AND FAMILY OUTDOORS');


--Verify insert
SELECT * FROM experience_natures;
--Result   : The inserted data appears in the table
 
 
--LOCATIONS TABLE

--Verify empty table
SELECT location_id, capacity, price, l.address.street, l.address.city, l.address.country FROM locations l;

--Requires reference of addresses table

--Insert without procedure
INSERT INTO locations (location_id,capacity,price,address)
	SELECT seq_location_id.NEXTVAL,1000,999, REF(a)
	FROM addresses a
	WHERE a.street = '963 SANINT AVE';

--Insert with procedure
EXEC proc_insert_locations(1200, 20500, '111 HUMBERG STREET');
EXEC proc_insert_locations(500, 5500, '852 UNI DRIVE');
EXEC proc_insert_locations(750, 2500, '056 TIME SQUARE');
EXEC proc_insert_locations(200, 1000, '33 CASTLE ASBY');

--Verify insert
SELECT location_id, capacity, price, l.address.street AS street, l.address.city  AS city, l.address.country  AS country FROM locations l ORDER BY location_id;
--Result   : The inserted data appears in the table


--EXPERIENCES TABLE 

--Verify empty table
SELECT experience_nature_id, experience_name, experience_price FROM experiences;

--Insert without procedure
INSERT INTO experiences(experience_nature_id,location_id,experience_name,experience_type,experience_price)
VALUES (1, 1, 'HIKING','CARDIO', 5000 );


--Insert with procedure
--Format of Arguments: Festival Nature Id, Location Id, Festival name, Performance1 - name, artist, genre, Performance 2- name, artist, genre
EXEC proc_insert_experiences(2, 1, 'BINGO','CLASSIC', 50 );
EXEC proc_insert_experiences(3, 2, 'DANCE','RAVE', 50 );
EXEC proc_insert_experiences(4, 4, 'BUNGEE','OUTDOOR', 200 );
EXEC proc_insert_experiences(5, 3, 'SKY DIVING','OUTDOOR', 500 );


--Verify insert
SELECT experience_nature_id, experience_name, experience_price FROM experiences;
--Result   : The inserted data appears in the table

-- EXPERIENCE_AMBASSADORS TABLE ------------------


--Verify empty table
SELECT experience_ambassador_id, ambassador_id, experience_nature_id, location_id FROM experience_ambassadors;

--Insert without procedure
INSERT INTO experience_ambassadors (experience_ambassador_id,ambassador_id,experience_nature_id,location_id)
VALUES (seq_experience_ambassador_id.NEXTVAL, 4, 1, 1);

--Insert with procedure
EXEC proc_insert_e_ambassadors(3, 1, 1);
EXEC proc_insert_e_ambassadors(2, 2, 1);
EXEC proc_insert_e_ambassadors(1, 3, 2);
EXEC proc_insert_e_ambassadors(4, 4, 4);
EXEC proc_insert_e_ambassadors(5, 5, 3);

--Verify insert
SELECT experience_ambassador_id, ambassador_id, experience_nature_id, location_id FROM experience_ambassadors;
--Result   : The inserted data appears in the table





