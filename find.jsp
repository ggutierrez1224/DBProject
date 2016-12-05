<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Option Result</title>
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
			String entityState = request.getParameter("state");
			String entityCrime = request.getParameter("crime");
			String entityOption = request.getParameter("option");
			//Make query
			String str = "SELECT " + entityOption + "(" + entityCrime+ ") as Result, Year FROM StateCrime WHERE State = '" + entityState + "'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//print results
			result.next();
			out.print("State: " + entityState);
			out.print("<br>");
			out.print("Year: " + result.getString("Year"));
			out.print("<br>");
			out.print(entityCrime + ": " + result.getString("Result"));
			
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
