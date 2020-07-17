<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
 <%
    if(request.getParameter("submit")!=null){
    	String id=request.getParameter("id");
    	String name=request.getParameter("sname");
    	String course=request.getParameter("course");
    	String fee=request.getParameter("fee");
    	
    	Connection conn;
    	PreparedStatement pst;
    	ResultSet rs;
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	conn=DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
    	pst=conn.prepareStatement("update student set stname=?,course=?,fee=? where id=? ");
    	pst.setString(1,name);
    	pst.setString(2,course);
    	pst.setString(3,fee);
    	pst.setString(4,id);
    	pst.executeUpdate();
    	
    	%>
    	
    	
    	<script>
    	
    	alert("Record Updated");
    	
    	</script>
    	
    	
    	<%
    }
    
    %>
     
     
     
     
     
     
     
     
     
     
     
     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
<link href="bootstrap-4.5.0/dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>

<link href="bootstrap-4.5.0/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>

  <h1>Student Update</h1>
  
  <div class="row">
   <div class="col-sm-4">
                <form  method="post" action="#">
                
                <%
                Connection conn;
            	PreparedStatement pst;
            	ResultSet rs;
            	
            	Class.forName("com.mysql.jdbc.Driver");
            	conn=DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
            	String id= request.getParameter("id");
            	pst=conn.prepareStatement("select * from student where id=?");
            	pst.setString(1,id);
                rs=pst.executeQuery();
                
                while(rs.next()){
                	
                
                %>
                
                
                
                
                    <div align="left">
                        <label class="form-label-group">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" value="<%= rs.getString("stname") %>" name="sname" id="sname" required>
                        </div>
                    <div align="left">
                        <label class="form-label-group">Course</label>
                        <input type="text" class="form-control" placeholder="Course"    value = "<%= rs.getString("course") %>" name="course" id="course" required>
                        </div>
                    <div align="left">
                        <label class="form-label-group">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee"  value=   " <%=  rs.getString("fee") %>"  name="fee" -id="fee" required>
                        
                        </div>
                        
                        <% }%>
                           
                        
                     </br>
                    <div align="right">
                       <input type ="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type ="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                         
                        </div>
                        <div align ="right">
                        <p><a href ="index.jsp">Back</a></p>
                        
                        </div>
                </form>
            </div>
  
  
  </div>
  
</body>
    
    
    
    
</body>
</html>
