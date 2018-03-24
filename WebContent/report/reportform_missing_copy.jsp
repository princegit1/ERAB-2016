<%@ page session="true" %>
<%String active=""+session.getAttribute("UserActive");
//out.print(active);
	if(active.equals("null"))
	{
		response.sendRedirect("Login_missing_copy.jsp");
	}
%>	
	<script language = "javascript">
	function startingDate()   
	{	
		var startDate = new Date();
		var Day = startDate.getDate();
		var Month = startDate.getMonth();
		var Year = startDate.getFullYear(); 
		var newMonth = Month + 1;
	       
		document.Merchant.Start_Day.value = Day;
		document.Merchant.Start_Month.value = newMonth;
		document.Merchant.Start_Year.value = Year;
		document.Merchant.Ending_Day.value = Day;
		document.Merchant.Ending_Month.value = newMonth;
		document.Merchant.Ending_Year.value = Year;      
	}   
	
	function DaysInMonth(WhichMonth, WhichYear)
{
  var DaysInMonth = 31;
  if (WhichMonth == "April" || WhichMonth == "June" || WhichMonth == "September" || WhichMonth == "November") DaysInMonth = 30;
  if (WhichMonth == "February" && (WhichYear/4) != Math.floor(WhichYear/4))	DaysInMonth = 28;
  if (WhichMonth == "February" && (WhichYear/4) == Math.floor(WhichYear/4))	DaysInMonth = 29;
  return DaysInMonth;
}

function ChangeOptionDays(Which)
{
  var todaydate = new Date();

var Day1 = todaydate.getDate();
var Month1 = todaydate.getMonth();
var Year1 = todaydate.getFullYear(); 
		
  DaysObject = eval("document.Merchant." + Which + "Day");
  MonthObject = eval("document.Merchant." + Which + "Month");
  YearObject = eval("document.Merchant." + Which + "Year");

  Month = MonthObject[MonthObject.selectedIndex].text;
  Year = YearObject[YearObject.selectedIndex].text;

  DaysForThisSelection = DaysInMonth(Month, Year);
 // alert("DaysForThisSelection :"+DaysForThisSelection);
  CurrentDaysInSelection = DaysObject.length;
 // alert("CurrentDaysInSelection :"+CurrentDaysInSelection);
  if (CurrentDaysInSelection > DaysForThisSelection)
  {
    for (i=0; i<(CurrentDaysInSelection-DaysForThisSelection); i++)
    {
      DaysObject.options[DaysObject.options.length - 1] = null
    }
  }
  if (DaysForThisSelection > CurrentDaysInSelection)
  {
    for (i=0; i<(DaysForThisSelection-CurrentDaysInSelection); i++)
    {
      NewOption = new Option(DaysObject.options.length + 1);
      DaysObject.add(NewOption);
    }
  }
  
}


	</script>

	<BODY  onLoad = "startingDate()">
	<P>&nbsp;</P><P>&nbsp;</P>
	<table width="1000" border="0" cellspacing="1" cellpadding="1" align="center" bgcolor=lightblue bordercolor=blue>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	
	<tr><td  bgcolor=blue></td><td bgcolor=blue><font size=4 color=white>RD Missing/Damaged Copies Report</font></td><td  bgcolor=blue></td></tr>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	</table>

	<table width="1000" border="0" cellspacing="1" cellpadding="1" align="center" bgcolor=lightblue bordercolor=blue>
	
	</table>

<P>&nbsp;</P>
		<form name="Merchant" method="post" action="report_missing_copy.jsp">

	<table width="386" border="1" cellspacing="1" cellpadding="1" align="center" >
	<tr> 
	<td> 
	<table width="381" border="0" cellspacing="1" cellpadding="2" align="center" height="105" >
	<tr> 
	<td  width="97" ><font  size="-1">From Date</font></td>
	<td width="64" > 
	<div align="center"> 
	<select name="Start_Day" id="Start_Day" size="1" onChange="ChangeOptionDays('Start_')">
	<script>
	var startDate = new Date();
	var Month = startDate.getMonth()+1;
	var Year = startDate.getFullYear();
	for(j=1;j<=31;j++){
	
	if(Month==2 && Year%4==0){
	document.writeln("<option value="+j+">"+j+"</option>");
	if(j==29)break;
	continue;
	}
	if(Month==2 && Year%4!=0){
	document.writeln("<option value="+j+">"+j+"</option>");
	if(j==28)break;
	continue;
	}
	if(Month==9 || Month==4 ||Month==6 || Month==11){
	document.writeln("<option value="+j+">"+j+"</option>");
	if(j==30)break;
	continue;
	}
	document.writeln("<option value="+j+">"+j+"</option>");

	}

	</script></select>
	</div>
	</td>

	<td width="104" > 
	<div align="center"> 
	<select name="Start_Month"  id="Start_Month" size="1" onChange="ChangeOptionDays('Start_')">
	<option value="1">Jan </option>
	<option value="2">Feb </option>
	<option value="3">March </option>
	<option value="4">April </option>
	<option value="5">May </option>
	<option value="6">June </option>
	<option value="7">July </option>
	<option value="8">Aug </option>
	<option value="9">Sept </option>
	<option value="10">Oct </option>
	<option value="11">Nov </option>
	<option value="12">Dec </option>
	
</select>

	</div>
	</td>
	<td width="82" > 
	<div align="center">&nbsp; 
	<select name="Start_Year" id="Start_Year"  onchange="ChangeOptionDays('Start_')">
		<option value="2011"> 2011 </option>
		<option value="2012"> 2012 </option>
		<option value="2013"> 2013 </option>
<option value="2014"> 2014 </option>
<option value="2015"> 2015 </option>
    <option value="2016" select> 2016 </option>
	</select>
	</div>
	</td>
	</tr>

	<tr> 
	<td  width="97" ><font  size="-1">End Date</font></td>
	<td width="64" > 
	<div align="center"> 
	<select name="Ending_Day" id="Ending_Day" size="1" onChange="ChangeOptionDays('Ending_')">
	<script>
	var startDate = new Date();
	var Month = startDate.getMonth()+1;
	var Year = startDate.getFullYear();
	for(j=1;j<=31;j++){
	
	if(Month==2 && Year%4==0){
	document.writeln("<option value="+j+">"+j+"</option>");
	if(j==29)break;
	continue;
	}
	if(Month==2 && Year%4!=0){
	document.writeln("<option value="+j+">"+j+"</option>");
	if(j==28)break;
	continue;
	}
	if(Month==9 || Month==4 ||Month==6 || Month==11){
	document.writeln("<option value="+j+">"+j+"</option>");
	if(j==30)break;
	continue;
	}
	document.writeln("<option value="+j+">"+j+"</option>");

	}

	</script></select>
	</div>
	</td>

	<td width="104" > 
	<div align="center"> 
	<select name="Ending_Month"  id="Ending_Month" size="1" onChange="ChangeOptionDays('Ending_')">
	<option value="1">Jan </option>
	<option value="2">Feb </option>
	<option value="3">March </option>
	<option value="4">April </option>
	<option value="5">May </option>
	<option value="6">June </option>
	<option value="7">July </option>
	<option value="8">Aug </option>
	<option value="9">Sept </option>
	<option value="10">Oct </option>
	<option value="11">Nov </option>
	<option value="12">Dec </option>
	</select>

	</div>
	</td>
	<td width="82" > 
	<div align="center">&nbsp; 
	<select name="Ending_Year" id="Ending_Year"  onchange="ChangeOptionDays('Ending_')">
		<option value="2011"> 2011 </option>
		<option value="2012"> 2012 </option>
		<option value="2013"> 2013 </option>
<option value="2014"> 2014 </option>
<option value="2015"> 2015 </option>
    <option value="2016" select> 2016 </option>
	</select>
	</div>
	</td>
	</tr>

	<tr>
	<td>&nbsp;
	
	</td>
	</tr>

	
	
	

	
	<input type="hidden" name="searchCreteria" value="detailed">
	<tr valign="top" align="center"> 
	<td colspan="2" height="29"><font color="red"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Download Excel</b></font></td>
	<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="reportType" value="excel"></td>
	</tr>

	<tr valign="top" align="center"> 
	<td colspan="4" height="29"> 
	<input type="submit" name="Submit" value="Submit" >&nbsp;&nbsp;
<!-- 	<input type="button" name="Back" value="back" onClick="javascript:history.back()">
 -->	</td>
	</tr>
	</table>
	</td>
	</tr>
	</table>

	<P>&nbsp;</P>
	<P>&nbsp;</P>
	<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	</P>
	<P> </P>
	</form>	
	</BODY></HTML>
	
	


</body>
</html>