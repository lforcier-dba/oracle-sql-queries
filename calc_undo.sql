 rem calc_undo.sql
 col undo_retention_sec for a25
 SELECT d.undo_size/(1024*1024) actual_undo_size_mb,
 SUBSTR(e.value,1,25) undo_retention_sec,
 ROUND((d.undo_size / (to_number(f.value) *
 g.undo_block_per_sec))) optimal_undo_retention_sec
 FROM (
 SELECT SUM(a.bytes) undo_size
 FROM v$datafile a,
 v$tablespace b,
 dba_tablespaces c
 WHERE c.contents = 'UNDO'
 AND c.status = 'ONLINE'
 AND b.name = c.tablespace_name
 AND a.ts# = b.ts#
 ) d,
 v$parameter e,
 v$parameter f,
 (
 SELECT MAX(undoblks/((end_time-begin_time)*3600*24))undo_block_per_sec
 FROM v$undostat
 ) g
 WHERE e.name = 'undo_retention'
 AND f.name = 'db_block_size' ;
