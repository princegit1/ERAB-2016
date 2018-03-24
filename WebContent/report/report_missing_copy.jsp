<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="conn.*" %>
<%@ page import="com.itgd.rd.utils.Utils"%>
<%
String active=""+session.getAttribute("UserActive");
String searchCreteria=request.getParameter("searchCreteria");
String searchBy=request.getParameter("searchBy");
String emailCheck="";	

if(active.equals("null"))
{
	response.sendRedirect("Login_missing_copy.jsp");
}
%>	

<%
int error=0;
int total=0;
Connection cn = Utils.getConnection();
PreparedStatement pstmt =null;
ResultSet rs =null;

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
	String selectQuery=null;
	
		if(searchCreteria.equals("detailed"))
		{
			selectQuery="select sno,Subscriptionno,salutation,Name,LName,Address,City,state,Pin,Telno,Mobile,Email,lstmonth1,issue1,lstmonth2,issue2,lstmonth3,issue3,submitdate from missing_damaged where submitdate BETWEEN '"+date1+"' AND '"+date2+"' order by sno";
		}
		
	
try
	{
		pstmt=cn.prepareStatement(selectQuery);
		rs=pstmt.executeQuery();
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
	<table width="1000" border="0" cellspacing="1" cellpadding="1" align="center" bgcolor=lightblue bordercolor=blue>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	
	<tr><td  bgcolor=blue></td><td bgcolor=blue><font size=4 color=white>RD Missing/Damaged Copies Report</font></td><td  bgcolor=blue></td></tr>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	</table>
	<table width="1000" border="0" cellspacing="1" cellpadding="1" align="center" bgcolor=lightblue bordercolor=blue>
	
	</table>
<P>
<%
	out.println("<table border=1 align=center><tr><th colspan=17> From "+day1+"-"+month1+"-"+year1+"  To "+day2+"-"+month2+"-"+year2+" </th></tr><tr></tr>");

			if(searchCreteria.equals("detailed"))
			{
			
%>
			
            <th bgcolor="blue"><font size=3 color=white>S No.</font></th>
            <th bgcolor="blue"><font size=3 color=white>Subscription no.</font></th>
             <th bgcolor="blue"><font size=3 color=white>Title</font></th>
             <th bgcolor="blue"><font size=3 color=white>Name</font></th>
             <th bgcolor="blue"><font size=3 color=white>LastName</font></th>
              <th bgcolor="blue"><font size=3 color=white>Address</font></th>
                <th bgcolor="blue"><font size=3 color=white>City</font></th>
               <th bgcolor="blue"><font size=3 color=white>State</font></th>
               <th bgcolor="blue"><font size=3 color=white>Pin</font></th>
               <th bgcolor="blue"><font size=3 color=white>Telephone</font></th>
               <th bgcolor="blue"><font size=3 color=white>Mobile</font></th>
               <th bgcolor="blue"><font size=3 color=white>Email</font></th>
               <th bgcolor="blue"><font size=3 color=white> Month1</font></th>
             <th bgcolor="blue"><font size=3 color=white>Missed/Damaged</font></th>
             <th bgcolor="blue"><font size=3 color=white>Month2</font></th>
             <th bgcolor="blue"><font size=3 color=white>Missed/Damaged</font></th>
               <th bgcolor="blue"><font size=3 color=white>Month3</font></th>
             <th bgcolor="blue"><font size=3 color=white>Missed/Damaged</font></th>
                <th bgcolor="blue"><font size=3 color=white>Record Date</font></th>
			</tr>
<%		
			while(rs.next())
				{
%>
			<tr>
			<td><p align="left"><%=rs.getInt("sno")%>&nbsp;</td>
			<td><p align="left"><%=rs.getString("Subscriptionno")%>&nbsp;</td>
			<td><p align="left"><%=rs.getString("salutation")%>&nbsp;</td>
			<td><p align="left"><%=rs.getString("Name")%>&nbsp;</td>
             <td><p align="left"><%=rs.getString("LName")%>&nbsp;</td>
              <td><p align="left"><%=rs.getString("Address")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("City")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("state")%>&nbsp;</td>
                <td><p align="left"><%=rs.getString("Pin")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("Telno")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("Mobile")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("Email")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("lstmonth1")%>&nbsp;</td>
			<td><p align="left"><%=rs.getString("issue1")%>&nbsp;</td>
			<td><p align="left"><%=rs.getString("lstmonth2")%>&nbsp;</td>
             <td><p align="left"><%=rs.getString("issue2")%>&nbsp;</td>
              <td><p align="left"><%=rs.getString("lstmonth3")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("issue3")%>&nbsp;</td>
			<td><p align="left"><%=rs.getString("submitdate")%>&nbsp;</td>
			</tr>
			
<%				
				}
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
		rs.close();
		pstmt.close();
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