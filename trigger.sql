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

CREATE OR REPLACE TRIGGER trig_show_deleted
AFTER DELETE ON ambassadors
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('The following row has been deleted from the ambassadors table:''Ambassador ID: ' || :old.id || 'Name: ' || :old.firstname);
END;
/


--
CREATE OR REPLACE TRIGGER trig_log_db_shutdown
BEFORE SHUTDOWN ON DATABASE
BEGIN
  INSERT INTO db_logs (event, timestamp)
  VALUES ('Database shutdown', SYSDATE);
END;
/


