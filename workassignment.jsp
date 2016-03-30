
<html xmlns=""><head>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<title>RESOURCE MANAGEMENT SYSTEM</title>
</head>
<body>
<table width="780" align=center cellspacing=0 border="4" cellpadding=0>
<jsp:include page="rm_transactions.jsp" /><br>
	<tr><td>
		<table width="600" height="300"align=center cellspacing=0 border="0" cellpadding=0>
			<tr><td>
				<fieldset id="fieldhead">
				<legend>Work Assignment</legend><BR>
					<%@ page import="java.sql.*"%>
				<%
					Connection con=null;
					PreparedStatement pst=null;
					Statement st=null;
					ResultSet rs=null;
					try	
					{
						String pid=request.getParameter("pid");
						String project_name=request.getParameter("project_name");
						String modulename=request.getParameter("module");
						
						String empid=request.getParameter("emp");
						String date1=request.getParameter("dd");
						String mon=request.getParameter("mm");
						String year=request.getParameter("yyyy");
						String submitdate=date1+"-"+mon+"-"+year;
						

						Class.forName("com.mysql.jdbc.Driver");
	                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms","root","");
						Statement stmt=con.createStatement();
						
						pst=con.prepareStatement("insert into workassign(pid,project_name,modulename,empid,submitdate,taskperform,status) values  (?,?,?,?,?,?,?)");
					
						pst.setString(1,pid);
						pst.setString(2,project_name);
						pst.setString(3,modulename);				
					
						pst.setString(4,empid);
						pst.setString(5,submitdate);	
						pst.setString(6,"null");
						pst.setString(7,"assigned");
							
								
						int eff=pst.executeUpdate();		
						
						if(eff>0 )
							out.println(" Work Assign is Successful<BR><center>");
				
						else
							out.println("<CENTER><b><u>Failed To Assign Work<BR><center>");
					}
								
					catch(Exception e)	
						{
					   
						out.println(e.getMessage());
						}
				%>
						
						
					
				</fieldset>
			</td></tr>
		</table>
	</td></tr>
</table>
</body>
</html>


