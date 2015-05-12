<h2>Direct Path Load Examples</h2>

SQL scripts to compare direct path load in Oracle Database 11g Release 2 with Oracle Database 12c.  They are primarily intended to demonstrate the new Hybrid TSM/HWMB load strategy in 12c - comparing this to the TSM strategy available in 11g. See the 11g and 12c "tsm_v_tsmhwmb.sql" scripts and their associated spool file "tsm_v_tsmhwmb.lst" to see the difference in behavior between these two database versions. In particular, compare the reduced number of table extents created in the 12c example compared with 11g.

The 11g directory contains a couple of examples to show how it is possible to use 10053 tracing to get information on the direct path strategy used because the SQL execution plan in 11g does not provide this information. The "show_type.sh" shows how you can grep this information from the "TRC" trace files.

The 12c directory contains a comprehensive set of examples demonstrating how the SQL execution plan is decorated with the chosen load strategy. 

Each SQL script has an associated LST file so you can see an example of the output without having to run them.

DISCLAIMER:
   -- These scripts are provided for educational purposes only. It is
   -- NOT supported by Oracle World Wide Technical Support.
   -- The scripts have been tested and they appear to work as intended.
   -- You should always run scripts on a test instance.
   -- Note that they will DROP tables when they are executed.


