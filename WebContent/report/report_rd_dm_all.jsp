<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="com.itgd.rd.utils.Utils"%>
<%
String active=""+session.getAttribute("UserActive");
String searchCreteria=request.getParameter("searchCreteria");
String searchBy=request.getParameter("searchBy");
if(active.equals("null"))
{
	response.sendRedirect("login_rd_dm.jsp");
}
%>	

<%
int error=0;
int total=0;
PreparedStatement pstmt1 =null;

ResultSet rs1 =null;


Connection cn = null; 
try
{

	String day1=request.getParameter("Start_Day");
	String month1=request.getParameter("Start_Month");
	String year1=request.getParameter("Start_Year");
	String day2=request.getParameter("Ending_Day");
	String month2=request.getParameter("Ending_Month");
	String year2=request.getParameter("Ending_Year");
	String reportType=request.getParameter("reportType");
	String date1=year1+"-"+month1+"-"+day1;
	String date2=year2+"-"+month2+"-"+day2;	
	String selectQueryq1=null;
	
	selectQueryq1="select name,email,phone,mobile,company_name,address1,address2,city,country,comments,source,offer from digital_subs where id > 5 and record_date BETWEEN '"+date1+"' AND '"+date2+"' ";
	
		//out.println(selectQueryq1);
	try
	{
		
		cn =  Utils.getConnection();
		pstmt1=cn.prepareStatement(selectQueryq1);
		
		rs1=pstmt1.executeQuery();
		
	}
	catch(Exception ee)
	{
		out.println("ERROR"+ee.toString());
	}

	try
	{
		if(reportType.equals("excel"))
		response.setContentType("application/vnd.ms-excel");		
	}
	catch(Exception e){}
%>
	<BODY>
	<P>
	<table width="700" border="0" cellspacing="1" cellpadding="1" align="center" bgcolor=lightblue bordercolor=blue>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	<tr><td  bgcolor=blue></td><th><h3>RD Digaital Magazine Offer Report<h3></th><td  bgcolor=blue></td></tr>
	<tr><td  bgcolor=blue></td><td bgcolor=blue><font size=4 color=white>RD Digaital Magazine Offer Report</font></td><td  bgcolor=blue></td></tr>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	</table>
<P>
	
<%
	
	out.println("<table border=1 align=center><tr><th colspan=13> From "+day1+"-"+month1+"-"+year1+"  To "+day2+"-"+month2+"-"+year2+" </th></tr><tr></tr>");
%>
	
<tr><th bgcolor="blue"><font size=3 color=white>S. No.</font></th><th bgcolor="blue"><font size=3 color=white>Name</font></th><th bgcolor="blue"><font size=3 color=white>E-mail</font></th><th bgcolor="blue"><font size=3 color=white>phone</font></th><th bgcolor="blue"><font size=3 color=white>mobile</font></th><th bgcolor="blue"><font size=3 color=white>company_name</font></th><th bgcolor="blue"><font size=3 color=white>address1</font></th><th bgcolor="blue"><font size=3 color=white>address2</font></th><th bgcolor="blue"><font size=3 color=white>city</font></th><th bgcolor="blue"><font size=3 color=white>country</font></th><th bgcolor="blue"><font size=3 color=white>comments</font></th><th bgcolor="blue"><font size=3 color=white>source</font></th><th bgcolor="blue"><font size=3 color=white>offer</font></th></tr>
<%		
while(rs1.next()) {
	total=total+1;
	String name = rs1.getString("name");
	String email = rs1.getString("email");
	String phone = rs1.getString("phone");
	String mobile = rs1.getString("mobile");
	String company_name = rs1.getString("company_name");
	String address1 = rs1.getString("address1");
	String address2 = rs1.getString("address2");
	String city = rs1.getString("city");
	String country = rs1.getString("country");
	String comments = rs1.getString("comments");
	String source = rs1.getString("source");
	String offer = rs1.getString("offer");
	
	
	out.println("<tr><td>"+total+"</td><td>"+name+"</td><td>"+email+"</td><td>"+phone+"</td><td>"+mobile+"</td><td>"+company_name+"</td><td>"+address1+"</td><td>"+address2+"</td><td>"+city+"</td><td>"+country+"</td><td>"+comments+"</td><td>"+source+"</td><td>"+offer+"</td></tr>");

	}
%>



<%
}
catch(Exception ee)
{
	out.print("exc="+ee+"<br>"+error);
}







finally
{
	try
	{
		rs1.close();
		pstmt1.close();
		
		cn.close();
		
	}
	catch(Exception eee)
	{
	}
}
%>
</tr>
</table>
</BODY>