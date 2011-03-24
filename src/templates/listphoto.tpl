<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title> Miniblog--My Photos</title>		
		<!-- Include jQuery (Lightbox Requirement) -->
		<link type="text/css" rel="stylesheet" media="screen" href="../css/index.css" />
		<link href="../css/style.css" rel="stylesheet" type="text/css" />
		<link href="../css/form.css" rel="stylesheet" type="text/css" />
		<link href="../css/menu_style.css" rel="stylesheet" type="text/css" />
    </head>
<body>
 	{{include file="header.tpl"}}
 		<input style="display:none" id="photo_catId" value={{$albumId}}></input> 
	<div id="content">
	    {{include file="menu.inc"}}
	     {{if $count > 0 }}
        <div class="section" style="float:left;width:700px"> 
            <div class="desc">
                 <p>
                     <span>当前相册：<script type="text/javascript">document.write(unescape('{{$dirname|escape htmlall}}'));</script></span>
                     <span class="code">Click the first image to begin the tour.</span>
                 </p>
            </div>
   
          
            <div  class='jCarouselLite'> 
                 <button class="prev">pre</button> <button class="next">next</button>
             	<ul>
             	 {{section name=photoIndex loop=$count}}    
             		 <div id="hiddenInfo" style="display:none">
               	   	 	<input id="photo{{$photolist[photoIndex][0]}}_id" value={{$photolist[photoIndex][0]}}></input>
               	 	 </div>
                	 <li  class="imgli" id="photo{{$photolist[photoIndex][0]}}">
               	 		 <div >
                   	    	<a  rel="lightbox-myGroup" title="{{$photolist[photoIndex][1]}}" href="{{$photolist[photoIndex][3]}}">
                  	    	<img src="{{$photolist[photoIndex][3]}}" alt="" width="150" height="100"/>
                        	<br>
                   		    </a>       
                   		     <div style="" align="center"> 
                   		  		 <p class="photo_desc" align="center">{{$photolist[photoIndex][1]}}</p> 
                    	 	 	 <span  href="javascript:void(0);" style="cursor:pointer;" onclick="return photoedit({{$photolist[photoIndex][0]}});">编辑</span>	
                   	 		   	 <span  href="javascript:void(0);" style="cursor:pointer;"  onclick="return photodel({{$photolist[photoIndex][0]}});">删除</span>
						  	  </div>  
                 	  		</div>
                  	   	</li>
               		{{/section}}
            	</ul>
            </div>
       	 </div>
    		 {{else}}
            	<div  style="padding:10px 10px 10px 10px;font-size:18px;">  
            	<span style="padding:30px 10px 10px 50px">当前相册：<script type="text/javascript">document.write(unescape('{{$dirname|escape htmlall}}'));</script>
            	<br><p align="center" style="padding:50px 50px 50px 50px"> 当前相册没有照片，<a href="addphoto.php?id={{$albumId}}">我要上传照片</a></div></p>
            {{/if}}
	</div>
	{{include file="footer.html"}}
<script language="javascript" src="../js/jcarousellite.js"></script>	 	
<script language="javascript" src="../js/lightbox/jquery.lightbox.js"></script>	 	
<script language="javascript" src="../js/popup.js"></script>
<script type="text/javascript">
		$(function() {
 			$(".jCarouselLite").jCarouselLite({
  		      btnNext: ".next",
    	   	  btnPrev: ".prev",
    	   	  btnGo  : null,
    	      auto	 : false,
    	      speed  : 1000,
    	      circular: false,    
      	  	  btnGo: null,
        	  mouseWheel: false, 
       		  easing: null, 
      		  vertical: false, 
        	  visible: 4,
        	  start: 0,
              scroll: 1, 
       		  beforeStart: null,
        	  afterEnd: null
   			 });
			});
var g_pop;
var old_catId;
function photoedit(id)
{	 
	var pop=new Popup({contentType:1, isReloadOnClose:false, width:440, height:390 });
	pop.setContent("title","编辑分类");
  	var catId=G("photo_catId").value;
  	old_catId=catId;
	pop.setContent("contentUrl","editphoto.php?id="+id+"&catId="+catId);
	pop.build();
	pop.show();
	g_pop=pop;
 	return false;
}
function editCallBack(photo_id,newName,newCatId)
{	 
		g_pop.config.contentType=2;
 		g_pop.config.width=200;
 		g_pop.config.height=80; 
 		g_pop.setContent("contentHtml","<div style='margin:50px' align='center'>照片更新成功</div>");
 		g_pop.reBuild();
 	 	g_pop_close4();
 	 	i=0;
 	 	while(i<$('#photo'+photo_id+' p.photo_desc').length)
 	 	{
 	 		$('#photo'+photo_id+' p.photo_desc').eq(i).text(newName);
 	 		i++;
 	 	}
  
 		 if(newCatId!=old_catId)
 		 {
 	 		$('#photo'+photo_id).remove();
 	 	 } 
  		return false;
}
 
function photodel(id)
{	 
	var pop=new Popup({contentType:3,isReloadOnClose:false,width:340,height:80});
	pop.setContent("title","删除文章");
	pop.setContent("confirmCon","您确定要彻底删除这篇文章及其所有评论吗？");
	pop.setContent("callBack",delCallback);
	pop.setContent("parameter",{fid:id,popup:pop});
	pop.build();
	pop.show();
	return false;
}
var g_pop=null;
var id=null;
function delCallback(para)
{
	var o_pop=para["popup"];
	o_pop.config.contentType=2;
   
 	g_pop=o_pop;
 	
 	$.post("result.php?action=delphoto", {photo_id: G(para["fid"])}, function(response)
		{
 			 if(response.status=="success")
 			 {
 			 	g_pop.setContent("contentHtml","<div style='margin:50px' align='center'>照片删除成功</div>");
 			 	g_pop.reBuild();
			 	g_pop_close4();
			 	$('#photo'+G(para["fid"])).remove();
		     }
		},"json");
 }
 function g_pop_close4()
 {
	 setTimeout("g_pop.close();",1000);
 }
</script>	
    </body>
</html>