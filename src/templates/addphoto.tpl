<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/> 
<title>Miniblog--Add Photos</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/form.css" rel="stylesheet" type="text/css" />
<link href="../css/menu_style.css" rel="stylesheet" type="text/css" />
<link href="../js/uploadify/css/uploadify.jGrowl.css"  rel="stylesheet"  type="text/css" />
<link href="../js/uploadify/css/uploadify.css" rel="stylesheet"  type="text/css" />

</head>
<body>

{{include file="header.tpl"}}

<div id="content">
	{{include file="menu.inc"}}
	
 	<div id="formbox">
 			<table>
			<tr>
				<input type="file" name="noimageupload" id="imageupload"></input>
				<div id="ImagefileQueue"></div>
			</tr>
			<tr>
				<td align="left">请选择照片所属相册:</td> 
			</tr>
			<tr>
				<td align="left">
					<select name="category" id="category" style="width:120px">
						 {{html_options options=$category_options selected=$defaultId}} 
					</select>
						<a id=newalbum href=""  onClick="openaddalbum();return false;" >
							新建相册
						</a>
						(请不要在相册名称中包含.  。' " : 等特殊字符！)		
				</td>
				
			</tr>
			<tr id="creating" style="display:none">
				<td>
						<input type="text" id="albuminput" name="albumname"  onfocus="hidCatErr();">
						<input type="submit" onClick="return checkform();" name="addalbum" id="addalbum" value="新建相册"  >
						<a id=newalbum href=""  onClick="cancelCat();return false;" >
							取消
						</a>	
						<div id="error">
						</div>
					</td>
			</tr>
			 <tr >
				<td align="left">请选择要上传的图片，每张大小在3M以内。您可以上传JPG、GIF、BMP和PNG格式的照片。</td> 
			</tr>
			 <tr>
				<td>
					<input id="userId" style="display:none" value="{{$user_id}}"></input>
					<input id="userName" style="display:none" value="{{$user_name}}">
					
					</input>
				</td>
			</tr>
 		</table>
 		 
	</div>
</div>
	

{{include file="footer.html"}}

<script type="text/javascript" src="../js/uploadify/swfobject.js"></script>
<script type="text/javascript" src="../js/uploadify/jquery.uploadify.v2.0.3.min.js"></script>
<script type="text/javascript" src="../js/uploadify/jquery.jgrowl_minimized.js"></script>

<script type="text/javascript">
 $(document).ready(function() {
	var categoryId=$("#category").val();
	var categoryName=$('#category option:selected').text();
	var user_id = $('#userId').val()
	var user_name = $('#userName').val()
	$("#imageupload").uploadify({
		'uploader'       : '../js/uploadify/uploadify.swf',
		'script'         : '../actions/addphoto.action.php',
		'checkScript'	 : '',
		'cancelImg'      : '../images/cancel.png',
		'queueID'        : 'ImagefileQueue',
 		'fileDesc'		 : 'Image Files',
		'fileExt'		 : '*.jpg;*.jpeg;*.gif;*.png',
		'buttonImg'		 : '../images/choose_photo.jpg',
		'width'			 : 320,
		'height'		 : 73,
		'buttonText'     : 'Select Files',
		'displayData'	 : 'percentage',
		'multi'			 : true,
		'auto'			 : true,
		'sizeLimit'		 : 1048576,
		'scriptData'	 : {'categoryId':categoryId,'categoryName':categoryName,'user_id':user_id,'user_name':user_name}, 
		onError: function (event, queueID ,fileObj, errorObj) {
			var msg;
			if (errorObj.type === "HTTP")
				msg = errorObj.type+": "+errorObj.info ;
			else if (errorObj.type ==="IO")
				msg = fileObj.name+'<br>'+errorObj.type+' Limit: '+Math.round(errorObj.sizeLimit/1024)+'KB';
			else
				msg = errorObj.type+": "+errorObj.info ;
			$.jGrowl('<p></p>'+msg, {
				theme: 	'error',
				header: 'ERROR',
				sticky: true
			});			
			$("#fileUploadgrowl" + queueID).fadeOut(250, function() { $("#fileUploadgrowl" + queueID).remove()});
			return false;
		},
		onCancel: function (event, queueID, fileObj, data) {
			var msg = "Cancelled uploading: "+fileObj.name;
			$.jGrowl('<p></p>'+msg, {
				theme: 	'warning',
				header: 'Cancelled Upload',
				life:	4000,
				sticky: false
			});
		},
		onClearQueue: function (event, data) {
			var msg = "Cleared "+data.fileCount+" files from queue";
			$.jGrowl('<p></p>'+msg, {
				theme: 	'warning',
				header: 'Cleared Queue',
				life:	4000,
				sticky: false
			});
		},
		onCheck: function (event,checkScript,queueID, folder, single) {
	 
		},
		onComplete: function (event, queueID ,fileObj, response, data) {		
			var size = Math.round(fileObj.size/1024);
			if(response == '1')
			{
				$.jGrowl('<p></p>'+fileObj.name+' - '+size+'KB', {
						  theme: 	'success',
						  header:   'Upload success',
						  life:	4000,
						  sticky: false
					});
			}
			else{
				$.jGrowl('<p></p>'+fileObj.name+' - '+size+'KB', {
						  theme: 	'fail',
						  header: 'Upload Failed',
						  life:	4000,
						  sticky: false
					});
			}
		}
	});
	$('#category').bind('change', function(){
 		$('#imageupload').uploadifySettings('scriptData',{'categoryId' : $(this).val(),'categoryName' : $('#category :selected').text()});
	});
}); 
 /* 以下用于创建新相册 */
 function G(element){
       if(typeof element=='string')
               element=document.getElementById(element);
        return element;
}
function bytes(str){
	if(typeof(str)!='string'){
		str = str.value;
	}
	var len = 0;
	for(var i = 0; i < str.length; i++){
		if(str.charCodeAt(i) > 127){
			len++;
		}
		len++;
	}
	return len;
} 
 function openaddalbum()
 {
 	G("newalbum").style.display="none";
 	G("creating").style.display="";
 	return false;
 }

// 判断特殊字符
 function checkpoint(id)
{
	var str=G(id).value;
	var len=str.length;
	var p=str.indexOf(".");
	var q=str.indexOf("。");
	var r=str.indexOf("．");
	if((p==0)||(q==0)||(r==0))
	{
		if(len==1)
		{   
 			$("#error").html("<b class='red'>相册名称中含有不合法字符'.'</b> ");
			return false;
		}
		else if(len==2)
		{
			var p1=str.indexOf(".",1);
			var q1=str.indexOf("。",1);
			var r1=str.indexOf("．",1);	
			if((p1==1)||(q1==1)||(r1==1))
			{
			    $("#error").html("<b class='red'>相册名称中含有不合法字符'. 。'</b> ");
				return false;
			}
			else
			{
				return true;
			}
		}
		else
		{
			return true;
		}
	}
	else
	{
		return true;
	}
}

// 相册名不得重复
function iscatsame(id)
{
 	var str=G(id).value;
	var o=G("category");
 	for (i=0;i<o.options.length;i++){
 		if(o.options[i].label.toLowerCase()== str.toLowerCase()){
			return false;
		}
	}
	return true;
}

function checkbytem(id,smax)
{
	ele=G(id).value;;
	len=bytes(ele);
	if(len>smax)
		return false;
	else
		return true;
}

function checkform() {

   var el=G("albuminput").value; 
   var len=bytes(el);
   if(len==0)
	{
		showCatErr("相册名称不得为空，请重新输入！");
		return false;
	}
	else if(!checkbytem("albuminput",49))
	{
		showCatErr("相册名称太长，请重新输入");
		return false;
		
	}
	else if(!checkpoint("albuminput"))
	{
		showCatErr("相册分类中含有不合法字符'.'");
		return false;
		
	}
	else if(!iscatsame("albuminput"))
	{
		showCatErr("相册名称不得重复");
		return false;
		
	}
	else
	{ 
		$.post("result.php?action=addalbum", {albumname: $('#albuminput').val()}, function(response)
	 	{
 	 		if(response.status == "success" )
	 		{
	 			var album = response.album;
 				var sel = G("category");
				var opnum = sel.options.length;
				sel.options[opnum] = new Option(album.albumName,album.albumId, false, false);
				sel.options[opnum].label=album.albumName;
				sel.selectedIndex = sel.options.length-1;
				G('newalbum').style.display='';
				G('creating').style.display='none';
 				$('#imageupload').uploadifySettings('scriptData',{'categoryId' :album.albumId,'categoryName' : album.albumName});
			 
			}
			else
			{
				alert("error");
			}
		},"json");
	}
}

// 取消创建
function cancelCat()
{
	G('creating').style.display="none";
	 
	G('newalbum') .style.display="";
	
	hidCatErr();
	return false;
}



function showCatErr(str)
{
	 $("#error").html(str);
}
function hidCatErr()
{
	 $("#error").html("");
}
 
</script>
</body>
</html>
