<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crime Rate Change</title>
</head>
<body>
<%
		List<String> list = new ArrayList<String>();
		ArrayList<String> crimeList = new ArrayList<String>();
		crimeList.add("Violent");
		crimeList.add("Property");
		crimeList.add("Murder");
		crimeList.add("Rape");
		crimeList.add("Robbery");
		crimeList.add("AggravatedAssault");
		crimeList.add("Burglary");
		crimeList.add("LarcenyTheft");
		crimeList.add("VehicleTheft");

		try {

			//Create a connection string
			String url = "jdbc:mysql://projectdb.cydkzsvgiryv.us-east-1.rds.amazonaws.com:3306/Project";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "gg548", "password");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selection from Home.jsp
			String entityCrime = request.getParameter("crime");
			String entityState = request.getParameter("state");
			String entityYear1 = request.getParameter("year1");
			String entityYear2 = request.getParameter("year2");
			//check if user selected all crimes and make statement
			String strSel, strFrom, strWhere;
			strSel = "SELECT TRUNCATE(((c." + entityCrime +"- s." + entityCrime + ")/s." + entityCrime + ")*100,2) as Rate "; 
			strFrom = "FROM StateCrime s, StateCrime c ";
			strWhere = "WHERE c.State = '" + entityState + "'" + " AND s.State = '" + entityState+ "' AND s.Year = " + entityYear1 + " AND c.Year = " +entityYear2;
			System.out.println(strSel + strFrom + strWhere);
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(strSel + strFrom + strWhere);
			
			out.print("State: " + entityState);
			out.print("<br>");
			out.print("Crime: " + entityCrime);
			out.print("<br>");
			out.print("Change Between: " + entityYear1 + " - " + entityYear2);
			
			//Make an HTML table to show the results in:
			out.print("<table>");

			
			result.next();
			out.print("<br>");
			out.print("Rate: " + result.getString("Rate") + "%");
			
			//close the connection.
			con.close();

		} catch (Exception e) 
		{
			e.printStackTrace(); 
		}
	%>
</body>
</html>