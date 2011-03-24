<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>{{$user_name}}'s Blog</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../js/pagination/pagination.css" />
<script language="javascript"> 
var k=0,j=0,x=0;
</script>
</head>

<body>
{{include file="header.tpl"}}

<div id="content">
			<form style='display:none;' id='delform' name='delform' action='result.php?action=delarticle'  method='post'>
		  	  	<input type='hidden' id="article_id" name='article_id' value=''>
 		  	  	
		  	 </form>
	<div id="formbox">
			
 		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="buttonPan">
					<tr>
						<td  width="7">&nbsp;</td>
						<td  >
						 
						</td>
						<td class="modtc" nowrap align="right">
							<div class="open">
							<a href="addarticle.php" >
								 <img src="../images/ico_postnew.gif" border="0" align="amsmiddle">写新文章 </a>
							</div>
						</td>
						<td class="modtr" width="7">&nbsp;</td>
					</tr>
		</table>
 		<div id="bodyleftPan">
  
 			<div id="hiddenresult" style="display:none;">
				{{section name=id loop=$articlenumber}}
			
				  <div class="article" id="article{{$articlelist[id][0]}}">
				     <div class="hidden" >
				 	<h2>{{$articlelist[id][1]|escape htmlall}}</h2>
					  	Category: <a style="cursor: pointer;" class="categoryName" onclick="categoryFilter({{$articlelist[id][7]}});">{{$articlelist[id][8]|escape htmlall}}</a> 
						<a class="categoryId" style="display:none">{{$articlelist[id][7]}}</a>
					<p class="browntext">{{$articlelist[id][3]|escape htmlall }}</p>
					<p>{{$articlelist[id][2]}}</p>	
				
					<ul>
						<li>  <a href="editarticle.php?id={{$articlelist[id][0]}}">编辑</a> </li>  
		  	  			<li>  <a href='#' onClick='return blogdel({{$articlelist[id][0]}},{{$articlelist[id][7]}});'>删除</a></li>    
					</ul>
				</div>
			  </div>
				{{/section}} 
			</div>
 			
 			<div id="Pagination" class="pagination">
        	</div>
        	
 			<div id="Searchresult">
		 
			</div>

			
		</div>
		<div id="bodyrightPan">
			<p class="hours"><a href="">24/7 hours</a></p>
			<div id="servicesPan">&nbsp;</div>
	  			<div id="servicesBodyPan">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td  width="7">&nbsp;</td>
							<td  nowrap>
								<p class="services">Category</p> 
							</td>
			
							<td nowrap align="right">
								<div >
									<a href="#" onclick="mod_editCat('../article/listcategory.php');return false;">
										<img src="../images/ico_edit.gif" border="0" align="absmiddle">
										编辑 
									</a>
								</div>
							</td>
							<td class="modtr" width="7">&nbsp;</td>
						</tr>
					</table>
			
					{{section name=category_id loop=$category_number}}
						<p class="boldbrowntext">
							<a  id="" class="categoryName" onclick="categoryFilter({{$categorylist[category_id][2]}});">{{$categorylist[category_id][0]|escape  htmlall }}</a>
							(<a id="article_number{{$categorylist[category_id][2]}}" onclick="categoryFilter({{$categorylist[category_id][2]}});">{{$categorylist[category_id][1]}}</a>)
						</p>
					{{/section}}
			 	</div>
			 	<div id="servicesBottomPan">
			 	</div>
		 	</div>
		</div>
	</div>
</div>

{{include file="footer.html"}}

<script language="javascript" src="../js/popup.js"></script>
<script language="javascript" src="../js/edit.js"></script>
<script type="text/javascript" src="../js/pagination/jquery.pagination.js"></script>

<script language="javascript">
///////////////////////////////////////////////////////////////////////////
initPagination(0);
    
function pageselectCallback(page_index,jq,items_per_page){
     var num_entries = $('#hiddenresult div.article div.hidden') .length; 
	 min=(page_index) * items_per_page;
	 max=(page_index+1) * items_per_page;
	 var new_content="";
	 for(i=min;i<max && i <num_entries ;i++)
	 {
		 new_content  = new_content + $('#hiddenresult div.article div.hidden').eq(i).html();
     }
     $('#Searchresult').empty().append(new_content);
     
     return false;
}

function initPagination(id) {
 	var num_entries =null; 
	 if(id==0)
	 {
		 num_entries = $('#hiddenresult div.article') .length; 
 	     if(num_entries > 0)
 	  	 {
 	   	  	$("#Pagination").pagination(num_entries, {
       			callback: pageselectCallback,
       		  	items_per_page:2
    	 	});
     	  }
 		  else 
 		 {
 		 	
 	   	    new_content="还没有发表过文章，&nbsp;&nbsp;<a href='addarticle.php'> 写新文章 </a>";
 		 	$('#Searchresult').html(new_content);
 	     }
 	 } 
  	else
 	{
 		num_entries = $('#hiddenresult div.article div.hidden') .length; 
 	    if(num_entries > 0)
 	    {
 	  	   $("#Pagination").pagination(num_entries, {
       			  callback: pageselectCallback,
       		  	 items_per_page:2
    	 	  });
    	 }
    	 else
    	 {
    		 $("#Pagination").pagination(0);
 		 	new_content="该分类下还没有文章，&nbsp;&nbsp;<a href='addarticle.php?id="+id+"'> 写新文章 </a>";
  		  	$('#Searchresult').html(new_content);
  		  }
 	}
}
 
function categoryFilter(id)
{
	var num_entries = $('#hiddenresult div.article').length;
    
     for(i=0;i<num_entries;i++)
     {
    	var catid= $("#hiddenresult  div.article div a.categoryId").eq(i).text();
    	var filterId=id.toString();
    	var test=catid.valueOf();
 		if(catid == filterId)
		{
		  	$('#hiddenresult div.article div').eq(i).addClass("hidden");
	 	}
		else
		{ 
		 
		  $('#hiddenresult div.article div').eq(i).removeClass("hidden");
		}
	}  
	initPagination(id);

}
////////////////////////////////////////////////////////////////////
function montourl(dmonth)
{
	var str=dmonth;
	var str=str.replace("年","");
	var str=str.replace("月",""); 
	return str;
}
  
function blogdel(id,catId)
{
	var pop=new Popup({contentType:3,isReloadOnClose:false,width:340,height:80});
	pop.setContent("title","删除文章");
	pop.setContent("confirmCon","您确定要彻底删除这篇文章及其所有评论吗？");
	pop.setContent("callBack",delCallback);
	pop.setContent("parameter",{fid:id,cid:catId,popup:pop});
	pop.build();
	pop.show();
	return false;
}
var g_pop=null;
var aticle_id=null;
var cat_id=null;
function delCallback(para)
{
	var o_pop=para["popup"];
	o_pop.config.contentType=2;
 	g_pop =o_pop;
	aticle_id=G(para["fid"]);
	cat_id=G(para["cid"]);
 
 	$.post("result.php?action=delarticle", {article_id: G(para["fid"])}, function(response)
	 	{
 			 if(response.status="success")
 			 {
 			 	g_pop.setContent("contentHtml","<div style='margin:50px' align='center'>删除成功</div>");
 			 	g_pop.reBuild();
			 	setTimeout("g_pop.close();",600);
				var oldnumber=$('#article_number'+cat_id).text();
				$('#article'+aticle_id).remove();
				$('#article_number'+cat_id).html(oldnumber-1);
				initPagination(cat_id);		 	
 			 }
		},"json");
}

function mod_editCat(url)
{
	var pop=new Popup({contentType:1, isReloadOnClose:true, width:440, height:390 });
	pop.setContent("title","编辑分类");
	pop.setContent("contentUrl",url);
	pop.build();
	pop.show();
	return false;
} 
</script>
</body>
</html>
