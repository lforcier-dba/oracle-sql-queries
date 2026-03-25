col index_name for a45
col table_name for a45
col index_owner for a15
col table_owner for a15
compute sum of count on report
break on report
set linesize 260
set pagesize 200

select table_owner,tablespace_name, table_name, count(1) count from dba_tab_partitions
where table_owner not in ('SYS')
and table_owner = 'OWNER'
group by table_owner,tablespace_name,table_name
having count(1) > 100
order by 1,2,4 desc,3;

select index_owner,tablespace_name, index_name, count(1) count from dba_ind_partitions
group by index_owner,tablespace_name,index_name
having count(1) > 100
order by 1,2,4 desc,3;
