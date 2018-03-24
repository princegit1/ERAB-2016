<%
	try
	{
	 String referer = request.getHeader("REFERER");
	 String invoiceNumber=""+request.getParameter("txtCustomerID");
	 double payableAmount=Double.parseDouble(request.getParameter("txtTxnAmount"));
	 String url = request.getRequestURL().toString();
        
	
if (referer != null && referer.contains("localhost") || referer != null && referer.contains("localhost")){ 
%>
<html>
<body onLoad="document.mForm.submit();" oncontextmenu="return false;">
<form name="mForm" method="POST" action="https://www.billdesk.com/pgidsk/pgmerc/INDIATODAYPaymentoption.jsp">
<input type="hidden" name="txtCustomerID" value="<%=invoiceNumber%> ">
<input type="hidden" name="txtTxnAmount" value="<%=payableAmount%>">
<input type="hidden" name="RU" value="http://pgateway.intoday.in/billdesk/IT/bdresponse_rd.jsp">
</form>

<center> processing please wait...........</center>
</body>
</html>
<% } else {  
 out.print("Invalid Domain");
 System.out.println("Server 39 error in http://subscription.readersdigest.in/from current url = " +url);
 
 }  
 }
catch(Exception ee)
{
		System.out.println("Server 11 error in http://subscription.readersdigest.in/ ");
		
}	
%>





