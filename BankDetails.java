package com.onlinebank;

import java.sql.*;
import java.util.*;

public class BankCommons {
	
	public static Connection prepareConn() {
		Connection c=null;
		try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	c = DriverManager.getConnection("jdbc:mysql://localhost/details","root","babysonu2812345678");
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		return c;
	}//prepareConn
	
	public static void closeConn(Connection c){
		try {
			if(c!=null)
				c.close();    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
	}//closeConn
	
	public static int update(String sql) {
		int update = 0;
		Connection c=null;
		try {
			c = prepareConn();
			Statement st = c.createStatement();
			update = st.executeUpdate(sql);    
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		closeConn(c);
		return update;
	}
	
	
	
	
	//------------
	
	public static String getNameByNo(String sql) {
		String name = "";
		Connection c=null;
		try {
			c = prepareConn();
			Statement st = c.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				name = rs.getString(1);
			}
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		closeConn(c);
		return name;
	}
	
	//--------------------------	
	
	
	
	public static int getBalance(String sql) {
		Connection c=null;
		int balance=0;
		try {
			c = prepareConn();
			Statement st = c.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				balance = rs.getInt(1);
			}
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		closeConn(c);
		return balance;
	}
	
//	public static void main (String[] args) {
//		String sql=("select username from accountdetails where operation ="WITHDRAW" and operation="DEPOSIT");
//		ArrayList a=getBalance(sql);
                                   

//	}
}