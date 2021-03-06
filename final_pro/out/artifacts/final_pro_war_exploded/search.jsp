<%--
  Created by IntelliJ IDEA.
  User: Chonor
  Date: 2017/12/11
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String user_id = (String)session.getAttribute("user_id");//用户id
    String Name[]={"1","2","3","4","5"};//存放电影名
    String Info[]={"1","2","3","4","5"};//存放电影信息
    String Score[]={"9","9.5","6","7.5","8.5"};//存放分数
    String Img_src[]={"","","","",""};//图片路径
    Integer Like[]={0,1,0,1,0};// 1是满心
    Integer List_size=5; //搜到的数目 >5  就=5 因为只有5条
    String background_src="";//背景暂时为空
    String Login="Login";//登陆后的名字获取 id->名字 然后把这个改了
    String Search_info;//搜索内容
    String Search_resule="结果如下";//搜索结果

    //搜索内容
    Search_info=request.getParameter("context");
    if(Search_info==null)Search_info="";
    //选择的排序方式
    /**
     * unselect 没有选
     * date 最新
     * hot 最热
     * score 评分最高
     * max 评论最多
     */
    String Chooes = request.getParameter("sort"); //排序方式
    if(Chooes==null) Chooes="unselect";
    String Chooess[]={"","","","",""};
    if(Chooes.equals("unselect")) Chooess[0]="selected";
    else Chooess[0]="";
    if(Chooes.equals("date")) Chooess[1]="selected";
    else Chooess[1]="";
    if(Chooes.equals("hot")) Chooess[2]="selected";
    else Chooess[2]="";
    if(Chooes.equals("score")) Chooess[3]="selected";
    else Chooess[3]="";
    if(Chooes.equals("max")) Chooess[4]="selected";
    else Chooess[4]="";

    Integer pgno = 0; //当前页号
    String param = request.getParameter("pgno");
    if(param != null && !param.isEmpty()){
        pgno = Integer.parseInt(param);
    }
    int pgprev = (pgno>0)?pgno-1:0;
    int pgnext = pgno+1;
%>


<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="css/search_.css" />
    <title>Search</title>

    <style>
    </style>
</head>

<body onLoad="onstart()">
<div id="bk_outer">
    <img src="" id="main_bk">
</div>

<div id="header_outer">
    <div id="header" class="wrapper">
        <p>网站名字啊</p>
        <a href="#"><i class="fa fa-user-circle-o"></i><%=Login%></a>
    </div><!--header-->
</div> <!--header_outer-->

<div id="nav_outer">
    <div id="nav_in" class="wrapper">
        <div id="logo"><a href="index.jsp"></a></div>
        <div id="main_nav">
            <ul id="nav">
                <li><a href="#">电影</a>
                    <ul class="subnav">
                        <li><a href="#">精选</a></li>
                        <li><a href="#">即将上映</a></li>
                        <li><a href="#">上映中</a></li>
                        <li><a href="#">..加东西</a></li>
                    </ul>
                </li>
                <li><a href="#">电视</a>
                    <ul class="subnav">
                        <li><a href="#">精选</a></li>
                        <li><a href="#">即将上映</a></li>
                        <li><a href="#">上映中</a></li>
                        <li><a href="#">..加东西</a></li>
                    </ul>
                </li>
                <li><a href="#">热评影视剧</a></li>
                <li><a href="#">发现</a></li>
            </ul>
        </div>
        <div id="serach">
            <form  action="search" method="get">
                <input type="text"  name="content" id="content" autocomplete="off" value="<%= Search_info%>">
                <input type="submit" id="submit" name="submit" value="">
                <i class="fa fa-search fa-1x"></i>
            </form>
        </div>
    </div>
</div>


<div id="search_outer">
    <div id="search_contain">
        <form action="search.jsp" method="get" id="serach_form">
            <input type="text"  name="context" id="search1" value="<%=Search_info%>">
            <input type="submit" id="submit1"  name="submit" value="搜索">
            <select id="sort" name="sort">
                <option value="unselect" <%=Chooess[0]%>>请选择</option>
                <option value="date" <%=Chooess[1]%>>最新</option>
                <option value="hot" <%=Chooess[2]%>>最热</option>
                <option value="score" <%=Chooess[3]%>>评分最高</option>
                <option value="max" <%=Chooess[4]%>>评论最多</option>
            </select>
        </form>
        <p id="search_result"><%=Search_resule%></p>
    </div>

</div>
<div id="searched_outer">
    <div id="searched">
        <ul id="searched_list">
            <li name="search_li">
                <img src="<%=Img_src[0]%>" class="search_img">
                <p class="search_name"><%=Name[0]%></p>
                <p class="search_info"><%=Info[0]%></p>
                <p class="search_score"><%=Score[0]%></p>
                <hr class="search_hr">
                <i class="fa fa-heart-o" id="like1" onclick="onmouseclick(1)"></i>

            </li>
            <li name="search_li">
                <img src="<%=Img_src[1]%>" class="search_img">
                <p class="search_name"><%=Name[1]%></p>
                <p class="search_info"><%=Info[1]%></p>
                <p class="search_score"><%=Score[1]%></p>
                <hr class="search_hr" >
                <i class="fa fa-heart-o" id="like2" onclick="onmouseclick(2)"></i>
            </li>
            <li name="search_li">
                <img src="<%=Img_src[2]%>" class="search_img">
                <p class="search_name"><%=Name[2]%></p>
                <p class="search_info"><%=Info[2]%></p>
                <p class="search_score"><%=Score[2]%></p>
                <hr class="search_hr">
                <i class="fa fa-heart-o" id="like3" onclick="onmouseclick(3)"></i>
            </li>
            <li name="search_li">
                <img src="<%=Img_src[3]%>" class="search_img">
                <p class="search_name"><%=Name[3]%></p>
                <p class="search_info"><%=Info[3]%></p>
                <p class="search_score"><%=Score[3]%></p>
                <hr class="search_hr">
                <i class="fa fa-heart-o" id="like4" onclick="onmouseclick(4)"></i>
            </li>
            <li name="search_li">
                <img src="<%=Img_src[4]%>" class="search_img">
                <p class="search_name"><%=Name[4]%></p>
                <p class="search_info"><%=Info[4]%></p>
                <p class="search_score"><%=Score[4]%></p>
                <hr class="search_hr">
                <i class="fa fa-heart-o" id="like5" onclick="onmouseclick(5)"></i>
            </li>
        </ul>
        <a href="search.jsp?pgno=<%=pgprev%>&context=<%=Search_info%>&submit=搜索&sort=<%=Chooes%>" id="pre_page" class="page">上一页</a>
        <a href="search.jsp?pgno=<%=pgnext%>&context=<%=Search_info%>&submit=搜索&sort=<%=Chooes%>" id="next_page"  class="page" >下一页</a>
    </div>
</div>

<div id="footer_outer">
    <div id="footer">

    </div>
</div>
</body>
</html>
<script>
    var like1=<%=Like[0]%>;
    var like2=<%=Like[1]%>;
    var like3=<%=Like[2]%>;
    var like4=<%=Like[3]%>;
    var like5=<%=Like[4]%>;
    var list_size=<%=List_size%>;
    var i_like1=document.getElementById("like1");
    var i_like2=document.getElementById("like2");
    var i_like3=document.getElementById("like3");
    var i_like4=document.getElementById("like4");
    var i_like5=document.getElementById("like5");
    function onstart(){

        if(like1==1)i_like1.className="fa fa-heart";
        else i_like1.className="fa fa-heart-o";

        if(like2==1)i_like2.className="fa fa-heart";
        else i_like2.className="fa fa-heart-o";

        if(like3==1)i_like3.className="fa fa-heart";
        else i_like3.className="fa fa-heart-o";

        if(like4==1)i_like4.className="fa fa-heart";
        else i_like4.className="fa fa-heart-o";

        if(like5==1)i_like5.className="fa fa-heart";
        else i_like5.className="fa fa-heart-o";

        display_li();
    }
    function display_li(){
        obj = document.getElementsByName("search_li");
        for(var i=list_size;i<obj.length;i++){
            obj[i].style.display="none";
        }
    }
    function onmouseclick(i){
        if(i==1){
            if(like1==1){
                like1=0;
                i_like1.className="fa fa-heart-o";
                <%Like[0]=0;%>
            }
            else{
                like1=1;
                i_like1.className="fa fa-heart";
                <%Like[0]=1;%>
            }
        }
        else if(i==2){
            if(like2==1){
                like2=0;
                i_like2.className="fa fa-heart-o";
                <%Like[1]=0;%>
            }
            else{
                like2=1;
                i_like2.className="fa fa-heart";
                <%Like[1]=1;%>
            }
        }
        else if(i==3){
            if(like3==1){
                like3=0;
                i_like3.className="fa fa-heart-o";
                <%Like[2]=0;%>
            }
            else{
                like3=1;
                i_like3.className="fa fa-heart";
                <%Like[2]=1;%>
            }
        }
        else if(i==4){
            if(like4==1){
                like4=0;
                i_like4.className="fa fa-heart-o";
                <%Like[3]=0;%>
            }
            else{
                like4=1;
                i_like4.className="fa fa-heart";
                <%Like[3]=1;%>
            }
        }
        else if(i==5){
            if(like5==1){
                like5=0;
                i_like5.className="fa fa-heart-o";
                <%Like[4]=0;%>
            }
            else{
                like5=1;
                i_like5.className="fa fa-heart";
                <%Like[4]=1;%>
            }
        }
    }
</script>
