<h2>Direct Path Load Examples</h2>

SQL scripts are provided to compare Oracle Database 11g Release 2 with Oracle Database 12c.

The scripts are primarily intended to demonstrate the new Hybrid TSM/HWMB load strategy in 12c - comparing this to the TSM strategy available in 11g. See the 11g and 12c "tsm_v_tsmhwmb.sql" scripts and their associated spool file "tsm_v_tsmhwmb.lst" to see the difference in behavior between these two database versions - in particular the reduce number of table extents created in the 12c example.

The 11g directory contains a couple of examples to show how it is possible to use 10053 tracing to get information on the direct path strategy used because the SQL execution plan in 11g does not provide this information.

The 12c directory contains a comprehensive set of examples demonstrating how the SQL execution plan is decorated with the chosen load strategy. 

