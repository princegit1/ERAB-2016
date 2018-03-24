<%
	try
	{
	 String invoiceNumber=""+request.getParameter("txtCustomerID");
	 double payableAmount=Double.parseDouble(request.getParameter("txtTxnAmount"));
	
	
	
%>

<html>
<body onLoad="document.mForm.submit();" oncontextmenu="return false;">
<form name="mForm" method="POST" action="https://www.billdesk.com/pgidsk/pgmerc/INDIATODAYPaymentoption.jsp">
<input type="hidden" name="txtCustomerID" value="<%=invoiceNumber%> ">
<input type="hidden" name="txtTxnAmount" value="<%=payableAmount%>">
<input type="hidden" name="RU" value="http://pgateway.intoday.in/billdesk/IT/bdresponse_14april11.jsp">
</form>

<center> processing please wait...........</center>
</body>
</html>
<%
 }
catch(Exception ee)
{
		out.println("<h1><b>There is some problem please try again</b></h1>");
}	
%>