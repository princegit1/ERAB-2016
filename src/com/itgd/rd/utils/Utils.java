package com.itgd.rd.utils;      

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.*;

public class Utils {    
	

	public static Connection getConnection() 
	{
		Connection dbCon = null;
		  
	      try
	      {
	    	  Class.forName("com.mysql.jdbc.Driver");  
	    	 // dbCon = DriverManager.getConnection("jdbc:mysql://10.10.25.242:3306/rdindia","itgd","itgd@nd@123");
	    	  dbCon = DriverManager.getConnection("jdbc:mysql://localhost/rdindia","root","");    
	    	  
		} 
		catch (Exception e) 
		{
		   System.out.println("Exception E: " + e);
		}
		return dbCon;
	}
	
	
} 

