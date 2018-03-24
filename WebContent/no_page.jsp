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

String invno=(String) session.getAttribute("invno");
String fname=(String) session.getAttribute("fname");
String lname=(String) session.getAttribute("lname");   
String city=(String) session.getAttribute("city");
String csource=(String) session.getAttribute("csource");

     

if(csource==null || ("").equals(csource))
{
	csource="Website";   
}
            
%>
<div class="wrapperContainerMain">
  <div class="topRdHeaderBox">
    <div class="topRdLogoSec"> <a href="#" class="rdLogoRight"><img src="images/rdlogo.png" alt="" /></a> <span class="topRdNumber">RD-6489</span> </div>
    <div class="prizeDrawList">
      <ul>
        <li>
          <h1 class="prize">PRICE DRAW ElIGIBILITY INQUERY</h1>
          <span class="year"><small>20</small>16</span> <span class="RfNumber">CUSTOMER REFERANCE NUMBER: <br>
          <small><%=invno %></small></span> </li>
        <li>    
          <div class="reciptName">
            <h2>Recipent 's full name</h2>
            <span><%=fname %> <%=lname %></span> </div>
          <div class="residenceName">
            <h2>Residence india</h2>
            <span><%=city %></span> </div>
          <div class="employmentName">
            <h2>Employment requirement 1</h2>
            <span>NOT an employee of Reader's Digest Association</span> </div>
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
          <div class="allStatusHead"> <span class="inqueryStatus">Inquiry Status </span> <span class="prizeMatch">Prize Match Status</span> <span class="AddSubscribe">Additional Subscriber Privileges</span> <img src="images/statusBanner4.png" alt="" /> </div>
        </li>    
      </ul>
    </div>
  </div>
  <div class="botmmazineSec page5">
    <h2>Thank you, [<%=fname %> <%=lname %>]</h2>
    <p>You have succcessfully completed the Prize Draw Eligibility Inquiry and all your<br>
      Preferred Subscriber Privileges are now 100% confirmed.<br>
      We will check to see if you are already owed Rs 20,00,000.<br>
      You may wish to print this page for your reference.</p>  
  </div>
</div>
</body>
</html>
