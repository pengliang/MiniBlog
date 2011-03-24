<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Miniblog--Photos</title>
		<link href="../css/style.css" rel="stylesheet" type="text/css" />
		<link href="../css/form.css" rel="stylesheet" type="text/css" />
		<link href="../css/menu_style.css" rel="stylesheet" type="text/css" />
	</head>
	
	<body >

	{{include file="header.tpl"}}
		<div id="content">
			{{include file="menu.inc"}}
			<div style="width: 600px;padding:15px 10px 10px 10px;float:left;">
 				<table width="100%" cellspacing="0" cellpadding="0" border="0" class="modth">
					<tbody>
						<tr>
							<td width="20" class="modtl"> </td>
							<td nowrap="" class="modtc">
									<table cellspacing="0" cellpadding="0" border="0">
										<tbody >
											<tr>
												<td>
													<div ><span class="modtit">相册列表</span> | 相册使用状态:</div>
										 		</td>
										 		<td>
									<script> 
									var per=0.0*100/1000.0;
									var allv=(1000.0==1000)?"1G":"1000.0MB";
									var ht='<div style="display:inline-block;width:100px;border:1px solid #ccc;background:#fff"';
									ht+='title="目前您已使用'+allv+'中的0.0MB('+per+'%)">';
									ht+='<IMG src="../images/jdt.jpg" name="oLoadBar" width="0" height="10" id="jdt"></div>';
									document.write(ht);
									</script>
										 		
										 		</td>
										 	</tr>
										 </tbody>
									 </table>
							</td>
							<td nowrap="" align="right" class="modtc"/>
								<a style='' href="addphoto.php" ><img style='' src="../images/ico_uploadpic.gif"></img>上传新照片</a>
								<a style='' href="javascript:void(0);" onclick="addalbum('addalbum.php');">
								   <img  style='' src="../images/ico_creatset.gif"></img>创建新相册</a> 
							</td>
							<td width="7" class="modtr"> </td>
						</tr>
					</tbody>
				</table>
			 </div>
			<div id="albumlistbox" style="padding:10px 5px 10px 50px;float:left;width:550px" >
					<ul>
						{{section name=albumIndex loop=$count}}
						<li class="albumli" id="album{{$albums_list[albumIndex][0]}}" onmouseover="return show_edit({{$albums_list[albumIndex][0]}});" onmouseout="hide_edit({{$albums_list[albumIndex][0]}});">
							<a align="center" href="#" onclick="getphotolist({{$albums_list[albumIndex][0]}},'{{$albums_list[albumIndex][2]|escape htmlall}}');">
							   <img  align="center" src="../images/dir.gif" border="0" width="100" height="80">
							   </img><br>											
								<p align="center" ><b class="album_name">{{$albums_list[albumIndex][2]|escape htmlall}}</b>
								(<span class="album_number">{{$albums_list[albumIndex][10]}}<span>)
							   	</p>
							   	<p class="album_desc" style="display:none">{{$albums_list[albumIndex][6]|escape htmlall}}</p>					
							</a>	
						
						 	<div style="display:none" id="edit{{$albums_list[albumIndex][0]}}"  align="center" >
						 	 {{if $albums_list[albumIndex][2]== "默认相册"}}
							 
							{{else}}	
                   	 	  		<span>
                   	 	  			<a href="javascript:void(0)"  onclick="return editalbum({{$albums_list[albumIndex][0]}});"> 编辑</a>
                   	 	  			|<a href="javascript:void(0)"  onclick="return albumdel({{$albums_list[albumIndex][0]}});">删除</a>
                   	 	  		</span>		
                   	 	  	 {{/if}}						
							</div>
							                                  			 
										
						</li>
						{{/section}}
					</ul>
				</div>
			
		</div>
 
		{{include file="footer.html"}}

<script language="javascript" src="../js/popup.js"></script>
<script language="javascript" src="../js/edit.js"></script>

<script type="text/javascript">
function getphotolist(albumid,albumName)
{
	$("#album"+albumid+" a").attr("href","listphoto.php?id="+albumid+"&name="+escape(albumName));
 }
function show_edit(id)
{
 	document.getElementById("edit"+id).style.display="";
	
}

 
var g_pop=null;
var id=null;
function hide_edit(id)
{
 	document.getElementById("edit"+id).style.display="none";	 
}
function editalbum(id)
{
	var pop=new Popup({ contentType:1, isReloadOnClose:false, width:530, height:230 });
  	g_pop=pop;
 	pop.setContent("title","编辑相册");
 	pop.setContent("contentUrl","editalbum.php?id="+id);
 	pop.build();
 	pop.show();
}

function editCallBack(album)
{
 	g_pop.config.contentType=2;
 	g_pop.setContent("contentHtml","<div style='margin:50px' align='center'>相册更新成功</div>");
 	g_pop.reBuild();
	g_pop_close();
	$("#album"+album.albumId+" b.album_name").text(album.albumName);
	$("#album"+album.albumId+" p.album_desc").text(album.albumDesc);
	
}
function addalbum(url)
{
  	var pop=new Popup({ contentType:1, isReloadOnClose:false, width:530, height:230 });
  	g_pop=pop;
 	pop.setContent("title","创建新相册");
 	pop.setContent("contentUrl",url);
 	pop.build();
 	pop.show();
}

function addCallBack(album)
{
	newalbum= "<li class='albumli' id='album"+album.albumId+"' onmouseover='return show_edit("+album.albumId+");' onmouseout='hide_edit("+album.albumId+");'>"+
			 	"<a  href='#' onclick=\"getphotolist(album.albumId,album.albumName,album.albumDesc);\">" +
			 		"<img  align='center' src='../images/dir.gif' border='0' width='100' height='80'>" +
			 			"<br><p align='center' ><b>"+album.albumName+"</b>(<span class='album_number'>0<span>)" +
				 	"</img>" +
				 "</a>" +
				 "<div style='display:none'' id='edit"+album.albumId+"'  align='center' >" +
				 	"<span><a href=''> 编辑</a>|<a href='javascript:void(0)' onclick='return albumdel("+album.albumId+");'>删除</a>" +
				 	"</span>" +
				 "</div>" +
			"</li>";
 	g_pop.config.contentType=2;
 	g_pop.setContent("contentHtml","<div style='margin:50px' align='center'>相册添加成功</div>");
 	g_pop.reBuild();
	g_pop_close();
	$("#albumlistbox ul").append(newalbum);
}
function albumdel(album_id)
{
	var pop=new Popup({contentType:3,isReloadOnClose:false,width:340,height:80});
	pop.setContent("title","删除相册");
	pop.setContent("confirmCon","您确定要彻底删除该及其中所有照片吗？");
	pop.setContent("callBack",delCallback);
	pop.setContent("parameter",{fid:album_id,popup:pop});
	pop.build();
	pop.show();
	return false;
}

function delCallback(para)
{
	var o_pop=para["popup"];
	o_pop.config.contentType=2;
 	var albumid=G(para["fid"]);
 	g_pop=o_pop;
 	var album_num = $("#album"+albumid+" span.album_number").text();
 	$.post("result.php?action=delalbum", {album_id: G(para["fid"]),album_number:album_num}, function(response)
		{
 			 if(response.status=="success")
 			 {
 			 	g_pop.setContent("contentHtml","<div style='margin:50px' align='center'>相册删除成功</div>");
 			 	g_pop.reBuild();
			 	g_pop_close();
			 	$('#album'+G(para["fid"])).remove();
		     }
		},"json");
 }
 function g_pop_close()
 {
	 setTimeout("g_pop.close();",1000);
 }
 
</script>
</body>
</html>