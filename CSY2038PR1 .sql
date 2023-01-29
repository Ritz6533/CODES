COLUMN object_name FORMAT A30;
COLUMN object_type FORMAT A12;
PURGE RECYCLEBIN;
SELECT object_name, object_type FROM user_objects;
SET SERVEROUTPUT ON

-- CSY2038_181@student/CSY2038_181
@D:\university\year_2\database\as2\CODES/createtables.sql
@D:\university\year_2\database\as2\CODES/constraint.sql
@D:\university\year_2\database\as2\CODES/trigger.sql
@D:\university\year_2\database\as2\CODES/insertData.sql
@D:\university\year_2\database\as2\CODES/query.sql
@D:\university\year_2\database\as2\CODES/procedure.sql
@D:\university\year_2\database\as2\CODES/function.sql
@D:\university\year_2\database\as2\CODES/cursor.sql
@D:\university\year_2\database\as2\CODES/drop.sql


GRANT ALL ON db_logs TO <CSY2038_181@student/CSY2038_181>;
