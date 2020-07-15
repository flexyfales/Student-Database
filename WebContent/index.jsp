<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%
    if(request.getParameter("submit")!=null){
    	String name =request.getParameter("sname");
    	String course =request.getParameter("course");
    	String fee = request.getParameter("fee");
    	
    	Connection conn;
    	PreparedStatement pst;
    	ResultSet rst;
    	Class.forName("com.mysql.jdbc.Driver");
    	conn=DriverManager.getConnection("jdbc:mysql://localhost/school","root"," ");
    	pst=conn.prepareStatement("insert into records (name,course,fee) values(?,?,?)");
    	pst.setString(1,name);
    	pst.setString(2,course);
    	pst.setString(3,fee);
    	pst.executeUpdate();
    	
    	%>
    	
    	<script> 
    	
    	alert("Record Added");
    	</script>
<!--

//-->
</script>
    	
    	<% 
    
    }
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<h1>Student Registration System</h1>

<form  method="post" action="#">

 StudentName :<input type="text" name="sname" placeholder="StudentName" required/><br>
 Course      :<input type = "text" name ="course" placeholder="Course" required/><br>
 Fee         :<input type="text" name="fee" placeholder="Fee" required/><br>

             <input type ="submit" value="submit"/><br>
             <input type ="submit" value="reset"/><br>

</form>

 <table id ="tbl-student" class=" table table-responsive table-bordered" cellpadding="0" width="100%" border="1%">
 <thead>
          <tr>
          <th> Student Name</th>
           <th>Course</th>
            <th>Fee</th>
            <th>Edit</th>
            <th>Delete </th>
          </tr>
          <%
          Connection conn;
      	PreparedStatement pst;
      	ResultSet rst;
      	Class.forName("com.mysql.jdbc.Driver");
      	conn=DriverManager.getConnection("jdbc:mysql://localhost/school","root"," ");
      //	pst=conn.prepareStatement("insert into records (name,course,fee) values(?,?,?)");
          
       String query="select *from records";
       Statement st =conn.createStatement();
       rst=st.executeQuery(query);
       while(rst.next()){
    	   String id=rst.getString("id");
    	   
       
    		   
          %>
          <tr>
          <td><%=rst.getString("name") %></td>
          <td><%=rst.getString("course") %></td>
          <td><%=rst.getString("fee") %></td>
          <td><a href ="update.jsp?id=<%=id%>">edit</a></td>
         <td><a href ="delete.jsp?id=<%= id%>">delete</a></td>
          </tr>
          <%
       }
          
          %>
 </thead>
 
 </table>


</body>
</html>