<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crime Stats</title>
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
		crimeList.add("Larceny Theft");
		crimeList.add("Vehicle Theft");

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
			String entityCrime = request.getParameter("crimeType");
			String entityState = request.getParameter("state");
			//check if user selected all crimes and make statement
			String str;
			if(entityCrime.equals("All"))
			{
				str = "SELECT * FROM StateCrime WHERE State = '" + entityState + "'";
			}
			else
			{
				str = "SELECT State, " + entityCrime +" FROM StateCrime WHERE State = '" + entityState + "'";
			}
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			out.print("State: " + entityState);
			
			//Make an HTML table to show the results in:
			out.print("<table>");

			if(!entityCrime.equals("All"))
			{
				
				//make a column for crime 
				out.print("<td>");
				//print out column header
				out.print("Crime");
				out.print("</td>");
				//make a column for statistic
				out.print("<td>");
				//print out column header
				out.print("Statistic");
				out.print("</td>");			
	
				//parse out the results
				while (result.next()) 
				{
					out.print("<tr>");
					//make column and print crime type
					out.print("<td>");
					out.print(entityCrime);
					out.print("</td>");
					//make column and print statistic
					out.print("<td>");
					out.print(result.getString(entityCrime));
					out.print("</td>");
					//out.print("</tr>");
				}
			}
			else
			{
				//make a row
				out.print("<tr>");
				//make a column for state 
				out.print("<td>");
				//print out column header
				out.print("Crime");
				out.print("</td>");
				//make a column for Population 
				out.print("<td>");
				//print out column header
				out.print("Statistic");
				out.print("</td>");
				
				//parse out the results
				while (result.next()) 
				{
					for(int i = 0; i < crimeList.size();i++)
					{
					//make a row
					out.print("<tr>");
					//make a column and print state name
					out.print("<td>");
					out.print(crimeList.get(i));
					out.print("</td>");
					//make column and print statistic
					out.print("<td>");
					out.print(result.getString(crimeList.get(i)));
					out.print("</td>");
					//out.print("</tr>");
					}
				}
			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) 
		{
			e.printStackTrace(); 
		}
	%>

</body>
</html>