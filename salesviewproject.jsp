<html>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html><head>
<link href="./css/styles.css" rel="stylesheet">
<title>RESOURCE MANAGEMENT SYSTEM</title></head>
<body>
<jsp:include page="sales_transactions.jsp" />
<p><b>Project Details<hr color="#008000" size="4">

<%

	Connection con=null;
	PreparedStatement stmt=null;
	Statement st=null;
	ResultSet rs=null;
	%>
	

	
	<%
    try{
		Class.forName("com.mysql.jdbc.Driver");
		 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms","root","");
    st=con.createStatement();
	String id=request.getParameter("id1");
	rs=st.executeQuery("Select pid,client_name,project_name,platform,duration,budget,enddate,status from projectdet where pid='"+id+"'");
	
	while(rs.next()) {
		String pid=rs.getString(1);
		String clientname=rs.getString(2);
		String projectname=rs.getString(3);
		String platform=rs.getString(4);
		int duration=Integer.parseInt(rs.getString(5));
		int budget=Integer.parseInt(rs.getString(6));
		String enddate=rs.getString(7);
		String status=rs.getString(8);
		%>
		hey its me
		<table width=80% align=center cellspacing=1 cellpadding=3><tr><td width='30%'>Project ID</td>
		<td width='30%'><font color=gray><%= clientname %></font></td></tr>
		
		</table>
		<%
		}
}catch(Exception e){e.printStackTrace();}

%></fieldset>


</body></html>