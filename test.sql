/*CREATE OR REPLACE FUNCTION proc_username IS 
vc_username VARCHAR(25);
vc_firstname students.student_firstname%TYPE;
vc_surname students.student_surname%TYPE;

BEGIN
SELECT student_firstname, student_surname
INTO vc_firstname,vc_surname
FROM students
WHERE student_id = 6901;

vc_username:=SUBSTR(vc_firstname,1,2) || SUBSTR(vc_surname,1,5);
RAISE NOTICE; 

END; */





CREATE OR REPLACE FUNCTION proc_username()
RETURNS VARCHAR(25) AS $$
DECLARE 
  vc_username VARCHAR(25);
  vc_firstname VARCHAR(255);
  vc_lastname VARCHAR(255);
BEGIN
  SELECT ambassador_firstname, ambassador_surname
  INTO vc_firstname,vc_lastname
  FROM ambassadors
  WHERE ambassador_id = 6901;
  vc_username:=substring(vc_firstname,1,2) || substring(vc_lastname,1,5);
  RAISE NOTICE 'vc_username: %', vc_username;
  RETURN vc_username;
END;
$$ LANGUAGE plpgsql;

--org--


--update_ambassador_salary

CREATE OR REPLACE FUNCTION update_ambassador_salary(INTEGER, NUMERIC)
RETURNS VOID AS $$
BEGIN
    UPDATE ambassadors
    SET salary = $2
    WHERE ambassador_id = $1;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION test_ambassador_connection()
RETURNS text AS $$
BEGIN
    RETURN 'Connection to database via Ambassador API Gateway is successful.';
END;
$$ LANGUAGE plpgsql;

-------create a test environment
