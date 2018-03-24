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
	response.sendRedirect("Login_duplicate_copy.jsp");
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
			selectQuery="select sno,Subscriptionno1,Salutation1,Name1,LName1,Add1,city1,state1,Pin1,Telno1,Mobile1,Email1,Subscriptionno2,Salutation2,Name2,LName2,Add2,city2,state2,Pin2,Telno2,Mobile2,Email2,Name3,Add3,City3, sub_type,Pin3,State3,Email3,Mobile3,submitdate from duplicate_copy where submitdate BETWEEN '"+date1+"' AND '"+date2+"' order by sno";
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
	
	<tr><td  bgcolor=blue></td><td bgcolor=blue><font size=4 color=white>RD Duplicate Copies Report</font></td><td  bgcolor=blue></td></tr>
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
            <th bgcolor="blue"><font size=3 color=white>Subscription no.1</font></th>
             <th bgcolor="blue"><font size=3 color=white>Title1</font></th>
             <th bgcolor="blue"><font size=3 color=white>Name1</font></th>
             <th bgcolor="blue"><font size=3 color=white>LastName1</font></th>
              <th bgcolor="blue"><font size=3 color=white>Address1</font></th>
                <th bgcolor="blue"><font size=3 color=white>City1</font></th>
               <th bgcolor="blue"><font size=3 color=white>State1</font></th>
               <th bgcolor="blue"><font size=3 color=white>Pin1</font></th>
               <th bgcolor="blue"><font size=3 color=white>Telephone1</font></th>
               <th bgcolor="blue"><font size=3 color=white>Mobile1</font></th>
               <th bgcolor="blue"><font size=3 color=white>Email-1</font></th>
               
               <th bgcolor="blue"><font size=3 color=white>Subscription no.2</font></th>
             <th bgcolor="blue"><font size=3 color=white>Title2</font></th>
             <th bgcolor="blue"><font size=3 color=white>Name2</font></th>
             <th bgcolor="blue"><font size=3 color=white>LastName2</font></th>
              <th bgcolor="blue"><font size=3 color=white>Address2</font></th>
                <th bgcolor="blue"><font size=3 color=white>City2</font></th>
               <th bgcolor="blue"><font size=3 color=white>State2</font></th>
               <th bgcolor="blue"><font size=3 color=white>Pin2</font></th>
               <th bgcolor="blue"><font size=3 color=white>Telephone2</font></th>
               <th bgcolor="blue"><font size=3 color=white>Mobile2</font></th>
               <th bgcolor="blue"><font size=3 color=white>Email-2</font></th>
               
                <th bgcolor="blue"><font size=3 color=white>Name3</font></th>
              <th bgcolor="blue"><font size=3 color=white>Address3</font></th>
                <th bgcolor="blue"><font size=3 color=white>City3</font></th>
               <th bgcolor="blue"><font size=3 color=white>State3</font></th>
               <th bgcolor="blue"><font size=3 color=white>Pin3</font></th>
              <th bgcolor="blue"><font size=3 color=white>Email-3</font></th>
               <th bgcolor="blue"><font size=3 color=white>Mobile3</font></th>
                <th bgcolor="blue"><font size=3 color=white>Record Date</font></th>
                <th bgcolor="blue"><font size=3 color=white>Request for</font></th>
			
			</tr>
<%		
			while(rs.next())
				{
				
%>
			<tr>
			<td><p align="left"><%=rs.getInt("sno")%>&nbsp;</td>
			<td><p align="left"><%=rs.getString("Subscriptionno1")%>&nbsp;</td>
			<td><p align="left"><%=rs.getString("Salutation1")%>&nbsp;</td>
			<td><p align="left"><%=rs.getString("Name1")%>&nbsp;</td>
             <td><p align="left"><%=rs.getString("LName1")%>&nbsp;</td>
              <td><p align="left"><%=rs.getString("Add1")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("city1")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("state1")%>&nbsp;</td>
                <td><p align="left"><%=rs.getString("Pin1")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("Telno1")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("Mobile1")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("Email1")%>&nbsp;</td>
               
               <td><p align="left"><%=rs.getString("Subscriptionno2")%>&nbsp;</td>
			<td><p align="left"><%=rs.getString("Salutation2")%>&nbsp;</td>
			<td><p align="left"><%=rs.getString("Name2")%>&nbsp;</td>
             <td><p align="left"><%=rs.getString("LName2")%>&nbsp;</td>
              <td><p align="left"><%=rs.getString("Add2")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("city2")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("state2")%>&nbsp;</td>
                <td><p align="left"><%=rs.getString("Pin2")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("Telno2")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("Mobile2")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("Email2")%>&nbsp;</td>
                
                
                <td><p align="left"><%=rs.getString("Name3")%>&nbsp;</td>
              <td><p align="left"><%=rs.getString("Add3")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("City3")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("State3")%>&nbsp;</td>
                <td><p align="left"><%=rs.getString("Pin3")%>&nbsp;</td>
                <td><p align="left"><%=rs.getString("Email3")%>&nbsp;</td>
               <td><p align="left"><%=rs.getString("Mobile3")%>&nbsp;</td>
			<td><p align="left"><%=rs.getString("submitdate")%>&nbsp;</td>
            <td><p align="left"><%=rs.getString("sub_type")%>&nbsp;</td>
			
			
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