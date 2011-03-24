<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<title>{{$user_name}}的空间_编辑分类      </title>

</head>
<body>

<iframe name="submitIframe" src="about:blank" style="display:none">
</iframe>

<form action="result.php?action=addcategory" style="display:none;" name="addcatform" id="addcatform" method="post" target="submitIframe">

<input type="hidden" name="categoryName" id="addcatid_f" >

</form>

<form action="result.php?action=editcategory" style="display:none;" name="editcatform" id="editcatform" method="post" target="submitIframe">

<input type="hidden" name="categoryName_o" id="catedit_o_f" value="">
<input type="hidden" name="categoryName" id="catedit_f" value="">
<input type="hidden" name="categoryId" id="catedit_f_id" value="">

</form>

<form action="result.php?action=delcategory" style="display:none;" name="deletecatform" id="deletecatform" method="post" target="submitIframe">
<input type="hidden" name="categoryName" id="cateditdel_f" value=""></input>
<input type="hidden" name="categoryId" id="cateditdel_f_id" value=""></input>
<input type="hidden" name="defaultId" id="cateditdel_f_defaultId" value=""></input>

</form>


<div class="dialog">
<div class="box" style="padding:0">
<div style="padding:10px">

<table border="0" cellspacing="0" cellpadding="0" class="formarea">
<tr>
<td><span class="f14">添加新的文章分类：</span></td>
</tr>
<tr>
<td>
<input type="text" id="addcatid" onChange="checkaddinput('addcatid')" onfocus="hiddenError(1)" style="width:210px" value="">
<div id="1_err_msg" class="error" style="display:none"></div>
</td>
</tr>
<tr>
<td><input type="button" onclick="addC('addcatid');" value=" 添加 "></td>
</tr>
</table>
<div class="line">&nbsp;</div>
<div class="itn">管理已有分类</div>

<div id="2_err_msg" class="error" style="display:none"></div>
</div>
<div style="height:200px;overflow:auto" id="forContral">

</div>
<br>
</div>
</div>
 
<script language="javascript" src="../js/popup.js"></script>
<script language="javascript" src="../js/edit.js"></script>

<script language="javascript">
 
G("addcatid").focus();

var newCatId="_i_e";
var catnum={{$category_number}};

var bCName=new Array();
var bCIsAvail=new Array();
var defaultCat=0;

var bc_i=0; 

var	default_Id={{$defaultId}};
	
	defaultCat=bc_i;
	
	bCName.push("默认分类");
	bCIsAvail.push(true);
	bc_i++;
	
	bCName.push(0);
	bCIsAvail.push(false);
 
	{{section name=id loop=$category_number}}
 
	 bCName.push('{{$categorylist[id][2]|escape htmlall}}');
	 bCIsAvail.push(true);
	 
	 bCName.push({{$categorylist[id][0]}});
	 bCIsAvail.push(false); 
	 

	 {{/section	}}

var isOping=false;
var delIndex=-1;
var ediIndex=-1;
var pop=null;

function deleteC(index)
{
	if(!isOping && bCIsAvail[index])
	{
		pop=new Popup({ contentType:3,isReloadOnClose:false,width:395,height:80});
		pop.setContent("title","删除分类");
		pop.setContent("confirmCon","您确定要删除？删除后该分类下的文章将移至默认分类下");
		pop.setContent("callBack",delCallback_pop);
		pop.setContent("parameter",{fid:"deletecatform",index:index,popup:pop});
		pop.setContent("overlay",1);
		pop.build();
		pop.show();
	}
	else
		alert("正在处理，请稍后……");
	return false;
}

function delCallback_pop(para)
{
	isOping=true;
	delIndex=para["index"];
	
 	G("cateditdel_f").value=bCName[delIndex];
	G("cateditdel_f_defaultId").value= default_Id ;
	G("cateditdel_f_id").value=bCName[parseInt(delIndex)+1];

	var o_pop=para["popup"];
	o_pop.config.contentType=1;
	o_pop.setContent("contentUrl","");
	o_pop.reBuild();
	G(para["fid"]).target=o_pop.iframeIdName;
	G(para["fid"]).submit();
}
function delCallBack()
{
	pop.close();
	var id_tr1=delIndex+"_a_e_tr1";
	var id_tr2=delIndex+"_a_e_tr2";
	bCIsAvail[delIndex]=false;
	hidden(id_tr1);
	hidden(id_tr2);
	if(delIndex<defaultCat)
		defaultCat--;
	
	catnum--;
	delIndex=-1;
	isOping=false;
}
function editC(index)
{
	if(!isOping && bCIsAvail[index])
	{
		var id_n=index+"_i_e";
		
		if(checkeditinput(id_n))
		{
			isOping=true;
			ediIndex=index;
			
			G("catedit_o_f").value=(bCName[ediIndex]);
 			G("catedit_f").value=G(id_n).value;
 			G("catedit_f_id").value=bCName[parseInt(ediIndex)+1];
 		 
			document.editcatform.submit();
		}
		else
		{
			showError(index,"编辑失败！");
		}
	}
	else
		alert("正在处理，请稍后……");
}
function ediCallBack(cName)
{
	bCName[ediIndex]=(cName);
	hidden(ediIndex+"_a_e_tr2");
	show(ediIndex+"_a_e_tr1");
 	G(ediIndex+"_cn_td").innerHTML=	HTMLEnCode(bCName[ediIndex]);
	G(ediIndex+"_i_e").value=(bCName[ediIndex]);
	//alert(encode_utf8(bCName[ediIndex]));
	ediIndex=-1;
	isOping=false;
}

function addC(id)
{
 	if(!isOping)
	{
		if(checkaddinput(id))
		{
			isOping=true;
			G("addcatid_f").value=G(id).value;
 			document.addcatform.submit();
 		//	alert(G("addcatid_f").value);
		}
	}
	else
		alert("正在处理，请稍后……");
}
function addCallBack(cid,cName)
{
 	bCName.push((cName));
	bCIsAvail.push(true);
	bCName.push(cid);
	bCIsAvail.push(false);
	getHTML();
	G("forContral").scrollTop = G("forContral").scrollHeight;
	init();
	G("addcatid").value="";
	catnum++;
	isOping=false;
	return true;
 }

function getStr(index,cName)
{
	var i=index;
	var str="<tr class='off forfind' id='"+i+"_a_e_tr1'>"+
				"<td class='padl' id='"+i+"_cn_td'>"+cName+"</td>"+
				"<td align='center'>"+
					"<a href='javascript:void(0);' id='"+i+"_a_e' class='forfind_a_e'>"+
					"<img src='../images/edit.gif' border='0' align='absmiddle'></a>"+
				"</td>"+
				"<td align='center'>"+
					"<a href='javascript:void(0);' id='"+i+"_a_d' class='forfind_a_d'>"+
					"<img src='../images/del.gif' border='0' align='absmiddle'></a>"+
				"</td>"+
			"</tr>"+
			"<tr class='on' style='display:none;' id='"+i+"_a_e_tr2'>"+
				"<td class='padl'>"+
					"<div class='pad'>"+
						"<input type='text' id='"+i+"_i_e' style='width:200px' value='"+cName+"' class='fd_cname'>"+
					"</div>"+
				"</td>"+
				"<td align='center'>"+
					"<div class='pad'>"+
						"<input name='' type='button' id='"+i+"_i_e_y' value='确定' class='fd_cconfirm'>"+
					"</div>"+
				"</td>"+
				"<td align='center'>"+
					"<div class='pad'>"+
						"<a href='javascript:void(0);' id='"+i+"_a_e_n' class='forfind_a_e_n'>取消</a>"+
					"</div>"+
				"</td>"+
			"</tr>";
	return str;
}
function getDef(index,cName)
{
	var i=index;
	var str="<tr class='off forfind' id='"+i+"_a_e_tr1'>"+
				"<td class='padl' id='"+i+"_cn_td'>"+cName+"</td>"+
				"<td align='center'>&nbsp;</td>"+
				"<td align='center'>&nbsp;</td>"+
			"</tr>";
	return str;
}

function getHTML()
{
	var htmlCode="<table width='100%' border='0' cellspacing='0' cellpadding='0' class='list'>"+
					"<tr style='font-weight:bold'>"+
						"<td width='68%' >分类名称</td>"+
						"<td width='14%' align='center' >重命名</td>"+
						"<td width='18%' align='center' >删除</td>"+
					"</tr>";
	for(var i=0;i<bCName.length;i++)
	{
		if(i==defaultCat && bCIsAvail[i])
		{
			htmlCode+=getDef(i,((bCName[i])));
		}
		else if(bCIsAvail[i])
		{
			htmlCode+=getStr(i,((bCName[i])));
		}
	}
	htmlCode+="</table>";
	G("forContral").innerHTML=htmlCode;
}

function checkbyteall(id,smin,smax,errorId)
{
	ele=G(id);
	len=bytes(ele.value);
	if((len<smin)||(len>smax))
	{
		showError(errorId,"分类名称应该在smin到smax字节之间。");
		return false;
	}
	return true;
}

function checkblank(id,errorId)
{
	ele=G(id);
	len=bytes(ele.value);
	if(len==0)
	{
		showError(errorId,"日志分类名称不得为空，请重新输入。");
		return false;
	}
	return true;
}

function iscatsame(newCatId,isAdd,errorId)
{
	var newCat=G(newCatId).value.toLowerCase();
  	var index=-1;
	if(!isAdd)
		index=parseInt(getindex(newCatId));
	for(i=0;i<bCName.length;i++)
	{
 		if(!isAdd && i!=index && bCIsAvail[i] && newCat==(bCName[i]).toLowerCase())
		{
			showError(errorId,"分类名称不得重复。");
			return false;
		}
		if(isAdd && bCIsAvail[i] && newCat==(bCName[i]).toLowerCase())
		{
			showError(errorId,"分类名称不得重复。");
			return false;
		}
	}
	return true;
}

function iscatfull(errorId)
{
	if(catnum<100)
	{
		return true;
	}
	else
	{
		showError(errorId,"分类数目最多为100个。");
		return false
	}
}

function checkpoint(id,errorId)
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
			showError(errorId,"日志分类中含有不合法字符'.'");
			return false;
		}
		else if(len==2)
		{
			var p1=str.indexOf(".",1);
			var q1=str.indexOf("。",1);
			var r1=str.indexOf("．",1);	
			if((p1==1)||(q1==1)||(r1==1))
			{
				showError(errorId,"日志分类中含有不合法字符'.'");
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

// edit
function checkeditinput(id)
{
	G(id).value=trimlr(id);
	G(id).value=trimrn(id);
	if(checkblank(id,2)&&checkbyteall(id,1,49,2)&&iscatsame(id,false,2)&&checkpoint(id,2))
    {
        return true;
    }
   	return false;
}

// add
function checkaddinput(id)
{
	G(id).value=trimlr(id);
	G(id).value=trimrn(id);
    if(checkblank(id,1)&&checkbyteall(id,1,49,1)&&iscatsame(id,true,1)&&iscatfull(1)&&checkpoint(id,1))
    {
        return true;
    }
   	return false;
}


function init()
{
	var trs = document.getElementsByTagName('tr');
	var tTrs = [];
	for (var i = 0; i < trs.length; i++) {
		if (/\bforfind\b/.test(trs[i].className))
			tTrs.push(trs[i]);
	}
	for (var i=0; i<tTrs.length; i++) {
		tTrs[i].onmouseover=function()
		{
			this.className=this.className.replace("off", "on");
		}
		tTrs[i].onmouseout=function()
		{
			this.className=this.className.replace("on", "off");
		}
	}

	var as= document.getElementsByTagName('a');
	var aA1s = [];//重命名
	var aA2s = [];//删除
	var aA3s = [];//取消重命名
	for (var i = 0; i < as.length; i++) {
		if (/\bforfind_a_e\b/.test(as[i].className))
			aA1s.push(as[i]);
		else if (/\bforfind_a_d\b/.test(as[i].className))
			aA2s.push(as[i]);
		else if (/\bforfind_a_e_n\b/.test(as[i].className))
			aA3s.push(as[i]);
	}
	for (var i=0; i<aA1s.length; i++) {
		aA1s[i].onclick=function()
		{
			hiddenError(2);
			var index=getindex(this.id);
			hidden(index+"_a_e_tr1");
			show(index+"_a_e_tr2");
			return false;
		}
	}
	for (var i=0; i<aA2s.length; i++) {
		aA2s[i].onclick=function()
		{
			hiddenError(2);
			deleteC(getindex(this.id));
			return false;
		}
	}
	for (var i=0; i<aA3s.length; i++) {
		aA3s[i].onclick=function()
		{
			hiddenError(2);
			var index=getindex(this.id);
			G(index+"_i_e").value=bCName[parseInt(index)];
			hidden(index+"_a_e_tr2");
			show(index+"_a_e_tr1");
			return false;
		}
	}

	var is= document.getElementsByTagName('input');
	var iI1s = [];//重命名输入框
	var iI2s = [];//重命名确认按钮
	for (var i = 0; i < is.length; i++) {
		if (/\bfd_cname\b/.test(is[i].className))
			iI1s.push(is[i]);
		else if (/\bfd_cconfirm\b/.test(is[i].className))
			iI2s.push(is[i]);
	}
	for (var i=0; i<iI1s.length; i++) {
		iI1s[i].onchange=function()
		{
			var id_n=getindex(this.id)+"_i_e";
			checkeditinput(id_n);
		}
		iI1s[i].onfocus=function()
		{
			hiddenError(2);
		}
	}
	for (var i=0; i<iI2s.length; i++) {
		iI2s[i].onclick=function()
		{
			editC(getindex(this.id));
		}
	}
}

function hidden(id)
{
	G(id).style.display="none";
}
function show(id)
{
	G(id).style.display="";
}
function getindex(id)
{
	var a=id.split("_");
	return a[0];
}


getHTML();
init();

function showError(index,errStr)
{
	if(index==1)
		hiddenError(2);
	else if(index==2)
		hiddenError(1);
	var errId=index+"_err_msg";
	G(errId).innerHTML=errStr;
	G(errId).style.display="";
}
function hiddenError(index)
{
	hidden(index+"_err_msg");
}
 

</script>

</body></html>