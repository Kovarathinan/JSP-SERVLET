<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String sname=""+request.getParameter("stname");
String sid=""+request.getParameter("streg");
String sdept=""+request.getParameter("stdept");
%>
   <form action="StudentSer.jsp" method="get">
   <!-- <form action="StudentSerPre.jsp" method="get"> -->  
   <!-- <form action="StudentSerCall.jsp" method="get"> --> 
<table align="center" border="1" cellspacing="2" cellpadding="2">
<tr>
<td>Student Name</td>
<%
if(sname.equals("null"))
{
	%>
	<td><input type="text" name="stname" value=""/></td>
	<%
}
else
{
	%>
	<td><input type="text" name="stname" value="<%=sname%>"/></td>
	<%
}
%>
</tr>
<tr>
<td>Student ID</td>
<%
if(sid.equals("null"))
{
	%>
	<td><input type="text" name="streg" value=""/></td>
	<%
}
else
{
	%>
	<td><input type="text" name="streg" value="<%=sid%>"/></td>
	<%
}
%>
</tr>
<tr>
<td>DEPARTMENT</td>
<td><select name="stdept">
<%
if(sdept.equals("cse"))
{
	%>
	<option value="cse" selected="selected">COMPUTER SCIENCE</option>
	<option value="ece">ELECTRONICS</option>
	<option value="eee">ELECTRICAL</option>
	<%
}
else if(sdept.equals("ece"))
{
	%>
	<option value="cse">COMPUTER SCIENCE</option>
	<option value="ece" selected="selected">ELECTRONICS</option>
	<option value="eee">ELECTRICAL</option>
	<%
}
else if(sdept.equals("eee"))
{
	%>
	<option value="cse">COMPUTER SCIENCE</option>
	<option value="ece">ELECTRONICS</option>
	<option value="eee" selected="selected">ELECTRICAL</option>
	<%
}
else if(sdept.equals("null"))
{
	%>
	<option value="cse">COMPUTER SCIENCE</option>
	<option value="ece">ELECTRONICS</option>
	<option value="eee">ELECTRICAL</option>
	<%
}
%>
</select></td>
</tr>
<tr>
<td colspan="2">
<table border="1">
<tr>
<td><input type="submit" name="save" value="ADD"/></td>
<td><input type="submit" name="open" value="SEARCH"/></td>
<td><input type="submit" name="update" value="UPDATE"/></td>
<td><input type="submit" name="delete" value="DELETE"/></td>
<td><input type="submit" name="select" value="SELECT ALL"/></td>
</tr>
</table>
</td>
</tr>
</table>

</form>
</body>
</html>