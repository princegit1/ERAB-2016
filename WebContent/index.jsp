<!doctype html>
<html lang="">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RD</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<% 
//response.sendRedirect("http://localhost:8080/ERAB-2016/index.jsp?crn=RD-6489YRAB&&email=abcd@gmail.com&&fname=Test&&lname=sdfsdf&&city=TestCity");
/*invno=RDWEB0303163537978R&&fname=Test&&lname=sdfsdf&&city=TestCity */
//String invno=""+request.getParameter("invno");
String crn=""+request.getParameter("crn");
String fname=""+request.getParameter("fname");
String lname=request.getParameter("lname");
if(lname == null){
lname = "";
}
String email=""+request.getParameter("email"); 
String city=""+request.getParameter("city");
String csource=request.getParameter("csource");

 
if(csource==null || ("").equals(csource))
{
	csource="website";
}
//out.println(csource);         
  
/* 

out.println(invno);
out.println(fname);
out.println(lname);
out.println(city);
out.println(csource);

*/  
%>
<div class="wrapperContainerMain">   
<form name="frm" method="post" action="page2.jsp">
  <div class="topRdHeaderBox">
    <div class="topRdLogoSec"> <a href="#" class="rdLogoRight"><img src="images/rdlogo.png" alt="" /></a> <span class="topRdNumber">RD-6489</span> </div>
    <div class="prizeDrawList">
      <ul>
        <li>
          <h1 class="prize">PRIZE DRAW ELIGIBILITY INQUIRY</h1>
          <span class="year"><small>20</small>16</span> <span class="RfNumber">CUSTOMER REFERENCE NUMBER: <br>
          <small><%=crn %></small></span> </li>
        <li>
          <div class="reciptName">
            <h2>Recipent 's full name</h2>
            <span><%=fname %> <%=lname %></span> </div>
          <div class="residenceName">
            <h2>Residence India</h2> 
            <span><%=city %></span> </div>
          <div class="employmentName">
            <h2>Employment Requirement 1</h2>
            <span>NOT an employee of Reader's Digest India</span> </div>
        </li>            
        <li>
          <div class="empRequiment">
            <h2>Employment Requirement 2</h2>
            <span>NOT an employee of Living Media India Limited</span> </div>
          <div class="demoCriteria">
            <h2>Demographic Criteria</h2>
            <span>Computer-run selection process</span> </div>
        </li>
        <li>
          <div class="allStatusHead"> <span class="inqueryStatus">Inquiry Status </span> <span class="prizeMatch">Prize Match Status</span> <span class="AddSubscribe">Additional Subscriber Privileges</span> <img src="images/statusBanner.jpg" alt="" /> </div>
        </li>
      </ul>
    </div>          
  </div>         
  <div class="botmStsSec">
    <div class="authorizeSec"> <img src="images/authorize.jpg" alt="" /> </div>
    <div class="promptReplySec">
      <p>To discover how much you<br>
        may have already won,<br>
        match the Prize ID Number<br>
        revealed Left to this chart.</p>
      <img src="images/prompt.png" alt="" /> </div>
      <input type="hidden" name="crn" value="<%=crn %>" />
   <input type="hidden" name="fname" value="<%=fname %>" />
    <input type="hidden" name="lname" value="<%=lname %>" /> 
     <input type="hidden" name="city" value="<%=city %>" />
       <input type="hidden" name="email" value="<%=email %>" />
      <input type="hidden" name="csource" value="<%=csource %>" />
    <div class="amtDetailSec"> <img src="images/amountDetail.png" alt="" /><input type="submit" value="" class="sbmt_rab" /> </div>
  </div>
  </form>
 
</div>
</body>
</html>
