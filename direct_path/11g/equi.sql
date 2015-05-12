set linesize 260
column PLAN_TABLE_OUTPUT format a200
set pagesize 200
set trims on
set tab off


alter session enable parallel dml;
alter session set parallel_force_local = FALSE;
alter session set parallel_degree_policy = 'MANUAL';

drop table sales_p;
drop table sales_p2;

create table sales_p partition by hash (sale_id) partitions 64 
as select * from sales where 1=-1
/

create table sales_p2 partition by hash (sale_id) partitions 64 
as select * from sales where 1=-1
/

alter table sales_copy parallel 4;
alter table sales_p parallel 4;
alter table sales_p2 parallel 4;
alter session enable parallel dml;

insert /*+ append */ 
into sales_p t1
select * from sales_copy t2;

select * from table(dbms_xplan.display_cursor);

select segment_name,segment_type
from user_segments
where segment_type = 'TEMPORARY';


commit;

alter session set tracefile_identifier = 'EQUI';
ALTER SESSION SET EVENTS='10053 trace name context forever, level 1';

insert /*+ append */ 
into sales_p2 t1
select * from sales_p t2;

ALTER SESSION SET EVENTS '10053 trace name context off';

commit;

