/*
  File: Part3.java
  August 2002
*/

import java.io.*;
import java.util.*;
import java.sql.*;

/**
 * This program reads a user's pass.dat and connects to Oracle.
 *
 * @author Paul Werstein
 */

public class Part3 {


    public static void main (String[] args) {
	new Part3().go();
    }

    // This is the function that does all the work
    private void go() {

	// Read pass.dat
	UserPass login = new UserPass();
	String user = login.getUserName();
	String pass = login.getPassWord();
	String host = "silver.otago.ac.nz";

	Connection con = null;
	try {
	    // Register the driver and connect to Oracle
	    DriverManager.registerDriver
		(new oracle.jdbc.driver.OracleDriver());
	    String url = "jdbc:oracle:thin:@" + host + ":1527:cosc344";
            System.out.println("url: " + url);
	    con = DriverManager.getConnection(url, user, pass);
	    System.out.println("Connected to Oracle");

      Statement stmt = con.createStatement();
      //ResultSet rs = stmt.executeQuery("SELECT * FROM department WHERE mgrssn = '888665555'");
      //ResultSetMetaData rsmd = rs.getMetaData();

      stmt.executeUpdate("UPDATE employee SET salary = salary * 1.1");

      ResultSet rs = stmt.executeQuery("select salary FROM employee");

      while(rs.next()){
        String salary = rs.getString("salary");
        System.out.println("new salary: " + salary);
      }
      rs.close();



	} catch (SQLException e) {
	    System.out.println(e.getMessage());
	    System.exit(1);

	} finally {
	    if (con != null) {
		try {
		    con.close();
		} catch (SQLException e) {
		    quit(e.getMessage());
		}
	    }
	}
    }  // end go()

    // Used to output an error message and exit
    private void quit(String message) {
	System.err.println(message);
	System.exit(1);
    }

} // end class Part3
