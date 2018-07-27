<%@ page language="java" import="java.util.*" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE HTML>
<html>
  	<head>
		<title>用户注册</title>
    	<style> 

    	</style>
	</head>  
	<body>  
        <form action="register2.jsp?" method="post">  
        <input type="hidden" name="stuid" value="12345" />  
        <p><label>同学名: </label><input type="text" id="txt1" name="name" size=18/> </p> 
    	<p><label>密码: </label><input type="password" name="password" size=24/></p>
        <p><label>校区: </label>   
            南校区<input type="radio" name="campus" value="south"/>  
            东校区<input type="radio" name="campus" value="east"/> 
            北校区<input type="radio" name="campus" value="north"/>     
            珠海校区<input type="radio" name="campus" value="zhuhai"/>
            深圳校区<input type="radio" name="campus" value="shenzhen"/>
		</p>
        <p><label>年级: </label><select name="grade">  
        			<option value="freshman">大学一年级</option>  
                    <option value="sophomore">大学二年级</option>  
                    <option value="junior">大学三年级</option>  
                    <option value="senior">大学四年级</option>  
        </select></p>    
        <p><label>社团: </label>
        	舞蹈队<input type="checkbox" name="club" value="dance"/>  
        	摄影<input type="checkbox" name="club" value="photo"/>  
			篮球<input type="checkbox" name="club" value="basketball"/>
       	</p>  
        <p>
        	<label style="vertical-align: top">说明: </label>
		  	<textarea rows="10" cols="40" name="explain"></textarea>
       	</p>
        <p>
        	<input type="submit" name="submit1" value="保存" />  
        	<input type="submit" name="submit2" value="退出" /><br>  
        </p>
        </form>  
    </body>  
</html>  