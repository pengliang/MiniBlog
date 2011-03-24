	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>MiniBlog,SD's first demo </title>

 	</head>

<script>
 
function checkbytem(id,smax){
	ele=document.getElementById(id);
	len=bytes(ele.value);
	if(len>smax){
		return false;
	}else{	
		return true;
	}
	
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
</script>
</head>
<body>
  <div id="content">
  	<div id="formbox">
  		<table border="0" cellspacing="0" cellpadding="5" class="formarea">
				<tr>
					<td width="80" valign="top" class="itn"  align="right">照片预览：</td>
					<td valign="top"><img id="spPhotoSrc" src='' width="300" height="200"  border="0"></td>
					 <script language="javascript">
							document.getElementById("spPhotoSrc").src= parent.$('#photo{{$photo_id}} div img').attr("src");
					</script>
				</tr>
				<tr>
					<td class="itn"  align="right">照片描述：</td>
					<td>
						<input type="text" name="spPhotoId" id="spPhotoId" style="display:none" value="{{$photo_id}}">
				
						<input type="text" name="spPhotoName" id="spPhotoName" style="width:220px" value="">
						 <script language="javascript">
							document.getElementById("spPhotoName").value= parent.$('#photo{{$photo_id}} p.photo_desc').eq(0).text();
						</script>
						</input>
					</td>
				</tr>
				<tr>
					<td class="itn"  align="right">所属相册：</td>
					<td>
						<select name="spAlbumId" id="spAlbumId" style="width:145px">   
						  {{html_options options=$albumlist selected=$dafult_id}}  
						</select>
					</td>
				</tr>
 
				<tr>
					<td>&nbsp;</td>
					<td class="sbt"><input name="tj" type="submit"  onclick="return editphoto();" value="保存修改">
							<a style="cursor:pointer" onclick="parent.g_pop.close();">取消</a>
					</td>
				 
				</tr>
		</table>
			
			<br>
     <div id="formbox">
  </div>
    
 <script language="javascript">
 
var o_name = document.getElementById("spPhotoName").value;
var o_catid = document.getElementById("spAlbumId").value;
 
function editphoto()
{	 	
  		id=document.getElementById("spPhotoId").value;
 		name=document.getElementById("spPhotoName").value;
 		catId=document.getElementById("spAlbumId").value;
 		if(catId == o_catid && name == o_name)
 		{
 			parent.g_pop_close4();
 			return true;
 		}
 		else
 		{
 		  	parent.$.post("result.php?action=editphoto", {photo_id: id,photo_name: name,cat_id: catId}, function(response)
			{
 		 		if(response.status=="success")
 		 		{
  		 			parent.editCallBack(id,name,catId); 
				}
			},"json");
		}
		return false;
 }
 </script>
</body>
</html>
