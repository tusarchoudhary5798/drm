<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*"%>
<%
    String User_Name = request.getParameter("User_Name");    
    String Password = request.getParameter("Password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/drm_demo","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from login where User_Name='" + User_Name + "'and  Password='" + Password + "'");
    if (rs.next()) {
        session.setAttribute("User_Name", Password);
       	out.println("Login Succssfully<br>");
	   
        
    } else {
        out.println("Invalid password <a href='login.html'>try again");
    }

%>	