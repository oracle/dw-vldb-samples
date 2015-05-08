<h2>Data Loading Examples</h2>

<h3>Purpose</h3>

Some examples for loading data efficiently into an Oracle database. Note that the Java code includes examples of both good and (very!) bad practice. For full details, and the background behind the examples, check out the <a href="https://www.youtube.com/watch?v=Tr2DC-1W0i8&feature=youtu.be">Youtube web seminar.</a>

The Java was tested on JDK 7 and Oracle Database 12.1.0.2, but it will work without issue on Oracle 11gR2 too. To compile it, your project will need to include the Oracle JDBC client libraries.

The Python example requires <a href="http://cx-oracle.sourceforge.net/">cx_Oracle</a>, which in turn depends an Oracle client installation (for example, the <a href="http://www.oracle.com/technetwork/database/features/instant-client/index.html">basic instant client and SDK).</a>
