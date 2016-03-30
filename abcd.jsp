
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
			<legend>Project Status</legend><BR>
<form method="post" action="workassign.jsp">
<%@ page import="java.sql.*"%>
<%
    
    Connection con=null;
	PreparedStatement sst=null;
	Statement st=null;
	ResultSet rs=null;
	ResultSet rs2=null;
	ResultSet rs3=null;
	%><select name="pid">
<option name="pid">Select Employee</option>
								<%
									try {
									Class.forName("com.mysql.jdbc.Driver");
		 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms","root","");
									st=con.createStatement();
									String cmd2="Select empid,empname from employee";
									rs2=st.executeQuery(cmd2);
									
									while(rs2.next()) 
									{
										String empid=rs2.getString("empid");
										String empname=rs2.getString("empname");
										
										out.println("<option empid='"+empid+"' empname='"+empname+"' >"+empid+"</option>");
									}
									
								   }   catch(Exception e) {
								       out.println("<option val='null'>"+e.getMessage().toString()+"</option>");
								       }
								%>
								<input type=submit name=Submit>
					</form>
					</body>
					</html>