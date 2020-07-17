<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import ="java.sql.* " %>
    
    <%
    if(request.getParameter("submit")!=null){
    	String name =request.getParameter("sname");
    	String course =request.getParameter("course");
    	String fee = request.getParameter("fee");
    	String name=request.getParameter("sname");
    	String course=request.getParameter("course");
    	String fee=request.getParameter("fee");
    	
    	Connection conn;
    	PreparedStatement pst;
    	ResultSet rst;
    	ResultSet rs;
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn=DriverManager.getConnection("jdbc:mysql://localhost/school","root"," ");
    	pst=conn.prepareStatement("insert into records (name,course,fee) values(?,?,?)");
    	conn=DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
    	pst=conn.prepareStatement("insert into student(stname,course,fee) values(?,?,?)");
    	pst.setString(1,name);
    	pst.setString(2,course);
    	pst.setString(3,fee);
@ -21,81 +23,110 @@
    	
    	%>
    	
    	
    	
    	<script>
    	
    	alert("Record Added");
    	
    	</script>
<!--

//-->
</script>
    	
    	<% 
    
    	
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
<title>Insert title here</title>

             <input type ="submit" value="submit"/><br>
             <input type ="submit" value="reset"/><br>
<link href="bootstrap-4.5.0/dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>

</form>
<link href="bootstrap-4.5.0/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

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
<h1>Student Registration System</h1>
</br>
        <div class="row">
            <div class="col-sm-4">
                <form  method="post" action="#">
                    <div align="left">
                        <label class="form-label-group">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" name="sname" -id="sname" required>
                        </div>
                    <div align="left">
                        <label class="form-label-group">Course</label>
                        <input type="text" class="form-control" placeholder="Course" name="course" -id="course" required>
                        </div>
                    <div align="left">
                        <label class="form-label-group">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee" -id="fee" required>
                        </div>
                     </br>
                    <div align="right">
                       <input type ="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type ="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                         
                        </div>
                </form>
            </div>
            <div class="col-sm-8">
                <div class="panel-body">
                <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                
                <thead>
                <tr>
                <th>Student Name</th>
                <th>Course</th>
                <th>Fee</th>
                <th>Edit</th>
                <th>Delete</th>
                
                </tr>
                
                <%

            	Connection conn;
            	PreparedStatement pst;
            	ResultSet rs;
            	
            	Class.forName("com.mysql.jdbc.Driver");
            	conn=DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
            	String query="select * from student";
            	Statement st = conn.createStatement();
            	rs=st.executeQuery(query);
            	while(rs.next()){
            		
            		String id=rs.getString("id");
            		
            	
                
                %>
                <tr>
                 <td><%=rs.getString("stname") %></td>
                <td><%=rs.getString("course") %></td>
                <td><%=rs.getString("fee") %></td>
                <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                 <td><a href="delete.jsp?id=<%=id %>">Delete</a></td>
                </tr>
                <%
            	}
                
                %>
                
                
                
                </table>
                
                </div>
                
            </div>
        </div>
</head>
<body>

</body>
</html>
