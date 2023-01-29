	--GROUP 7
	--	RITESH JUNG SHAH
	--	RUPAK DAHAL
	--	DIPESH DHUNGANA
	--	RAHUL AHMED SEZAN 

--trigger to add gender Male as M and Female as F only
CREATE OR REPLACE TRIGGER trig_check_gender
AFTER INSERT OR UPDATE OF gender ON ambassadors
FOR EACH ROW
BEGIN
  IF :new.gender NOT IN ('F', 'M') THEN
    RAISE_APPLICATION_ERROR(-20000, 'Invalid!. Only ''F'' for female or ''M'' for male are allowed.');

  END IF;
END;
/

--test
INSERT INTO ambassadors(ambassador_id,firstname,lastname,gender,email,leader,salary,contact,current_address)
VALUES (seq_ambassador_id.NEXTVAL, 'BORED', 'MANGO', 'X', 'BOREDMANGO@GMAIL.COM', seq_ambassador_id.CURRVAL, 40000.50 ,contact_detail_varray_type(contact_detail_type('7414118520', 'MOBILE') ,contact_detail_type('8426795130', 'HOME')) ,address_type('33 CASTLE ASBY', 'NORTHAMPTON', 'UK'));

--trigger to display the ambassadors input name and if they have a high or low salary
CREATE OR REPLACE TRIGGER trig_display_a
AFTER INSERT ON ambassadors
FOR EACH ROW
BEGIN
   DBMS_OUTPUT.PUT_LINE(' Welcome to the database '|| :NEW.firstname ||' '|| :NEW.lastname);
   IF :NEW.salary > 12000 THEN
      DBMS_OUTPUT.PUT_LINE('You have a competitive salary which is - '|| :NEW.salary  );
   ELSE
      DBMS_OUTPUT.PUT_LINE('You have a modest salary which is '|| :NEW.salary );
   END IF;
END;
/
--Test
INSERT INTO ambassadors(ambassador_id,firstname,lastname,gender,email,leader,salary,contact,current_address)
VALUES (seq_ambassador_id.NEXTVAL, 'BORED', 'MANGO', 'M', 'BOREDMANGO@GMAIL.COM', seq_ambassador_id.CURRVAL, 40000.50 ,contact_detail_varray_type(contact_detail_type('7414118520', 'MOBILE') ,contact_detail_type('8426795130', 'HOME')) ,address_type('33 CASTLE ASBY', 'NORTHAMPTON', 'UK'));

CREATE OR REPLACE TRIGGER trig_show_deleted
AFTER DELETE ON ambassadors
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('The following row has been deleted from the ambassadors table:''Ambassador ID: ' || :old.ambassador_id || '   Name: ' || :old.firstname);
END;
/
SHOW ERRORS

--Test
DELETE FROM ambassadors WHERE ambassador_id = 7;


CREATE OR REPLACE TRIGGER trig_update_salary
BEFORE UPDATE OF salary ON ambassadors 
FOR EACH ROW
BEGIN
  IF :new.salary < :old.salary THEN
    raise_application_error(-20000, 'Salary cannot be decreased');
  END IF;
END;
/

--Test
SELECT ambassador_id, salary FROM ambassadors WHERE ambassador_id = 1;

UPDATE ambassadors SET salary = '1' WHERE ambassador_id = 1;
