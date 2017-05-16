function selectAll() {
 var selectName = document.getElementById("selectName");
 var checkboxs=document.getElementsByName("delId");
 if(selectName.checked){ 
	 for (var i=0; i < checkboxs.length; i++) {
	  var e = checkboxs[i];
	  e.checked = true;
	 }
 }else{
 for (var i=0; i < checkboxs.length; i++) {
	  var e = checkboxs[i];
	  e.checked = false;
	 }
	 }
}
function audit(type,ids,sign){
var checkboxs=document.getElementsByName("delId");
 var uuids = "";
 var flag = false;
 if("666" == ids){
 	for (var i=0; i < checkboxs.length; i++) {
  var e = checkboxs[i];
  if(e.checked){
  	var checkstate = document.getElementById("check"+e.value).innerHTML;
  	 if("4" == type){
	  	if(checkstate.indexOf("待审核") < 0){alert("只能对待审核状态，进行操作！");return;}
	  }else{
	  	return false;
	  }
   uuids += e.value + ",";
   flag = true;
  }
 }
 }else{
 	var checkstate = document.getElementById("check"+ids).innerHTML;
  	if("4" == type){
	  	if(checkstate.indexOf("待审核") < 0){alert("只能对待审核状态，进行操作！");return;}
	  }else{
	  	return false;
	  }
   uuids += ids + ",";
   flag = true;
 }
 
 var screenHeight = screen.height;
 var screenWidth = screen.width;
 var left = (screenWidth - 200) / 2;
 var top = (screenHeight - 400) / 2;
 if(flag){
 	if("666" == ids){
	   		uuids = uuids.substring(0,uuids.length -1);
	   }else{
	   		uuids = uuids;
	   }
 	if("4" == type){	
 	   if("1" == sign){
 	   window.open('/pages/manager/school.jsp?uuids='+uuids,'aa','width=600px,height=500px,left=' + left + ',top=' + top+ ',resize=0');
	   window.location.href="/Manager/listCommQuery?sign=1";
 	   }
 	  if("3" == sign){
 	  window.open('/pages/manager/coach.jsp?uuids='+uuids,'aa','width=600px,height=500px,left=' + left + ',top=' + top+ ',resize=0');
	  window.location.href="/Manager/listCommQuery?sign=3";
 	   }
 	   if("4" == sign){
 	   window.open('/pages/manager/judge.jsp?uuids='+uuids,'aa','width=600px,height=500px,left=' + left + ',top=' + top+ ',resize=0');
	   window.location.href="/Manager/listCommQuery?sign=4";
 	   }
 	   if("5" == sign){
 	    window.open('/pages/manager/stuMove.jsp?uuids='+uuids,'aa','width=500px,height=400px,left=' + left + ',top=' + top+ ',resize=0');
		window.location.href="/Manager/listCommQuery?sign=5";
 	   }
	  if("6" == sign){
 	   window.open('/pages/manager/coachMove.jsp?uuids='+uuids,'aa','width=600px,height=500px,left=' + left + ',top=' + top+ ',resize=0');
	   window.location.href="/Manager/listCommQuery?sign=6";
 	   }
 	   if("7" == sign){
 	   window.open('/pages/manager/member.jsp?uuids='+uuids,'aa','width=600px,height=500px,left=' + left + ',top=' + top+ ',resize=0');
	   window.location.href="/Manager/listCommQuery?sign=7";
 	   }
 	  
	}else{
		 return false;
	}
 }
	
}
function published(type,ids,sign){
	
var checkboxs=document.getElementsByName("delId");
 var uuids = "";
 var flag = false;
 if("666" == ids){
 	for (var i=0; i < checkboxs.length; i++) {
  var e = checkboxs[i];
  if(e.checked){
  	var checkstate = document.getElementById("check"+e.value).innerHTML;
  	if("2" == type){
	  	if(checkstate.indexOf("待审核") < 0){alert("只能对待审核状态，进行审核！");return;}
	  }else if("3" == type){
	  	if(checkstate.indexOf("待审核") > 0){alert("待审核状态，不可进行取消审核操作，谢谢！");return;}
	  }else{
	  }
   uuids += e.value + ",";
   flag = true;
  }
 }
if("1" == type){
	  	if(window.confirm("你确定要删除吗?")){
	  	}else{
	  		return false;
	  	}
	  }
 }else{
  
  	var checkstate = document.getElementById("check"+ids).innerHTML;
  	if("2" == type){
	  	if(checkstate.indexOf("待审核") < 0){alert("只能对待审核状态，进行审核！");return;}
	  }else if("3" == type){
	  	if(checkstate.indexOf("待审核") > 0){alert("待审核状态，不可进行取消审核操作，谢谢！");return;}
	  }else if("1" == type){
	  	if(window.confirm("你确定要删除吗?")){
	  	}else{
	  		return false;
	  	}
	  }else if("8" == type){
	    if(checkstate.indexOf("待审核") < 0&&checkstate.indexOf("审核未通过") < 0){
	    alert("只能对待审核和审核未通过状态，进行修改！");
	    return;
	    }else{
	    window.location.href="/Manager/modifyComm.action?delID="+ids+"&sign="+sign;
	    return;
	    }
	  }else{
	  	return false;
	  }
  
 	uuids +=ids + ",";
 	flag = true;
  
 }
 
	if(flag){
	   if("666" == ids){
	   		uuids = uuids.substring(0,uuids.length -1);
	   }else{
	   		uuids = uuids;
	   }
		$.ajax({
		type : "post",
		dataType : "text",
		url : "/Manager/updataComm.action",
		data : {
		    uuids : uuids,
			sign :  sign,
			flag : type
		},
		success : function(data) {
		
				if("2" == type){
					alert("审核成功!");
					window.location.href="/Manager/listCommQuery?sign="+sign;
				}else if("3" == type){
					alert("取消审核成功");
					window.location.href="/Manager/listCommQuery?sign="+sign;
				}else if("1" == type){
					alert("删除成功！");
					window.location.href="/Manager/listCommQuery?sign="+sign;
				}else{
					  alert("请选择需要操作的记录！");return;
				}
	},
	error : function() {
	}
	});
	}else{
		alert("请选择需要操作的记录！");return;
	}
}
function showqueryiframe123(flag){
	if(flag == 1){
		document.getElementById("showqueryiframe123").style.display = "none";
		document.getElementById("showqueryiframe").innerHTML = "<label onclick='showqueryiframe123(0)' style='cursor:pointer'>（展开） 查询窗口</label>";
	}else{
		document.getElementById("showqueryiframe123").style.display = "block";
		document.getElementById("showqueryiframe").innerHTML = "<label onclick='showqueryiframe123(1)' style='cursor:pointer'>（收起） 查询窗口</label>";
	}
}
function checkImage(msg,parm){
	// var objButton=document.getElementById("Button1");//上传按钮
     var objFileUpload=document.getElementById(msg);//FileUpload
     var objMSG=document.getElementById(parm);//显示提示信息用的DIV
     var FileName=new String(objFileUpload.value);//文件名
     
     var extension=new String (FileName.substring(FileName.lastIndexOf(".")+1,FileName.length));//文件扩展名
      
     if(extension=="jpg"||extension=="JPG"||extension=="jpeg"||extension=="JPEG"||extension=="BMP"||extension=="bmp")//你可以添加扩展名
     {
         // objButton.disabled=false;//启用上传按钮
          objMSG.innerHTML="";
		  document.getElementById('isVal').value="1";
     }
     else
     {
         //  objButton.disabled=true;//禁用上传按钮
           objMSG.innerHTML="你上传的格式不正确，请上传格式为.jpg,.jpeg,.bmp格式的图片";
		   document.getElementById('isVal').value="0";
		   return false;
      }
}



function closeExamine(type,ids,sign){
	var checkstate = document.getElementById("check"+ids).innerHTML;
	if(checkstate.indexOf("已审核通过") > 0){alert("审核状态，不可进行取消审核操作，谢谢！");return;}
	$.ajax({
		type : "post",
		dataType : "text",
		url : "/Manager/updataComm.action",
		data : {
		    uuids : ids,
			sign :  sign,
			flag : type
		},
		success : function(data) {
		
		
					alert("取消审核成功");
					window.location.href="/Manager/listCommQuery?sign="+sign;
				
	},
	error : function() {
	}
	});
}