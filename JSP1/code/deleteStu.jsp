<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<%
	request.setCharacterEncoding("utf-8");
	String msg ="";
	String connectString = "jdbc:mysql:// 172.18.187.230:53306/teaching"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(connectString, "user", "123");
	Statement stmt = con.createStatement();
	try{
		String fmt="delete from stu where id='%s'";
		String sql = String.format(fmt,request.getParameter("pid"));
		int cnt = stmt.executeUpdate(sql);
		if(cnt>0)msg = "Delete Success!";
		else msg = "Delete Failure!";
		stmt.close(); 
		con.close();
	}catch(Exception e){
		msg = e.getMessage();
	}

%>
<!DOCTYPE HTML>
<html>
<meta charset="utf-8">
<head>
	<title>删除学生记录</title>
	<style>
		a:link,a:visited {color:blue}
		.container{ margin:0 auto; width:500px; text-align:center; }  
  </style>  
</head>
<body>
	<div class="container">
		<h1>删除学生记录</h1>
		<%=msg%>
		<br><br>
		<a href="browseStu2.jsp">返回</a>
	</div>
</body>
</html>
