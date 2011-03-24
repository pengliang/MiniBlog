<!--STATUS OK-->
<html><head><meta http-equiv=content-type content="text/html; charset=utf-8">

<title>增加新分类 </title>
<head>
<script type="text/javascript" src="../js/edit.js"></script> 
<script language="javascript" src="../js/popup.js"></script>
<script language="javascript">

function checkform()
{
	setformat(); 
	var booladd =parent.checkselect("category",document.getElementById("categoryName").value);
 	if(!booladd)
	{
 
	 	showErr('err_title',"该分类已经存在！");
	}
 	if(checkpoint("categoryName") && booladd && 
 		checkblank('categoryName',"err_title","日志分类名称不能为空。")&&
 		checklength('categoryName',50,"err_title","您输入的分类名称太长，请保持在50字以内。" ))
 	{	
 	 	document.getElementById("type").value="article";
 		document.getElementById("addcatform").submit();
 	}
 }
 
 function checkpoint(id)
{
	setformat();
	var str=document.getElementById(id).value;
	var len=str.length;
	var p=str.indexOf(".");
	var q=str.indexOf("。");
	var r=str.indexOf("．");
	if((p==0)||(q==0)||(r==0))
	{
		if(len==1)
		{
			showErr('err_title',"日志分类中含有不合法字符'.'");
			return false;
		}
		else if(len==2)
		{
			var p1=str.indexOf(".",1);
			var q1=str.indexOf("。",1);
			var r1=str.indexOf("．",1);	
			if((p1==1)||(q1==1)||(r1==1))
			{
				showErr('err_title',"日志分类中含有不合法字符'.'");
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
 
function setformat()
{
	document.getElementById("categoryName").value=trimlr("categoryName");
	document.getElementById("categoryName").value=trimrn("categoryName");
}

function cancel(id)
{
	if(document.getElementById(id).value=="")
		parent.g_close_pop();
	else
		document.getElementById(id).value="";
}
 

</script>
</head>
<body>

<form   name="addcatform" id="addcatform"  action="result.php?action=addcategory" method="post">
  
<table  border="0" cellspacing="3" cellpadding="1" class="formhd" style="margin-top:30px;">
<tr>
<td width="80" > 分类名称：</td>
<td><input type="text" name="categoryName" id="categoryName" style="width:290px"></td>
</tr>

<tr id="err_title" style="display:none">
<td>&nbsp;</td>
<td><div class="error_con" id="err_title_con"></div></td>
</tr>
<tr style="display:none">
	<td >
		<input type="hidden",name="type" id="type" value=""></input>
	</td>
<td><div class="error_con" id="err_title_con"></div></td>
</tr>
<tr>
<td>&nbsp;</td>
<td class="formsb"><input type="button" value=" 确定 " onClick="return checkform();">
<input name="button" type="button" value=" 取消 " onClick="cancel('categoryName');"></td>

</tr>
</table>
</form>
 
</body></html>