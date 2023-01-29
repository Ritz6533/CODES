--

	--GROUP 7
	--	RITESH JUNG SHAH
	--	RUPAK DAHAL
	--	DIPESH DHUNGANA
	--	RAHUL AHMED SEZAN 

--Display dbms output
SET SERVEROUTPUT ON

--ADDRESSES OBJECT TABLE 
 
 --Format the table
COLUMN street FORMAT A30;
COLUMN city FORMAT A20;
COLUMN country FORMAT A20;

--Verify empty table
SELECT street, city, country FROM addresses;

INSERT INTO addresses(street, city, country) VALUES ('101 BEECH AVENUE', 'NORTHAMPTON', 'UK');
INSERT INTO addresses(street, city, country) VALUES	('566 Creeds Avenue', 'Texas', 'USA');
INSERT INTO addresses(street, city, country) VALUES	('123 Sun WAY', 'SAN FERNANDO', 'USA');
INSERT INTO addresses(street, city, country) VALUES	('852 UNI DRIVE', 'SAN DIEGO', 'USA');
INSERT INTO addresses(street, city, country) VALUES	('456 COVO STREET', 'LUTON', 'UK');
INSERT INTO addresses(street, city, country) VALUES	('056 TIME SQUARE', 'NEW YORK', 'USA');
INSERT INTO addresses(street, city, country) VALUES	('111 HUMBERG STREET', 'COLORADO', 'UK');
INSERT INTO addresses(street, city, country) VALUES	('963 SANINT AVE', 'SAN DIEGO', 'USA');
INSERT INTO addresses(street, city, country) VALUES	('152 KETTERING ROAD', 'NORTHAMPTON', 'UK');
INSERT INTO addresses(street, city, country) VALUES	('33 CASTLE ASBY', 'NORTHAMPTON', 'UK');


--Verify insert
SELECT street, city, country FROM addresses; 
--Result   : The inserted data appears in the table

--AMBASSADOR TABLE

--Verify empty table
SELECT ambassador_id,firstname,lastname,gender,leader,salary,current_address FROM ambassadors;

--Insert
INSERT INTO ambassadors(ambassador_id,firstname,lastname,gender,email,leader,salary,contact,current_address)
VALUES (seq_ambassador_id.NEXTVAL, 'RITESH', 'SHAH', 'M', '64SH5AHRITESHJUNG6533@GMAIL.COM', seq_ambassador_id.CURRVAL, 979.66 ,contact_detail_varray_type(contact_detail_type('0743456456', 'MOBILE') ,contact_detail_type('07543456456', 'HOME')) ,address_type('101 BEECH AVENUE', 'NORTHAMPTON', 'UK'));

INSERT INTO ambassadors(ambassador_id,firstname,lastname,gender,email,leader,salary,contact,current_address)
VALUES (seq_ambassador_id.NEXTVAL, 'HAPPY', 'APPLE', 'F', 'HAPPYAPPLE@GMAIL.COM', seq_ambassador_id.CURRVAL, 10000.50 ,contact_detail_varray_type(contact_detail_type('7412365895', 'MOBILE') ,contact_detail_type('8520369874', 'HOME')) ,address_type('566 Creeds Avenue', 'Texas', 'USA'));

INSERT INTO ambassadors(ambassador_id,firstname,lastname,gender,email,leader,salary,contact,current_address)
VALUES (seq_ambassador_id.NEXTVAL, 'SAD', 'MANGO', 'M', 'SADMANGO@GMAIL.COM', seq_ambassador_id.CURRVAL, 15000.00 ,contact_detail_varray_type(contact_detail_type('7894561230', 'MOBILE') ,contact_detail_type('9632587412', 'HOME')) ,address_type('123 Sun WAY', 'SAN FERNANDO', 'USA'));

INSERT INTO ambassadors(ambassador_id,firstname,lastname,gender,email,leader,salary,contact,current_address)
VALUES (seq_ambassador_id.NEXTVAL, 'CALM', 'BANANA', 'M', 'CALMBANANA@GMAIL.COM', seq_ambassador_id.CURRVAL, 20000.50 ,contact_detail_varray_type(contact_detail_type('7532148920', 'MOBILE') ,contact_detail_type('9856325015', 'HOME')) ,address_type('852 UNI DRIVE', 'SAN DIEGO', 'USA'));

INSERT INTO ambassadors(ambassador_id,firstname,lastname,gender,email,leader,salary,contact,current_address)
VALUES (seq_ambassador_id.NEXTVAL, 'RUDE', 'GUAVA', 'F', 'RUDEGUAVA@GMAIL.COM', seq_ambassador_id.CURRVAL, 20099.99 ,contact_detail_varray_type(contact_detail_type('7391468202', 'MOBILE') ,contact_detail_type('9856230145', 'HOME')) ,address_type('111 HUMBERG STREET', 'COLORADO', 'UK'));

INSERT INTO ambassadors(ambassador_id,firstname,lastname,gender,email,leader,salary,contact,current_address)
VALUES (seq_ambassador_id.NEXTVAL, 'LOVELY', 'BERRY', 'M', 'LOVELYBERRY@GMAIL.COM', seq_ambassador_id.CURRVAL, 35000.99 ,contact_detail_varray_type(contact_detail_type('7897897890', 'MOBILE') ,contact_detail_type('9894521035', 'HOME')) ,address_type('152 KETTERING ROAD', 'NORTHAMPTON', 'UK'));


INSERT INTO ambassadors(ambassador_id,firstname,lastname,gender,email,leader,salary,contact,current_address)
VALUES (seq_ambassador_id.NEXTVAL, 'ZZ', 'W', 'P', '64SHRITESHJUNG6533@GMAIL.COM', seq_ambassador_id.CURRVAL, 97889.66 ,contact_detail_varray_type(contact_detail_type('07434546456', 'MOBsILE') ,contact_detail_type('075434586456', 'HOME')) ,address_type('101 BEECH AVENUE', 'NORTHAMPTON', 'UK'));

--Verify insert
SELECT ambassador_id,firstname, lastname FROM ambassadors;
--Result   : The inserted data appears in the table

--EXPERIENCE_NATURE TABLE


--Verify empty table
SELECT * FROM experience_natures;

--Insert
INSERT INTO experience_natures (experience_nature_id,name,experience_type)
VALUES (seq_experience_nature_id.NEXTVAL, 'HIKING', 'PHYSICAL AND OUTDOOR');

INSERT INTO experience_natures (experience_nature_id,name,experience_type)
VALUES (seq_experience_nature_id.NEXTVAL, 'CONCERT', 'MUSIC AND 2021 RAVE');

INSERT INTO experience_natures (experience_nature_id,name,experience_type)
VALUES (seq_experience_nature_id.NEXTVAL, 'BINGO', 'OLD PEOPLES GAME');

INSERT INTO experience_natures (experience_nature_id,name,experience_type)
VALUES (seq_experience_nature_id.NEXTVAL, 'DANCE AND DRINK', 'YOUTH RNB DANCE');

INSERT INTO experience_natures (experience_nature_id,name,experience_type)
VALUES (seq_experience_nature_id.NEXTVAL, 'KIDS FESTIVAL', 'KIDS AND FAMILY OUTDOORS');


--Verify insert
SELECT * FROM experience_natures;
--Result   : The inserted data appears in the table
 
 
--LOCATIONS TABLE

--Verify empty table
SELECT location_id, capacity, price, l.address.street, l.address.city, l.address.country FROM locations l;

--Requires reference of addresses table

--Insert 
INSERT INTO locations (location_id,capacity,price,address)
	SELECT seq_location_id.NEXTVAL,100,999, REF(a)
	FROM addresses a
	WHERE a.street = '963 SANINT AVE';
--Different ways to Insert in location
INSERT INTO locations (location_id,capacity,price,address)
VALUES (seq_location_id.NEXTVAL,1000,9999, (SELECT REF(a) FROM addresses a WHERE a.street = '111 HUMBERG STREET'));


INSERT INTO locations (location_id,capacity,price,address)
VALUES (seq_location_id.NEXTVAL,500, 5500, (SELECT REF(a) FROM addresses a WHERE a.street = '056 TIME SQUARE'));

INSERT INTO locations (location_id,capacity,price,address)
VALUES (seq_location_id.NEXTVAL,750, 2500, (SELECT REF(a) FROM addresses a WHERE a.street = '056 TIME SQUARE'));

INSERT INTO locations (location_id,capacity,price,address)
VALUES (seq_location_id.NEXTVAL,200, 1000, (SELECT REF(a) FROM addresses a WHERE a.street = '33 CASTLE ASBY'));

--Verify insert
SELECT location_id, capacity, price, l.address.street AS street, l.address.city  AS city, l.address.country  AS country FROM locations l ORDER BY location_id;
--Result   : The inserted data appears in the table


--EXPERIENCES TABLE 

--Verify empty table
SELECT experience_nature_id, experience_name, experience_price FROM experiences;

--Insert 
INSERT INTO experiences(experience_nature_id,location_id,experience_name,experience_type,experience_price)
VALUES (1, 1, 'HIKING','CARDIO', 5000 );

INSERT INTO experiences(experience_nature_id,location_id,experience_name,experience_type,experience_price)
VALUES (2, 1, 'BINGO','CLASSIC', 50 );

INSERT INTO experiences(experience_nature_id,location_id,experience_name,experience_type,experience_price)
VALUES (3, 2, 'DANCE','RAVE', 50 );

INSERT INTO experiences(experience_nature_id,location_id,experience_name,experience_type,experience_price)
VALUES (4, 4, 'BUNGEE','OUTDOOR', 200 );

INSERT INTO experiences(experience_nature_id,location_id,experience_name,experience_type,experience_price)
VALUES (5, 3, 'SKY DIVING','OUTDOOR', 500 );



--Verify insert
SELECT experience_nature_id, experience_name, experience_price FROM experiences;
--Result   : The inserted data appears in the table

-- EXPERIENCE_AMBASSADORS TABLE ------------------


--Verify empty table
SELECT experience_ambassador_id, ambassador_id, experience_nature_id, location_id FROM experience_ambassadors;

--Insert 
INSERT INTO experience_ambassadors (experience_ambassador_id,ambassador_id,experience_nature_id,location_id)
VALUES (seq_experience_ambassador_id.NEXTVAL, 4, 1, 1);

INSERT INTO experience_ambassadors (experience_ambassador_id,ambassador_id,experience_nature_id,location_id)
VALUES (seq_experience_ambassador_id.NEXTVAL, 3, 1, 1);

INSERT INTO experience_ambassadors (experience_ambassador_id,ambassador_id,experience_nature_id,location_id)
VALUES (seq_experience_ambassador_id.NEXTVAL, 2, 2, 1);

INSERT INTO experience_ambassadors (experience_ambassador_id,ambassador_id,experience_nature_id,location_id)
VALUES (seq_experience_ambassador_id.NEXTVAL, 1, 3, 2);

INSERT INTO experience_ambassadors (experience_ambassador_id,ambassador_id,experience_nature_id,location_id)
VALUES (seq_experience_ambassador_id.NEXTVAL, 4, 4, 4);
INSERT INTO experience_ambassadors (experience_ambassador_id,ambassador_id,experience_nature_id,location_id)
VALUES (seq_experience_ambassador_id.NEXTVAL, 5, 5, 3);



--Verify insert
SELECT experience_ambassador_id, ambassador_id, experience_nature_id, location_id FROM experience_ambassadors;
--Result   : The inserted data appears in the table



