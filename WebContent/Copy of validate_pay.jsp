<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date" %>

<%@ page import="com.itgd.rd.utils.Utils"%>
=================

<%

/*if(session.getAttribute("invno")==null){
 response.sendRedirect("page1.jsp?csource="+(String)session.getAttribute("csource"));
} else{
session.setAttribute("invno",null);
}
*/
String invno=null;  
String crn=""+session.getAttribute("crn"); 
String fname=""+session.getAttribute("fname");
String lname=""+session.getAttribute("lname");    
String city=""+session.getAttribute("city");
String csource=""+session.getAttribute("csource");
String email=""+session.getAttribute("email");
if(csource==null || ("").equals(csource))
{                    
	csource="Website";
}
String year = null;
String month = null;
String day = null;

DateFormat fmt 			= new SimpleDateFormat("yyMMddHHmmss");
String now 				= fmt.format(new java.util.Date());
Random randomGenerator 	= new Random();
int num 				= randomGenerator.nextInt(799)+100 ; 
invno			="RDRAB"+now+num;

String ipAddress  = request.getHeader("X-FORWARDED-FOR");
if(ipAddress == null)
{
  ipAddress = request.getRemoteAddr();
}


int payMode= 2;
int amount= 711; 


String productPriceId="";

if ((request.getParameter("productPriceId"))!=null){
	 productPriceId=""+request.getParameter("productPriceId");
	}

if(productPriceId.equals("1")){
	amount=711;
}
else{   
	amount=711;    
}


int insert=0;
int count=0;
int update=0;

//String pgateway=request.getParameter("payGStype");
String payGStype = "BillDesk";
String pgateway="BillDesk";
		Connection dbConn = null;
		ResultSet rs = null;
		PreparedStatement pstmt1 =null;
		PreparedStatement statementInsert = null;
		Statement statementUpdate = null;
		PreparedStatement statementSelect = null;
		String insertQuery=null;
		String selectQuery=null;
		String updateQuery=null;
		String orderNumber = ""+request.getParameter("txtOR");
		int netAmount=0;
		if(!orderNumber.equals(""))
		{  
		try  
		{            
		 dbConn = Utils.getConnection();  
		try
		{
		 	
/* 		selectQuery="select count(id)as records from online_subscript_dtls where renewal_subscription_id='"+crn+"'";      
		
		statementSelect=dbConn.prepareStatement(selectQuery);
		rs = statementSelect.executeQuery();
				if(rs.next())
				{
					count = rs.getInt("records"); 
					//out.println("count : " + count);
				}
				
				if(rs != null)
					rs.close();
				if(statementSelect != null)
					statementSelect.close();
			
		if(count==0)
		{   */        
			
			insertQuery="insert into online_subscript_dtls(cname,clname,ccity,amount,invno,renewal_subscription_id,paymode,csource,payment_gateway,cmail,ipaddress,payment_status,subscription_type) values(?,?,?,?,?,?,?,?,?,?,?,'PAYMENT_PENDING','RENEW')";
			//out.println("InserQuery: " + insertQuery);
			statementInsert = dbConn.prepareStatement(insertQuery);
			statementInsert.setString(1,fname); 
			statementInsert.setString(2,lname);
			statementInsert.setString(3,city);
			statementInsert.setInt(4,amount);    
			statementInsert.setString(5,invno);
			statementInsert.setString(6,crn);
			statementInsert.setInt(7,payMode);
			statementInsert.setString(8,csource); 
			statementInsert.setString(9,pgateway);
			statementInsert.setString(10,email);  
			statementInsert.setString(11,ipAddress);    
			insert=statementInsert.executeUpdate();
			  
			if(statementInsert != null)
			   statementInsert.close(); 
		/*  }
		else{
			
		try          
		{        
		if(session.getAttribute("invno")==null)
			{
			updateQuery="UPDATE online_subscript_dtls SET subscription_type='RENEW',cmail='"+email+"', amount='"+amount+"', payment_gateway='"+pgateway+"',payment_status='PAYMENT_PENDING',paymode='"+payMode+"' ,amount='"+amount+"',ipaddress='"+ipAddress+"' WHERE renewal_subscription_id='"+crn+"'";
			//out.println("updateQuery: " + updateQuery);
			
			}     
		else{
			
			//updateQuery="UPDATE online_subscript_dtls SET cname='"+fname+"',clname='"+lname+"',ccity='"+city+"',amount='"+amount+"',csource='"+csource+"', payment_gateway='"+pgateway+"',payment_status='PAYMENT_PENDING',paymode='"+payMode+"' WHERE renewal_subscription_id='"+crn+"'";
			updateQuery="UPDATE online_subscript_dtls SET subscription_type='RENEW', cmail='"+email+"', amount='"+amount+"',csource='"+csource+"', payment_gateway='"+pgateway+"',payment_status='PAYMENT_PENDING',paymode='"+payMode+"' ,ipaddress='"+ipAddress+"' WHERE renewal_subscription_id='"+crn+"'";
			//out.println("updateQuery: " + updateQuery);
			
		 
		}
			statementUpdate = dbConn.createStatement();
			update=statementUpdate.executeUpdate(updateQuery);
			
			if(statementUpdate != null)
				statementUpdate.close();
		}
		catch(Exception ee)
		{
			 out.println(" Error in RD E-RAB updating code block -->"+ee);
		}
		
		} */
		
		}
		catch(Exception ee)
		{
				out.println(" Error in RD E-RAB inserting code block -->"+ee);
		}
	try
		{	rs=null;
			pstmt1 = dbConn.prepareStatement("SELECT invno,amount FROM online_subscript_dtls WHERE  renewal_subscription_id='"+crn+"'");
				rs = pstmt1.executeQuery();
				if(rs.next())
				{
					invno = rs.getString("invno");
					netAmount = rs.getInt("amount");
				}
		}
		catch(Exception e)
		{
			out.println("Error1"+e.toString());
		}
		finally
		{
			if(pstmt1 != null)
				pstmt1.close();
		}
		}
		catch(Exception e)
		{
		out.println("Error2 "+e.toString());
		}
		finally
		{
		if(dbConn != null)
		dbConn.close();
		}
		}
		else
		{
		 response.sendRedirect("index.jsp?csource="+(String)session.getAttribute("csource"));
	    }

	//out.println("InsertUpdate :" + insert);
if (insert==1 || update==1)
{
	
  if(invno!=null)  
      {
%> 
<html>
<body onLoad="document.mForm.submit();" oncontextmenu="return false;">
<!--  <FORM ACTION="http://pgateway.intoday.in/paymentgw/ItiSsl_Sale_test6april11.jsp" METHOD="post" name="mForm">
<input type="hidden" name="astrRespURL" value="http://pgateway.intoday.in/paymentgw/response_test.jsp">
<INPUT type="hidden" NAME = "astrMerchantTxnID"  VALUE="<%=invno%>">
<INPUT type="hidden" NAME = "astrAmount"  VALUE="<%=netAmount%>"> -->   
<!-- <form name="mForm" method="POST" action="http://localhost:8080/E-RAB-2016/pgateway/paymentGateway_rd.jsp"> -->
<form name="mForm" method="POST" action="http://pgateway.intoday.in/billdesk/IT/paymentGateway_rd.jsp">

<input type="hidden" name="txtCustomerID" value="<%=invno%>">
<input type="hidden" name="txtTxnAmount" value="<%=netAmount%>">  <%-- --%>
</FORM>          
<% }           
	
	else
	{
		 response.sendRedirect("index.jsp?csource="+(String)session.getAttribute("csource"));
	}
	%>

           
<center>

Processing please wait...........
</center>
</body>
</html>
<% 
}
else{

out.println("Test---insert"+insert+"---invoice---"+invno+"---amount---"+amount+"source---"+csource+"---fname---"+fname+"----city---"+city+"--payMode--"+payMode);

}
 
%>
     


