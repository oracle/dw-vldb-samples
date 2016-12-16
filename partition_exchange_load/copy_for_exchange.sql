PROMPT ======================================================================================
PROMPT Copy extended statistics and (table-level) histograms from a partitioned table
PROMPT to an exchange table (for partition exchange loading)
PROMPT ======================================================================================
set serveroutput on
set verify off
set feedback off
set linesize 1000
set trims on
set serveroutput on

accept ptable prompt 'Enter the name of the partitioned table: '
accept etable prompt 'Enter the name of the exchange table: '

spool copy_tox.sql

declare
  cursor extlist is
     select extension,creator 
     from   user_stat_extensions
     where  table_name = upper('&ptable');
begin
  dbms_output.put_line('var r VARCHAR2(50)');
  for c in extlist
  loop
    dbms_output.put_line('exec :r := dbms_stats.create_extended_stats('''||user||''',''&etable'','''||c.extension||''')');
  end loop;
end;
/

declare
  n number(10) := 0;
  tname varchar2(100);
  cursor tlist is
    select distinct cs.table_name
    from  user_tab_col_statistics cs,
          user_tables t
    where cs.histogram is not null
    and   cs.histogram != 'NONE'
    and   t.table_name = upper('&ptable')
    and   t.table_name = cs.table_name
    order by cs.table_name;
  cursor collist is
    select column_name
    from  user_tab_col_statistics
    where histogram is not null
    and   histogram != 'NONE'
    and   table_name = tname
    order by table_name,column_name;
begin
  for t in tlist
  loop
     dbms_output.put('exec dbms_stats.gather_table_stats(ownname=>NULL,tabname=>''&etable'',method_opt=>');
     dbms_output.put('''FOR ALL COLUMNS SIZE 1, FOR COLUMNS ');
     tname := t.table_name;
     for c in collist
     loop
        dbms_output.put(c.column_name||' ');
     end loop;
     dbms_output.put('SIZE 254'')');
     dbms_output.put_line('');
  end loop;
end;
/
spool off
