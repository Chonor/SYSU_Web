﻿<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<%
	request.setCharacterEncoding("utf-8");
	String msg ="";
	String info = "";
	String connectString = "jdbc:mysql:// 172.18.187.230:53306/teaching"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 
    StringBuilder table=new StringBuilder("");
	if(request.getMethod().equalsIgnoreCase("post")){
		info=request.getParameter("info");
	}
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(connectString,"user", "123");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from stu where num LIKE '%"+info+"%' OR name LIKE '%"+info+"%' ORDER BY num;"); 
		table.append("<table><tr><th>id</th><th>学号</th><th>姓名</th><th>-</th>");  
		while(rs.next()) {  
            table.append(String.format(  
                "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s %s</td></tr>",  
                rs.getString("id"),rs.getString("num"),rs.getString("name"),  
                "<a href='updateStu.jsp?pid="+rs.getString("id")+"'>修改</a>",  
                "<a href='deleteStu.jsp?pid="+rs.getString("id")+"'>删除</a>"  
                )  
            );  
		}  
		table.append("</table>");  
		rs.close();  
		stmt.close();  
		con.close();  
	}
	catch (Exception e){
		msg = e.getMessage();
	}
%><!DOCTYPE HTML>
<html>  
	<style>  
		table{border-collapse: collapse;  border: none; width: 500px;}  
        td,th{border: solid grey 1px; padding: 5px;margin: 0;}  
        .container{ margin:0 auto; width:500px; text-align:center;}
		a:link,a:visited {color:blue}
	</style>  
<head>  
<title>查询学生名单</title>  
</head>  
<body>  
    <div class="container">  
        <h1>查询学生名单</h1>
		<form action="queryStu.jsp" method="post">
			输入查询:<input id="info" name="info" type="text" value="<%=info%>" >
			<input type="submit" name="sub" value="查询">
			<br><br>
		</form>
        <%=table%><br><br>
        <div style="float:left">
			<a href="addStu.jsp">新增</a>
			<a href="browseStu2.jsp">返回</a>
		</div>
		<br><br>
		<%=msg%><br><br>
  	</div>    
</body>   
