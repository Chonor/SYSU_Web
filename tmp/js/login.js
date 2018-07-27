  var code;
    function createCode(){
        code = "";
        var codeLength = 4;
        var codeV = document.getElementById("code");
        var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 'S','T','U','V','W','X','Y','Z');
        for(var i = 0; i < codeLength; i++){
             var index = Math.floor(Math.random()*36);
             code += random[index]; 
        }
        codeV.value = code;
    }
    function validate(){
        var oValue = document.getElementById("checkcode").value.toUpperCase();
        if(oValue ==0){
            document.getElementById("checkicon").className="fa fa-close"
        }else if(oValue != code){
             document.getElementById("checkicon").className="fa fa-close"
            oValue = "";
            createCode();
        }else{
             document.getElementById("checkicon").className="fa fa-check"
        }
		document.getElementById("checkicon").style.visibility="visible";
    }// JavaScript Document
function inputworry(){
			obj=document.getElementById("user");
			obj.style.background="red";
			obj.placeholder="用户名与密码不匹配";
			obj.value="";
	obj=document.getElementById("password");
			obj.style.background="red";
			obj.placeholder="用户名与密码不匹配";
	obj.value="";
		}
		function inputin(i){
			if(i==1){			
				obj=document.getElementById("user");
				obj.style.background="rgba(255,255,255,0.80)";
				obj.placeholder="用户名";
				if(obj.placeholder=="用户名与密码不匹配")obj.value="";
			}
			else{
				obj=document.getElementById("password");
				obj.style.background="rgba(255,255,255,0.80)";
				obj.placeholder="密码";
				if(obj.placeholder=="用户名与密码不匹配")obj.value="";
			}
		}