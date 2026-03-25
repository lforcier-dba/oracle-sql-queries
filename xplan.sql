to get sql statement:
set long 50000
select sql_fulltext from gv$sql where sql_id = 'sqlid' and rownum = 1;
SELECT * FROM table(DBMS_XPLAN.DISPLAY_CURSOR(sql_id=>'sqlid'));
