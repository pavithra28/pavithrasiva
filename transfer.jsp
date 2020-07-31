<%@ page contentType="text/html; charset=UTF-8 language="java" import="java.sql.*,java.util.*,com.onlinebanking.BankDetails" errorPage="" %>
<%


String uname = request.getParameter("uname");
int accno = Integer.parseInt(request.getParameter("accNo"));
int daccno = Integer.parseInt(request.getParameter("daccNo"));
int amt = Integer.parseInt(request.getParameter("Amount"));
String bal_sql = "SELECT balance FROM txdetails WHERE uname='"+uname+"' AND acc_no = "+accno+";
int bal = BankDetails.getBalance(bal_sql);
String n = BankDetails.getNameByNo("SELECT uname FROM accdetails WHERE accno = "+daccno);
String bal_sql_1 = "SELECT balance FROM txdetails WHERE uname='"+n+"' AND acc_no = "+daccno+";
int bal_2 = BankDetails.getBalance(bal_sql_1);

int bal1=0;

if(bal < amt ){
	System.out.println("Current Balance : "+bal);
	response.sendRedirect("lowBal.jsp");
}else if(bal == 0){
	response.sendRedirect("noBal.jsp");
}else {
	bal1 = bal - amt;
	String sql_up = "UPDATE txdetails  SET bal=ball WHERE uname='"+uname+"' AND accno = "+accno+" ;
	int up = BankDetails.update(sql_up);
	}

%>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8>
<title>Online Bank.</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
</head>

<body>
<td width="160" >
<div id="ddblueblockmenu"
    <li><a href="get-balance.jsp">Check Balance</a></li>
	  </ul>
</div>

    <td colspan="2" style="padding:20px;line-height:20px;">
	<div class="box1">
	<marquee><h2><font color="#FF0000">Online Banking.</font></h2></marquee>
	</div>
	<br/>
	</table>
</body>

</html>
