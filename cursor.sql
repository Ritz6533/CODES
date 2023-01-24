/*
In this example, a cursor named cur_ambassadors is created to select the firstname, lastname, 
and salary columns from the ambassadors table. The cursor is then opened, and a loop is 
used to fetch each row from the cursor one at a time and display the firstname, lastname,
and salary of each ambassador in the table. Finally, the cursor is closed.
It is also possible to use "FOR LOOP" instead of "LOOP" to fetch the data from cursor.
*/
SET SERVEROUTPUT ON;

--Use of While loop and cursor to insert value on different table based on while statement.
CREATE OR REPLACE PROCEDURE proc_a_b
AS
CURSOR cur_m_ambassadors IS
SELECT ambassador_id, salary FROM ambassadors;
rec_cur_m_ambassadors cur_m_ambassadors%ROWTYPE;
BEGIN
OPEN cur_m_ambassadors;
FETCH cur_m_ambassadors INTO rec_cur_m_ambassadors;
WHILE cur_m_ambassadors%FOUND LOOP
IF rec_cur_m_ambassadors.salary <10000
THEN
INSERT INTO experience_ambassadors (experience_ambassador_id,ambassador_id,experience_nature_id,location_id)
VALUES (seq_experience_ambassador_id.NEXTVAL, rec_cur_m_ambassadors.ambassador_id, 1, 1);
DBMS_OUTPUT.PUT_LINE(rec_cur_m_ambassadors.ambassador_id  || '  Ambassador Id has been added to Experience Ambassadors ');
END IF;
FETCH cur_m_ambassadors INTO rec_cur_m_ambassadors;
END LOOP;
CLOSE cur_m_ambassadors;
END;
/
SHOW ERRORS
EXEC proc_a_b;


------

--Updating salary using cursor using for loop
SELECT ambassador_id, firstname, salary FROM ambassadors;

DECLARE
   CURSOR cur_s_ambassadors IS
      SELECT ambassador_id, firstname, salary FROM ambassadors;
   rec_cur_s_ambassadors cur_s_ambassadors%ROWTYPE;
BEGIN
   FOR rec_cur_s_ambassadors IN cur_s_ambassadors
   LOOP
      UPDATE ambassadors
      SET salary = salary * 1.1
      WHERE ambassador_id = rec_cur_s_ambassadors.ambassador_id;
            

   END LOOP;
   DBMS_OUTPUT.PUT_LINE('-SALAY IS UPDATED');
END;
/
SHOW ERRORS
 SELECT ambassador_id, firstname, salary FROM ambassadors;


----Use of cursor to display all the ambassadors with their names and email

DECLARE
   CURSOR cur_ambassadors IS
      SELECT firstname, lastname, email FROM ambassadors;
   rec_cur_ambassadors cur_ambassadors%ROWTYPE;
BEGIN
   OPEN cur_ambassadors;
   LOOP
      FETCH cur_ambassadors INTO rec_cur_ambassadors;
      EXIT WHEN cur_ambassadors%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(rec_cur_ambassadors.firstname || ' ' || rec_cur_ambassadors.lastname || ' email is  ' || rec_cur_ambassadors.email);
   END LOOP;
   CLOSE cur_ambassadors;
END;
/
SHOW ERRORS

--Extract the ambassadors with atleast minimum salary of inserted data
CREATE OR REPLACE PROCEDURE proc_d_ambassador_salary(in_min_salary NUMBER)
AS
   CURSOR cur_d_ambassadors IS
      SELECT firstname, lastname, salary FROM ambassadors WHERE salary > in_min_salary;
   rec_d_cur_ambassadors cur_d_ambassadors%ROWTYPE;
BEGIN
   FOR rec_cur_d_ambassadors IN cur_d_ambassadors
   LOOP
      DBMS_OUTPUT.PUT_LINE(rec_cur_d_ambassadors.firstname || ' ' || rec_cur_d_ambassadors.lastname || ' Salary =   ' || rec_cur_d_ambassadors.salary);
   END LOOP;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE(SQLERRM);
END proc_d_ambassador_salary;
/
SHOW ERRORS
EXEC proc_d_ambassador_salary (13500);


----need to add 2 more cursior