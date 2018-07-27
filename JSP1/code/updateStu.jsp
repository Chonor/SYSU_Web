<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>

<%
	request.setCharacterEncoding("utf-8");
	String msg ="";
	String connectString = "jdbc:mysql:// 172.18.187.230:53306/teaching"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 
    String id=request.getParameter("pid");
	String num="";
	String name="";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(connectString, "user", "123");
	Statement stmt = con.createStatement();
	if(request.getMethod().equalsIgnoreCase("post")){
		num = request.getParameter("num");
		name = request.getParameter("name");
		try{
			String fmt="update stu set num='%s',name='%s' where id='%s'";
			String sql = String.format(fmt,request.getParameter("num"),request.getParameter("name"),id);
			int cnt = stmt.executeUpdate(sql);
			if(cnt>0)msg = "Update Success!";
			stmt.close(); 
			con.close();
		}catch(Exception e){
			msg = e.getMessage();
		}
	}else{
		try{
			String fmt="select * from stu where id='%s'";
			String sql = String.format(fmt,id);
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){
				num=rs.getString("num");
				name=rs.getString("name");
			}
			if(num.equals("")&&name.equals(""))msg = "The user does not exist!";
		}catch(Exception e){
			msg = e.getMessage();
		}
	}
%>
<!DOCTYPE HTML>

<html>
<meta charset="utf-8">
<head>
	<title>修改学生记录</title>
	<style>
		a:link,a:visited {color:blue}
		.container{ margin:0 auto; width:500px; text-align:center; }  
  </style>  
</head>
<body>
	<div class="container">
		<h1>修改学生记录</h1>
		<form action="updateStu.jsp?pid=<%=id%>" method="post">
			学号:<input id="num" name="num" type="text" value="<%=num%>" ><br><br>
			姓名:<input id="name" type="text" name="name" value="<%=name%>"><br><br>
			<input type="submit" name="sub" value="修改">
			<input type="reset" name="rset" value="清空"><br><br>
		</form>
		<%=msg%>
		<br><br>
		<a href="browseStu2.jsp">返回</a>
	</div>
</body>
</html>
