	--GROUP 7
	--	RITESH JUNG SHAH
	--	RUPAK DAHAL
	--	DIPESH DHUNGANA
	--	RAHUL AHMED SEZAN 

--testing PLSQL

--Test 1
SELECT ambassador_id,firstname,salary  FROM ambassadors WHERE ambassador_id =2;
SELECT ambassador_id,firstname,salary  FROM ambassadors WHERE ambassador_id =3;
EXEC proc_ambassador_salary(2, 15);
EXEC proc_ambassador_salary(3, 10);
SELECT ambassador_id,firstname,salary  FROM ambassadors WHERE ambassador_id =2;
SELECT ambassador_id,firstname,salary  FROM ambassadors WHERE ambassador_id =3;

--Test 2
SELECT ambassador_id,firstname,lastname  FROM ambassadors WHERE ambassador_id =2;
EXEC proc_username(2);
SELECT ambassador_id,firstname,lastname  FROM ambassadors WHERE ambassador_id =3;
EXEC proc_username(3);

--Test 3
SELECT location_id,price,capacity FROM locations WHERE location_id = 4;
EXEC proc_discounted_price(4);
SELECT location_id,price,capacity FROM locations WHERE location_id = 1;
EXEC proc_discounted_price(1);

--Test 4
SELECT ambassador_id,firstname,salary  FROM ambassadors WHERE ambassador_id =6;
EXEC proc_delete_ambassador (6);
SELECT ambassador_id,firstname,salary  FROM ambassadors WHERE ambassador_id =6;

--Test 5
SELECT ambassador_id,firstname,lastname  FROM ambassadors WHERE ambassador_id =2;
SELECT func_fullname(2) FROM DUAL;
SELECT func_fullname(3) FROM DUAL;

--Test 6
SELECT func_lastname(2) FROM DUAL;
SELECT func_lastname(3) FROM DUAL;

--Test 7
SELECT ambassador_id, firstname, salary FROM ambassadors;
