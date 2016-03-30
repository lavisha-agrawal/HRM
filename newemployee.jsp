<%@ page import="java.sql.*"%>

<%	
	PreparedStatement pst=null;
	PreparedStatement pst2=null;
	Statement st=null;
	ResultSet rs=null;
	try{
		
		String eid=request.getParameter("eid").toLowerCase();
	String ename=request.getParameter("ename").toLowerCase();
	String sex=request.getParameter("sex").toLowerCase();
	String addr=request.getParameter("address").toLowerCase();
	String phone=request.getParameter("phone");
	String aemail=request.getParameter("alternate_email").toLowerCase();
	String designation=request.getParameter("designation");
	String grade=request.getParameter("grade");
	String primaryskills=request.getParameter("primaryskills");
	String secondaryskills=request.getParameter("secondaryskills");
	String salary=request.getParameter("salary");
	String password1=request.getParameter("password1");	
		
		
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms","root","");
	
		
		pst=con.prepareStatement("insert into employee(empid,empname,gender,address,contactno,aemail,role,grade,primaryskills,secondarskills,salary,pword) values (?,?,?,?,?,?,?,?,?,?,?,?)");
		
	
				
				
				pst.setString(1,eid);	
				pst.setString(2,ename);				
				pst.setString(3,sex);
				pst.setString(4,addr);
				pst.setString(5,phone);	
				pst.setString(6,aemail);
				pst.setString(7,designation);	
				pst.setString(8,grade);
				pst.setString(9,primaryskills);
				pst.setString(10,secondaryskills);
				pst.setInt(11,Integer.parseInt(salary));
					pst.setString(12,password1);	
				
			
			
		out.print(pst);
			
		
				int eff=pst.executeUpdate();		
				
				if(eff>0 )
					out.println("added Successful<BR>");
		%>
    	<jsp:forward page="rm_transactions.jsp" />
    <% 
				
		}
					
	catch(Exception e1)	
		{
   		
	out.print(e1.getMessage());
		

		}
%>