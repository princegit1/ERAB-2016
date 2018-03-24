<%@ page import="com.billdesk.pgidsk.PGIUtil" %>
<%@ page import="java.util.zip.CRC32" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>SFA - Response from Billdesk Web Server</title>
</head>
<%
String strHash = null;
HashMap	oHashMap	=	new HashMap();
 
/* Unique CheckSum Key Provided By BillDesk */ 
String commonstr="5n9wh8T0a3fw";

String temp=request.getParameter("msg");
String makeCheckSum="";
String[] tempString;
tempString=temp.split("\\|");
String MerchantID="";
String CustomerID="";
String TxnReferenceNo="";
String BankReferenceNo="";
String TxnAmount="";
String BankID="";
String BankMerchantID="";
String TxnType="";
String CurrencyName="";
String ItemCode="";
String SecurityType="";
String SecurityID="";
String SecurityPassword="";
String TxnDate="";
String AuthStatus="";
String SettlementType="";
String AdditionalInfo1="";
String AdditionalInfo2="";
String AdditionalInfo3="";
String AdditionalInfo4="";
String AdditionalInfo5="";
String AdditionalInfo6="";
String AdditionalInfo7="";
String ErrorStatus="";
String ErrorDescription="";
String CheckSum="";
String	redirectURL	="";

for(int i=0;i<tempString.length;i++)
{
	MerchantID = tempString[0];
	CustomerID = tempString[1];
	TxnReferenceNo = tempString[2];
	BankReferenceNo = tempString[3];
	TxnAmount = tempString[4];
	BankID = tempString[5];
	BankMerchantID = tempString[6];
	TxnType = tempString[7];
	CurrencyName = tempString[8];
	ItemCode = tempString[9];
	SecurityType = tempString[10];
	SecurityID = tempString[11];
	SecurityPassword = tempString[12];
	TxnDate = tempString[13];
	AuthStatus = tempString[14];
	SettlementType = tempString[15];
	AdditionalInfo1 = tempString[16];
	AdditionalInfo2 = tempString[17];
	AdditionalInfo3 = tempString[18];
	AdditionalInfo4 = tempString[19];
	AdditionalInfo5 = tempString[20];
	AdditionalInfo6 = tempString[21];
	AdditionalInfo7 = tempString[22];
	ErrorStatus = tempString[23];
	ErrorDescription = tempString[24];
	CheckSum = tempString[25];
}


makeCheckSum=MerchantID+"|"+CustomerID+"|"+TxnReferenceNo+"|"+BankReferenceNo+"|"+TxnAmount+"|"+BankID+"|"+BankMerchantID+"|"+TxnType+"|"+CurrencyName+"|"+ItemCode+"|"+SecurityType+"|"+SecurityID+"|"+SecurityPassword+"|"+TxnDate+"|"+AuthStatus+"|"+SettlementType+"|"+AdditionalInfo1+"|"+AdditionalInfo2+"|"+AdditionalInfo3+"|"+AdditionalInfo4+"|"+AdditionalInfo5+"|"+AdditionalInfo6+"|"+AdditionalInfo7+"|"+ErrorStatus+"|"+ErrorDescription;
//out.println(makeCheckSum);
try
{
	strHash = PGIUtil.doDigest(makeCheckSum,commonstr);
}
catch(Exception eCRC)
{
	out.println(eCRC.toString());
}

//out.println("<br>"+temp);
//out.println("<br>Status=>"+strHash);

if(CheckSum.equals(strHash))
{
	//out.println("Transaction is valid. ");

	
/*else
{
	out.println("Transaction is invalid");
}

if(AuthStatus.equals("0300"))
{
		out.println("<br>Sucessful Transaction");
}

else
{
	out.println("<br>Sorry, your transaction has been fail dut to "+ErrorDescription+" reason.<br>Try Again.");
}
*/
	   
		String[]	splitArr	=	CustomerID.split("-");

		oHashMap.put("ITE","http://subscriptions.intoday.in/subscriptions/itoday/billstatus.jsp");
		oHashMap.put("ITEW","http://subscriptions.intoday.in/subscriptions/itoday/billstatus.jsp");
		oHashMap.put("ITH","http://subscriptions.intoday.in/subscriptions/itoday/billstatus.jsp");
		oHashMap.put("ITTL","http://subscriptions.intoday.in/subscriptions/itoday/billstatus.jsp");
		oHashMap.put("ITI","http://subscriptions.intoday.in/subscriptions/itoday/billstatus.jsp");
		oHashMap.put("ITB","http://subscriptions.intoday.in/subscriptions/itoday/billstatus.jsp");
		oHashMap.put("ITT","http://subscriptions.intoday.in/subscriptions/itoday/billstatus.jsp");
		oHashMap.put("ITM","http://subscriptions.intoday.in/subscriptions/itoday/billstatus.jsp");
		oHashMap.put("ITT","http://subscriptions.intoday.in/subscriptions/itoday/billstatus.jsp");
		
		
		
		try
		{
			if(splitArr[1].equalsIgnoreCase("web") && oHashMap.containsKey(splitArr[0])	)
			{
				redirectURL	=	(String)oHashMap.get(splitArr[0]);
			}
			else if(!splitArr[1].equalsIgnoreCase("web") &&	oHashMap.containsKey(splitArr[0]+"-"+splitArr[1])	)
			{
				redirectURL	=	(String)oHashMap.get(splitArr[0]+"-"+splitArr[1]);
			}
			else if(!splitArr[1].equalsIgnoreCase("web") &&	oHashMap.containsKey(splitArr[0])	)
			{
			redirectURL	=	(String)oHashMap.get(splitArr[0]);
			System.out.println("redirectURL3---"+redirectURL);
			}
			else 
			{
			System.out.println("redirectURL4---"+redirectURL);
			}
		

	%>
<body onLoad="document.pgform.submit();">
<CENTER>
<IMG SRC="SplashPageLoader.gif">
</CENTER>
<FORM METHOD=POST NAME="pgform" ACTION="<%=redirectURL%>" >
<INPUT TYPE="hidden" name="RespCode" value="<%=AuthStatus%>">
<INPUT TYPE="hidden" name="TxnID" value="<%=CustomerID%>">
<INPUT TYPE="hidden" name="Message" value="<%=ErrorDescription%>">
</FORM>
</body>
	
<%
}
		catch(Exception ee){
			out.println("There is some problem.");
		}	

}
else
{
%>
<center><h1>Transaction is invalid</h1></center>
<%}%>


</html>