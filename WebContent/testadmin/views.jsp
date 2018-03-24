<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>

<%@ page import="com.itgd.rd.utils.Utils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Views</title>
</head>
<body>
<%
String uemail = null;
String upass = null;
uemail = "" + request.getParameter("uemail");
upass = "" + request.getParameter("upass");

if(uemail.equals("admin") && upass.equals("admin"))
{
%>

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs =null;
try
{
 conn = Utils.getConnection();
 String s1 = " Select id, invno,subdate,csalutation, cname, clname, cadd1,cadd2,cadd3,ccity, cstate_name, cpin, ctel, cmob, cmail, subs_for, gsalutation, gname, glname, gadd1,gadd2,gadd3, gcity, gstate_name, gpin, gtel, gmob, gemail, amount, paymode, csource,subscription_type,payment_status,renewal_subscription_id,payment_gateway,edm_offer_type,ipaddress,payback_card_no from online_subscript_dtls";
 stmt = conn.createStatement();
 rs = stmt.executeQuery(s1);
 %>
 <table class="brd1">
 <tr>
	</td><b>Subscription ID</b></th>
	<th><b>Invoice Number</b></th>
	<th><b>Subscription Date</b></th>
    <th><b>Title</b></th>
	<th><b>Name</b></th>
    <th><b>Last Name</b></th>
	<th><b>Address1</b></th>
	<th><b>Address2</b></th>
    <th><b>Address3</b></th>
	<th><b>City</b></th>
	<th><b>State</b></th>
    <th><b>Zip</b></th>
	<th><b>Telephone</b></th>
    <th><b>Mobile</b></th>
	<th><b>Email</b></th>
    <th><b>Subscription for</b></th>
    <th><b>Gift Title</b></th>
	<th><b>Gift Name</b></th>
    <th><b>Gift Last Name</b></th>
	<th><b>Gift Address1</b></th>
	<th><b>Gift Address2</b></th>
    <th><b>Gift Address3</b></th>
	<th><b>Gift City</b></th>
	<th><b>Gift State</b></th>
    <th><b>Gift Zip</b></th>
	<th><b>Gift Telephone</b></th>
    <th><b>Gift Mobile</b></th>
	<th><b>Gift Email</b></th>
	<th><b>Net Amount</b></th>
	<th><b>Payment Mode</b></th>
    <th><b>Subscription source</b></th>
	<th><b>Subscription Type</b></th>
    <th><b>Payment Status</b></th>
	<th><b>Renewal Subscription Number</b></th>
    <th><b>Payment Gateway</b></th>
    <th><b>EDM Offer Type</b></th>
    <th><b>IP Address</b></th>
    <th><b>Payback Card No.</b></th>
	
	</tr>
	<%
 while(rs.next())
 {
	%>
	<tr>
	<td><%=rs.getInt("id") %></td>
	
	<td><%=rs.getString("subdate") %></td>
	
    <td><%=rs.getString("cname") %></td>
	<td><%=rs.getString("clname") %></td>
    <td>Address1</td>
	<td>Address1</td>
	<td>Address2</td>
    <td>Address3</td>
	<td>City</td>
	<td>State</td>
    <td>Zip</td>
	<td>Telephone</td>
    <td>Mobile</td>
	<td>Email</td>
    <td>Subscription for</td>
    <td>Gift Title</td>
	<td>Gift Name</td>
    <td>Gift Last Name</td>
	<td>Gift Address1</td>
	<td>Gift Address2</td>
    <td>Gift Address3</td>
	<td>Gift City</td>
	<td>Gift State</td>
    <td>Gift Zip</td>
	<td>Gift Telephone</td>
    <td>Gift Mobile</td>
	<td>Gift Email</td>
	<td>Net Amount</td>
	<td>Payment Mode</td>
    <td>Subscription source</td>
	<td>Subscription Type</td>
    <td>Payment Status</td>
	<td>Renewal Subscription Number</td>
    <td>Payment Gateway</td>
    <td>EDM Offer Type</td>
    <td>IP Address</td>
    <td>Payback Card No.</td>
	
	</tr>
	<% 
 }
	%>
	</table>
	<%
	
} 
catch(Exception e)
{
	out.println("Exception E: " + e);
}

}
else
{
	response.sendRedirect("login.jsp");
}
%>
</body>
</html>