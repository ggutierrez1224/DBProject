<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crime Alert: Home</title>

</head>
<body background="background2.jpg">


<header>
<img style="border: none" src="CrimeAlert.png" width="250" height="80" alt>
</header> <!-- the usual HTML way -->


<br>
 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<form method="get" action="types.jsp" enctype=text/plain>
    <!-- note the show.jsp will be invoked when the choice is made -->
  List States: <select name="type" size=1>
			<option value="Open Carry">Open Carry</option>
			<option value="Not Open Carry">Not Open Carry</option>
		</select>&nbsp;<br> <input type="submit" value="Submit">
</form>
<br>

Compare crime rates based on State. (Per 100k Population)
<br>
	<form method="post" action="cmpRate.jsp">
	<table>
	<tr>    
	<td><input type="text" name="state1" placeholder="First State"></td>
	<td><input type="text" name="state2" placeholder="Second State"></td>
	</tr>
	</table>
	<input type="submit" value="Get Rates">
	</form>
<br>

Get a percentage of a specific crime in a State:
<br>
	<form method="query" action="stats.jsp">
	<table>
	<tr>
	<td><select name="crimeType" size=1>
			<option value="">Pick a Crime</option>
			<option value="Violent">Violent</option>
			<option value="Property">Property</option>
			<option value="Murder">Murder</option>
			<option value="Rape">Rape</option>
			<option value="Robbery">Robbery</option>
			<option value="AggravatedAssault">Aggravated Assault</option>
			<option value="Burglary">Burglary</option>
			<option value="LarcenyThefy">Larceny Theft</option>
			<option value="VehicleTheft">Vehicle Theft</option>
			<option value="All">All Crime</option>
			</select>&nbsp;</td>
	<td><select name="Year" size=1>
		<option value="">Choose Year</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<option value="2016">2016</option>
		</select>&nbsp;</td>
	<td><input type="text" name = "state" placeholder="State Name"></td>
	</tr>
	</table>
	<input type="submit" value="Get Rate">
	</form>
<br>

&nbsp;Find something with this
<br>
	<form method="find" action="find.jsp">
	<table>
	<tr>
	<td><input type="text" name="state" placeholder="State"></td>
	<td><select name="crime" size=1>
			<option value="">Pick a Crime</option>
			<option value="Violent">Violent</option>
			<option value="Property">Property</option>
			<option value="Murder">Murder</option>
			<option value="Rape">Rape</option>
			<option value="Robbery">Robbery</option>
			<option value="AggravatedAssault">Aggravated Assault</option>
			<option value="Burglary">Burglary</option>
			<option value="LarcenyThefy">Larceny Theft</option>
			<option value="VehicleTheft">Vehicle Theft</option>
			</select>&nbsp;</td>
	<td><select name="option" size=1>
		<option value=""> Pick Option</option>
		<option value="MAX">Highest</option>
		<option value="MIN">Lowest</option>
		<option value="AVG">Average</option>
	</select> &nbsp;</td>
	</table>
	&nbsp;<input type="submit" value="Submit">
	</form>

</body>
</html>
