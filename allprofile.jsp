<html>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html><head>

<title>RESOURCE MANAGEMENT SYSTEM</title></head>
<body>
<jsp:include page="hr_transactions.jsp" />
<p><b>Personal Profile</font><hr color="#008000" size="4">

<%
 try{
	Connection con=null;
	PreparedStatement stmt=null;
	Statement st=null;
	ResultSet resultset=null;
	
   
		Class.forName("com.mysql.jdbc.Driver");
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms","root","");
		
    st=con.createStatement();
	String id=request.getParameter("id");
	resultset=st.executeQuery("Select * from employee where empid='"+id+"'");
             
         if(!resultset.next()) {
                out.println("Sorry, could not find that publisher. " +
                "Please <A HREF='tryAgain.html'>try again</A>.");
            } else {
				
        %>
	 <TABLE BORDER="1" width=80% align='center' cellspacing=1 cellpadding=3>
            <TR>
               <TH>EMPID</TH>
			   <TH>EMPName</TH>
               <TH>GENDER</TH>
               <TH>ADDRESS</TH>
               <TH>CONTACTNO</TH>
               <TH>EMAIL</TH>
			    <TH>DESIGNATION</TH>
				 <TH>GRADE</TH>
				 <TH>PRIMARYSKIILS</TH>
				 <TH>SECONDARYSKIILS</TH>
				 <TH>SALARY</TH>
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
				   <TD> <%= resultset.getString(9) %> </TD>
				    <TD> <%= resultset.getString(10) %> </TD>
					 <TD> <%= resultset.getString(11) %> </TD>
					  
           </TR>
       </TABLE>
       <BR>
       <%  
	} }
	catch(Exception e)
	{out.print(e.getMessage());}
       %>
	 
    </BODY>
</HTML>
