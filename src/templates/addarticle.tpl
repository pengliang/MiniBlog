<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MiniBlog </title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/form.css" rel="stylesheet" type="text/css" />
<link href="../css/menu_style.css" rel="stylesheet" type="text/css" />

</head>
<body onload="setcur();">
{{include file="header.tpl"}}
<div id="content">
 {{include file="menu.inc"}}
	<div id="formbox">
		<form name="form1" id="popFormSubmit" action="result.php?action=addarticle"  method="post"  onSubmit="return checkform();" >
			 <table>
 	  		 		 <tr id="err_title" style="display:none">
						<td width="40%">&nbsp;</td>
						<td width="60%"id="err_title_con"></td> 
	  		 		 </tr>
			 </table> 
			<div class="fieldblock">
				<label for="title">Title:</label>
		  		<input name="article_title" id="article_title" type="text" ></input>
			</div>
	 
	 		<div class="fieldblock">
				<script type="text/javascript" src="../js/nicEdit/nicEdit.js"></script> 
 		 
				<script language="javascript">
						bkLib.onDomLoaded(function(){new nicEditor({fullPanel: true}).panelInstance('article_content');});
				</script>
 		
 				<textarea name="article_content"id="article_content" style="width: 550px; height: 300px;">
					Some Initial Content was in this textarea
				</textarea> 
			</div>
		
			<div class="fieldblock">
				<label >Category:</label>
	 	 		<select name="category" id="category">
						 {{html_options options=$category_options selected=$category_id}} 
				</select>
					 
	 			<a href="addcategory.php"  onClick="openaddcat('addcategory.php');return false;" >
							增加新分类
				</a>
			</div>
		
			<div id="submitblock"> 
				<input name="newarticle" type="image" src="../images/submit.gif" size="32,32" value="Save"/>
			</div>
		</form>
	</div>
</div>
 
{{include file="footer.html"}}


<script type="text/javascript" src="../js/popup.js"></script>
<script type="text/javascript" src="../js/edit.js"></script>
<script language="javascript" >

function checkform()
{
	if(checkblank('article_title',"err_title","您必须输入文章标题，请检查。") && 
	   checklength('article_title',50,"err_title","您输入的文章标题太长，请保持在50字以内。") )
	{
			submitForm();
			return true;
	}
	else
	{
		return false;
	}
}
var g_pop=null;

function submitForm() {
	g_pop=null;
	g_pop=new Popup({contentType:1,isReloadOnClose:true,width:340,height:80});
	g_pop.setContent("title","发表文章");
	g_pop.setContent("contentUrl","");
	g_pop.build();
	g_pop.show();
	
	G("popFormSubmit").target=g_pop.iframeIdName;
 }

function checkselect(itm, val){
  	with(eval('document.form1.'+itm)){
		for (i=0;i<options.length;i++){
 			if(options[i].label.toLowerCase()== val.toLowerCase()){
 					return false;
			}
		}
	}
	return true;
}
 
function openaddcat(url){
	g_pop=new Popup({contentType:1, isReloadOnClose:false,width:440, height:139 });
	g_pop.setContent("title","添加新分类");
	g_pop.setContent("contentUrl",url);
	g_pop.build();
	g_pop.show();
	return false;
}

function addCallBack(opvalue,oplabel){
	var sel = G("category");
	var opnum = sel.options.length;
	sel.options[opnum] = new Option(HTMLDeCode(oplabel),opvalue, false, false);
	sel.options[opnum].label=HTMLDeCode(oplabel);
	sel.selectedIndex = sel.options.length-1;
	g_pop.close();
}
function g_pop_close()
{
	g_pop.close();
}
function setcur(){
	G("article_title").focus();
}
 
var MSG_UNLOAD="您的文章内容还没有进行保存！";
var UnloadConfirm = {};
UnloadConfirm.set = function(confirm_msg){
    window.onbeforeunload = function(event){
        event = event || window.event;
        event.returnValue = confirm_msg;
    }
}
UnloadConfirm.clear = function(){
    window.onbeforeunload = function(){};
}
UnloadConfirm.set(MSG_UNLOAD);
 
</script>
</body>
</html>
