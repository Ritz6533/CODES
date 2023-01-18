/*
In this example, a cursor named emp_cursor is created to select the firstname, lastname, 
and salary columns from the ambassadors table. The cursor is then opened, and a loop is 
used to fetch each row from the cursor one at a time and display the firstname, lastname,
and salary of each ambassador in the table. Finally, the cursor is closed.
It is also possible to use "FOR LOOP" instead of "LOOP" to fetch the data from cursor.
*/
----ROUGH WORK
DECLARE
   CURSOR emp_cursor IS
      SELECT firstname, lastname, salary FROM ambassadors;
   emp_rec emp_cursor%ROWTYPE;
BEGIN
   OPEN emp_cursor;
   LOOP
      FETCH emp_cursor INTO emp_rec;
      EXIT WHEN emp_cursor%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(emp_rec.firstname || ' ' || emp_rec.lastname || ' earns ' || emp_rec.salary);
   END LOOP;
   CLOSE emp_cursor;
END;
/

---
DECLARE
   CURSOR emp_cursor IS
      SELECT firstname, lastname, salary FROM ambassadors;
   emp_rec emp_cursor%ROWTYPE;
BEGIN
   OPEN emp_cursor;
   FOR emp_rec IN emp_cursor
   LOOP
      UPDATE ambassadors
      SET salary = salary * 1.1
      WHERE firstname = emp_rec.firstname AND lastname = emp_rec.lastname;
   END LOOP;
   CLOSE emp_cursor;
END;
/
----
DECLARE
   CURSOR emp_cursor IS
      SELECT ambassador_id FROM ambassadors WHERE salary < 5000;
   emp_id NUMBER;
BEGIN
   OPEN emp_cursor;
   FOR emp_rec IN emp_cursor
   LOOP
      DELETE FROM ambassadors
      WHERE ambassador_id = emp_rec.ambassador_id;
   END LOOP;
   CLOSE emp_cursor;
END;
--
CREATE OR REPLACE PROCEDURE display_ambassador_salary(p_min_salary NUMBER)
AS
   CURSOR emp_cursor IS
      SELECT firstname, lastname, salary FROM ambassadors WHERE salary > p_min_salary;
   emp_rec emp_cursor%ROWTYPE;
BEGIN
   OPEN emp_cursor;
   FOR emp_rec IN emp_cursor
   LOOP
      DBMS_OUTPUT.PUT_LINE(emp_rec.firstname || ' ' || emp_rec.lastname || ' earns ' || emp_rec.salary);
   END LOOP;
   CLOSE emp_cursor;
END;
