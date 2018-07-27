<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8" %>
<%request.setCharacterEncoding("utf-8");
    String msg ="";
    String connectString = "jdbc:mysql://172.18.187.231:53306/teaching"
            + "?autoReconnect=true&useUnicode=true"
            + "&characterEncoding=UTF-8";

    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection(connectString, "user", "123");
    Statement stmt = con.createStatement();
    if(request.getMethod().equalsIgnoreCase("post")){
        String id=request.getParameter("id");
        String name = request.getParameter("name");
        try{
            String fmt="update stu set name='%s' where id='%s'";
            String sql = String.format(fmt,name,id);
            int cnt = stmt.executeUpdate(sql);
            if(cnt>0)msg = "修改成功!";
            else msg="修改失败!";
            stmt.close();
            con.close();
        }catch(Exception e){
            msg="修改失败!";
        }
    }
%>
<%=msg%>



