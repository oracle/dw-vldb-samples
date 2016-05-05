Get a detailed list of database parameters and fix controls affected by optimizer_features_enable (OFE)

The script should be run on a test instance and it requires access to SYS.X$... tables.

If the database has any Optimizer database parameters set already, then this can mask differences reported by the script.

The script will create some tables and drop them on completion, so you will be prompted for the name of schema where it is safe to do this.

Usage:

1) Connect to an account with access to SYS.X$ tables (usually SYS)
2) SQL> @ofe

<a hred="http://blogs.oracle.com/optimizer">See Optimizer blog for more details.</a>
