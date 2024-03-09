<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Pack.Jdbc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String sname=request.getParameter("stname");
String sid=request.getParameter("streg");
String sdept=request.getParameter("stdept");
Jdbc db=new Jdbc();
Connection con=db.dbconnect();
if(request.getParameter("save")!=null)
{
	out.print(con);
	if((sdept.length()>0)&&(sid.length()>0))
	{
		int id=Integer.parseInt(sid);
		String sql="insert into details values(?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, sname);
		ps.setInt(2, id);
		ps.setString(3, sdept);
		System.out.println(sql);
		int n=ps.executeUpdate();
		ps.close();
		JOptionPane.showMessageDialog(null, "inserted");
		%>
		<jsp:forward page="Student.jsp"/>
		<%
	}
	else
	{
		JOptionPane.showMessageDialog(null, "Invalid");
		%>
		<jsp:forward page="Student.jsp"/>
		<%
	}
	
}
else if(request.getParameter("open")!=null)
{
	if(sid.length()>0)
	{
		int id=Integer.parseInt(sid);
		String sql="select *from details where stu_reg=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, id);
		System.out.println(sql);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			%>
			<jsp:forward page="Student.jsp">
			<jsp:param value="<%=rs.getString(1)%>" name="stname"/>
			<jsp:param value="<%=rs.getInt(2)%>" name="streg"/>
			<jsp:param value="<%=rs.getString(3)%>" name="stdept"/>
			</jsp:forward>
			<%
		}
		else
		{
			JOptionPane.showMessageDialog(null, "no records found");
			%>
			<jsp:forward page="Student.jsp"/>
			<%
		}
	}
}
else if(request.getParameter("update")!=null)
{
	if((sdept.length()>0)&&(sid.length()>0))
	{
		int id=Integer.parseInt(sid);
		String sql="update details set stu_dept=? where stu_reg=?";

		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, sdept);
		ps.setInt(2,id);
		System.out.println(sql);
		int n=ps.executeUpdate();
		ps.close();
		JOptionPane.showMessageDialog(null, "updated");
		%>
		<jsp:forward page="Student.jsp"/>
		<%
	}
	else
	{
		JOptionPane.showMessageDialog(null, "Invalid");
		%>
		<jsp:forward page="Student.jsp"/>
		<%
	}
}
else if(request.getParameter("delete")!=null)
{
	if(sid.length()>0)
	{
		int id=Integer.parseInt(sid);
		String sql="delete from details where stu_reg=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, id);
		System.out.println(sql);
		int n=ps.executeUpdate();
		ps.close();
		JOptionPane.showMessageDialog(null, "deleted");
		%>
		<jsp:forward page="Student.jsp"/>
		<%
	}
	else
	{
		JOptionPane.showMessageDialog(null, "Invalid");
		%>
		<jsp:forward page="Student.jsp"/>
		<%
	}
}
else if(request.getParameter("select")!=null)
{
	Statement st=con.createStatement();
	String sql="select *from details";
	System.out.println(sql);
	ResultSet rs=st.executeQuery(sql);
	%>
	<jsp:include page="Student.jsp"/>
	<table align="center" border="1">
	<tr>
	<th>NAME</th>
	<th>ID</th>
	<th>DEPT</th>
	</tr>
	<%
	while(rs.next())
	{
		%>
		<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getInt(2)%></td>
		<td><%=rs.getString(3) %></td>
		</tr>
		<%
	}
	
	%>
	</table>
	<%
	rs.close();
	st.close();
}
con.close();
%>

</body>
</html>