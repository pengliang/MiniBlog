<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MiniBlog </title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/form.css" rel="stylesheet" type="text/css" />
<link href="css/menu_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="js/pagination/pagination.css" />
<!-- Include the Google Friend Connect javascript library. -->
<script type="text/javascript" src="http://www.google.com/friendconnect/script/friendconnect.js"></script>
 

 </head>
 
<body> 

{{include file="top_header.html"}}
	<div id="content">
		<div id="bodyleftPan">
 			<div id="Pagination" class="pagination">
      	  	</div>
 			<div id="Searchresult" style="padding-Top:30px;">
			</div>
			<div id="hiddenresult" style="display:none;">
				{{section name=id loop=$articlenumber}}
				 <div class="article">
					<h2>{{$articlelist[id][1]|escape  htmlall }}</h2>
					<p class="greentext">{{$articlelist[id][5]|escape  htmlall }}</p>
					<p class="browntext">{{$articlelist[id][3]|escape  htmlall }}</p>
					<p>{{$articlelist[id][2]|escape "htmlall"}}</p>	
				 </div>
				{{/section}} 
			</div>
		</div>
		<div id="bodyrightPan">
		<!-- Define the div tag where the gadget will be inserted. -->
<div id="div-134737277782069403" style="width:282px;border:1px solid #cccccc;"></div>
<!-- Render the gadget into a div. -->
<script type="text/javascript">
var skin = {};
skin['BORDER_COLOR'] = '#cccccc';
skin['ENDCAP_BG_COLOR'] = '#e0ecff';
skin['ENDCAP_TEXT_COLOR'] = '#333333';
skin['ENDCAP_LINK_COLOR'] = '#0000cc';
skin['ALTERNATE_BG_COLOR'] = '#ffffff';
skin['CONTENT_BG_COLOR'] = '#ffffff';
skin['CONTENT_LINK_COLOR'] = '#0000cc';
skin['CONTENT_TEXT_COLOR'] = '#333333';
skin['CONTENT_SECONDARY_LINK_COLOR'] = '#7777cc';
skin['CONTENT_SECONDARY_TEXT_COLOR'] = '#666666';
skin['CONTENT_HEADLINE_COLOR'] = '#333333';
skin['ALIGNMENT'] = 'right';
google.friendconnect.container.setParentUrl('/eclipse-php/miniblog/src/' /* location of rpc_relay.html and canvas.html */);
google.friendconnect.container.renderSignInGadget(
 { id: 'div-134737277782069403',
   site: '17106039852854048006' },
  skin);
</script>
 
 		 <!-- Define the div tag where the gadget will be inserted. -->
		<div id="div-7697497223515900237" style="width:276px;border:1px solid #cccccc;"></div>
<!-- Render the gadget into a div. -->
  		<script type="text/javascript">
var skin = {};
skin['BORDER_COLOR'] = '#cccccc';
skin['ENDCAP_BG_COLOR'] = '#ffcc33';
skin['ENDCAP_TEXT_COLOR'] = '#000000';
skin['ENDCAP_LINK_COLOR'] = '#0000cc';
skin['ALTERNATE_BG_COLOR'] = '#ffffff';
skin['CONTENT_BG_COLOR'] = '#ffffff';
skin['CONTENT_LINK_COLOR'] = '#0000cc';
skin['CONTENT_TEXT_COLOR'] = '#333333';
skin['CONTENT_SECONDARY_LINK_COLOR'] = '#7777cc';
skin['CONTENT_SECONDARY_TEXT_COLOR'] = '#666666';
skin['CONTENT_HEADLINE_COLOR'] = '#333333';
skin['NUMBER_ROWS'] = '4';
google.friendconnect.container.setParentUrl('/eclipse-php/miniblog/src/' /* location of rpc_relay.html and canvas.html */);
google.friendconnect.container.renderMembersGadget(
 { id: 'div-7697497223515900237',
   site: '17106039852854048006' },
  skin);
</script>
			<div id="loginPan">
 				<h2>members <span>login</span></h2>
					<form action="user/result.php?action=login" method="post">
						<label>UserName</label>
						<input name="user_name" type="text"></input>
						<label>Password</label>
						<input name="user_pwd" type="password"></input>
						<input name="Input" type="submit" class="button" value="Login" />
					</form>
					<ul>
						<li class="nonregister">Not a member &nbsp;?</li>
					
						<li class="register">
							 	<a href="user/register.php">Resister now</a>
						</li>
 
					</ul>
			</div>
			<div id="loginBottomPan">&nbsp;</div>
			<p class="hours"><a href="#">24/7 hours</a></p>
		</div>
	</div>
	<div id="footer">
		<div id="footerPan">
			<div id="footerlogoPan">
				<a href="">
				<img src="images/footerlogo.gif" title="Blog Division" alt="Blog Division" width="189" height="87" border="0" /></a>
			</div>
				<ul>
					<li><a href="index.php">Home</a>| </li>
					<li><a href="about.php">About Us</a> | </li>
					<li><a href="#">Company</a>| </li>
					<li><a href="#">Solutions</a> | </li>
					<li><a href="#">Partners</a> |</li>
					<li><a href="#">Client</a> |</li>
					<li><a href="#">Contact</a> </li>
				</ul>
			<p class="copyright">9blog division. All rights reserved.</p>
		</div>
	</div>

  <!-- Define the div tag where the gadget will be inserted. -->
<div id="div-4099093513585266591"></div>
<!-- Render the gadget into a div. -->
<script type="text/javascript">
var skin = {};
skin['BORDER_COLOR'] = '#cccccc';
skin['ENDCAP_BG_COLOR'] = '#e0ecff';
skin['ENDCAP_TEXT_COLOR'] = '#333333';
skin['ENDCAP_LINK_COLOR'] = '#0000cc';
skin['ALTERNATE_BG_COLOR'] = '#ffffff';
skin['CONTENT_BG_COLOR'] = '#ffffff';
skin['CONTENT_LINK_COLOR'] = '#0000cc';
skin['CONTENT_TEXT_COLOR'] = '#333333';
skin['CONTENT_SECONDARY_LINK_COLOR'] = '#7777cc';
skin['CONTENT_SECONDARY_TEXT_COLOR'] = '#666666';
skin['CONTENT_HEADLINE_COLOR'] = '#333333';
skin['POSITION'] = 'bottom';
skin['DEFAULT_COMMENT_TEXT'] = '- \u5728\u6b64\u5904\u6dfb\u52a0\u8bc4\u8bba -';
skin['HEADER_TEXT'] = '\u8bc4\u8bba';
google.friendconnect.container.setParentUrl('/eclipse-php/miniblog/src/' /* location of rpc_relay.html and canvas.html */);
google.friendconnect.container.renderSocialBar(
 { id: 'div-4099093513585266591',
   site: '17106039852854048006',
   'view-params':{"scope":"SITE","features":"video,comment","showWall":"true"}
 },
  skin);
</script>

 
	<script type="text/javascript" src="js/pagination/jquery.pagination.js"></script>

	<script language="javascript">

           initPagination();
    
			function pageselectCallback(page_index,jq,items_per_page){
		 	    var num_entries = $('#hiddenresult div.article').length;  
			 	min=(page_index) * items_per_page;
			 	max=(page_index+1) * items_per_page;
			 	var new_content="";
			 	for(i=min;i<max &&i<num_entries ;i++)
			 	{
                  	new_content  = new_content + $('#hiddenresult div.article').eq(i).html();
                }
                $('#Searchresult').empty().append(new_content);
                return false;
            }

            function initPagination() {
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
 		 
 		 			$('#Searchresult').html("还没有人发表过文章 <a style='cursor:pointer' href='article/addarticle.php'>写新文章 </a>");
 	   		  }
           }
</script>
 	</body>
</html>
