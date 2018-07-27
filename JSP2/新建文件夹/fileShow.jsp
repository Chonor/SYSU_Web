<%@pagelanguage="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<!DOCTYPEHTML>
<html>
<head>
    <title>文件上传</title>
</head>
<body>
    <form name="fileUpload" action="fileUpload.jsp" method="POST" enctype="multipart/form-data">
        <p>id：<input type="text" name="id" size=24 ></p>
        <p>文件名：<input type="file" name="file1" size=48 ></p>
        <p><input type=submit name="submit" value="OK"></p>
    </form>
</body>
</html>
