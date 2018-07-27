<%@ page language="java" import="java.util.*" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%  
    String submit1 = request.getParameter("submit1");  
    String submit2 = request.getParameter("submit2");  
       
    String method = request.getMethod();  
    boolean post = method.equalsIgnoreCase("post"); 
      
    String name = request.getParameter("name");  
    if(name==null) name="";  
      
    String stuid = request.getParameter("stuid");  
    if(stuid==null) stuid="";  
      
    String password = request.getParameter("password");  
    if(password==null) password="";  
    //校区
    String campus = request.getParameter("campus");  
    if(campus==null) campus="";  
    String campuss[]= {"","","","",""};  
    campus.equals("south")? campuss[0] = "checked":"";  
    campus.equals("east")? campuss[1] = "checked":"";  
    campus.equals("north")? campuss[2] = "checked":"";  
    campus.equals("zhuhai")? campuss[3] = "checked":"";  
    campus.equals("shenzhen")? campuss[4] = "checked":"";  
          
	//年级
    String grade = request.getParameter("grade");  
    if(grade==null) grade="";  
    String grades[]= {"","","",""};  
    grade.equals("freshman")? grades[0] = "selected":"";  
    grade.equals("sophomore"))? grades[1] = "selected":"";  
    grade.equals("junior"))?grades[2] = "selected":"";  
    grade.equals("senior"))?grades[3] = "selected":"";  
          
    //社团 
    String[] values={"","",""};  
    if(request.getMethod().equalsIgnoreCase("post")){  
        values = request.getParameterValues("club");  
        System.out.println(values[0]);  
        System.out.println(values[1]);  
        System.out.println(values[2]);  
        System.out.println(values.length);  
    }  
    String clubs[]= {"","",""};  
        for(int i = 0 ; i < values.length ; i++)  
            clubs[i] = "checked";  
    
    //说明 
    String explain = request.getParameter("explain");  
    if(explain==null) explain="";  
%>
<!DOCTYPE HTML>
<html>
  	<head>
		<title>用户注册</title>
    	<style> 

    	</style>
	</head>  
	<body>  
        <form action="register2.jsp" method="post">  
        <input type="hidden" name="stuid" value="<%=stuid%>" />  
        <p><label>同学名: </label><input type="text" id="txt1" name="<%=name + "*"%>" size=18/> </p> 
    	<p><label>密码: </label><input type="password" name="<%=password%>" size=24/></p>
        <p><label>校区: </label>   
            南校区<input type="radio" name="campus" value="south" <%=campuss[0]%>/>  
            东校区<input type="radio" name="campus" value="east" <%=campuss[1]%>/> 
            北校区<input type="radio" name="campus" value="north" <%=campuss[2]%>/>     
            珠海校区<input type="radio" name="campus" value="zhuhai" <%=campuss[3]%>/>
            深圳校区<input type="radio" name="campus" value="shenzhen" <%=campuss[4]%>/>
		</p>
        <p><label>年级: </label><select name="grade">  
        			<option value="freshman" <%=grades[0]%>>大学一年级</option>  
                    <option value="sophomore" <%=grades[1]%>>大学二年级</option>  
                    <option value="junior" <%=grades[2]%>>大学三年级</option>  
                    <option value="senior" <%=grades[3]%>>大学四年级</option>  
        </select></p>    
        <p><label>社团: </label>
        	舞蹈队<input type="checkbox" name="club" value="dance" <%=clubs[0]%>/>  
        	摄影<input type="checkbox" name="club" value="photo" <%=clubs[1]%>/>  
			篮球<input type="checkbox" name="club" value="basketball" <%=clubs[2]%>/>
       	</p>  
        <p>
        	<label style="vertical-align: top">说明: </label>
		  	<textarea rows="10" cols="40" name="explain" <%=explain + "*"%>></textarea>
       	</p>
        <p>
        	<input type="submit" name="submit1" value="保存" />  
        	<input type="submit" name="submit2" value="退出" /><br>  
        </p>
        </form>  
    </body>  
</html>  