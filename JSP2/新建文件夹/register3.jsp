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
      
    String id = request.getParameter("id");  
    if(id==null) id="";  
      
    String password = request.getParameter("password");  
    if(password==null) password="";  
    //校区
    String campus = request.getParameter("campus");
	String campuss[]= {"","","","",""}; 
	campuss[0] = campus.equals("south")?"checked":"";  
	campuss[1] = campus.equals("east")? "checked":"";  
	campuss[2] = campus.equals("north")? "checked":"";  
	campuss[3] = campus.equals("zhuhai")? "checked":"";  
	campuss[4] = campus.equals("shenzhen")? "checked":""; 

	String grade = request.getParameter("grade");  
    //年级 
	if(grade == null) grade=""; 
	String grades[]= {"","","",""};
	grades[0] = grade.equals("freshman")? "selected":"";  
	grades[1] = grade.equals("sophomore")? "selected":"";  
	grades[2] = grade.equals("junior")? "selected":"";  
	grades[3] = grade.equals("senior")? "selected":""; 
	//社团  
    String values[]=null; 
	String clubs[] = {"","",""};
    values = request.getParameterValues("club");  
	if(values != null){
		if(values[0].equals("dance"))clubs[0]="checked";
		else if(values[0].equals("photo"))clubs[1]="checked";
		else if(values[0].equals("basketball"))clubs[2]="checked";
		if(values.length==2 && values[1].equals("photo"))clubs[1]="checked";
		else if(values.length==2 && values[1].equals("basketball"))clubs[2]="checked";
		if(values.length==3 && values[2].equals("basketball"))clubs[2]="checked";
	}
			
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
        <form action="register3.jsp" method="post">  
        <input type="hidden" name="id" value="<%=id%>" />  
        <p><label>同学名: </label><input type="text" name="name" value="<%=name + "*"%>" size=18/> </p> 
    	<p><label>密码: </label><input type="password" name="password" value="<%=password%>" size=24/></p>
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
		  	<textarea rows="10" cols="35" name="explain" ><%=explain + "*"%></textarea>
       	</p>
        <p>
        	<input type="submit" name="submit1" value="保存" />  
        	<input type="submit" name="submit2" value="退出" />  
        </p>
        </form>  
    </body>  
</html>  