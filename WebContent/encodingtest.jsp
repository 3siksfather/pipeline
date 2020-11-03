<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
        
    String first = null ;
    String word = null;
    
    if ( request.getParameter("data") != null )
    {
    first = request.getParameter("data");
    word = first;
     
    System.out.println("utf-8 -> euc-kr        : " + new String(word.getBytes("utf-8"), "euc-kr"));
    System.out.println("utf-8 -> ksc5601       : " + new String(word.getBytes("utf-8"), "ksc5601"));
    System.out.println("utf-8 -> x-windows-949 : " + new String(word.getBytes("utf-8"), "x-windows-949"));
    System.out.println("utf-8 -> iso-8859-1    : " + new String(word.getBytes("utf-8"), "iso-8859-1"));
    System.out.println("iso-8859-1 -> euc-kr        : " + new String(word.getBytes("iso-8859-1"), "euc-kr"));
    System.out.println("iso-8859-1 -> ksc5601       : " + new String(word.getBytes("iso-8859-1"), "ksc5601"));
    System.out.println("iso-8859-1 -> x-windows-949 : " + new String(word.getBytes("iso-8859-1"), "x-windows-949"));
    System.out.println("iso-8859-1 -> utf-8         : " + new String(word.getBytes("iso-8859-1"), "utf-8"));
    System.out.println("euc-kr -> utf-8         : " + new String(word.getBytes("euc-kr"), "utf-8"));
    System.out.println("euc-kr -> ksc5601       : " + new String(word.getBytes("euc-kr"), "ksc5601"));
    System.out.println("euc-kr -> x-windows-949 : " + new String(word.getBytes("euc-kr"), "x-windows-949"));
    System.out.println("euc-kr -> iso-8859-1    : " + new String(word.getBytes("euc-kr"), "iso-8859-1"));
    System.out.println("ksc5601 -> euc-kr        : " + new String(word.getBytes("ksc5601"), "euc-kr"));
    System.out.println("ksc5601 -> utf-8         : " + new String(word.getBytes("ksc5601"), "utf-8"));
    System.out.println("ksc5601 -> x-windows-949 : " + new String(word.getBytes("ksc5601"), "x-windows-949"));
    System.out.println("ksc5601 -> iso-8859-1    : " + new String(word.getBytes("ksc5601"), "iso-8859-1"));
    System.out.println("x-windows-949 -> euc-kr     : " + new String(word.getBytes("x-windows-949"), "euc-kr"));
    System.out.println("x-windows-949 -> utf-8      : " + new String(word.getBytes("x-windows-949"), "utf-8"));
    System.out.println("x-windows-949 -> ksc5601    : " + new String(word.getBytes("x-windows-949"), "ksc5601"));
    System.out.println("x-windows-949 -> iso-8859-1 : " + new String(word.getBytes("x-windows-949"), "iso-8859-1"));
     
    first = new String(first.getBytes("iso-8859-1"), "utf-8");
    System.out.println("data:" + first); 
    } else first = "NULL";
    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>encoding test result</title>
</head>
<body>
<form name="encoding" action="encodingtest.jsp" method="post">
<table border="1" cellspacing="0" width="500">
  <tr>
    <th width="10%">구분</th><th width="25%">입력값</th>
  </tr>
  <tr>
      <td>input data</td>
      <td><input name="data"></td>
  </tr>
  <tr>
      <td colspan=2><input type="submit" value="OK"></td>     
  </tr>
</table>
<br>
<br>
# Encoding Result
<br>
<%
    if ( first.equals("NULL"))
    {
	  out.println("입력값 : " + first);
    } else 
    {
        out.println("입력값 : " + first);
        out.println("<br><br>");
%>
    	<table border="1" cellspacing="0" width="800">
    	  <tr>
    	    <th width="10%">구분</th><th width="25%">결과값</th>
    	  </tr>
    	  <tr>
    	      <td>utf-8 -> euc-kr</td>
    	      <td>
    	      <%
    	        out.println(new String(word.getBytes("utf-8"), "euc-kr"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>utf-8 -> ksc5601</td>
    	      <td>
    	      <%
    	        out.println(new String(word.getBytes("utf-8"), "ksc5601"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>utf-8 -> x-windows-949</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("utf-8"), "x-windows-949"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>utf-8 -> iso-8859-1</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("utf-8"), "iso-8859-1"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>iso-8859-1 -> euc-kr</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("iso-8859-1"), "euc-kr"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>iso-8859-1 -> ksc5601</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("iso-8859-1"), "ksc5601"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>iso-8859-1 -> x-windows-949</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("iso-8859-1"), "x-windows-949"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>iso-8859-1 -> utf-8</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("iso-8859-1"), "utf-8"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>euc-kr -> utf-8</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("euc-kr"),"utf-8"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>euc-kr -> ksc5601</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("euc-kr"), "ksc5601"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>euc-kr -> x-windows-949</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("euc-kr"), "x-windows-949"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>euc-kr -> iso-8859-1</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("euc-kr"), "iso-8859-1"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>ksc5601 -> euc-kr</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("ksc5601"), "euc-kr"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>ksc5601 -> utf-8</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("ksc5601"), "utf-8"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>ksc5601 -> x-windows-949</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("ksc5601"), "x-windows-949"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>ksc5601 -> iso-8859-1</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("ksc5601"), "iso-8859-1"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>x-windows-949 -> utf-8</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("x-windows-949"), "utf-8"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>x-windows-949 -> euc-kr</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("x-windows-949"), "euc-kr"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>x-windows-949 -> ksc5601</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("x-windows-949"),"ksc5601"));
    	      %>
    	      </td>
    	  </tr>
    	  <tr>
    	      <td>x-windows-949 -> iso-8859-1</td>
    	      <td>
    	      <%
    	      out.println(new String(word.getBytes("x-windows-949"), "iso-8859-1"));
    	      %>
    	      </td>
    	  </tr>
    	</table>
<%
    }
%>
</form>
</body>
</html>