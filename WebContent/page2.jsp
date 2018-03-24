
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

String crn=""+request.getParameter("crn");
String fname=""+request.getParameter("fname");
String lname=request.getParameter("lname");
if(lname == null){
lname = "";
}
String email=""+request.getParameter("email"); 
String city=""+request.getParameter("city");
String csource=request.getParameter("csource");


//out.println(csource);
            
%>
<div class="wrapperContainerMain">
<form name="frm" method="post" action="page3.jsp">
  <div class="topRdHeaderBox">
    <div class="topRdLogoSec"> <a href="#" class="rdLogoRight"><img src="images/rdlogo.png" alt="" /></a> <span class="topRdNumber">RD-6489</span> </div>
    <div class="prizeDrawList">
      <ul>
        <li>
          <h1 class="prize">PRIZE DRAW ELIGIBILITY INQUIRY</h1>
          <span class="year"><small>20</small>16</span> <span class="RfNumber">CUSTOMER REFERENCE NUMBER: <br>
          <small><%=crn %> </small></span> </li>
        <li>
          <div class="reciptName">
            <h2>Recipient's Full Name</h2>
            <span><%=fname %> <%=lname %></span> </div>
          <div class="residenceName">
            <h2>Residence India</h2>  
            <span><%=city %> </span> </div>
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
          <div class="allStatusHead"> <span class="inqueryStatus">Inquiry Status </span> <span class="prizeMatch">Prize Match Status</span> <span class="AddSubscribe">Additional Subscriber Privileges</span> <img src="images/statusBanner2.png" alt="" /> </div>
        </li>
      </ul>
    </div>
  </div>
  <div class="botmStsSec">
    <div class="hondaCitybanner2">
      <div class="hCbannerCheckBox">
        <h2>Brand-new Rs.7,75,000 Honda City Car or<br>
          Rs.7,75,000 CASH - you choose</h2>
        <div class="selectBoxSec">
          <form>
            <div class="selectBox">
              <input type="radio" name="text" id="a"/>
              <label for="a">Car<span></span></label>
            </div>
            <div class="selectBox">
              <input type="radio" name="text" id="b"/>
              <label for="b">Cash<span></span></label>
            </div>
          </form>
        </div>
      </div>
      <div class="yourToWinSec">
        <div class="winLeftContent">
                   
        
        <input type="hidden" name="crn" value="<%=crn %>" />
   <input type="hidden" name="fname" value="<%=fname %>" />
    <input type="hidden" name="lname" value="<%=lname %>" />
     <input type="hidden" name="city" value="<%=city %>" />
      <input type="hidden" name="csource" value="<%=csource %>" />
      <input type="hidden" name="email" value="<%=email %>" />
          <p>In addition to determining your prize draw status, our inquiry showed that since recently joining a select group of <span>Preferred
            Reader's Digest Subscribers,</span> you have acquired the right to clame additional privileges and the chance to win lacs more in our Thank You prize, when you accept to our time limited subscriber offer. </p>
          <span class="hondaCityCarImg"><img src="images/hondacity.png" alt="" /></span> </div>
        <div class="rightContinueBtn"> 
        <input type="submit" value="" class="sbmt_rab2" />
        <!-- <a href="#"><img src="images/continue2.png" alt="" /></a> -->
        
        </div>
      </div>
    </div>
  </div>
  </form>
</div>
</body>
</html>
