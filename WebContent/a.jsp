<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date" %>
<%
String year = null;
String month = null;
String day = null;
String invno = null;
DateFormat fmt 			= new SimpleDateFormat("yyMMddHHmmss");
String now 				= fmt.format(new java.util.Date());
Random randomGenerator 	= new Random();
int num 				= randomGenerator.nextInt(799)+100 ; 
invno			="RDRAB"+now+num;

//out.println("INVNO: " + invno);


String source ="" + request.getParameter("csource");
if(source==null || ("").equals(source))
{
	source="website";
}
//out.println(source);     

// http://subscription.readersdigest.in/rdindia/E-RAB-2016/index.jsp?crn=RD10098734&&email=kunalrulz@gmail.com&&fname=Mr.%20Kunal%20Bag&&city=New%20Delhi&&csource=ERAB2016

String string = "Kunal Test Bag";
String[] stringArray = string.split("\\s+");

/* for (String str : stringArray)
{
	
   out.println("String " + str);
  
} */

String slt = "";
String fn = "";
String ln ="";

for(int i=0;i<stringArray.length;i++)
{   
//	if((stringArray.length <= 3) && stringArray[i]!= null ) {
	// out.println("<br> String "+ i + "---" + stringArray[i]);
	 if((stringArray[0].equals("Mr.")) || (stringArray[0].equals("Mrs.")) || (stringArray[0].equals("Miss.")) || (stringArray[0].equals("Mr")) || (stringArray[0].equals("Mrs")) || (stringArray[0].equals("Dr.")) || (stringArray[0].equals("Dr")))
	 {
		 
		 slt = stringArray[0];
		 fn = stringArray[1]; 
		 if(i>1)
		 {
			 ln =  stringArray[2]; 
		 }
		 else if(i>2)
		 {
			 ln =  stringArray[2] + "" +  stringArray[3];
			 
		 }
		 else
		 {
			 ln = ""; 
		 }
		 out.println("<br>Salutation is: " + stringArray[0]);
		 out.println("<br>Firstname is: " + stringArray[1]);
		 out.println("<br>Lastname is: " + stringArray[2]);
		
		 
		 request.setAttribute("slt", slt);
		 request.setAttribute("fn", fn);    
		 request.setAttribute("ln", ln);
		 
	 }             
	 else        
	 {               
		
		
		 fn = stringArray[0];
		 if(i>0)
		 {   
		 ln = stringArray[1];
		 }
		 else if(i>1)
		 {
			 ln = stringArray[1] + "" +  stringArray[2]; 
		 }
		 else
		 {
			 ln = "";  
		 }   
		 out.println("<br>Firstname is: " + stringArray[0]);
		 out.println("<br>Lastname is: " + stringArray[1]);
		 	 
		 request.setAttribute("fn", fn);
		 request.setAttribute("ln", ln);
	 }
	 
	
	  
//	}
	 
}

out.println("<br><br> " +  request.getAttribute("slt"));
out.println("<br><br> " +  request.getAttribute("fn"));
out.println("<br><br> " +  request.getAttribute("ln"));


%>