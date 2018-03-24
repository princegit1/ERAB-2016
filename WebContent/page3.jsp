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
/*invno=RD_WEB10111&&fname=Rakesh&&lname=Gupta&&city=Delhi&&csource=RD_NEW */
String crn=""+request.getParameter("crn");
String fname=""+request.getParameter("fname");
String lname=request.getParameter("lname"); 
if(lname == null){
lname = "";
}
String city=""+request.getParameter("city");
String csource=request.getParameter("csource");
String email=""+request.getParameter("email"); 


/* 

out.println(invno);    
out.println(fname);
out.println(lname);
out.println(city);
out.println(csource);

*/  
%>
<div class="wrapperContainerMain">
<form name="frm" method="post" action="page4.jsp">
  <div class="topRdHeaderBox">
    <div class="topRdLogoSec"> <a href="#" class="rdLogoRight"><img src="images/rdlogo.png" alt="" /></a> <span class="topRdNumber">RD-6489</span> </div>
    <div class="prizeDrawList">
      <ul>
        <li>
          <h1 class="prize">PRIZE DRAW ElIGIBILITY INQUIRY</h1>
          <span class="year"><small>20</small>16</span> <span class="RfNumber">CUSTOMER REFERENCE NUMBER: <br>
          <small><%=crn %></small></span> </li>
        <li>
          <div class="reciptName">
            <h2>Recipient's Full Name</h2>
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
          <div class="allStatusHead"> <span class="inqueryStatus">Inquiry Status </span> <span class="prizeMatch">Prize Match Status</span> <span class="AddSubscribe">Additional Subscriber Privileges</span> <img src="images/statusBanner3.png" alt="" /> </div>
        </li>
      </ul>
    </div>
  </div>
      
      <input type="hidden" name="crn" value="<%=crn %>" />
   <input type="hidden" name="fname" value="<%=fname %>" />
    <input type="hidden" name="lname" value="<%=lname %>" />
     <input type="hidden" name="city" value="<%=city %>" />
      <input type="hidden" name="csource" value="<%=csource %>" />
      <input type="hidden" name="email" value="<%=email %>" />
  <div class="botmStsSec">
    <div class="rdMagineleftSec"> <img src="images/magazinepage3.png" alt="" /> </div>
    <div class="rdMaginerightSec">
      <h2>Prize choice Confirmed,<br>
       <%=fname %> <%=lname %></h2>
      <p>The low introductory rate offered to you when you first subscribed was the very best available. So, to thank you for the intrest you have shown in our magazine, we would like to offer you the opportunuty to extend the introductory rate for futher 12 issues at the same exceptional discount. </p>
      <p> That's an <span>extra 12 months of the world's favourate magazine at just Rs.711 </span>including postage and handling - an outstanding 45% off our actual annual subscription price of Rs.1260</p>
      <div class="freeNotebookSec">
        <h3>Plus a FREE Reader's Digest<br>
          Notebook</h3>
        <small>Specially chosen to thank you for<br>
        talking up our great offer.</small> <span class="freenotbookcarImg"><img src="images/freenotbookcarImg.png" alt="" /></span> <input type="submit" value="" class="notebookBtn" /> </div>
    </div>
  </div>
    </form>
</div>
</body>
</html>
