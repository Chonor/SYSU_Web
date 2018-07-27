<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="GB2312"   
contentType="text/html;charset=GB2312"%>  
<% session.setAttribute("course", "移动Web应用设计"+ new Date());%>  
<% String id= session.getId();%>  
<!DOCTYPE  html>  
<html lang="zh-cn">  
<head>  
<title>Session X</title>  
</head>  
<body>  
  <h1>Session X</h1>    
  <p>sessionID:<%=id%></p>  
  <p><a href=Y.jsp>Y.jsp</a></p> 
  <p><a href=Z.jsp>Z.jsp</a></p>   
</body>  
</html>  