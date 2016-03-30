<%@page import="java.sql.*"%>
<%! String userid,password;
Connection con;
Statement st;
ResultSet rs;
%>

<%
		
		



	try
		{
			userid=request.getParameter("userid");
			password=request.getParameter("password");
			Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms","root","");
			st=con.createStatement();
			String cmd="Select * from employee where empid='"+userid+"' and pword='"+password+"'";
			rs=st.executeQuery(cmd);
	
   session.setAttribute( "id",userid);

		if(rs.next())
			{
			
				%>
										<jsp:forward page="hr_home.jsp"/>;
						
				<%
				
	        }
			 
	    		 
			else 
				out.println("<body bgcolor=gray><p><font face=tahoma color=maroon>No Such user Exist .<BR><BR>Please Check Your ID and Password u supplied is Correct or Not</h1>");
				 out.print(userid+password);
				
		}
		
	 catch(Exception e)
	    {
			out.println(e.getMessage());
		}

%>