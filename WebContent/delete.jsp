<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import ="java.sql.* " %>
    
    <% 
    	String id=request.getParameter("id");
    	
    	
    	Connection conn;
    	PreparedStatement pst;
    	ResultSet rs;
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn=DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
    	pst=conn.prepareStatement("delete from student where id =?");
    	pst.setString(1,id);
    	pst.executeUpdate();
    	
    	%>
    	
    	
    	<script>
    	
    	alert("Record Deleted");
    	
    	</script>
    	
    	
    
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>

</body>
</html>