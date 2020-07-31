<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,java.util.*,com.onlinebank.BankCommons" errorPage="" %>
<%
String op = "WITHDRAW";
String uname = request.getParameter("uname");
int accno = Integer.parseInt(request.getParameter("accNo"));
int amt = Integer.parseInt(request.getParameter("Amount"));
String bal_sql = "SELECT balance FROM txdetails WHERE uname='"+uname+"' AND acc_no = "+accno+";

int bal1=0;
int bal = BankDetails.getBalance(bal_sql);
if(bal == 0){
	response.sendRedirect("noBal.jsp");
}else if(bal < amt){
	response.sendRedirect("noBal.jsp");
}else {
	bal1 = bal - amt;
	String sql_up = "UPDATE tx_details SET bal=ball WHERE uname='"+uname+"' AND acc_no = "+accno+" ;
	int up = BankDetails.update(sql_up);
}


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8" />
<title>Online Bank.</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
</head>
</html>
