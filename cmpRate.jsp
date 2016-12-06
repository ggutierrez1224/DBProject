<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of States</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Create a connection string
			String url = "jdbc:mysql://projectdb.cydkzsvgiryv.us-east-1.rds.amazonaws.com:3306/Project";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "gg548", "password");

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get intput from home.jsp
			String entity1 = request.getParameter("state1");
			String entity2 = request.getParameter("state2");
			String entityYear = request.getParameter("year");
			//Make query
			String str = "SELECT DISTINCT TRUNCATE((c.CrimeTotal/s.Population)*100000,2) as Rate, s.State FROM StateCrime c, States s WHERE (c.State = '" + entity1 + "' AND s.State = '" + entity1 + "' AND c.Year = " + entityYear + ") OR (c.State = '" + entity2 + "' AND s.State = '" + entity2 + "' AND c.Year = " + entityYear + ")";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header for State
			out.print("State");
			out.print("</td>");
			//make column for rate
			out.print("<td>");
			//print out column header for Rate
			out.print("Rate");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current state:
				out.print(result.getString("State"));
				out.print("</td>");
				//print out current rate:
				out.print("<td>");
				out.print(result.getString("Rate"));
				out.print("</td>");
				//
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	%>

</body>
</html>
