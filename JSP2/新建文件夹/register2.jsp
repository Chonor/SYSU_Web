<%@ page language="java" import="java.util.*" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>用户注册输入显示</title>
  </head>  
  <body>      
    <p>id： <%= request.getParameter("id") %></p>    
    <p>同学名： <%= request.getParameter("name") %></p>    
    <p>密码： <%= request.getParameter("password") %></p>    
    <p>校区： <%= request.getParameter("campus") %></p>      
    <p>社团： <%   
      out.print("[");  
      String[] values=null;  
      if(request.getMethod().equalsIgnoreCase("post"))  
        values = request.getParameterValues("club");  
      if(values != null){
		out.print(values[0]);  
		for(int i = 1; i < values.length ; i++)  
		out.print("," + values[i]);
	  }	
      out.println("]");  
    %></p>    
    <p>年级： <%= request.getParameter("grade") %></p>    
    <p>说明： <%= request.getParameter("explain") %></p>    
    <p>submit1： <%= request.getParameter("submit1") %></p>   
    <p>submit2： <%= request.getParameter("submit2") %></p>  
  </body>  
</html>