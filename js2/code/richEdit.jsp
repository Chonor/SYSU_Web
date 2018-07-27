<%@ page language="java" import="java.util.*,java.io.*"
         contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html><head><title>Rich Text Editing</title></head>
<body>
<div id="cs" name="edit" style="height:200px;width:400px;border:solid 1px black" contenteditable="true">
</div><br>
<input type="button" value="斜体" onclick="italic()">
<input type="button" value="颜色" onclick="color()">
<input type="button" value="字号" onclick="textsize()">
<input type="button" value="图像" onclick="imgs()">
<input type="button" value="链接" onclick="srcs()">
<input type="button" value="撤销" onclick="clears()">
<input type="button" value="代码" onclick="show()">
<script>
    function italic() {
        document.execCommand("italic",false,null);
    }
    function color() {
        document.execCommand("forecolor",false,"red");
    }
    function textsize() {
        document.execCommand("fontsize",false,7);
    }
    function imgs() {
        document.execCommand("insertimage",false,"images/home.gif");
    }
    function srcs() {
        document.execCommand("createlink",false,"http://www.sysu.edu.cn");
    }
    function clears() {
        var unuse = document.execCommand('undo');;
    }
    function show() {
        var cs=document.getElementById("cs");
        alert(cs.innerHTML);
    }
</script>
</body>
</html>