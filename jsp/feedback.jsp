<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*"%>

<%
	
	String Experience;
	String Comments;
	String User_Name;
	String Email;
	
	
	Exprience = request.getParameter("Experience");
	Comments= request.getParameter("Comments");
	User_Name = request.getParameter("User_Name");
	Email = request.getParameter("Email");
	
     	out.println("Your Experience is : "+Experience+"<br>");
		out.println("Your Comments is : "+Comments+"<br>");	
     	out.println("Your User_Name is : "+User_Name+"<br>");
		out.println("Your Email is : "+Email+"<br>");				
		
		String sql;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/drm_demo","root","");
			Statement stmt=con.createStatement();
			sql = "INSERT INTO `feedback`(`Experience`, `Comments`, `User_Name`,`Email`) VALUES ('"+Experience+"','"+Comments"', '"+User_Name+"','"+Email+"')";
			stmt.executeUpdate(sql);
			
			String query="Select * from feedback";			
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next())
			{
				out.println(rs.getString("Experience")+ "--- "+rs.getString("Comments")+ "--- "+rs.getString("User_Name")+ "--- "+rs.getString("Email")+"<br>");	
			}
			rs.close();
					
			stmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			System.out.println("Finally DB Operation Complete");
		}		
%> 