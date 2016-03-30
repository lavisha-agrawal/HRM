<html>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html><head>
<link href="./css/styles.css" rel="stylesheet">
<title>RESOURCE MANAGEMENT SYSTEM</title></head>
<body>
<jsp:include page="hr_transactions.jsp" />
<p><b>Project Details<hr color="#008000" size="4">

<%

	Connection con=null;
	PreparedStatement stmt=null;
	Statement st=null;
	ResultSet rs=null;
	%>
	<fieldset id="fieldhead">
	<legend>View Project Details</legend><BR>
<form action="updatestatus.jsp" method=post>
        <% 
           Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms","root","");

            Statement statement = con.createStatement();

            String id = request.getParameter("id");  
          ResultSet resultset=statement.executeQuery("Select pid,client_name,project_name,platform,duration,budget,enddate,status from projectdet where pid='"+id+"'");
           
		
            if(!resultset.next()) {
                out.println("Sorry, could not find that publisher. " +
                "Please <A HREF='tryAgain.html'>try again</A>.");
            } else {
        %>

        <TABLE BORDER="1">
            <TR>
               <TH>ID</TH>
			   <TH>ClientName</TH>
               <TH>ProjectName</TH>
               <TH>Platform</TH>
               <TH>Duration</TH>
               <TH>Budget</TH>
			    <TH>EndDate</TH>
				 <TH>Status</TH>
           </TR>
           <TR>
               <TD> <%= resultset.getString(1) %> </TD>
               <TD> <%= resultset.getString(2) %> </TD>
               <TD> <%= resultset.getString(3) %> </TD>
               <TD> <%= resultset.getString(4) %> </TD>
               <TD> <%= resultset.getString(5) %> </TD>
			    <TD> <%= resultset.getString(6) %> </TD>
				 <TD> <%= resultset.getString(7) %> </TD>
				  <TD> <%= resultset.getString(8) %> </TD>
           </TR>
       </TABLE>
       <BR>
       <%  out.println("<Td colspan=2 align=center><button type=submit accesskey='U'><u>U</u>pdate Details</button></td></tr></table>");
           } 
       %>
	   </form>
    </BODY>
</HTML>
