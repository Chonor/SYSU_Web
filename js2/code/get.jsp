<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<%
	request.setCharacterEncoding("utf-8");
	String msg ="";
	String info="";
	String id=request.getParameter("id");
	String connectString = "jdbc:mysql://172.18.187.231:53306/teaching"
			+ "?autoReconnect=true&useUnicode=true"
			+ "&characterEncoding=UTF-8";
	if(id!=null) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(connectString, "user", "123");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from stu where id= '" + id+"'");
			if (rs.next()) {
				info+="id:"+rs.getString("id")+"<br>\n";
				info+="num:"+rs.getString("num")+"<br>\n";
				info+="name:"+rs.getString("name")+"<br>\n";
			}
			else info="null";
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			msg = e.getMessage();
		}
	}
	else info="null";
%>
<%=info%>
