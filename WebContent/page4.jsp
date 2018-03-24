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


%>
<div class="wrapperContainerMain">  
<form name="frm" method="post" >
  <div class="topRdHeaderBox">
    <div class="topRdLogoSec"> <a href="#" class="rdLogoRight"><img src="images/rdlogo.png" alt="" /></a> <span class="topRdNumber">RD-6489</span> </div>
    <div class="prizeDrawList">
      <ul>
        <li>
          <h1 class="prize">PRIZE DRAW ElIGIBILITY INQUERY</h1>
          <span class="year"><small>20</small>16</span> <span class="RfNumber">CUSTOMER REFERANCE NUMBER: <br>
          <small><%=crn %></small></span> </li>
        <li>
          <div class="reciptName">   
            <h2>Recipent 's full name</h2>
            <span><%=fname %> <%=lname %></span> </div>
          <div class="residenceName">
            <h2>Residence india</h2>
            <span><%=city %></span> </div>
          <div class="employmentName">
            <h2>Employment requirement 1</h2>
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
          <div class="allStatusHead"> <span class="inqueryStatus">Inquiry Status </span> <span class="prizeMatch">Prize Match Status</span> <span class="AddSubscribe">Additional Subscriber Privileges</span> <img src="images/statusBanner4.png" alt="" /> </div>
        </li>
      </ul>
    </div>
  </div>
  <div class="botmmazineSec">
    <h2>[<%=fname %> <%=lname %>], Claim all These additional subscriber privileges and discover if we already owe you <span> Rs. 20,00,000!</span></h2>
    
    <div class="mazine_pic">
            <div class="mazineleftNoSec"> <img src="images/magineCarimg4.png" alt="" /></div>

        <div class="mazineRightNoSec"> <img src="images/redermazine4.png" alt="" /></div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script>
    $(document).ready(function(){
        
      $('#yes_btn').click(function(){
         //alert('Yes');
         
         document.frm.action="validate_pay.jsp";
         document.frm.submit();
          })
       
         $('#no_btn').click(function(){
        // alert('No');
         
         document.frm.action="no_page.jsp"; 
         document.frm.submit(); 
        
          })
          
        })
        


</script>
     <div class="mazineRight_text">
      <a href="#" class="yesBtn"><img src="images/yesbtn.png" alt="" id="yes_btn"  /></a>
      <p>Please enter me in the India Today Group Rupees Two crore super bonanza Sweepstakes 2016 and send a 12-month Reader's Digest subscription for only Rs. 711.00 - that's over 46% discount on the subscription price of Rs. 1260 (Including Rs. 60 for postage and handling). That's only Rs. 59.25 per issue! Plus get surprise gifts absolutely FREE! </p>
     
     <ul>
      <li>The Rs. 20,00,000.00 Super Grand Prize</li>
 <li>The Rs. 7,75,000.00 / Honda City Thank You prize</li>
 <li>A share of Rs. 1,71,52,098.00 worth of additional prizes</li>
 <li>Receive your Free Gift - A special Readers Digest Notebook</li>
</ul>

</div> 
  <input type="hidden" name="crn" value="<%=crn %>" />
   <input type="hidden" name="fname" value="<%=fname %>" />
    <input type="hidden" name="lname" value="<%=lname %>" />
     <input type="hidden" name="city" value="<%=city %>" />
      <input type="hidden" name="csource" value="<%=csource %>" />
      <input type="hidden" name="email" value="<%=email %>" />
      <%
      session.setAttribute("crn",crn); 
      session.setAttribute("fname",fname);
      session.setAttribute("lname",lname);  
      session.setAttribute("city",city);
      session.setAttribute("csource",csource);
      session.setAttribute("email",email);
      
      crn=(String) session.getAttribute("crn");
      fname=(String) session.getAttribute("fname");
      lname=(String) session.getAttribute("lname");
      city=(String) session.getAttribute("city");
      csource=(String) session.getAttribute("csource");
      email=(String) session.getAttribute("email");
      //out.println(invno + "==" + fname + "==" + lname + "==" + city + "==" + csource);
      
      %>
<div class="mazineLeft_text">
      <a href="#" class="noBtn" id="no_btn" onClick="redirectToPayNow()">NO</a>
      <p>I do not wish to subscribe at this time, but enter me in the India Today Group Rupees Two Crore Super Bonanza Sweepstakes 2016 with a confirmed chance to win:</p>
      <ul>
      	<li>Basic privileges in Reader's Digest Sweepstakes</li>
      </ul>
</div>



    
  </div>
    </form>
</div>
</body>
</html>
