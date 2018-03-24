<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String invoice_no	=	(String)session.getAttribute("invno");
	if(invoice_no==null || invoice_no.length()<=0)
	{
		response.sendRedirect("index.jsp?msg=Cannot-access-page-directly&csource="+session.getAttribute("csource"));
		return;
	}
	
	String fname	=	(String)session.getAttribute("fname");
	String lname	=	(String)session.getAttribute("lname");
	if(fname.length()<=0 || lname.length()<=0)
	{
		response.sendRedirect("index.jsp?msg=Cannot-access-page-directly&csource="+session.getAttribute("csource"));
		return;
	}
	String mobile	=	(String)session.getAttribute("mobile");
	if(mobile!=null && mobile.length()>0)
	{
		mobile	=	(String)session.getAttribute("mobile");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RD Lifetime Annuity</title>
<link href='http://fonts.googleapis.com/css?family=Roboto:100,300,700,500,400,900' rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--[if lt IE 8]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE8.js"></script>
<![endif]-->
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
<![endif]-->
<style>
.error{  font-size: 11px;
  color: #c00;
  background: !important ;
  }
  .footer{
  	width:100%; float:left; text-align:center; font:12px/15px "Roboto", sans-serif; color:#005399; padding:13px 0;
  }
</style>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="css/new_pyck.css" />
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script>
	$(function () {
	
    $('#datepicker').datepicker({
        dateFormat:  'dd/mm/yy',
        showButtonPanel: true,
        changeMonth: true,
        changeYear: true,
		yearRange: '1925:2000',
        /*showOn: "button",
        buttonImage: "images/calendar.gif",
        buttonImageOnly: false,*/
        minDate: new Date(1925,0, 1),
		//minDate: '-18Y',
        maxDate: '-18Y',
        inline: true
    });
});
</script>
  <script>
  	function validate(frm)
	{
		//alert('Inside validate');
		
	}
  </script>
  <script>
function yesaction(frm)
{
	//alert('Yes');
	var email =/[-a-zA-Z0-9_\.]+@[-a-zA-Z0-9]+\.[-a-zA-Z0-9\.]+/;
		var eflag = frm.email.value.match(email);
		
		var nval = /[a-zA-Z\s]{1,100}/;
		var nflag = frm.fname.value.match(nval);
		var lnflag = frm.lname.value.match(nval);
		var cflag = frm.city.value.match(nval);
		
		var zval = /[0-9]{6}/
		var zflag = frm.zip.value.match(zval);
		
		//var mval = /[0-9]{10,11}/
		var mval = /[1-9]+[0-9]{9}/
		var mflag = frm.mobile.value.match(mval);

		if (frm.fname.value=="")
		{
			alert("Please enter your first name");
			frm.fname.focus();
			return false;
		}
		if (frm.fname.value.trim()=="")
		{
			alert("Please enter your first name");
			frm.fname.focus();
			return false;
		}
		if (nflag != frm.fname.value)
		{
			alert("Enter only alphabets in first name");
			frm.fname.focus();
			//frm.fname.select();
			return false;
		}
		if (frm.lname.value=="")
		{
			alert("Please enter your last name");
			frm.lname.focus();
			return false;
		}
		if (frm.lname.value.trim()=="")
		{
			alert("Please enter your last name");
			frm.lname.focus();
			return false;
		}
		if (lnflag != frm.lname.value)
		{
			alert("Enter only alphabets in last name");
			frm.lname.focus();
			frm.lname.select();
			return false;
		}
		if (frm.address1.value=="")
		{
			alert("Please enter address line 1");
			document.rd.address1.focus();
			return false;
		}
		
			if (frm.address1.value.trim()=="")
		{
			alert("Please enter address line 1");
			document.rd.address1.focus();
			return false;
		}
		if (frm.address2.value=="")
		{
			alert("Please enter address line 2");
			frm.address2.focus();
			return false;
		}
		
		if (frm.address2.value.trim()=="")
		{
			alert("Please enter address line 2");
			frm.address2.focus();
			return false;
		}
		
		if (frm.city.value=="")
		{
			alert("Please enter your city name");
			frm.city.focus();
			return false;
		}
		if (frm.city.value.trim()=="")
		{
			alert("Please enter your city name"); 
			frm.city.focus();
			return false;
		}
		
		if (cflag != frm.city.value)
		{
			alert("Enter only alphabets in city");
			frm.city.focus();
			return false;
		}
		if(frm.state.value=="")
		{
			alert("Please select your state");
			frm.state.focus();
			return false;
		}
		
		if (frm.mobile.value=="")
		{
			alert("Please enter your mobile number");
			frm.mobile.focus();
			return false;
		}
		if (frm.mobile.value != "")
		{
			if(mflag!=frm.mobile.value)
			{
				alert("Enter a valid mobile number");
				frm.mobile.focus();
				//frm.mobile.select();
				return false;
			}
		}
		
		if (frm.zip.value=="")
		{
			alert("Please enter postal code");
			frm.zip.focus();
			return false;
		}
		if (zflag != frm.zip.value)
		{
			alert("Enter valid 6 digit postal code");
			frm.zip.focus();
			//frm.zip.select();
			return false;
		}
		if (frm.email.value=="")
		{
			alert("Please enter your email address");
			frm.email.focus();
			return false;
		}
		if(eflag!=frm.email.value)
		{
			alert("Enter a valid email address");
			frm.email.focus();
			//frm.email.select();
			return false;
		}
		if(frm.dob.value=="")
		{
			alert("Please select your date of birth");
			frm.dob.focus();
			//frm.email.select();
			return false;
		}
		/*if (!frm.accept.checked)
		{
			alert("You must be above 18 years of age");
			frm.accept.focus();
			return false;
		}*/
	document.rd.action="thanksyes-new.jsp";
	document.rd.submit();   
	
}

function noaction(frm)
{ 
	//alert('No');
	var email =/[-a-zA-Z0-9_\.]+@[-a-zA-Z0-9]+\.[-a-zA-Z0-9\.]+/;
		var eflag = frm.email.value.match(email);
		
		var nval = /[a-zA-Z\s]{1,100}/;
		var nflag = frm.fname.value.match(nval);
		var lnflag = frm.lname.value.match(nval);
		var cflag = frm.city.value.match(nval);
		
		var zval = /[0-9]{6}/
		var zflag = frm.zip.value.match(zval);
		
		//var mval = /[0-9]{10,11}/
		var mval = /[1-9]+[0-9]{9}/
		var mflag = frm.mobile.value.match(mval);

		if (frm.fname.value=="")
		{
			alert("Please enter your first name");
			frm.fname.focus();
			return false;
		}
		if (nflag != frm.fname.value)
		{
			alert("Enter only alphabets in first name");
			frm.fname.focus();
			//frm.fname.select();
			return false;
		}
		if (frm.lname.value=="")
		{
			alert("Please enter your last name");
			frm.lname.focus();
			return false;
		}
		if (lnflag != frm.lname.value)
		{
			alert("Enter only alphabets in last name");
			frm.lname.focus();
			frm.lname.select();
			return false;
		}
		if (frm.address1.value=="")
		{
			alert("Please enter address line 1");
			document.rd.address1.focus();
			return false;
		}
		
		
		if (frm.address2.value=="")
		{
			alert("Please enter address line 2");
			frm.address2.focus();
			return false;
		}
		
		
		if (frm.city.value=="")
		{
			alert("Please enter your city name");
			frm.city.focus();
			return false;
		}
		
		if (cflag != frm.city.value)
		{
			alert("Enter only alphabets in city");
			frm.city.focus();
			return false;
		}
		if(frm.state.value=="")
		{
			alert("Please select your state");
			frm.state.focus();
			return false;
		}
		
		if (frm.mobile.value=="")
		{
			alert("Please enter your mobile number");
			frm.mobile.focus();
			return false;
		}
		if (frm.mobile.value != "")
		{
			if(mflag!=frm.mobile.value)
			{
				alert("Enter a valid mobile number");
				frm.mobile.focus();
				//frm.mobile.select();
				return false;
			}
		}
		
		if (frm.zip.value=="")
		{
			alert("Please enter postal code");
			frm.zip.focus();
			return false;
		}
		if (zflag != frm.zip.value)
		{
			alert("Enter valid 6 digit postal code");
			frm.zip.focus();
			//frm.zip.select();
			return false;
		}
		if (frm.email.value=="")
		{
			alert("Please enter your email address");
			frm.email.focus();
			return false;
		}
		if(eflag!=frm.email.value)
		{
			alert("Enter a valid email address");
			frm.email.focus();
			//frm.email.select();
			return false;
		}
		if(frm.dob.value=="")
		{
			alert("Please select your date of birth");
			frm.dob.focus();
			//frm.email.select();
			return false;
		}
		/*if (!frm.accept.checked)
		{
			alert("You must be above 18 years of age");
			frm.accept.focus();
			return false;
		}*/
	document.rd.action="whysayno_page.jsp";
	document.rd.submit();

}

  </script>
  <%//@include file="ga_edm.jsp"%>
</head>

<body>
<div id="wrapper" class="ipadwid_wid">     
  <div class="page_b">
    <!--<div class="head_section pad_p6"> <span class="rdin"></span> <span class="banner"><img src="http://media2.intoday.in/rdindia/rd-lifetime-annuity/top-banner.png" alt="" /></span>
      <div class="entry">
        <h2><em>Entry document issued for:</em> <br> <%=fname+" "+lname%></h2>
      </div>
    </div>-->
      <div class="brown_header">
        <h1>INDIA TODAY GROUP RUPEES TWO CRORE SUPER BONANZA SWEEPSTAKES 2016</h1>
      </div>
    <div id="page6">
      <form  name="rd" method="post" id="rdform" >
        <div class="top_section">
          <div class="left_content">
            <h3>Final registration for the winner's selection stage</h3>
            <p> Please complete your details below. We will use these details to contact you in the event you're drawn as a winner. Then click below to confirm your chance privileges.</p>
          </div>
          <div class="code_sec">
            <h3>Here is your personal Access Code:</h3>
            <span> <%=invoice_no%> </span> </div>
        </div>
        <div class="form_center">
          <div class="main">
            <div class="m_cnt_rw" style="width:100%;">
<div class="rows">
  <div class="left_col">
    <label>*Title:</label>
    <select name="title">
      <option value="Mr">Mr.</option>
      <option value="Mrs">Mrs.</option> 
      <option value="Ms">Ms</option>
    </select>
  </div>
    <div class="left_col htg_l">
    </div>
</div>
<div class="rows">
  <div class="left_col">
    <label>*First Name:</label>
    <input type="text" value="<%= (String)session.getAttribute("fname")%>" name="fname" />
  </div>
  <div class="left_col">
    <label>*Last Name:</label>
    <input type="text" value="<%= (String)session.getAttribute("lname")%>" name="lname" />
  </div>
</div>
<div class="rows">
  <div class="left_col">  <label>*Address1:</label>
      <input type="text" value="" name="address1" /></div>
  <div class="left_col"> <label>*Address2:</label>
      <input type="text" value="" name="address2" /> </div>
</div>

<div class="rows">
  <div class="left_col">   <label>*City:</label>
      <input type="text"  name="city" />
       </div>
  <div class="left_col">   <label>*State:</label>
      <select class="wid" name="state">
        <option value="" selected="selected">Select </option>
        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands </option>
        <option value="Andhra Pradesh">Andhra Pradesh </option>
        <option value="Arunachal Pradesh">Arunachal Pradesh </option>
        <option value="Assam">Assam </option>
        <option value="Bihar">Bihar </option>
        <option value="Chandigarh">Chandigarh </option>
        <option value="Chhattisgarh">Chhattisgarh </option>
        <option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli </option>
        <option value="Daman and Diu">Daman and Diu </option>
        <option value="Delhi">Delhi </option>
        <option value="Goa">Goa </option>
        <option value="Gujarat">Gujarat </option>
        <option value="Haryana">Haryana </option>
        <option value="Himachal Pradesh">Himachal Pradesh </option>
        <option value="Jammu and Kashmir">Jammu and Kashmir </option>
        <option value="Jharkhand">Jharkhand </option>
        <option value="Karnataka">Karnataka </option>
        <option value="Kerala">Kerala </option>
        <option value="Lakshadweep">Lakshadweep </option>
        <option value="Madhya Pradesh">Madhya Pradesh </option>
        <option value="Maharashtra">Maharashtra </option>
        <option value="Manipur">Manipur </option>
        <option value="Meghalaya">Meghalaya </option>
        <option value="Mizoram">Mizoram </option>
        <option value="Nagaland">Nagaland </option>
        <option value="Orissa">Orissa </option>
        <option value="Pondicherry">Pondicherry </option>
        <option value="Punjab">Punjab </option>
        <option value="Rajasthan">Rajasthan </option>
        <option value="Sikkim">Sikkim </option>
        <option value="Tamil Nadu">Tamil Nadu </option>
        <option value="Tripura">Tripura </option>
        <option value="Telangana">Telangana </option>
        <option value="Uttaranchal">Uttaranchal </option>
        <option value="Uttar Pradesh">Uttar Pradesh </option>
        <option value="West Bengal">West Bengal </option>
      </select> </div>
</div>

<div class="rows">
  <div class="left_col">  <label>*Mobile No:</label>
      <input type="text"  name="mobile" maxlength="10"/>  <em>(Numbers only- No spaces)</em> </div>
  <div class="left_col">  <label>*Pin Code:</label>
      <input type="text" value="" name="zip" maxlength="6"/> </div>
</div>

<div class="rows">
  <div class="left_col">  <label>*Email:</label>
      <input type="text" value="<%= (String)session.getAttribute("email")%>" name="email" /> </div>
  <div class="left_col">  <label>*Date Of Birth:</label>
  		<input type="text" name="dob" id="datepicker" readonly/> <em style="margin-left:32%">Please enter your date of birth to</br> confirm that you are above 18 years of age</em>
    </div>
</div>

<div class="rows">
  <div class="left_col">  <!--<label class="wid">*Yes, I am above 18yrs of age:</label>
      <input type="checkbox" value="" name="accept" />--> </div>
  <div class="left_col">  </div>
</div>
</div>
          </div>
        </div>
        
        <div class="section_part">
        
        
        <div class="clear"></div>
        <div  class="yesdiv">
      <span class="yes" onClick="javascript : yesaction(document.rd);">
        <!--<input type="submit" />-->
        <!--<input type="submit" value="Yes" />-->
        <!--<input type="button" value="Yes" />-->
        </span>
        </div>
        <!--<input type="submit" class="yes" />-->
        
        <div class="com_part"> 
        <p>Please enter me in the India Today Group Rupees Two Crore Super Bonanza Sweepstakes 2016 and send a 12-month Reader's Digest subscription for only Rs.  711.00 -  that's over 46% discount on the subscription price of Rs.  1260 (Including Rs.  60 for postage and handling). That's only Rs.  59.25 per issue! Plus get surprise gifts absolutely FREE! along with 4 confirmed chances to win.</p>
        <div class="com_row">
        <ul>
        <li><p>The Rs.  20,00,000.00 Super Grand Prize</p></li>
        <li><p>The Rs.  7,75,000.00 Thank You prize</p></li>
        <li><p>A share of Rs.  1,71,52,098.00 worth of additional prizes</p></li>
        <li><p>Receive your Free Gift ?Made in India? by Kunal Vijayakar worth Rs.  299</p></li>
        
        
        </ul>
        <div class="car"> <img src="http://media2.intoday.in/indiatoday/rd_pyck/car4-2016.png" alt=""  class="car_rd_py" />
        <h4>Rs.  7,75,000.00 CASH</h4>
<h5>OR</h5>
<h5>HONDA CITY</h5>
       
        
        
        
        </div>
        <div class="clear"></div>
         <p>For your convenience, when you do continue, you can be assured that your subscription will be serviced without interruption, for as long as you wish under our no-risk Continuing Renewal Privilege. Here's how it works; each year before the end of your term, you'll receive a reminder with easy instructions on how you can go on receiving Reader's Digest for another year at the guaranteed discount over the issue price then in effect. Should you decide to no longer remain a Privileged Subscriber, simply return your reminder to us stating your wishes and your subscription shall be stopped upon completion of your term. You may, if you wish, drop us a line to cancel your subscription at any time and receive a full refund for those issues not serviced. It's our total commitment to your 100% satisfaction. No questions asked.</p>
        
        
        </div>
        
        </div>
        
         <div class="clear"></div>
         <div  class="yesdiv">
        <span class="no" onClick="javascript : noaction(document.rd);" style="cursor:pointer;">
        	<!--<input type="button" value="No" />-->
        </span>
        </div>
        
        <div class="com_part nbord">
        <p>I do not wish to subscribe at this time, but enter me in the India Today Group Rupees Two Crore Super Bonanza Sweepstakes 2016 with a confirmed chance to win:</p>
        
        <div class="com_row">
        <ul>
        <li><p>Basic privileges in Reader's Digest Sweepstakes</p></li>
       
        </ul>
        
        
         
        
        
        </div>
        
        </div>
        </div>
        
        
      
        
      </form>
    </div>
  </div>
<!--  <div id="footer"> <span><a href="#">Terms &amp; Conditions</a> | <a href="#">Prize List</a> | <a href="#">Past Winners</a></span> </div>-->
<%@include file="footer.jsp"%>
</div>
</body>
</html>
