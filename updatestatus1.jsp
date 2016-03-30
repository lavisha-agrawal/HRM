<%@ page import="java.sql.*" %>

<HTML>
    <HEAD>
        <TITLE>Fetching Data From a Database</TITLE>
    </HEAD>

    <BODY>
        <H1>Database Lookup</H1>
        

        <H1>Fetching Data From a Database</H1>
		<form action="updatestatus.jsp" method=post>
        <% 
           Class.forName("com.mysql.jdbc.Driver");
	Connection	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms","root","");

            Statement statement = con.createStatement();

            String id = request.getParameter("id");  
          ResultSet resultset=statement.executeQuery("Select pid,client_name,project_name,platform,duration,budget,enddate,status from projectdet where pid='"+id+"'");
            out.println("<Td colspan=2 align=center><button type=submit accesskey='U'><u>U</u>pdate Details</button></td></tr></table>");
		
            if(!resultset.next()) {
                out.println("Sorry, could not find that publisher. " +
                "Please <A HREF='tryAgain.html'>try again</A>.");
            } else {
        %>

        <TABLE BORDER="1">
            <TR>
               <TH>ID</TH>
               <TH>Name</TH>
               <TH>City</TH>
               <TH>State</TH>
               <TH>Country</TH>
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
       <% 
           } 
       %>
	   </form>
    </BODY>
</HTML>
