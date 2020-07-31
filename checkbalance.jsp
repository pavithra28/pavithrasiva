<%@ page contentType="text/html; charset=iso-"UTF-8" language="java" import="java.sql.*,java.util.*,com.onlinebank.BankCommons" errorPage="" %>
<%


String uname = (String)session.getAttribute("cust_name");
String sql = "SELECT acc_no, acctype FROM accdetails WHERE uname='"+uname+"'";
ArrayList one = BankDetails.getAccountByName(sql);
int size = one.size();
if(size < 1) {
	response.sendRedirect("noAcc.jsp");
}
%>

<html>
<head>
<title>Online Bank</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<body>
	<li><a href="transfer.jsp">Trasnsfer Amount</a></li>
	


    <td colspan="2" style="padding:20px;line-height:20px;">
	<div class="box1">
	<marquee><h2><font color="#FF0000">Online Bank.</font></h2></marquee>
	</div>
	<br/>
	  <table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
       
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right"><strong>Account Holder Name </strong></div></td>
          <td>:</td>
          <td>&nbsp;<%= uname %></td>
        </tr>
        <tr>
          <td width="43%"><div align="right"><strong>Select Account No.</strong></div></td>
          <td width="2%">:</td>
          <td width="55%"><select name="accNo">
              <%
			for(int i=0; i<size; i++){
			ArrayList o = (ArrayList)one.get(i);
			%>
              <option value="<%=(String)o.get(0)%>" ><%=(String)o.get(0)%> ::<%=(String)o.get(1)%></option>
              <% } %>
            </select>          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><label>
          <input type="submit" name="Submit" value="Check Balance" />
          </label></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
      </form>
	</td>
  </tr>
  <tr style="height:30px;">
    <td colspan="3" style="background-color:#2175bc;">&nbsp;</td>
  </tr>
</table>
</body>

</html>
