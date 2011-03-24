<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<title>创建新相册</title>
<script type="text/javascript" src="../js/edit.js"></script>
<script language="javascript">
var j=0;
var cati=0;
function checkblank1(id)
{
	var el=document.getElementById(id).value;
	var len=bytes(el);
	   if(len==0)
	   {
		showErr(1,"相册名称不得为空，请重新输入。");
		return false;
		}
		else
		{
		return true;
		}
}
function checkbyteall(id,smin,smax,index,err)
{
	ele=document.getElementById(id);
	len=bytes(ele.value);
	if((len<smin)||(len>smax))
	{
		showErr(index,err);
		return false;
	}
	else
	{
		return true;
	}
}
function checkbytem(id,smax,index,err)
{
	ele=document.getElementById(id);
	len=bytes(ele.value);
	if(len>smax)
	{
		showErr(index,err);
		return false;
	}
	else
	{
		return true;
	}
}
function checkpoint(id)
{
	var str=document.getElementById(id).value;
	var len=str.length;
	var p=str.indexOf(".");
	var q=str.indexOf("。");
	var r=str.indexOf("．");
	if((p==0)||(q==0)||(r==0))
	{
		if(len==1)
		{
			showErr(1,"相册分类中含有不合法字符'.'");
			return false;
		}
		else if(len==2)
		{
			var p1=str.indexOf(".",1);
			var q1=str.indexOf("。",1);
			var r1=str.indexOf("．",1);	
			if((p1==1)||(q1==1)||(r1==1))
			{
				showErr(1,"相册分类中含有不合法字符'.'");
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
function iscatsame(id,k)
{
     var edit1=document.getElementById(id).value;
	 var edit2=edit1.toLowerCase();
     var flat=0;

	 var num =  parent.$("b.album_name").length;
	 var mid=new Array(num);
	 var begin=new Array(num);
     for(i=0;i<num;i++)
     {   
    	 
		begin[i]=parent.$("b.album_name").eq(i).text();;
		mid[i]=begin[i].toLowerCase();
        if(edit2==mid[i])
        {
           flat++;
       }
    }
    if(flat<=k)
    {
          return true;
    }
    else
   {
		showErr(1,"相册名称不得重复。");
        return false;
   }

}
function checkaddinput(id)
{
	document.getElementById(id).value=trimlr(id);
	document.getElementById(id).value=trimrn(id);
    if(checkblank1(id)&&checkbyteall(id,1,49,1,"相册名称应该在1到49字节。")&&iscatsame(id,0)&&checkpoint(id))
    {
        return true;
    }
    else
   {
   		return false;
   }
}
function checkaddcatform(id)
{
	document.getElementById('sde').value=trimlr('sde');
	document.getElementById('sde').value=trimrn('sde');
    if(checkaddinput(id)&&checkbytem('sde',200,2,"您输入的相册简介太长，请保持在100字以内。"))
	{
  		var name=document.getElementById("spAlbumName").value;
 		var desc=trimlr('sde');
		var o_name =parent.$("#album{{$albumId}} b.album_name").text();
		var o_desc= parent.$("#album{{$albumId}} p.album_desc").text();
		if(o_name == name && desc == o_desc)
		{
			return true;
		}
		else
		{
 			parent.$.post("result.php?action=editalbum", {albumId:{{$albumId}},albumname: name,albumdesc: desc}, function(response)
			{
 				if(response.status=="success")
	 			{ 
 					parent.editCallBack(response.album);
 				}
			},"json");
		}
	} 
	else {
			return false;
	}
}
function showErr(index,str)
{
	G(index+"_err").style.display="";
	G(index+"_err_con").innerHTML=str;
}
function hidErr(index)
{
	G(index+"_err").style.display="none";
	G(index+"_err_con").innerHTML="";
}
	 
</script>
</head>
<body>

<form onsubmit="return checkaddcatform('spAlbumName')" name="form1"
	method="post" action="">

<table cellspacing="6" cellpadding="1" border="0" class="formhd">
	<tbody>
		<tr>
			<td width="100" class="f14">相册名称：</td>
			<td>
		 		<input type="text" onfocus="hidErr(1);"
					onchange="checkaddinput('spAlbumName')" style="width: 290px;"
					maxlength="49" id="spAlbumName" name="spAlbumName" /> 
				<span class="gray">(必填)</span>
				<script language="javascript">
					G("spAlbumName").value=parent.$("#album{{$albumId}} b.album_name").text();
				</script>
			</td>
		</tr>
		<tr style="display: none;" id="1_err">
			<td> </td>
			<td>
			<div id="1_err_con" class="error"></div>
			</td>
		</tr>
		<tr>
			<td valign="top" width="100" class="f14">相册简介：</td>
			<td>
				<textarea onfocus="hidErr(2);"
						  onchange="checkbytem('sde',200,2,'您输入的相册简介太长，请保持在100字以内。');"
						  style="width: 410px; height: 82px;" id="sde" name="spAlbumDescri">
				</textarea>
				<script language="javascript">
					G("sde").value=parent.$("#album{{$albumId}} p.album_desc").text();
				</script>
			</td>
		</tr>
		<tr style="display: none;" id="2_err">
			<td> </td>
			<td>
			<div id="2_err_con" class="error"></div>
			</td>
		</tr>

		<tr>
			<td> </td>
			<td class="formsb"><input type="submit" value=" 保存修改 " name="tj" />&nbsp;&nbsp;&nbsp;&nbsp;<a
				style="cursor: pointer" onclick="parent.g_pop.close();">取消</a></td>
		</tr>
	</tbody>
</table>
</form>
</body>
</html>
 