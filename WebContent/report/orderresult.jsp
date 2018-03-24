<%@page import="java.sql.*"%>
<%@ page session="true" %>
<%@ page import="com.itgd.rd.utils.Utils"%>
<%String active=""+session.getAttribute("UserActive");
	if(active.equals(""))
	{
		response.sendRedirect("Login.jsp");
	}
String QUERY=null;
String mailer="";
String reportType=""+request.getParameter("reportType");
String UserType=""+session.getAttribute("UserType");
String day1=request.getParameter("Start_Day");
String month1=request.getParameter("Start_Month");
String year1=request.getParameter("Start_Year");
String day2=request.getParameter("Ending_Day");
String month2=request.getParameter("Ending_Month");
String year2=request.getParameter("Ending_Year");
String orderstatus=request.getParameter("orderstatus");
String payType=request.getParameter("paytype");
String excel=request.getParameter("excel");
String setradio=request.getParameter("setradio");
String qty="0";

String date1=year1+'-'+month1+'-'+day1;
String date2=year2+'-'+month2+'-'+day2;
String pstatus="Order Type:All Orders";
String ostatus="Payment Status:";
//String publication="ITE";

int subscription_id=0;
String invoiceNumber="";
String subscription_date="";
String title="";
String name="";
String lname="";
String address1="";
String address2="";
String address3="";
String city="";
String state="";
String pin="";
String telephone="";
String mobile = "";
String email="";

int subs_for=0;
String gtitle="";
String gname="";
String glname="";
String gaddress1="";
String gaddress2="";
String gaddress3="";
String gcity="";
String gstate="";
String gpin="";
String gtelephone="";
String gmobile = "";
String gemail="";
int amount=0;
int payMode=0;
String source="";
String subs_type="";
String payment_status="";
String renewal_subs_id="";
String payment_gateway="";
String edm_offer="";
String ipaddress="";

String payment_mode="";
String subscription_for="";
String payback_card_no="";

int color = 0;

int orderId;



Connection conn = Utils.getConnection();
Statement stmt = null;
Statement stmt1 = null;
Statement stmt2 = null;
ResultSet rs=null;
ResultSet rslt=null;
ResultSet RESULT=null;

out.print("date1--->"+date1);
out.print("date2--->"+date2);



try

{
stmt = conn.createStatement();

String qry="f";
if(orderstatus.equals("all"))
{

qry=" Select id, invno,subdate,csalutation, cname, clname, cadd1,cadd2,cadd3,ccity, cstate_name, cpin, ctel, cmob, cmail, subs_for, gsalutation, gname, glname, gadd1,gadd2,gadd3, gcity, gstate_name, gpin, gtel, gmob, gemail, amount, paymode, csource,subscription_type,payment_status,renewal_subscription_id,payment_gateway,edm_offer_type,ipaddress,payback_card_no from online_subscript_dtls  where subdate between '"+date1+"' and '"+date2+"'";
ostatus=ostatus+" All ";
}

else if(orderstatus.equals("Paygot"))
{
//out.println("Inside Paygot");
qry=" Select id,invno,subdate,csalutation, cname, clname, cadd1,cadd2,cadd3,ccity, cstate_name, cpin, ctel, cmob, cmail, subs_for, gsalutation, gname, glname, gadd1,gadd2,gadd3, gcity, gstate_name, gpin, gtel, gmob, gemail, amount,  paymode, csource,subscription_type,payment_status,renewal_subscription_id,payment_gateway,edm_offer_type,ipaddress,payback_card_no from online_subscript_dtls where    payment_status='SUCCESSFUL' and subdate between '"+date1+"' and '"+date2+"'";
ostatus=ostatus+"SUCCESSFUL";

}
else{
//out.println("Inside Else");
qry=" Select id,invno,subdate,csalutation, cname, clname, cadd1,cadd2,cadd3,ccity, cstate_name, cpin, ctel, cmob, cmail, subs_for, gsalutation, gname, glname, gadd1,gadd2,gadd3, gcity, gstate_name, gpin, gtel, gmob, gemail, amount, paymode, csource,subscription_type,payment_status,renewal_subscription_id,payment_gateway,edm_offer_type,ipaddress,payback_card_no from online_subscript_dtls where    payment_status='Payment_pending'or payment_status='Failed' and subdate between '"+date1+"' and '"+date2+"'";
ostatus=ostatus+" Payment Pending";
}
if(payType.equals("online"))
{
qry=qry+" and paymode in('2') ";
pstatus="Order Type:Online Orders";
//out.println("Inside online");

}else if(payType.equals("offline"))
{ qry=qry+" and paymode in('3','1')";
 pstatus="Order Type:Offine Orders";
// out.println("Inside offline");
}


try
	{
	  if(reportType.equals("excel"))
		{
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition","attachment;filename=rdindiaorderresult.xls");;		
		}
	
	}catch(Exception e){}
	qry=qry+"order by str_to_date(subdate, '%M %Y')";
	rslt=stmt.executeQuery(qry);
	
	
out.println(qry)  ;
%>
<HTML>
	<BODY>
	<P>
	<table width="686" border="0" cellspacing="1" cellpadding="1" align="center" bgcolor=lightblue bordercolor=blue>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	<tr><td  bgcolor=blue></td>
    <th><h3><%=setradio%><h3></th>
    <td  bgcolor=blue></td></tr>
	<tr><td  bgcolor=blue></td><td bgcolor=blue><font size=4 color=white>ORDER REPORT RESULT</font></td><td  bgcolor=blue></td></tr>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	</table>
	</P>

<%
if(orderstatus.equals("orderstatus"))
{
out.println("<table border=1 align=center><tr><th colspan=13> From "+day1+"-"+month1+"-"+year1+"  To "+day2+"-"+month2+"-"+year2+" </th></tr>");
}
else
{
out.println( "<table border=1 align=center><tr><th colspan=13> From "+day1+"-"+month1+"-"+year1+"  To "+day2+"-"+month2+"-"+year2+" </th></tr>");
}
out.println("<tr><th colspan=13> '"+ ostatus+"'  '"+pstatus+"'   </th></tr>");

int num=1;
if(num > 0 )
{
	%>

	<tr bgcolor=lightgreen>
	<th><b>Subscription ID</b></th>
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

					while(rslt.next())
					{

						subscription_id=rslt.getInt("id");
						invoiceNumber=rslt.getString("invno");
						subscription_date=rslt.getString("subdate");
						title=rslt.getString("csalutation");
						name=rslt.getString("cname");
						lname=rslt.getString("clname");
						address1=rslt.getString("cadd1");
						address2=rslt.getString("cadd2");
						address3=rslt.getString("cadd3");
						city=rslt.getString("ccity");
						state=rslt.getString("cstate_name");
						pin=rslt.getString("cpin");
						telephone=rslt.getString("ctel");
						mobile=rslt.getString("cmob");
						email=rslt.getString("cmail");
						subs_for=rslt.getInt("subs_for");
						gtitle=rslt.getString("gsalutation");
						gname=rslt.getString("gname");
						glname=rslt.getString("glname");
						gaddress1=rslt.getString("gadd1");
						gaddress2=rslt.getString("gadd2");
						gaddress3=rslt.getString("gadd3");
						gcity=rslt.getString("gcity");
						gstate=rslt.getString("gstate_name");
						gpin=rslt.getString("gpin");
						gtelephone=rslt.getString("gtel");
						gmobile=rslt.getString("gmob");
						gemail=rslt.getString("gemail");
						amount=rslt.getInt("amount");
						payMode=rslt.getInt("paymode");
						source=rslt.getString("csource");
						subs_type=rslt.getString("subscription_type");
						payment_status=rslt.getString("payment_status");
						renewal_subs_id=""+rslt.getString("renewal_subscription_id");
						payment_gateway=rslt.getString("payment_gateway");
						edm_offer=rslt.getString("edm_offer_type");
						ipaddress=rslt.getString("ipaddress");
						payback_card_no=rslt.getString("payback_card_no");

					
                    mailer="Direct Access";
					if(payMode==4)
					{
					payment_mode="COD";
					}
                    else if(payMode==2)
                    {
                    payment_mode="Credit-card";
                    }
                    else if(payMode==1)
                    {
                     payment_mode="VPP";
                    }
					 else if(payMode==0)
                    {
                     payment_mode="Process not completed";
                    }
                    else
                    {
                    payment_mode="Cheque/DD";
                    }
                    
                    if(subs_for==1)
                    {
                    subscription_for="For Myself";
                    }
                    else if(subs_for==2)
                    {
                     subscription_for="Gifting Someone";
                    }
                    else
                    {
                    subscription_for="For Both";
                    }
                    
                    
					
					
					
					%><tr >
					
					<td align="right"><%=subscription_id%></td>
					<td align="right"><%=invoiceNumber%></td>
					<td align="right"><%=subscription_date%></td>
                    <td align="right"><%=title%></td>
					<td align="right"><%=name%></td>
                    <td align="right"><%=lname%></td>
					<td align="right"><%=address1%></td>
					<td align="right"><%=address2%></td>
                    <td align="right"><%=address3%></td>
					<td align="right"><%=city%></td>
					<td align="right"><%=state%></td>
                    	<td align="right"><%=pin%></td>
                        <td align="right"><%=telephone%></td>
                        <td align="right"><%=mobile%></td>
					<td align="right"><%=email%></td>
					<td align="right"><%=subscription_for%></td>
                    
                    <td align="right"><%=gtitle%></td>
					<td align="right"><%=gname%></td>
                    <td align="right"><%=glname%></td>
					<td align="right"><%=gaddress1%></td>
					<td align="right"><%=gaddress2%></td>
                    <td align="right"><%=gaddress3%></td>
					<td align="right"><%=gcity%></td>
					<td align="right"><%=gstate%></td>
                    	<td align="right"><%=gpin%></td>
                        <td align="right"><%=gtelephone%></td>
                        <td align="right"><%=gmobile%></td>
					<td align="right"><%=gemail%></td>
				
					
					<td align="right"><%=amount%></td>
					<td align="right"><%=payment_mode%></td>
					<td align="right"><%=source%></td>
					<td align="right"><%=subs_type%></td>
					<td align="right"><%=payment_status%></td>
					<td align="right"><%=renewal_subs_id%></td>
					

					<td align="right"><%=payment_gateway%></td>

					<td align="right"><%=edm_offer%></td>
					<td align="right"><%=ipaddress%></td>
					<td align="right"><%=payback_card_no%></td>
					
					</tr>

<%
	
}
}


}



catch(Exception e){out.print("Error+"+e.toString());}

finally{



conn.close();

}
%>
</table>
</BODY>
</HTML>