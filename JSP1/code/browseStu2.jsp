﻿<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<%
	String msg ="";
	Integer pgno = 0; //当前页号
	Integer pgcnt = 4; //每页行数
	String param = request.getParameter("pgno");
	if(param != null && !param.isEmpty()){
		pgno = Integer.parseInt(param);
	}
	param = request.getParameter("pgcnt");
	if(param != null && !param.isEmpty()){
		pgcnt = Integer.parseInt(param);
	}
	request.setCharacterEncoding("utf-8");
	int pgprev = (pgno>0)?pgno-1:0;
	int pgnext = pgno+1;
	String connectString = "jdbc:mysql:// 172.18.187.230:53306/teaching"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 
    StringBuilder table=new StringBuilder("");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(connectString,"user", "123");
		Statement stmt=con.createStatement();
		String sql=String.format("select * from stu limit %d,%d",pgno*pgcnt,pgcnt);
		ResultSet rs=stmt.executeQuery(sql);
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
<title>浏览学生名单</title>  
</head>  
<body>  
    <div class="container">  
        <h1>浏览学生名单</h1>    
        <%=table%><br><br>
        <div style="float:left">
			<a href="addStu.jsp">新增</a>
		</div>
		<div style="float:right">
			<a href="browseStu2.jsp?pgno=<%=pgprev%>&pgcnt=<%=pgcnt%>">上一页</a>
			<a href="browseStu2.jsp?pgno=<%=pgnext%>&pgcnt=<%=pgcnt%>">下一页</a>
		</div>
		<br><br>
		<%=msg%><br><br>
  	</div>    
</body>  
</html>  
